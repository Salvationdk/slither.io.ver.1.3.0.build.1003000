package starling.textures
{
    import __AS3__.vec.*;
    import flash.display3D.textures.*;
    import flash.geom.*;
    import starling.utils.*;

    public class SubTexture extends Texture
    {
        private var mParent:Texture;
        private var mOwnsParent:Boolean;
        private var mRegion:Rectangle;
        private var mFrame:Rectangle;
        private var mRotated:Boolean;
        private var mWidth:Number;
        private var mHeight:Number;
        private var mTransformationMatrix:Matrix;
        private static var sTexCoords:Point = new Point();
        private static var sMatrix:Matrix = new Matrix();

        public function SubTexture(param1:Texture, param2:Rectangle = null, param3:Boolean = false, param4:Rectangle = null, param5:Boolean = false)
        {
            this.mParent = param1;
            this.mRegion = param2 ? (param2.clone()) : (new Rectangle(0, 0, param1.width, param1.height));
            this.mFrame = param4 ? (param4.clone()) : (null);
            this.mOwnsParent = param3;
            this.mRotated = param5;
            this.mWidth = param5 ? (this.mRegion.height) : (this.mRegion.width);
            this.mHeight = param5 ? (this.mRegion.width) : (this.mRegion.height);
            this.mTransformationMatrix = new Matrix();
            if (param5)
            {
                this.mTransformationMatrix.translate(0, -1);
                this.mTransformationMatrix.rotate(Math.PI / 2);
            }
            if (this.mFrame && (this.mFrame.x > 0 || this.mFrame.y > 0 || this.mFrame.right < this.mWidth || this.mFrame.bottom < this.mHeight))
            {
                trace("[Starling] Warning: frames inside the texture\'s region are unsupported.");
            }
            this.mTransformationMatrix.scale(this.mRegion.width / this.mParent.width, this.mRegion.height / this.mParent.height);
            this.mTransformationMatrix.translate(this.mRegion.x / this.mParent.width, this.mRegion.y / this.mParent.height);
            return;
        }// end function

        override public function dispose() : void
        {
            if (this.mOwnsParent)
            {
                this.mParent.dispose();
            }
            super.dispose();
            return;
        }// end function

        override public function adjustVertexData(param1:VertexData, param2:int, param3:int) : void
        {
            var _loc_6:* = NaN;
            var _loc_7:* = NaN;
            var _loc_4:* = param2 * VertexData.ELEMENTS_PER_VERTEX + VertexData.TEXCOORD_OFFSET;
            var _loc_5:* = VertexData.ELEMENTS_PER_VERTEX - 2;
            this.adjustTexCoords(param1.rawData, _loc_4, _loc_5, param3);
            if (this.mFrame)
            {
                if (param3 != 4)
                {
                    throw new ArgumentError("Textures with a frame can only be used on quads");
                }
                _loc_6 = this.mFrame.width + this.mFrame.x - this.mWidth;
                _loc_7 = this.mFrame.height + this.mFrame.y - this.mHeight;
                param1.translateVertex(param2, -this.mFrame.x, -this.mFrame.y);
                param1.translateVertex((param2 + 1), -_loc_6, -this.mFrame.y);
                param1.translateVertex(param2 + 2, -this.mFrame.x, -_loc_7);
                param1.translateVertex(param2 + 3, -_loc_6, -_loc_7);
            }
            return;
        }// end function

        override public function adjustTexCoords(param1:Vector.<Number>, param2:int = 0, param3:int = 0, param4:int = -1) : void
        {
            var _loc_7:* = NaN;
            var _loc_8:* = NaN;
            if (param4 < 0)
            {
                param4 = (param1.length - param2 - 2) / (param3 + 2) + 1;
            }
            var _loc_5:* = param2 + param4 * (2 + param3);
            var _loc_6:* = this;
            sMatrix.identity();
            while (_loc_6)
            {
                
                sMatrix.concat(_loc_6.mTransformationMatrix);
                _loc_6 = _loc_6.parent as SubTexture;
            }
            var _loc_9:* = param2;
            while (_loc_9 < _loc_5)
            {
                
                _loc_7 = param1[_loc_9];
                _loc_8 = param1[int((_loc_9 + 1))];
                MatrixUtil.transformCoords(sMatrix, _loc_7, _loc_8, sTexCoords);
                param1[_loc_9] = sTexCoords.x;
                param1[int((_loc_9 + 1))] = sTexCoords.y;
                _loc_9 = _loc_9 + (2 + param3);
            }
            return;
        }// end function

        public function get parent() : Texture
        {
            return this.mParent;
        }// end function

        public function get ownsParent() : Boolean
        {
            return this.mOwnsParent;
        }// end function

        public function get rotated() : Boolean
        {
            return this.mRotated;
        }// end function

        public function get region() : Rectangle
        {
            return this.mRegion;
        }// end function

        public function get clipping() : Rectangle
        {
            var _loc_1:* = new Point();
            var _loc_2:* = new Point();
            MatrixUtil.transformCoords(this.mTransformationMatrix, 0, 0, _loc_1);
            MatrixUtil.transformCoords(this.mTransformationMatrix, 1, 1, _loc_2);
            var _loc_3:* = new Rectangle(_loc_1.x, _loc_1.y, _loc_2.x - _loc_1.x, _loc_2.y - _loc_1.y);
            RectangleUtil.normalize(_loc_3);
            return _loc_3;
        }// end function

        public function get transformationMatrix() : Matrix
        {
            return this.mTransformationMatrix;
        }// end function

        override public function get base() : TextureBase
        {
            return this.mParent.base;
        }// end function

        override public function get root() : ConcreteTexture
        {
            return this.mParent.root;
        }// end function

        override public function get format() : String
        {
            return this.mParent.format;
        }// end function

        override public function get width() : Number
        {
            return this.mWidth;
        }// end function

        override public function get height() : Number
        {
            return this.mHeight;
        }// end function

        override public function get nativeWidth() : Number
        {
            return this.mWidth * this.scale;
        }// end function

        override public function get nativeHeight() : Number
        {
            return this.mHeight * this.scale;
        }// end function

        override public function get mipMapping() : Boolean
        {
            return this.mParent.mipMapping;
        }// end function

        override public function get premultipliedAlpha() : Boolean
        {
            return this.mParent.premultipliedAlpha;
        }// end function

        override public function get scale() : Number
        {
            return this.mParent.scale;
        }// end function

        override public function get repeat() : Boolean
        {
            return this.mParent.repeat;
        }// end function

        override public function get frame() : Rectangle
        {
            return this.mFrame;
        }// end function

    }
}
