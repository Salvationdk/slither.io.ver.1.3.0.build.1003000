package starling.utils
{
    import flash.geom.*;
    import starling.errors.*;

    public class MathUtil extends Object
    {
        private static const TWO_PI:Number = 6.28319;

        public function MathUtil()
        {
            throw new AbstractClassError();
        }// end function

        public static function intersectLineWithXYPlane(param1:Vector3D, param2:Vector3D, param3:Point = null) : Point
        {
            if (param3 == null)
            {
                param3 = new Point();
            }
            var _loc_4:* = param2.x - param1.x;
            var _loc_5:* = param2.y - param1.y;
            var _loc_6:* = param2.z - param1.z;
            var _loc_7:* = (-param1.z) / _loc_6;
            param3.x = param1.x + _loc_7 * _loc_4;
            param3.y = param1.y + _loc_7 * _loc_5;
            return param3;
        }// end function

        public static function normalizeAngle(param1:Number) : Number
        {
            param1 = param1 % TWO_PI;
            if (param1 < -Math.PI)
            {
                param1 = param1 + TWO_PI;
            }
            if (param1 > Math.PI)
            {
                param1 = param1 - TWO_PI;
            }
            return param1;
        }// end function

        public static function clamp(param1:Number, param2:Number, param3:Number) : Number
        {
            return param1 < param2 ? (param2) : (param1 > param3 ? (param3) : (param1));
        }// end function

    }
}
