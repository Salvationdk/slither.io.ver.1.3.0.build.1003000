package starling.animation
{
    import __AS3__.vec.*;
    import starling.animation.*;
    import starling.core.*;
    import starling.events.*;

    public class Juggler extends Object implements IAnimatable
    {
        private var mObjects:Vector.<IAnimatable>;
        private var mElapsedTime:Number;

        public function Juggler()
        {
            this.mElapsedTime = 0;
            this.mObjects = new Vector.<IAnimatable>(0);
            return;
        }// end function

        public function add(param1:IAnimatable) : void
        {
            var _loc_2:* = null;
            if (param1 && this.mObjects.indexOf(param1) == -1)
            {
                this.mObjects[this.mObjects.length] = param1;
                _loc_2 = param1 as EventDispatcher;
                if (_loc_2)
                {
                    _loc_2.addEventListener(Event.REMOVE_FROM_JUGGLER, this.onRemove);
                }
            }
            return;
        }// end function

        public function contains(param1:IAnimatable) : Boolean
        {
            return this.mObjects.indexOf(param1) != -1;
        }// end function

        public function remove(param1:IAnimatable) : void
        {
            if (param1 == null)
            {
                return;
            }
            var _loc_2:* = param1 as EventDispatcher;
            if (_loc_2)
            {
                _loc_2.removeEventListener(Event.REMOVE_FROM_JUGGLER, this.onRemove);
            }
            var _loc_3:* = this.mObjects.indexOf(param1);
            if (_loc_3 != -1)
            {
                this.mObjects[_loc_3] = null;
            }
            return;
        }// end function

        public function removeTweens(param1:Object) : void
        {
            var _loc_3:* = null;
            if (param1 == null)
            {
                return;
            }
            var _loc_2:* = this.mObjects.length - 1;
            while (_loc_2 >= 0)
            {
                
                _loc_3 = this.mObjects[_loc_2] as Tween;
                if (_loc_3 && _loc_3.target == param1)
                {
                    _loc_3.removeEventListener(Event.REMOVE_FROM_JUGGLER, this.onRemove);
                    this.mObjects[_loc_2] = null;
                }
                _loc_2 = _loc_2 - 1;
            }
            return;
        }// end function

        public function containsTweens(param1:Object) : Boolean
        {
            var _loc_3:* = null;
            if (param1 == null)
            {
                return false;
            }
            var _loc_2:* = this.mObjects.length - 1;
            while (_loc_2 >= 0)
            {
                
                _loc_3 = this.mObjects[_loc_2] as Tween;
                if (_loc_3 && _loc_3.target == param1)
                {
                    return true;
                }
                _loc_2 = _loc_2 - 1;
            }
            return false;
        }// end function

        public function purge() : void
        {
            var _loc_2:* = null;
            var _loc_1:* = this.mObjects.length - 1;
            while (_loc_1 >= 0)
            {
                
                _loc_2 = this.mObjects[_loc_1] as EventDispatcher;
                if (_loc_2)
                {
                    _loc_2.removeEventListener(Event.REMOVE_FROM_JUGGLER, this.onRemove);
                }
                this.mObjects[_loc_1] = null;
                _loc_1 = _loc_1 - 1;
            }
            return;
        }// end function

        public function delayCall(param1:Function, param2:Number, ... args) : IAnimatable
        {
            if (param1 == null)
            {
                return null;
            }
            var _loc_5:* = DelayedCall;
            args = _loc_5.starling_internal::fromPool(param1, param2, args);
            args.addEventListener(Event.REMOVE_FROM_JUGGLER, this.onPooledDelayedCallComplete);
            this.add(args);
            return args;
        }// end function

        public function repeatCall(param1:Function, param2:Number, param3:int = 0, ... args) : IAnimatable
        {
            if (param1 == null)
            {
                return null;
            }
            var _loc_6:* = DelayedCall;
            args = _loc_6.starling_internal::fromPool(param1, param2, args);
            args.repeatCount = param3;
            args.addEventListener(Event.REMOVE_FROM_JUGGLER, this.onPooledDelayedCallComplete);
            this.add(args);
            return args;
        }// end function

        private function onPooledDelayedCallComplete(event:Event) : void
        {
            var _loc_2:* = DelayedCall;
            _loc_2.starling_internal::toPool(event.target as DelayedCall);
            return;
        }// end function

        public function tween(param1:Object, param2:Number, param3:Object) : IAnimatable
        {
            var _loc_5:* = null;
            var _loc_6:* = null;
            if (param1 == null)
            {
                throw new ArgumentError("target must not be null");
            }
            var _loc_7:* = Tween;
            var _loc_4:* = _loc_7.starling_internal::fromPool(param1, param2);
            for (_loc_5 in param3)
            {
                
                _loc_6 = _loc_8[_loc_5];
                if (_loc_4.hasOwnProperty(_loc_5))
                {
                    _loc_4[_loc_5] = _loc_6;
                    continue;
                }
                if (param1.hasOwnProperty(Tween.getPropertyName(_loc_5)))
                {
                    _loc_4.animate(_loc_5, _loc_6 as Number);
                    continue;
                }
                throw new ArgumentError("Invalid property: " + _loc_5);
            }
            _loc_4.addEventListener(Event.REMOVE_FROM_JUGGLER, this.onPooledTweenComplete);
            this.add(_loc_4);
            return _loc_4;
        }// end function

        private function onPooledTweenComplete(event:Event) : void
        {
            var _loc_2:* = Tween;
            _loc_2.starling_internal::toPool(event.target as Tween);
            return;
        }// end function

        public function advanceTime(param1:Number) : void
        {
            var _loc_4:* = 0;
            var _loc_5:* = null;
            var _loc_2:* = this.mObjects.length;
            var _loc_3:* = 0;
            this.mElapsedTime = this.mElapsedTime + param1;
            if (_loc_2 == 0)
            {
                return;
            }
            _loc_4 = 0;
            while (_loc_4 < _loc_2)
            {
                
                _loc_5 = this.mObjects[_loc_4];
                if (_loc_5)
                {
                    if (_loc_3 != _loc_4)
                    {
                        this.mObjects[_loc_3] = _loc_5;
                        this.mObjects[_loc_4] = null;
                    }
                    _loc_5.advanceTime(param1);
                    _loc_3++;
                }
                _loc_4++;
            }
            if (_loc_3 != _loc_4)
            {
                _loc_2 = this.mObjects.length;
                while (_loc_4 < _loc_2)
                {
                    
                    this.mObjects[int(_loc_3++)] = this.mObjects[int(_loc_4++)];
                }
                this.mObjects.length = _loc_3;
            }
            return;
        }// end function

        private function onRemove(event:Event) : void
        {
            this.remove(event.target as IAnimatable);
            var _loc_2:* = event.target as Tween;
            if (_loc_2 && _loc_2.isComplete)
            {
                this.add(_loc_2.nextTween);
            }
            return;
        }// end function

        public function get elapsedTime() : Number
        {
            return this.mElapsedTime;
        }// end function

        protected function get objects() : Vector.<IAnimatable>
        {
            return this.mObjects;
        }// end function

    }
}
