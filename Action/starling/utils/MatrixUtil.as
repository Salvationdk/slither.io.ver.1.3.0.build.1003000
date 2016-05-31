package starling.utils
{
    import __AS3__.vec.*;
    import flash.geom.*;
    import starling.errors.*;

    public class MatrixUtil extends Object
    {
        private static var sRawData:Vector.<Number> = new Vector.<Number>(16);
        private static var sRawData2:Vector.<Number> = new Vector.<Number>(16, true);

        public function MatrixUtil()
        {
            throw new AbstractClassError();
        }// end function

        public static function convertTo3D(param1:Matrix, param2:Matrix3D = null) : Matrix3D
        {
            if (param2 == null)
            {
                param2 = new Matrix3D();
            }
            sRawData[0] = param1.a;
            sRawData[1] = param1.b;
            sRawData[4] = param1.c;
            sRawData[5] = param1.d;
            sRawData[12] = param1.tx;
            sRawData[13] = param1.ty;
            param2.copyRawDataFrom(sRawData);
            return param2;
        }// end function

        public static function convertTo2D(param1:Matrix3D, param2:Matrix = null) : Matrix
        {
            if (param2 == null)
            {
                param2 = new Matrix();
            }
            param1.copyRawDataTo(sRawData2);
            param2.a = sRawData2[0];
            param2.b = sRawData2[1];
            param2.c = sRawData2[4];
            param2.d = sRawData2[5];
            param2.tx = sRawData2[12];
            param2.ty = sRawData2[13];
            return param2;
        }// end function

        public static function transformPoint(param1:Matrix, param2:Point, param3:Point = null) : Point
        {
            return transformCoords(param1, param2.x, param2.y, param3);
        }// end function

        public static function transformPoint3D(param1:Matrix3D, param2:Vector3D, param3:Vector3D = null) : Vector3D
        {
            return transformCoords3D(param1, param2.x, param2.y, param2.z, param3);
        }// end function

        public static function transformCoords(param1:Matrix, param2:Number, param3:Number, param4:Point = null) : Point
        {
            if (param4 == null)
            {
                param4 = new Point();
            }
            param4.x = param1.a * param2 + param1.c * param3 + param1.tx;
            param4.y = param1.d * param3 + param1.b * param2 + param1.ty;
            return param4;
        }// end function

        public static function transformCoords3D(param1:Matrix3D, param2:Number, param3:Number, param4:Number, param5:Vector3D = null) : Vector3D
        {
            if (param5 == null)
            {
                param5 = new Vector3D();
            }
            param1.copyRawDataTo(sRawData2);
            param5.x = param2 * sRawData2[0] + param3 * sRawData2[4] + param4 * sRawData2[8] + sRawData2[12];
            param5.y = param2 * sRawData2[1] + param3 * sRawData2[5] + param4 * sRawData2[9] + sRawData2[13];
            param5.z = param2 * sRawData2[2] + param3 * sRawData2[6] + param4 * sRawData2[10] + sRawData2[14];
            param5.w = param2 * sRawData2[3] + param3 * sRawData2[7] + param4 * sRawData2[11] + sRawData2[15];
            return param5;
        }// end function

        public static function skew(param1:Matrix, param2:Number, param3:Number) : void
        {
            var _loc_4:* = Math.sin(param2);
            var _loc_5:* = Math.cos(param2);
            var _loc_6:* = Math.sin(param3);
            var _loc_7:* = Math.cos(param3);
            param1.setTo(param1.a * _loc_7 - param1.b * _loc_4, param1.a * _loc_6 + param1.b * _loc_5, param1.c * _loc_7 - param1.d * _loc_4, param1.c * _loc_6 + param1.d * _loc_5, param1.tx * _loc_7 - param1.ty * _loc_4, param1.tx * _loc_6 + param1.ty * _loc_5);
            return;
        }// end function

        public static function prependMatrix(param1:Matrix, param2:Matrix) : void
        {
            param1.setTo(param1.a * param2.a + param1.c * param2.b, param1.b * param2.a + param1.d * param2.b, param1.a * param2.c + param1.c * param2.d, param1.b * param2.c + param1.d * param2.d, param1.tx + param1.a * param2.tx + param1.c * param2.ty, param1.ty + param1.b * param2.tx + param1.d * param2.ty);
            return;
        }// end function

        public static function prependTranslation(param1:Matrix, param2:Number, param3:Number) : void
        {
            param1.tx = param1.tx + (param1.a * param2 + param1.c * param3);
            param1.ty = param1.ty + (param1.b * param2 + param1.d * param3);
            return;
        }// end function

        public static function prependScale(param1:Matrix, param2:Number, param3:Number) : void
        {
            param1.setTo(param1.a * param2, param1.b * param2, param1.c * param3, param1.d * param3, param1.tx, param1.ty);
            return;
        }// end function

        public static function prependRotation(param1:Matrix, param2:Number) : void
        {
            var _loc_3:* = Math.sin(param2);
            var _loc_4:* = Math.cos(param2);
            param1.setTo(param1.a * _loc_4 + param1.c * _loc_3, param1.b * _loc_4 + param1.d * _loc_3, param1.c * _loc_4 - param1.a * _loc_3, param1.d * _loc_4 - param1.b * _loc_3, param1.tx, param1.ty);
            return;
        }// end function

        public static function prependSkew(param1:Matrix, param2:Number, param3:Number) : void
        {
            var _loc_4:* = Math.sin(param2);
            var _loc_5:* = Math.cos(param2);
            var _loc_6:* = Math.sin(param3);
            var _loc_7:* = Math.cos(param3);
            param1.setTo(param1.a * _loc_7 + param1.c * _loc_6, param1.b * _loc_7 + param1.d * _loc_6, param1.c * _loc_5 - param1.a * _loc_4, param1.d * _loc_5 - param1.b * _loc_4, param1.tx, param1.ty);
            return;
        }// end function

        new Vector.<Number>(16)[0] = 1;
        new Vector.<Number>(16)[1] = 0;
        new Vector.<Number>(16)[2] = 0;
        new Vector.<Number>(16)[3] = 0;
        new Vector.<Number>(16)[4] = 0;
        new Vector.<Number>(16)[5] = 1;
        new Vector.<Number>(16)[6] = 0;
        new Vector.<Number>(16)[7] = 0;
        new Vector.<Number>(16)[8] = 0;
        new Vector.<Number>(16)[9] = 0;
        new Vector.<Number>(16)[10] = 1;
        new Vector.<Number>(16)[11] = 0;
        new Vector.<Number>(16)[12] = 0;
        new Vector.<Number>(16)[13] = 0;
        new Vector.<Number>(16)[14] = 0;
        new Vector.<Number>(16)[15] = 1;
    }
}
