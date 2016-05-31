package starling.utils
{
    import __AS3__.vec.*;
    import flash.geom.*;

    public class VertexData extends Object
    {
        private var mRawData:Vector.<Number>;
        private var mPremultipliedAlpha:Boolean;
        private var mNumVertices:int;
        public static const ELEMENTS_PER_VERTEX:int = 8;
        public static const POSITION_OFFSET:int = 0;
        public static const COLOR_OFFSET:int = 2;
        public static const TEXCOORD_OFFSET:int = 6;
        private static var sHelperPoint:Point = new Point();
        private static var sHelperPoint3D:Vector3D = new Vector3D();

        public function VertexData(param1:int, param2:Boolean = false)
        {
            this.mRawData = new Vector.<Number>(0);
            this.mPremultipliedAlpha = param2;
            this.numVertices = param1;
            return;
        }// end function

        public function clone(param1:int = 0, param2:int = -1) : VertexData
        {
            if (param2 < 0 || param1 + param2 > this.mNumVertices)
            {
                param2 = this.mNumVertices - param1;
            }
            var _loc_3:* = new VertexData(0, this.mPremultipliedAlpha);
            _loc_3.mNumVertices = param2;
            _loc_3.mRawData = this.mRawData.slice(param1 * ELEMENTS_PER_VERTEX, param2 * ELEMENTS_PER_VERTEX);
            _loc_3.mRawData.fixed = true;
            return _loc_3;
        }// end function

        public function copyTo(param1:VertexData, param2:int = 0, param3:int = 0, param4:int = -1) : void
        {
            this.copyTransformedTo(param1, param2, null, param3, param4);
            return;
        }// end function

        public function copyTransformedTo(param1:VertexData, param2:int = 0, param3:Matrix = null, param4:int = 0, param5:int = -1) : void
        {
            var _loc_6:* = NaN;
            var _loc_7:* = NaN;
            if (param5 < 0 || param4 + param5 > this.mNumVertices)
            {
                param5 = this.mNumVertices - param4;
            }
            var _loc_8:* = param1.mRawData;
            var _loc_9:* = param2 * ELEMENTS_PER_VERTEX;
            var _loc_10:* = param4 * ELEMENTS_PER_VERTEX;
            var _loc_11:* = (param4 + param5) * ELEMENTS_PER_VERTEX;
            if (param3)
            {
                while (_loc_10 < _loc_11)
                {
                    
                    _loc_6 = this.mRawData[int(_loc_10++)];
                    _loc_7 = this.mRawData[int(_loc_10++)];
                    _loc_8[int(_loc_9++)] = param3.a * _loc_6 + param3.c * _loc_7 + param3.tx;
                    _loc_8[int(_loc_9++)] = param3.d * _loc_7 + param3.b * _loc_6 + param3.ty;
                    _loc_8[int(_loc_9++)] = this.mRawData[int(_loc_10++)];
                    _loc_8[int(_loc_9++)] = this.mRawData[int(_loc_10++)];
                    _loc_8[int(_loc_9++)] = this.mRawData[int(_loc_10++)];
                    _loc_8[int(_loc_9++)] = this.mRawData[int(_loc_10++)];
                    _loc_8[int(_loc_9++)] = this.mRawData[int(_loc_10++)];
                    _loc_8[int(_loc_9++)] = this.mRawData[int(_loc_10++)];
                }
            }
            else
            {
                while (_loc_10 < _loc_11)
                {
                    
                    _loc_8[int(_loc_9++)] = this.mRawData[int(_loc_10++)];
                }
            }
            return;
        }// end function

        public function append(param1:VertexData) : void
        {
            this.mRawData.fixed = false;
            var _loc_2:* = this.mRawData.length;
            var _loc_3:* = param1.mRawData;
            var _loc_4:* = _loc_3.length;
            var _loc_5:* = 0;
            while (_loc_5 < _loc_4)
            {
                
                this.mRawData[int(_loc_2++)] = _loc_3[_loc_5];
                _loc_5++;
            }
            this.mNumVertices = this.mNumVertices + param1.numVertices;
            this.mRawData.fixed = true;
            return;
        }// end function

        public function setPosition(param1:int, param2:Number, param3:Number) : void
        {
            var _loc_4:* = param1 * ELEMENTS_PER_VERTEX + POSITION_OFFSET;
            this.mRawData[_loc_4] = param2;
            this.mRawData[int((_loc_4 + 1))] = param3;
            return;
        }// end function

        public function getPosition(param1:int, param2:Point) : void
        {
            var _loc_3:* = param1 * ELEMENTS_PER_VERTEX + POSITION_OFFSET;
            param2.x = this.mRawData[_loc_3];
            param2.y = this.mRawData[int((_loc_3 + 1))];
            return;
        }// end function

        public function setColorAndAlpha(param1:int, param2:uint, param3:Number) : void
        {
            if (param3 < 0.001)
            {
                param3 = 0.001;
            }
            else if (param3 > 1)
            {
                param3 = 1;
            }
            var _loc_4:* = param1 * ELEMENTS_PER_VERTEX + COLOR_OFFSET;
            var _loc_5:* = this.mPremultipliedAlpha ? (param3) : (1);
            this.mRawData[_loc_4] = (param2 >> 16 & 255) / 255 * _loc_5;
            this.mRawData[int((_loc_4 + 1))] = (param2 >> 8 & 255) / 255 * _loc_5;
            this.mRawData[int(_loc_4 + 2)] = (param2 & 255) / 255 * _loc_5;
            this.mRawData[int(_loc_4 + 3)] = param3;
            return;
        }// end function

        public function setColor(param1:int, param2:uint) : void
        {
            var _loc_3:* = param1 * ELEMENTS_PER_VERTEX + COLOR_OFFSET;
            var _loc_4:* = this.mPremultipliedAlpha ? (this.mRawData[int(_loc_3 + 3)]) : (1);
            this.mRawData[_loc_3] = (param2 >> 16 & 255) / 255 * _loc_4;
            this.mRawData[int((_loc_3 + 1))] = (param2 >> 8 & 255) / 255 * _loc_4;
            this.mRawData[int(_loc_3 + 2)] = (param2 & 255) / 255 * _loc_4;
            return;
        }// end function

        public function getColor(param1:int) : uint
        {
            var _loc_4:* = NaN;
            var _loc_5:* = NaN;
            var _loc_6:* = NaN;
            var _loc_2:* = param1 * ELEMENTS_PER_VERTEX + COLOR_OFFSET;
            var _loc_3:* = this.mPremultipliedAlpha ? (this.mRawData[int(_loc_2 + 3)]) : (1);
            if (_loc_3 == 0)
            {
                return 0;
            }
            _loc_4 = this.mRawData[_loc_2] / _loc_3;
            _loc_5 = this.mRawData[int((_loc_2 + 1))] / _loc_3;
            _loc_6 = this.mRawData[int(_loc_2 + 2)] / _loc_3;
            return int(_loc_4 * 255) << 16 | int(_loc_5 * 255) << 8 | int(_loc_6 * 255);
        }// end function

        public function setAlpha(param1:int, param2:Number) : void
        {
            if (this.mPremultipliedAlpha)
            {
                this.setColorAndAlpha(param1, this.getColor(param1), param2);
            }
            else
            {
                this.mRawData[int(param1 * ELEMENTS_PER_VERTEX + COLOR_OFFSET + 3)] = param2;
            }
            return;
        }// end function

        public function getAlpha(param1:int) : Number
        {
            var _loc_2:* = param1 * ELEMENTS_PER_VERTEX + COLOR_OFFSET + 3;
            return this.mRawData[_loc_2];
        }// end function

        public function setTexCoords(param1:int, param2:Number, param3:Number) : void
        {
            var _loc_4:* = param1 * ELEMENTS_PER_VERTEX + TEXCOORD_OFFSET;
            this.mRawData[_loc_4] = param2;
            this.mRawData[int((_loc_4 + 1))] = param3;
            return;
        }// end function

        public function getTexCoords(param1:int, param2:Point) : void
        {
            var _loc_3:* = param1 * ELEMENTS_PER_VERTEX + TEXCOORD_OFFSET;
            param2.x = this.mRawData[_loc_3];
            param2.y = this.mRawData[int((_loc_3 + 1))];
            return;
        }// end function

        public function translateVertex(param1:int, param2:Number, param3:Number) : void
        {
            var _loc_4:* = param1 * ELEMENTS_PER_VERTEX + POSITION_OFFSET;
            this.mRawData[_loc_4] = this.mRawData[_loc_4] + param2;
            this.mRawData[int((_loc_4 + 1))] = this.mRawData[int((_loc_4 + 1))] + param3;
            return;
        }// end function

        public function transformVertex(param1:int, param2:Matrix, param3:int = 1) : void
        {
            var _loc_4:* = NaN;
            var _loc_5:* = NaN;
            var _loc_6:* = param1 * ELEMENTS_PER_VERTEX + POSITION_OFFSET;
            var _loc_7:* = 0;
            while (_loc_7 < param3)
            {
                
                _loc_4 = this.mRawData[_loc_6];
                _loc_5 = this.mRawData[int((_loc_6 + 1))];
                this.mRawData[_loc_6] = param2.a * _loc_4 + param2.c * _loc_5 + param2.tx;
                this.mRawData[int((_loc_6 + 1))] = param2.d * _loc_5 + param2.b * _loc_4 + param2.ty;
                _loc_6 = _loc_6 + ELEMENTS_PER_VERTEX;
                _loc_7++;
            }
            return;
        }// end function

        public function setUniformColor(param1:uint) : void
        {
            var _loc_2:* = 0;
            while (_loc_2 < this.mNumVertices)
            {
                
                this.setColor(_loc_2, param1);
                _loc_2++;
            }
            return;
        }// end function

        public function setUniformAlpha(param1:Number) : void
        {
            var _loc_2:* = 0;
            while (_loc_2 < this.mNumVertices)
            {
                
                this.setAlpha(_loc_2, param1);
                _loc_2++;
            }
            return;
        }// end function

        public function scaleAlpha(param1:int, param2:Number, param3:int = 1) : void
        {
            var _loc_4:* = 0;
            var _loc_5:* = 0;
            if (param2 == 1)
            {
                return;
            }
            if (param3 < 0 || param1 + param3 > this.mNumVertices)
            {
                param3 = this.mNumVertices - param1;
            }
            if (this.mPremultipliedAlpha)
            {
                _loc_4 = 0;
                while (_loc_4 < param3)
                {
                    
                    this.setAlpha(param1 + _loc_4, this.getAlpha(param1 + _loc_4) * param2);
                    _loc_4++;
                }
            }
            else
            {
                _loc_5 = param1 * ELEMENTS_PER_VERTEX + COLOR_OFFSET + 3;
                _loc_4 = 0;
                while (_loc_4 < param3)
                {
                    
                    this.mRawData[int(_loc_5 + _loc_4 * ELEMENTS_PER_VERTEX)] = this.mRawData[int(_loc_5 + _loc_4 * ELEMENTS_PER_VERTEX)] * param2;
                    _loc_4++;
                }
            }
            return;
        }// end function

        public function getBounds(param1:Matrix = null, param2:int = 0, param3:int = -1, param4:Rectangle = null) : Rectangle
        {
            var _loc_5:* = NaN;
            var _loc_6:* = NaN;
            var _loc_7:* = NaN;
            var _loc_8:* = NaN;
            var _loc_9:* = 0;
            var _loc_10:* = NaN;
            var _loc_11:* = NaN;
            var _loc_12:* = 0;
            if (param4 == null)
            {
                param4 = new Rectangle();
            }
            if (param3 < 0 || param2 + param3 > this.mNumVertices)
            {
                param3 = this.mNumVertices - param2;
            }
            if (param3 == 0)
            {
                if (param1 == null)
                {
                    param4.setEmpty();
                }
                else
                {
                    MatrixUtil.transformCoords(param1, 0, 0, sHelperPoint);
                    param4.setTo(sHelperPoint.x, sHelperPoint.y, 0, 0);
                }
            }
            else
            {
                _loc_5 = Number.MAX_VALUE;
                _loc_6 = -Number.MAX_VALUE;
                _loc_7 = Number.MAX_VALUE;
                _loc_8 = -Number.MAX_VALUE;
                _loc_9 = param2 * ELEMENTS_PER_VERTEX + POSITION_OFFSET;
                if (param1 == null)
                {
                    _loc_12 = 0;
                    while (_loc_12 < param3)
                    {
                        
                        _loc_10 = this.mRawData[_loc_9];
                        _loc_11 = this.mRawData[int((_loc_9 + 1))];
                        _loc_9 = _loc_9 + ELEMENTS_PER_VERTEX;
                        if (_loc_5 > _loc_10)
                        {
                            _loc_5 = _loc_10;
                        }
                        if (_loc_6 < _loc_10)
                        {
                            _loc_6 = _loc_10;
                        }
                        if (_loc_7 > _loc_11)
                        {
                            _loc_7 = _loc_11;
                        }
                        if (_loc_8 < _loc_11)
                        {
                            _loc_8 = _loc_11;
                        }
                        _loc_12++;
                    }
                }
                else
                {
                    _loc_12 = 0;
                    while (_loc_12 < param3)
                    {
                        
                        _loc_10 = this.mRawData[_loc_9];
                        _loc_11 = this.mRawData[int((_loc_9 + 1))];
                        _loc_9 = _loc_9 + ELEMENTS_PER_VERTEX;
                        MatrixUtil.transformCoords(param1, _loc_10, _loc_11, sHelperPoint);
                        if (_loc_5 > sHelperPoint.x)
                        {
                            _loc_5 = sHelperPoint.x;
                        }
                        if (_loc_6 < sHelperPoint.x)
                        {
                            _loc_6 = sHelperPoint.x;
                        }
                        if (_loc_7 > sHelperPoint.y)
                        {
                            _loc_7 = sHelperPoint.y;
                        }
                        if (_loc_8 < sHelperPoint.y)
                        {
                            _loc_8 = sHelperPoint.y;
                        }
                        _loc_12++;
                    }
                }
                param4.setTo(_loc_5, _loc_7, _loc_6 - _loc_5, _loc_8 - _loc_7);
            }
            return param4;
        }// end function

        public function getBoundsProjected(param1:Matrix3D, param2:Vector3D, param3:int = 0, param4:int = -1, param5:Rectangle = null) : Rectangle
        {
            var _loc_6:* = NaN;
            var _loc_7:* = NaN;
            var _loc_8:* = NaN;
            var _loc_9:* = NaN;
            var _loc_10:* = 0;
            var _loc_11:* = NaN;
            var _loc_12:* = NaN;
            var _loc_13:* = 0;
            if (param2 == null)
            {
                throw new ArgumentError("camPos must not be null");
            }
            if (param5 == null)
            {
                param5 = new Rectangle();
            }
            if (param4 < 0 || param3 + param4 > this.mNumVertices)
            {
                param4 = this.mNumVertices - param3;
            }
            if (param4 == 0)
            {
                if (param1)
                {
                    MatrixUtil.transformCoords3D(param1, 0, 0, 0, sHelperPoint3D);
                }
                else
                {
                    sHelperPoint3D.setTo(0, 0, 0);
                }
                MathUtil.intersectLineWithXYPlane(param2, sHelperPoint3D, sHelperPoint);
                param5.setTo(sHelperPoint.x, sHelperPoint.y, 0, 0);
            }
            else
            {
                _loc_6 = Number.MAX_VALUE;
                _loc_7 = -Number.MAX_VALUE;
                _loc_8 = Number.MAX_VALUE;
                _loc_9 = -Number.MAX_VALUE;
                _loc_10 = param3 * ELEMENTS_PER_VERTEX + POSITION_OFFSET;
                _loc_13 = 0;
                while (_loc_13 < param4)
                {
                    
                    _loc_11 = this.mRawData[_loc_10];
                    _loc_12 = this.mRawData[int((_loc_10 + 1))];
                    _loc_10 = _loc_10 + ELEMENTS_PER_VERTEX;
                    if (param1)
                    {
                        MatrixUtil.transformCoords3D(param1, _loc_11, _loc_12, 0, sHelperPoint3D);
                    }
                    else
                    {
                        sHelperPoint3D.setTo(_loc_11, _loc_12, 0);
                    }
                    MathUtil.intersectLineWithXYPlane(param2, sHelperPoint3D, sHelperPoint);
                    if (_loc_6 > sHelperPoint.x)
                    {
                        _loc_6 = sHelperPoint.x;
                    }
                    if (_loc_7 < sHelperPoint.x)
                    {
                        _loc_7 = sHelperPoint.x;
                    }
                    if (_loc_8 > sHelperPoint.y)
                    {
                        _loc_8 = sHelperPoint.y;
                    }
                    if (_loc_9 < sHelperPoint.y)
                    {
                        _loc_9 = sHelperPoint.y;
                    }
                    _loc_13++;
                }
                param5.setTo(_loc_6, _loc_8, _loc_7 - _loc_6, _loc_9 - _loc_8);
            }
            return param5;
        }// end function

        public function toString() : String
        {
            var _loc_1:* = "[VertexData \n";
            var _loc_2:* = new Point();
            var _loc_3:* = new Point();
            var _loc_4:* = 0;
            while (_loc_4 < this.numVertices)
            {
                
                this.getPosition(_loc_4, _loc_2);
                this.getTexCoords(_loc_4, _loc_3);
                _loc_1 = _loc_1 + ("  [Vertex " + _loc_4 + ": " + "x=" + _loc_2.x.toFixed(1) + ", " + "y=" + _loc_2.y.toFixed(1) + ", " + "rgb=" + this.getColor(_loc_4).toString(16) + ", " + "a=" + this.getAlpha(_loc_4).toFixed(2) + ", " + "u=" + _loc_3.x.toFixed(4) + ", " + "v=" + _loc_3.y.toFixed(4) + "]" + (_loc_4 == (this.numVertices - 1) ? ("\n") : (",\n")));
                _loc_4++;
            }
            return _loc_1 + "]";
        }// end function

        public function get tinted() : Boolean
        {
            var _loc_3:* = 0;
            var _loc_1:* = COLOR_OFFSET;
            var _loc_2:* = 0;
            while (_loc_2 < this.mNumVertices)
            {
                
                _loc_3 = 0;
                while (_loc_3 < 4)
                {
                    
                    if (this.mRawData[int(_loc_1 + _loc_3)] != 1)
                    {
                        return true;
                    }
                    _loc_3++;
                }
                _loc_1 = _loc_1 + ELEMENTS_PER_VERTEX;
                _loc_2++;
            }
            return false;
        }// end function

        public function setPremultipliedAlpha(param1:Boolean, param2:Boolean = true) : void
        {
            var _loc_3:* = 0;
            var _loc_4:* = 0;
            var _loc_5:* = NaN;
            var _loc_6:* = NaN;
            var _loc_7:* = NaN;
            if (param1 == this.mPremultipliedAlpha)
            {
                return;
            }
            if (param2)
            {
                _loc_3 = this.mNumVertices * ELEMENTS_PER_VERTEX;
                _loc_4 = COLOR_OFFSET;
                while (_loc_4 < _loc_3)
                {
                    
                    _loc_5 = this.mRawData[int(_loc_4 + 3)];
                    _loc_6 = this.mPremultipliedAlpha ? (_loc_5) : (1);
                    _loc_7 = param1 ? (_loc_5) : (1);
                    if (_loc_6 != 0)
                    {
                        this.mRawData[_loc_4] = this.mRawData[_loc_4] / _loc_6 * _loc_7;
                        this.mRawData[int((_loc_4 + 1))] = this.mRawData[int((_loc_4 + 1))] / _loc_6 * _loc_7;
                        this.mRawData[int(_loc_4 + 2)] = this.mRawData[int(_loc_4 + 2)] / _loc_6 * _loc_7;
                    }
                    _loc_4 = _loc_4 + ELEMENTS_PER_VERTEX;
                }
            }
            this.mPremultipliedAlpha = param1;
            return;
        }// end function

        public function get premultipliedAlpha() : Boolean
        {
            return this.mPremultipliedAlpha;
        }// end function

        public function set premultipliedAlpha(param1:Boolean) : void
        {
            this.setPremultipliedAlpha(param1);
            return;
        }// end function

        public function get numVertices() : int
        {
            return this.mNumVertices;
        }// end function

        public function set numVertices(param1:int) : void
        {
            this.mRawData.fixed = false;
            this.mRawData.length = param1 * ELEMENTS_PER_VERTEX;
            var _loc_2:* = this.mNumVertices * ELEMENTS_PER_VERTEX + COLOR_OFFSET + 3;
            var _loc_3:* = this.mRawData.length;
            var _loc_4:* = _loc_2;
            while (_loc_4 < _loc_3)
            {
                
                this.mRawData[_loc_4] = 1;
                _loc_4 = _loc_4 + ELEMENTS_PER_VERTEX;
            }
            this.mNumVertices = param1;
            this.mRawData.fixed = true;
            return;
        }// end function

        public function get rawData() : Vector.<Number>
        {
            return this.mRawData;
        }// end function

    }
}
