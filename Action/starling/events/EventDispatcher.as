package starling.events
{
    import __AS3__.vec.*;
    import flash.utils.*;
    import starling.display.*;

    public class EventDispatcher extends Object
    {
        private var mEventListeners:Dictionary;
        private static var sBubbleChains:Array = [];

        public function EventDispatcher()
        {
            return;
        }// end function

        public function addEventListener(param1:String, param2:Function) : void
        {
            if (this.mEventListeners == null)
            {
                this.mEventListeners = new Dictionary();
            }
            var _loc_3:* = this.mEventListeners[param1] as Vector.<Function>;
            if (_loc_3 == null)
            {
                new Vector.<Function>(1)[0] = param2;
                this.mEventListeners[param1] = new Vector.<Function>(1);
            }
            else if (_loc_3.indexOf(param2) == -1)
            {
                _loc_3[_loc_3.length] = param2;
            }
            return;
        }// end function

        public function removeEventListener(param1:String, param2:Function) : void
        {
            var _loc_3:* = null;
            var _loc_4:* = 0;
            var _loc_5:* = 0;
            var _loc_6:* = null;
            var _loc_7:* = 0;
            var _loc_8:* = null;
            if (this.mEventListeners)
            {
                _loc_3 = this.mEventListeners[param1] as Vector.<Function>;
                _loc_4 = _loc_3 ? (_loc_3.length) : (0);
                if (_loc_4 > 0)
                {
                    _loc_5 = 0;
                    _loc_6 = new Vector.<Function>((_loc_4 - 1));
                    _loc_7 = 0;
                    while (_loc_7 < _loc_4)
                    {
                        
                        _loc_8 = _loc_3[_loc_7];
                        if (_loc_8 != param2)
                        {
                            _loc_6[int(_loc_5++)] = _loc_8;
                        }
                        _loc_7++;
                    }
                    this.mEventListeners[param1] = _loc_6;
                }
            }
            return;
        }// end function

        public function removeEventListeners(param1:String = null) : void
        {
            if (param1 && this.mEventListeners)
            {
                delete this.mEventListeners[param1];
            }
            else
            {
                this.mEventListeners = null;
            }
            return;
        }// end function

        public function dispatchEvent(event:Event) : void
        {
            var _loc_2:* = event.bubbles;
            if (!_loc_2 && (this.mEventListeners == null || !(event.type in this.mEventListeners)))
            {
                return;
            }
            var _loc_3:* = event.target;
            event.setTarget(this);
            if (_loc_2 && this is DisplayObject)
            {
                this.bubbleEvent(event);
            }
            else
            {
                this.invokeEvent(event);
            }
            if (_loc_3)
            {
                event.setTarget(_loc_3);
            }
            return;
        }// end function

        function invokeEvent(event:Event) : Boolean
        {
            var _loc_4:* = 0;
            var _loc_5:* = null;
            var _loc_6:* = 0;
            var _loc_2:* = this.mEventListeners ? (this.mEventListeners[event.type] as Vector.<Function>) : (null);
            var _loc_3:* = _loc_2 == null ? (0) : (_loc_2.length);
            if (_loc_3)
            {
                event.setCurrentTarget(this);
                _loc_4 = 0;
                while (_loc_4 < _loc_3)
                {
                    
                    _loc_5 = _loc_2[_loc_4] as Function;
                    _loc_6 = _loc_5.length;
                    if (_loc_6 == 0)
                    {
                        this._loc_5();
                    }
                    else if (_loc_6 == 1)
                    {
                        this._loc_5(event);
                    }
                    else
                    {
                        this._loc_5(event, event.data);
                    }
                    if (event.stopsImmediatePropagation)
                    {
                        return true;
                    }
                    _loc_4++;
                }
                return event.stopsPropagation;
            }
            else
            {
                return false;
            }
        }// end function

        function bubbleEvent(event:Event) : void
        {
            var _loc_2:* = null;
            var _loc_6:* = false;
            var _loc_3:* = this as DisplayObject;
            var _loc_4:* = 1;
            if (sBubbleChains.length > 0)
            {
                _loc_2 = sBubbleChains.pop();
                _loc_2[0] = _loc_3;
            }
            else
            {
                new Vector.<EventDispatcher>(1)[0] = _loc_3;
                _loc_2 = new Vector.<EventDispatcher>(1);
            }
            do
            {
                
                _loc_2[int(_loc_4++)] = _loc_3;
                var _loc_7:* = _loc_3.parent;
                _loc_3 = _loc_3.parent;
            }while (_loc_7 != null)
            var _loc_5:* = 0;
            while (_loc_5 < _loc_4)
            {
                
                _loc_6 = _loc_2[_loc_5].invokeEvent(event);
                if (_loc_6)
                {
                    break;
                }
                _loc_5++;
            }
            _loc_2.length = 0;
            sBubbleChains[sBubbleChains.length] = _loc_2;
            return;
        }// end function

        public function dispatchEventWith(param1:String, param2:Boolean = false, param3:Object = null) : void
        {
            var _loc_4:* = null;
            if (param2 || this.hasEventListener(param1))
            {
                _loc_4 = Event.fromPool(param1, param2, param3);
                this.dispatchEvent(_loc_4);
                Event.toPool(_loc_4);
            }
            return;
        }// end function

        public function hasEventListener(param1:String) : Boolean
        {
            var _loc_2:* = this.mEventListeners ? (this.mEventListeners[param1]) : (null);
            return _loc_2 ? (_loc_2.length != 0) : (false);
        }// end function

    }
}
