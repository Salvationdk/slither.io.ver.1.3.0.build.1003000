package starling.events
{
    import __AS3__.vec.*;
    import flash.geom.*;
    import flash.utils.*;
    import starling.display.*;

    public class TouchProcessor extends Object
    {
        private var mStage:Stage;
        private var mRoot:DisplayObject;
        private var mElapsedTime:Number;
        private var mTouchMarker:TouchMarker;
        private var mLastTaps:Vector.<Touch>;
        private var mShiftDown:Boolean = false;
        private var mCtrlDown:Boolean = false;
        private var mMultitapTime:Number = 0.3;
        private var mMultitapDistance:Number = 25;
        protected var mQueue:Vector.<Array>;
        protected var mCurrentTouches:Vector.<Touch>;
        private static var sUpdatedTouches:Vector.<Touch> = new Vector.<Touch>(0);
        private static var sHoveringTouchData:Vector.<Object> = new Vector.<Object>(0);
        private static var sHelperPoint:Point = new Point();

        public function TouchProcessor(param1:Stage)
        {
            var _loc_2:* = param1;
            this.mStage = param1;
            this.mRoot = _loc_2;
            this.mElapsedTime = 0;
            this.mCurrentTouches = new Vector.<Touch>(0);
            this.mQueue = new Vector.<Array>(0);
            this.mLastTaps = new Vector.<Touch>(0);
            this.mStage.addEventListener(KeyboardEvent.KEY_DOWN, this.onKey);
            this.mStage.addEventListener(KeyboardEvent.KEY_UP, this.onKey);
            this.monitorInterruptions(true);
            return;
        }// end function

        public function dispose() : void
        {
            this.monitorInterruptions(false);
            this.mStage.removeEventListener(KeyboardEvent.KEY_DOWN, this.onKey);
            this.mStage.removeEventListener(KeyboardEvent.KEY_UP, this.onKey);
            if (this.mTouchMarker)
            {
                this.mTouchMarker.dispose();
            }
            return;
        }// end function

        public function advanceTime(param1:Number) : void
        {
            var _loc_2:* = 0;
            var _loc_3:* = null;
            var _loc_4:* = null;
            this.mElapsedTime = this.mElapsedTime + param1;
            sUpdatedTouches.length = 0;
            if (this.mLastTaps.length > 0)
            {
                _loc_2 = this.mLastTaps.length - 1;
                while (_loc_2 >= 0)
                {
                    
                    if (this.mElapsedTime - this.mLastTaps[_loc_2].timestamp > this.mMultitapTime)
                    {
                        this.mLastTaps.splice(_loc_2, 1);
                    }
                    _loc_2 = _loc_2 - 1;
                }
            }
            while (this.mQueue.length > 0)
            {
                
                for each (_loc_3 in this.mCurrentTouches)
                {
                    
                    if (_loc_3.phase == TouchPhase.BEGAN || _loc_3.phase == TouchPhase.MOVED)
                    {
                        _loc_3.phase = TouchPhase.STATIONARY;
                    }
                }
                while (this.mQueue.length > 0 && !this.containsTouchWithID(sUpdatedTouches, this.mQueue[(this.mQueue.length - 1)][0]))
                {
                    
                    _loc_4 = this.mQueue.pop();
                    _loc_3 = this.createOrUpdateTouch(_loc_4[0], _loc_4[1], _loc_4[2], _loc_4[3], _loc_4[4], _loc_4[5], _loc_4[6]);
                    sUpdatedTouches[sUpdatedTouches.length] = _loc_3;
                }
                this.processTouches(sUpdatedTouches, this.mShiftDown, this.mCtrlDown);
                _loc_2 = _loc_6.length - 1;
                while (_loc_2 >= 0)
                {
                    
                    if (_loc_6[_loc_2].phase == TouchPhase.ENDED)
                    {
                        _loc_6.splice(_loc_2, 1);
                    }
                    _loc_2 = _loc_2 - 1;
                }
                sUpdatedTouches.length = 0;
            }
            return;
        }// end function

        protected function processTouches(param1:Vector.<Touch>, param2:Boolean, param3:Boolean) : void
        {
            var _loc_5:* = null;
            var _loc_6:* = null;
            sHoveringTouchData.length = 0;
            var _loc_4:* = new TouchEvent(TouchEvent.TOUCH, this.mCurrentTouches, param2, param3);
            for each (_loc_5 in param1)
            {
                
                if (_loc_5.phase == TouchPhase.HOVER && _loc_5.target)
                {
                    sHoveringTouchData[sHoveringTouchData.length] = {touch:_loc_5, target:_loc_5.target, bubbleChain:_loc_5.bubbleChain};
                }
                if (_loc_5.phase == TouchPhase.HOVER || _loc_5.phase == TouchPhase.BEGAN)
                {
                    sHelperPoint.setTo(_loc_5.globalX, _loc_5.globalY);
                    _loc_5.target = this.mRoot.hitTest(sHelperPoint, true);
                }
            }
            for each (_loc_6 in sHoveringTouchData)
            {
                
                if (_loc_6.touch.target != _loc_6.target)
                {
                    _loc_4.dispatch(_loc_6.bubbleChain);
                }
            }
            for each (_loc_5 in param1)
            {
                
                _loc_5.dispatchEvent(_loc_4);
            }
            return;
        }// end function

        public function enqueue(param1:int, param2:String, param3:Number, param4:Number, param5:Number = 1, param6:Number = 1, param7:Number = 1) : void
        {
            this.mQueue.unshift(arguments);
            if (this.mCtrlDown && this.simulateMultitouch && param1 == 0)
            {
                this.mTouchMarker.moveMarker(param3, param4, this.mShiftDown);
                this.mQueue.unshift([1, param2, this.mTouchMarker.mockX, this.mTouchMarker.mockY]);
            }
            return;
        }// end function

        public function enqueueMouseLeftStage() : void
        {
            var _loc_1:* = this.getCurrentTouch(0);
            if (_loc_1 == null || _loc_1.phase != TouchPhase.HOVER)
            {
                return;
            }
            var _loc_2:* = 1;
            var _loc_3:* = _loc_1.globalX;
            var _loc_4:* = _loc_1.globalY;
            var _loc_5:* = _loc_1.globalX;
            var _loc_6:* = this.mStage.stageWidth - _loc_5;
            var _loc_7:* = _loc_1.globalY;
            var _loc_8:* = this.mStage.stageHeight - _loc_7;
            var _loc_9:* = Math.min(_loc_5, _loc_6, _loc_7, _loc_8);
            if (Math.min(_loc_5, _loc_6, _loc_7, _loc_8) == _loc_5)
            {
                _loc_3 = -_loc_2;
            }
            else if (_loc_9 == _loc_6)
            {
                _loc_3 = this.mStage.stageWidth + _loc_2;
            }
            else if (_loc_9 == _loc_7)
            {
                _loc_4 = -_loc_2;
            }
            else
            {
                _loc_4 = this.mStage.stageHeight + _loc_2;
            }
            this.enqueue(0, TouchPhase.HOVER, _loc_3, _loc_4);
            return;
        }// end function

        public function cancelTouches() : void
        {
            var _loc_1:* = null;
            if (this.mCurrentTouches.length > 0)
            {
                for each (_loc_1 in this.mCurrentTouches)
                {
                    
                    if (_loc_1.phase == TouchPhase.BEGAN || _loc_1.phase == TouchPhase.MOVED || _loc_1.phase == TouchPhase.STATIONARY)
                    {
                        _loc_1.phase = TouchPhase.ENDED;
                        _loc_1.cancelled = true;
                    }
                }
                this.processTouches(this.mCurrentTouches, this.mShiftDown, this.mCtrlDown);
            }
            _loc_3.length = 0;
            this.mQueue.length = 0;
            return;
        }// end function

        private function createOrUpdateTouch(param1:int, param2:String, param3:Number, param4:Number, param5:Number = 1, param6:Number = 1, param7:Number = 1) : Touch
        {
            var _loc_8:* = this.getCurrentTouch(param1);
            if (this.getCurrentTouch(param1) == null)
            {
                _loc_8 = new Touch(param1);
                this.addCurrentTouch(_loc_8);
            }
            _loc_8.globalX = param3;
            _loc_8.globalY = param4;
            _loc_8.phase = param2;
            _loc_8.timestamp = this.mElapsedTime;
            _loc_8.pressure = param5;
            _loc_8.width = param6;
            _loc_8.height = param7;
            if (param2 == TouchPhase.BEGAN)
            {
                this.updateTapCount(_loc_8);
            }
            return _loc_8;
        }// end function

        private function updateTapCount(param1:Touch) : void
        {
            var _loc_4:* = null;
            var _loc_5:* = NaN;
            var _loc_2:* = null;
            var _loc_3:* = this.mMultitapDistance * this.mMultitapDistance;
            for each (_loc_4 in this.mLastTaps)
            {
                
                _loc_5 = Math.pow(_loc_4.globalX - param1.globalX, 2) + Math.pow(_loc_4.globalY - param1.globalY, 2);
                if (_loc_5 <= _loc_3)
                {
                    _loc_2 = _loc_4;
                    break;
                }
            }
            if (_loc_2)
            {
                param1.tapCount = _loc_2.tapCount + 1;
                _loc_7.splice(_loc_7.indexOf(_loc_2), 1);
            }
            else
            {
                param1.tapCount = 1;
            }
            _loc_7.push(param1.clone());
            return;
        }// end function

        private function addCurrentTouch(param1:Touch) : void
        {
            var _loc_2:* = this.mCurrentTouches.length - 1;
            while (_loc_2 >= 0)
            {
                
                if (this.mCurrentTouches[_loc_2].id == param1.id)
                {
                    this.mCurrentTouches.splice(_loc_2, 1);
                }
                _loc_2 = _loc_2 - 1;
            }
            this.mCurrentTouches.push(param1);
            return;
        }// end function

        private function getCurrentTouch(param1:int) : Touch
        {
            var _loc_2:* = null;
            for each (_loc_2 in this.mCurrentTouches)
            {
                
                if (_loc_2.id == param1)
                {
                    return _loc_2;
                }
            }
            return null;
        }// end function

        private function containsTouchWithID(param1:Vector.<Touch>, param2:int) : Boolean
        {
            var _loc_3:* = null;
            for each (_loc_3 in param1)
            {
                
                if (_loc_3.id == param2)
                {
                    return true;
                }
            }
            return false;
        }// end function

        public function get simulateMultitouch() : Boolean
        {
            return this.mTouchMarker != null;
        }// end function

        public function set simulateMultitouch(param1:Boolean) : void
        {
            if (this.simulateMultitouch == param1)
            {
                return;
            }
            if (param1)
            {
                this.mTouchMarker = new TouchMarker();
                this.mTouchMarker.visible = false;
                this.mStage.addChild(this.mTouchMarker);
            }
            else
            {
                this.mTouchMarker.removeFromParent(true);
                this.mTouchMarker = null;
            }
            return;
        }// end function

        public function get multitapTime() : Number
        {
            return this.mMultitapTime;
        }// end function

        public function set multitapTime(param1:Number) : void
        {
            this.mMultitapTime = param1;
            return;
        }// end function

        public function get multitapDistance() : Number
        {
            return this.mMultitapDistance;
        }// end function

        public function set multitapDistance(param1:Number) : void
        {
            this.mMultitapDistance = param1;
            return;
        }// end function

        public function get root() : DisplayObject
        {
            return this.mRoot;
        }// end function

        public function set root(param1:DisplayObject) : void
        {
            this.mRoot = param1;
            return;
        }// end function

        public function get stage() : Stage
        {
            return this.mStage;
        }// end function

        public function get numCurrentTouches() : int
        {
            return this.mCurrentTouches.length;
        }// end function

        private function onKey(event:KeyboardEvent) : void
        {
            var _loc_2:* = false;
            var _loc_3:* = null;
            var _loc_4:* = null;
            if (event.keyCode == 17 || event.keyCode == 15)
            {
                _loc_2 = this.mCtrlDown;
                this.mCtrlDown = event.type == KeyboardEvent.KEY_DOWN;
                if (this.simulateMultitouch && _loc_2 != this.mCtrlDown)
                {
                    this.mTouchMarker.visible = this.mCtrlDown;
                    this.mTouchMarker.moveCenter(this.mStage.stageWidth / 2, this.mStage.stageHeight / 2);
                    _loc_3 = this.getCurrentTouch(0);
                    _loc_4 = this.getCurrentTouch(1);
                    if (_loc_3)
                    {
                        this.mTouchMarker.moveMarker(_loc_3.globalX, _loc_3.globalY);
                    }
                    if (_loc_2 && _loc_4 && _loc_4.phase != TouchPhase.ENDED)
                    {
                        this.mQueue.unshift([1, TouchPhase.ENDED, _loc_4.globalX, _loc_4.globalY]);
                    }
                    else if (this.mCtrlDown && _loc_3)
                    {
                        if (_loc_3.phase == TouchPhase.HOVER || _loc_3.phase == TouchPhase.ENDED)
                        {
                            this.mQueue.unshift([1, TouchPhase.HOVER, this.mTouchMarker.mockX, this.mTouchMarker.mockY]);
                        }
                        else
                        {
                            this.mQueue.unshift([1, TouchPhase.BEGAN, this.mTouchMarker.mockX, this.mTouchMarker.mockY]);
                        }
                    }
                }
            }
            else if (event.keyCode == 16)
            {
                this.mShiftDown = event.type == KeyboardEvent.KEY_DOWN;
            }
            return;
        }// end function

        private function monitorInterruptions(param1:Boolean) : void
        {
            var _loc_2:* = null;
            var _loc_3:* = null;
            try
            {
                _loc_2 = getDefinitionByName("flash.desktop::NativeApplication");
                _loc_3 = _loc_2["nativeApplication"];
                if (param1)
                {
                    _loc_3.addEventListener("deactivate", this.onInterruption, false, 0, true);
                }
                else
                {
                    _loc_3.removeEventListener("deactivate", this.onInterruption);
                }
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        private function onInterruption(param1:Object) : void
        {
            this.cancelTouches();
            return;
        }// end function

    }
}
