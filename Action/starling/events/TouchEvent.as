package starling.events
{
    import __AS3__.vec.*;
    import starling.display.*;

    public class TouchEvent extends Event
    {
        private var mShiftKey:Boolean;
        private var mCtrlKey:Boolean;
        private var mTimestamp:Number;
        private var mVisitedObjects:Vector.<EventDispatcher>;
        public static const TOUCH:String = "touch";
        private static var sTouches:Vector.<Touch> = new Vector.<Touch>(0);

        public function TouchEvent(param1:String, param2:Vector.<Touch>, param3:Boolean = false, param4:Boolean = false, param5:Boolean = true)
        {
            super(param1, param5, param2);
            this.mShiftKey = param3;
            this.mCtrlKey = param4;
            this.mTimestamp = -1;
            this.mVisitedObjects = new Vector.<EventDispatcher>(0);
            var _loc_6:* = param2.length;
            var _loc_7:* = 0;
            while (_loc_7 < _loc_6)
            {
                
                if (param2[_loc_7].timestamp > this.mTimestamp)
                {
                    this.mTimestamp = param2[_loc_7].timestamp;
                }
                _loc_7++;
            }
            return;
        }// end function

        public function getTouches(param1:DisplayObject, param2:String = null, param3:Vector.<Touch> = null) : Vector.<Touch>
        {
            var _loc_7:* = null;
            var _loc_8:* = false;
            var _loc_9:* = false;
            if (param3 == null)
            {
                param3 = new Vector.<Touch>(0);
            }
            var _loc_4:* = data as Vector.<Touch>;
            var _loc_5:* = (_loc_4).length;
            var _loc_6:* = 0;
            while (_loc_6 < _loc_5)
            {
                
                _loc_7 = _loc_4[_loc_6];
                _loc_8 = _loc_7.isTouching(param1);
                _loc_9 = param2 == null || param2 == _loc_7.phase;
                if (_loc_8 && _loc_9)
                {
                    param3[param3.length] = _loc_7;
                }
                _loc_6++;
            }
            return param3;
        }// end function

        public function getTouch(param1:DisplayObject, param2:String = null, param3:int = -1) : Touch
        {
            var _loc_5:* = null;
            var _loc_6:* = 0;
            this.getTouches(param1, param2, sTouches);
            var _loc_4:* = sTouches.length;
            if (sTouches.length > 0)
            {
                _loc_5 = null;
                if (param3 < 0)
                {
                    _loc_5 = sTouches[0];
                }
                else
                {
                    _loc_6 = 0;
                    while (_loc_6 < _loc_4)
                    {
                        
                        if (sTouches[_loc_6].id == param3)
                        {
                            _loc_5 = sTouches[_loc_6];
                            break;
                        }
                        _loc_6++;
                    }
                }
                sTouches.length = 0;
                return _loc_5;
            }
            else
            {
                return null;
            }
        }// end function

        public function interactsWith(param1:DisplayObject) : Boolean
        {
            var _loc_2:* = false;
            this.getTouches(param1, null, sTouches);
            var _loc_3:* = sTouches.length - 1;
            while (_loc_3 >= 0)
            {
                
                if (sTouches[_loc_3].phase != TouchPhase.ENDED)
                {
                    _loc_2 = true;
                    break;
                }
                _loc_3 = _loc_3 - 1;
            }
            sTouches.length = 0;
            return _loc_2;
        }// end function

        function dispatch(param1:Vector.<EventDispatcher>) : void
        {
            var _loc_2:* = 0;
            var _loc_3:* = null;
            var _loc_4:* = 0;
            var _loc_5:* = null;
            var _loc_6:* = false;
            if (param1 && param1.length)
            {
                _loc_2 = bubbles ? (param1.length) : (1);
                _loc_3 = target;
                setTarget(param1[0] as EventDispatcher);
                _loc_4 = 0;
                while (_loc_4 < _loc_2)
                {
                    
                    _loc_5 = param1[_loc_4] as EventDispatcher;
                    if (this.mVisitedObjects.indexOf(_loc_5) == -1)
                    {
                        _loc_6 = _loc_5.invokeEvent(this);
                        this.mVisitedObjects[this.mVisitedObjects.length] = _loc_5;
                        if (_loc_6)
                        {
                            break;
                        }
                    }
                    _loc_4++;
                }
                setTarget(_loc_3);
            }
            return;
        }// end function

        public function get timestamp() : Number
        {
            return this.mTimestamp;
        }// end function

        public function get touches() : Vector.<Touch>
        {
            return (data as Vector.<Touch>).concat();
        }// end function

        public function get shiftKey() : Boolean
        {
            return this.mShiftKey;
        }// end function

        public function get ctrlKey() : Boolean
        {
            return this.mCtrlKey;
        }// end function

    }
}
