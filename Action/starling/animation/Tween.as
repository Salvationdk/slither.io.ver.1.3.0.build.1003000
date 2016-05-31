package starling.animation
{
    import __AS3__.vec.*;
    import starling.animation.*;
    import starling.events.*;

    public class Tween extends EventDispatcher implements IAnimatable
    {
        private var mTarget:Object;
        private var mTransitionFunc:Function;
        private var mTransitionName:String;
        private var mProperties:Vector.<String>;
        private var mStartValues:Vector.<Number>;
        private var mEndValues:Vector.<Number>;
        private var mUpdateFuncs:Vector.<Function>;
        private var mOnStart:Function;
        private var mOnUpdate:Function;
        private var mOnRepeat:Function;
        private var mOnComplete:Function;
        private var mOnStartArgs:Array;
        private var mOnUpdateArgs:Array;
        private var mOnRepeatArgs:Array;
        private var mOnCompleteArgs:Array;
        private var mTotalTime:Number;
        private var mCurrentTime:Number;
        private var mProgress:Number;
        private var mDelay:Number;
        private var mRoundToInt:Boolean;
        private var mNextTween:Tween;
        private var mRepeatCount:int;
        private var mRepeatDelay:Number;
        private var mReverse:Boolean;
        private var mCurrentCycle:int;
        private static const HINT_MARKER:String = "#";
        private static var sTweenPool:Vector.<Tween> = new Vector.<Tween>(0);

        public function Tween(param1:Object, param2:Number, param3:Object = "linear")
        {
            this.reset(param1, param2, param3);
            return;
        }// end function

        public function reset(param1:Object, param2:Number, param3:Object = "linear") : Tween
        {
            this.mTarget = param1;
            this.mCurrentTime = 0;
            this.mTotalTime = Math.max(0.0001, param2);
            this.mProgress = 0;
            var _loc_4:* = 0;
            this.mRepeatDelay = 0;
            this.mDelay = _loc_4;
            var _loc_4:* = null;
            this.mOnComplete = null;
            this.mOnRepeat = _loc_4;
            this.mOnUpdate = _loc_4;
            this.mOnStart = _loc_4;
            var _loc_4:* = null;
            this.mOnCompleteArgs = null;
            this.mOnRepeatArgs = _loc_4;
            this.mOnUpdateArgs = _loc_4;
            this.mOnStartArgs = _loc_4;
            var _loc_4:* = false;
            this.mReverse = false;
            this.mRoundToInt = _loc_4;
            this.mRepeatCount = 1;
            this.mCurrentCycle = -1;
            this.mNextTween = null;
            if (param3 is String)
            {
                this.transition = param3 as String;
            }
            else if (param3 is Function)
            {
                this.transitionFunc = param3 as Function;
            }
            else
            {
                throw new ArgumentError("Transition must be either a string or a function");
            }
            if (this.mProperties)
            {
                this.mProperties.length = 0;
            }
            else
            {
                this.mProperties = new Vector.<String>(0);
            }
            if (this.mStartValues)
            {
                this.mStartValues.length = 0;
            }
            else
            {
                this.mStartValues = new Vector.<Number>(0);
            }
            if (this.mEndValues)
            {
                this.mEndValues.length = 0;
            }
            else
            {
                this.mEndValues = new Vector.<Number>(0);
            }
            if (this.mUpdateFuncs)
            {
                this.mUpdateFuncs.length = 0;
            }
            else
            {
                this.mUpdateFuncs = new Vector.<Function>(0);
            }
            return this;
        }// end function

        public function animate(param1:String, param2:Number) : void
        {
            if (this.mTarget == null)
            {
                return;
            }
            var _loc_3:* = this.mProperties.length;
            var _loc_4:* = this.getUpdateFuncFromProperty(param1);
            this.mProperties[_loc_3] = getPropertyName(param1);
            this.mStartValues[_loc_3] = Number.NaN;
            this.mEndValues[_loc_3] = param2;
            this.mUpdateFuncs[_loc_3] = _loc_4;
            return;
        }// end function

        public function scaleTo(param1:Number) : void
        {
            this.animate("scaleX", param1);
            this.animate("scaleY", param1);
            return;
        }// end function

        public function moveTo(param1:Number, param2:Number) : void
        {
            this.animate("x", param1);
            this.animate("y", param2);
            return;
        }// end function

        public function fadeTo(param1:Number) : void
        {
            this.animate("alpha", param1);
            return;
        }// end function

        public function rotateTo(param1:Number, param2:String = "rad") : void
        {
            this.animate("rotation#" + param2, param1);
            return;
        }// end function

        public function advanceTime(param1:Number) : void
        {
            var _loc_2:* = 0;
            var _loc_9:* = null;
            var _loc_10:* = null;
            var _loc_11:* = null;
            if (param1 == 0 || this.mRepeatCount == 1 && this.mCurrentTime == this.mTotalTime)
            {
                return;
            }
            var _loc_3:* = this.mCurrentTime;
            var _loc_4:* = this.mTotalTime - this.mCurrentTime;
            var _loc_5:* = param1 > _loc_4 ? (param1 - _loc_4) : (0);
            this.mCurrentTime = this.mCurrentTime + param1;
            if (this.mCurrentTime <= 0)
            {
                return;
            }
            if (this.mCurrentTime > this.mTotalTime)
            {
                this.mCurrentTime = this.mTotalTime;
            }
            if (this.mCurrentCycle < 0 && _loc_3 <= 0 && this.mCurrentTime > 0)
            {
                var _loc_12:* = this;
                var _loc_13:* = this.mCurrentCycle + 1;
                _loc_12.mCurrentCycle = _loc_13;
                if (this.mOnStart != null)
                {
                    this.mOnStart.apply(this, this.mOnStartArgs);
                }
            }
            var _loc_6:* = this.mCurrentTime / this.mTotalTime;
            var _loc_7:* = this.mReverse && this.mCurrentCycle % 2 == 1;
            var _loc_8:* = this.mStartValues.length;
            this.mProgress = _loc_7 ? (this.mTransitionFunc(1 - _loc_6)) : (this.mTransitionFunc(_loc_6));
            _loc_2 = 0;
            while (_loc_2 < _loc_8)
            {
                
                if (this.mStartValues[_loc_2] != this.mStartValues[_loc_2])
                {
                    this.mStartValues[_loc_2] = this.mTarget[this.mProperties[_loc_2]] as Number;
                }
                _loc_9 = this.mUpdateFuncs[_loc_2] as Function;
                this._loc_9(this.mProperties[_loc_2], this.mStartValues[_loc_2], this.mEndValues[_loc_2]);
                _loc_2++;
            }
            if (this.mOnUpdate != null)
            {
                this.mOnUpdate.apply(this, this.mOnUpdateArgs);
            }
            if (_loc_3 < this.mTotalTime && this.mCurrentTime >= this.mTotalTime)
            {
                if (this.mRepeatCount == 0 || this.mRepeatCount > 1)
                {
                    this.mCurrentTime = -this.mRepeatDelay;
                    var _loc_12:* = this;
                    var _loc_13:* = this.mCurrentCycle + 1;
                    _loc_12.mCurrentCycle = _loc_13;
                    if (this.mRepeatCount > 1)
                    {
                        var _loc_12:* = this;
                        var _loc_13:* = this.mRepeatCount - 1;
                        _loc_12.mRepeatCount = _loc_13;
                    }
                    if (this.mOnRepeat != null)
                    {
                        this.mOnRepeat.apply(this, this.mOnRepeatArgs);
                    }
                }
                else
                {
                    _loc_10 = this.mOnComplete;
                    _loc_11 = this.mOnCompleteArgs;
                    dispatchEventWith(Event.REMOVE_FROM_JUGGLER);
                    if (_loc_10 != null)
                    {
                        _loc_10.apply(this, _loc_11);
                    }
                }
            }
            if (_loc_5)
            {
                this.advanceTime(_loc_5);
            }
            return;
        }// end function

        private function getUpdateFuncFromProperty(param1:String) : Function
        {
            var _loc_2:* = null;
            var _loc_3:* = getPropertyHint(param1);
            switch(_loc_3)
            {
                case null:
                {
                    _loc_2 = this.updateStandard;
                    break;
                }
                case "rgb":
                {
                    _loc_2 = this.updateRgb;
                    break;
                }
                case "rad":
                {
                    _loc_2 = this.updateRad;
                    break;
                }
                case "deg":
                {
                    _loc_2 = this.updateDeg;
                    break;
                }
                default:
                {
                    trace("[Starling] Ignoring unknown property hint:", _loc_3);
                    _loc_2 = this.updateStandard;
                    break;
                }
            }
            return _loc_2;
        }// end function

        private function updateStandard(param1:String, param2:Number, param3:Number) : void
        {
            var _loc_4:* = param2 + this.mProgress * (param3 - param2);
            if (this.mRoundToInt)
            {
                _loc_4 = Math.round(_loc_4);
            }
            this.mTarget[param1] = _loc_4;
            return;
        }// end function

        private function updateRgb(param1:String, param2:Number, param3:Number) : void
        {
            var _loc_4:* = uint(param2);
            var _loc_5:* = uint(param3);
            var _loc_6:* = _loc_4 >> 24 & 255;
            var _loc_7:* = _loc_4 >> 16 & 255;
            var _loc_8:* = _loc_4 >> 8 & 255;
            var _loc_9:* = _loc_4 & 255;
            var _loc_10:* = _loc_5 >> 24 & 255;
            var _loc_11:* = _loc_5 >> 16 & 255;
            var _loc_12:* = _loc_5 >> 8 & 255;
            var _loc_13:* = _loc_5 & 255;
            var _loc_14:* = _loc_6 + (_loc_10 - _loc_6) * this.mProgress;
            var _loc_15:* = _loc_7 + (_loc_11 - _loc_7) * this.mProgress;
            var _loc_16:* = _loc_8 + (_loc_12 - _loc_8) * this.mProgress;
            var _loc_17:* = _loc_9 + (_loc_13 - _loc_9) * this.mProgress;
            this.mTarget[param1] = _loc_14 << 24 | _loc_15 << 16 | _loc_16 << 8 | _loc_17;
            return;
        }// end function

        private function updateRad(param1:String, param2:Number, param3:Number) : void
        {
            this.updateAngle(Math.PI, param1, param2, param3);
            return;
        }// end function

        private function updateDeg(param1:String, param2:Number, param3:Number) : void
        {
            this.updateAngle(180, param1, param2, param3);
            return;
        }// end function

        private function updateAngle(param1:Number, param2:String, param3:Number, param4:Number) : void
        {
            while (Math.abs(param4 - param3) > param1)
            {
                
                if (param3 < param4)
                {
                    param4 = param4 - 2 * param1;
                    continue;
                }
                param4 = param4 + 2 * param1;
            }
            this.updateStandard(param2, param3, param4);
            return;
        }// end function

        public function getEndValue(param1:String) : Number
        {
            var _loc_2:* = this.mProperties.indexOf(param1);
            if (_loc_2 == -1)
            {
                throw new ArgumentError("The property \'" + param1 + "\' is not animated");
            }
            return this.mEndValues[_loc_2] as Number;
        }// end function

        public function get isComplete() : Boolean
        {
            return this.mCurrentTime >= this.mTotalTime && this.mRepeatCount == 1;
        }// end function

        public function get target() : Object
        {
            return this.mTarget;
        }// end function

        public function get transition() : String
        {
            return this.mTransitionName;
        }// end function

        public function set transition(param1:String) : void
        {
            this.mTransitionName = param1;
            this.mTransitionFunc = Transitions.getTransition(param1);
            if (this.mTransitionFunc == null)
            {
                throw new ArgumentError("Invalid transiton: " + param1);
            }
            return;
        }// end function

        public function get transitionFunc() : Function
        {
            return this.mTransitionFunc;
        }// end function

        public function set transitionFunc(param1:Function) : void
        {
            this.mTransitionName = "custom";
            this.mTransitionFunc = param1;
            return;
        }// end function

        public function get totalTime() : Number
        {
            return this.mTotalTime;
        }// end function

        public function get currentTime() : Number
        {
            return this.mCurrentTime;
        }// end function

        public function get progress() : Number
        {
            return this.mProgress;
        }// end function

        public function get delay() : Number
        {
            return this.mDelay;
        }// end function

        public function set delay(param1:Number) : void
        {
            this.mCurrentTime = this.mCurrentTime + this.mDelay - param1;
            this.mDelay = param1;
            return;
        }// end function

        public function get repeatCount() : int
        {
            return this.mRepeatCount;
        }// end function

        public function set repeatCount(param1:int) : void
        {
            this.mRepeatCount = param1;
            return;
        }// end function

        public function get repeatDelay() : Number
        {
            return this.mRepeatDelay;
        }// end function

        public function set repeatDelay(param1:Number) : void
        {
            this.mRepeatDelay = param1;
            return;
        }// end function

        public function get reverse() : Boolean
        {
            return this.mReverse;
        }// end function

        public function set reverse(param1:Boolean) : void
        {
            this.mReverse = param1;
            return;
        }// end function

        public function get roundToInt() : Boolean
        {
            return this.mRoundToInt;
        }// end function

        public function set roundToInt(param1:Boolean) : void
        {
            this.mRoundToInt = param1;
            return;
        }// end function

        public function get onStart() : Function
        {
            return this.mOnStart;
        }// end function

        public function set onStart(param1:Function) : void
        {
            this.mOnStart = param1;
            return;
        }// end function

        public function get onUpdate() : Function
        {
            return this.mOnUpdate;
        }// end function

        public function set onUpdate(param1:Function) : void
        {
            this.mOnUpdate = param1;
            return;
        }// end function

        public function get onRepeat() : Function
        {
            return this.mOnRepeat;
        }// end function

        public function set onRepeat(param1:Function) : void
        {
            this.mOnRepeat = param1;
            return;
        }// end function

        public function get onComplete() : Function
        {
            return this.mOnComplete;
        }// end function

        public function set onComplete(param1:Function) : void
        {
            this.mOnComplete = param1;
            return;
        }// end function

        public function get onStartArgs() : Array
        {
            return this.mOnStartArgs;
        }// end function

        public function set onStartArgs(param1:Array) : void
        {
            this.mOnStartArgs = param1;
            return;
        }// end function

        public function get onUpdateArgs() : Array
        {
            return this.mOnUpdateArgs;
        }// end function

        public function set onUpdateArgs(param1:Array) : void
        {
            this.mOnUpdateArgs = param1;
            return;
        }// end function

        public function get onRepeatArgs() : Array
        {
            return this.mOnRepeatArgs;
        }// end function

        public function set onRepeatArgs(param1:Array) : void
        {
            this.mOnRepeatArgs = param1;
            return;
        }// end function

        public function get onCompleteArgs() : Array
        {
            return this.mOnCompleteArgs;
        }// end function

        public function set onCompleteArgs(param1:Array) : void
        {
            this.mOnCompleteArgs = param1;
            return;
        }// end function

        public function get nextTween() : Tween
        {
            return this.mNextTween;
        }// end function

        public function set nextTween(param1:Tween) : void
        {
            this.mNextTween = param1;
            return;
        }// end function

        static function getPropertyHint(param1:String) : String
        {
            if (param1.indexOf("color") != -1 || param1.indexOf("Color") != -1)
            {
                return "rgb";
            }
            var _loc_2:* = param1.indexOf(HINT_MARKER);
            if (_loc_2 != -1)
            {
                return param1.substr((_loc_2 + 1));
            }
            return null;
        }// end function

        static function getPropertyName(param1:String) : String
        {
            var _loc_2:* = param1.indexOf(HINT_MARKER);
            if (_loc_2 != -1)
            {
                return param1.substring(0, _loc_2);
            }
            return param1;
        }// end function

        static function fromPool(param1:Object, param2:Number, param3:Object = "linear") : Tween
        {
            if (sTweenPool.length)
            {
                return sTweenPool.pop().reset(param1, param2, param3);
            }
            return new Tween(param1, param2, param3);
        }// end function

        static function toPool(param1:Tween) : void
        {
            var _loc_2:* = null;
            param1.mOnComplete = null;
            param1.mOnRepeat = _loc_2;
            param1.mOnUpdate = _loc_2;
            param1.mOnStart = _loc_2;
            var _loc_2:* = null;
            param1.mOnCompleteArgs = null;
            param1.mOnRepeatArgs = _loc_2;
            param1.mOnUpdateArgs = _loc_2;
            param1.mOnStartArgs = _loc_2;
            param1.mTarget = null;
            param1.mTransitionFunc = null;
            param1.removeEventListeners();
            sTweenPool.push(param1);
            return;
        }// end function

    }
}
