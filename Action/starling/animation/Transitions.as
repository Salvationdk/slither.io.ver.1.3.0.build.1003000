package starling.animation
{
    import flash.utils.*;
    import starling.errors.*;

    public class Transitions extends Object
    {
        public static const LINEAR:String = "linear";
        public static const EASE_IN:String = "easeIn";
        public static const EASE_OUT:String = "easeOut";
        public static const EASE_IN_OUT:String = "easeInOut";
        public static const EASE_OUT_IN:String = "easeOutIn";
        public static const EASE_IN_BACK:String = "easeInBack";
        public static const EASE_OUT_BACK:String = "easeOutBack";
        public static const EASE_IN_OUT_BACK:String = "easeInOutBack";
        public static const EASE_OUT_IN_BACK:String = "easeOutInBack";
        public static const EASE_IN_ELASTIC:String = "easeInElastic";
        public static const EASE_OUT_ELASTIC:String = "easeOutElastic";
        public static const EASE_IN_OUT_ELASTIC:String = "easeInOutElastic";
        public static const EASE_OUT_IN_ELASTIC:String = "easeOutInElastic";
        public static const EASE_IN_BOUNCE:String = "easeInBounce";
        public static const EASE_OUT_BOUNCE:String = "easeOutBounce";
        public static const EASE_IN_OUT_BOUNCE:String = "easeInOutBounce";
        public static const EASE_OUT_IN_BOUNCE:String = "easeOutInBounce";
        private static var sTransitions:Dictionary;

        public function Transitions()
        {
            throw new AbstractClassError();
        }// end function

        public static function getTransition(param1:String) : Function
        {
            if (sTransitions == null)
            {
                registerDefaults();
            }
            return sTransitions[param1];
        }// end function

        public static function register(param1:String, param2:Function) : void
        {
            if (sTransitions == null)
            {
                registerDefaults();
            }
            sTransitions[param1] = param2;
            return;
        }// end function

        private static function registerDefaults() : void
        {
            sTransitions = new Dictionary();
            register(LINEAR, linear);
            register(EASE_IN, easeIn);
            register(EASE_OUT, easeOut);
            register(EASE_IN_OUT, easeInOut);
            register(EASE_OUT_IN, easeOutIn);
            register(EASE_IN_BACK, easeInBack);
            register(EASE_OUT_BACK, easeOutBack);
            register(EASE_IN_OUT_BACK, easeInOutBack);
            register(EASE_OUT_IN_BACK, easeOutInBack);
            register(EASE_IN_ELASTIC, easeInElastic);
            register(EASE_OUT_ELASTIC, easeOutElastic);
            register(EASE_IN_OUT_ELASTIC, easeInOutElastic);
            register(EASE_OUT_IN_ELASTIC, easeOutInElastic);
            register(EASE_IN_BOUNCE, easeInBounce);
            register(EASE_OUT_BOUNCE, easeOutBounce);
            register(EASE_IN_OUT_BOUNCE, easeInOutBounce);
            register(EASE_OUT_IN_BOUNCE, easeOutInBounce);
            return;
        }// end function

        static function linear(param1:Number) : Number
        {
            return param1;
        }// end function

        static function easeIn(param1:Number) : Number
        {
            return param1 * param1 * param1;
        }// end function

        static function easeOut(param1:Number) : Number
        {
            var _loc_2:* = param1 - 1;
            return _loc_2 * _loc_2 * _loc_2 + 1;
        }// end function

        static function easeInOut(param1:Number) : Number
        {
            return easeCombined(easeIn, easeOut, param1);
        }// end function

        static function easeOutIn(param1:Number) : Number
        {
            return easeCombined(easeOut, easeIn, param1);
        }// end function

        static function easeInBack(param1:Number) : Number
        {
            var _loc_2:* = 1.70158;
            return Math.pow(param1, 2) * ((_loc_2 + 1) * param1 - _loc_2);
        }// end function

        static function easeOutBack(param1:Number) : Number
        {
            var _loc_2:* = param1 - 1;
            var _loc_3:* = 1.70158;
            return Math.pow(_loc_2, 2) * ((_loc_3 + 1) * _loc_2 + _loc_3) + 1;
        }// end function

        static function easeInOutBack(param1:Number) : Number
        {
            return easeCombined(easeInBack, easeOutBack, param1);
        }// end function

        static function easeOutInBack(param1:Number) : Number
        {
            return easeCombined(easeOutBack, easeInBack, param1);
        }// end function

        static function easeInElastic(param1:Number) : Number
        {
            var _loc_2:* = NaN;
            var _loc_3:* = NaN;
            var _loc_4:* = NaN;
            if (param1 == 0 || param1 == 1)
            {
                return param1;
            }
            _loc_2 = 0.3;
            _loc_3 = _loc_2 / 4;
            _loc_4 = param1 - 1;
            return -1 * Math.pow(2, 10 * _loc_4) * Math.sin((_loc_4 - _loc_3) * (2 * Math.PI) / _loc_2);
        }// end function

        static function easeOutElastic(param1:Number) : Number
        {
            var _loc_2:* = NaN;
            var _loc_3:* = NaN;
            if (param1 == 0 || param1 == 1)
            {
                return param1;
            }
            _loc_2 = 0.3;
            _loc_3 = _loc_2 / 4;
            return Math.pow(2, -10 * param1) * Math.sin((param1 - _loc_3) * (2 * Math.PI) / _loc_2) + 1;
        }// end function

        static function easeInOutElastic(param1:Number) : Number
        {
            return easeCombined(easeInElastic, easeOutElastic, param1);
        }// end function

        static function easeOutInElastic(param1:Number) : Number
        {
            return easeCombined(easeOutElastic, easeInElastic, param1);
        }// end function

        static function easeInBounce(param1:Number) : Number
        {
            return 1 - easeOutBounce(1 - param1);
        }// end function

        static function easeOutBounce(param1:Number) : Number
        {
            var _loc_4:* = NaN;
            var _loc_2:* = 7.5625;
            var _loc_3:* = 2.75;
            if (param1 < 1 / _loc_3)
            {
                _loc_4 = _loc_2 * Math.pow(param1, 2);
            }
            else if (param1 < 2 / _loc_3)
            {
                param1 = param1 - 1.5 / _loc_3;
                _loc_4 = _loc_2 * Math.pow(param1, 2) + 0.75;
            }
            else if (param1 < 2.5 / _loc_3)
            {
                param1 = param1 - 2.25 / _loc_3;
                _loc_4 = _loc_2 * Math.pow(param1, 2) + 0.9375;
            }
            else
            {
                param1 = param1 - 2.625 / _loc_3;
                _loc_4 = _loc_2 * Math.pow(param1, 2) + 0.984375;
            }
            return _loc_4;
        }// end function

        static function easeInOutBounce(param1:Number) : Number
        {
            return easeCombined(easeInBounce, easeOutBounce, param1);
        }// end function

        static function easeOutInBounce(param1:Number) : Number
        {
            return easeCombined(easeOutBounce, easeInBounce, param1);
        }// end function

        static function easeCombined(param1:Function, param2:Function, param3:Number) : Number
        {
            if (param3 < 0.5)
            {
                return 0.5 * Transitions.param1(param3 * 2);
            }
            return 0.5 * Transitions.param2((param3 - 0.5) * 2) + 0.5;
        }// end function

    }
}
