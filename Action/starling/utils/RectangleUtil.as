package starling.utils
{
    import __AS3__.vec.*;
    import flash.geom.*;
    import starling.errors.*;

    public class RectangleUtil extends Object
    {
        private static const sHelperPoint:Point = new Point();
        private static const sPositions:Vector.<Point> = new Vector.<Point>(4);

        public function RectangleUtil()
        {
            throw new AbstractClassError();
        }// end function

        public static function intersect(param1:Rectangle, param2:Rectangle, param3:Rectangle = null) : Rectangle
        {
            if (param3 == null)
            {
                param3 = new Rectangle();
            }
            var _loc_4:* = param1.x > param2.x ? (param1.x) : (param2.x);
            var _loc_5:* = param1.right < param2.right ? (param1.right) : (param2.right);
            var _loc_6:* = param1.y > param2.y ? (param1.y) : (param2.y);
            var _loc_7:* = param1.bottom < param2.bottom ? (param1.bottom) : (param2.bottom);
            if (_loc_4 > _loc_5 || _loc_6 > _loc_7)
            {
                param3.setEmpty();
            }
            else
            {
                param3.setTo(_loc_4, _loc_6, _loc_5 - _loc_4, _loc_7 - _loc_6);
            }
            return param3;
        }// end function

        public static function fit(param1:Rectangle, param2:Rectangle, param3:String = "showAll", param4:Boolean = false, param5:Rectangle = null) : Rectangle
        {
            if (!ScaleMode.isValid(param3))
            {
                throw new ArgumentError("Invalid scaleMode: " + param3);
            }
            if (param5 == null)
            {
                param5 = new Rectangle();
            }
            var _loc_6:* = param1.width;
            var _loc_7:* = param1.height;
            var _loc_8:* = param2.width / _loc_6;
            var _loc_9:* = param2.height / _loc_7;
            var _loc_10:* = 1;
            if (param3 == ScaleMode.SHOW_ALL)
            {
                _loc_10 = _loc_8 < _loc_9 ? (_loc_8) : (_loc_9);
                if (param4)
                {
                    _loc_10 = nextSuitableScaleFactor(_loc_10, false);
                }
            }
            else if (param3 == ScaleMode.NO_BORDER)
            {
                _loc_10 = _loc_8 > _loc_9 ? (_loc_8) : (_loc_9);
                if (param4)
                {
                    _loc_10 = nextSuitableScaleFactor(_loc_10, true);
                }
            }
            _loc_6 = _loc_6 * _loc_10;
            _loc_7 = _loc_7 * _loc_10;
            param5.setTo(param2.x + (param2.width - _loc_6) / 2, param2.y + (param2.height - _loc_7) / 2, _loc_6, _loc_7);
            return param5;
        }// end function

        private static function nextSuitableScaleFactor(param1:Number, param2:Boolean) : Number
        {
            var _loc_3:* = 1;
            if (param2)
            {
                if (param1 >= 0.5)
                {
                    return Math.ceil(param1);
                }
                while (1 / (_loc_3 + 1) > param1)
                {
                    
                    _loc_3 = _loc_3 + 1;
                }
            }
            else
            {
                if (param1 >= 1)
                {
                    return Math.floor(param1);
                }
                while (1 / _loc_3 > param1)
                {
                    
                    _loc_3 = _loc_3 + 1;
                }
            }
            return 1 / _loc_3;
        }// end function

        public static function normalize(param1:Rectangle) : void
        {
            if (param1.width < 0)
            {
                param1.width = -param1.width;
                param1.x = param1.x - param1.width;
            }
            if (param1.height < 0)
            {
                param1.height = -param1.height;
                param1.y = param1.y - param1.height;
            }
            return;
        }// end function

        public static function getBounds(param1:Rectangle, param2:Matrix, param3:Rectangle = null) : Rectangle
        {
            if (param3 == null)
            {
                param3 = new Rectangle();
            }
            var _loc_4:* = Number.MAX_VALUE;
            var _loc_5:* = -Number.MAX_VALUE;
            var _loc_6:* = Number.MAX_VALUE;
            var _loc_7:* = -Number.MAX_VALUE;
            var _loc_8:* = 0;
            while (_loc_8 < 4)
            {
                
                MatrixUtil.transformCoords(param2, sPositions[_loc_8].x * param1.width, sPositions[_loc_8].y * param1.height, sHelperPoint);
                if (_loc_4 > sHelperPoint.x)
                {
                    _loc_4 = sHelperPoint.x;
                }
                if (_loc_5 < sHelperPoint.x)
                {
                    _loc_5 = sHelperPoint.x;
                }
                if (_loc_6 > sHelperPoint.y)
                {
                    _loc_6 = sHelperPoint.y;
                }
                if (_loc_7 < sHelperPoint.y)
                {
                    _loc_7 = sHelperPoint.y;
                }
                _loc_8++;
            }
            param3.setTo(_loc_4, _loc_6, _loc_5 - _loc_4, _loc_7 - _loc_6);
            return param3;
        }// end function

        new Vector.<Point>(4)[0] = new Point(0, 0);
        new Vector.<Point>(4)[1] = new Point(1, 0);
        new Vector.<Point>(4)[2] = new Point(0, 1);
        new Vector.<Point>(4)[3] = new Point(1, 1);
    }
}
