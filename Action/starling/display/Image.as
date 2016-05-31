package starling.display
{
    import flash.display.*;
    import flash.geom.*;
    import starling.core.*;
    import starling.textures.*;
    import starling.utils.*;

    public class Image extends Quad
    {
        private var mTexture:Texture;
        private var mSmoothing:String;
        private var mVertexDataCache:VertexData;
        private var mVertexDataCacheInvalid:Boolean;

        public function Image(param1:Texture)
        {
            var _loc_2:* = null;
            var _loc_3:* = NaN;
            var _loc_4:* = NaN;
            var _loc_5:* = false;
            if (param1)
            {
                _loc_2 = param1.frame;
                _loc_3 = _loc_2 ? (_loc_2.width) : (param1.width);
                _loc_4 = _loc_2 ? (_loc_2.height) : (param1.height);
                _loc_5 = param1.premultipliedAlpha;
                super(_loc_3, _loc_4, 16777215, _loc_5);
                mVertexData.setTexCoords(0, 0, 0);
                mVertexData.setTexCoords(1, 1, 0);
                mVertexData.setTexCoords(2, 0, 1);
                mVertexData.setTexCoords(3, 1, 1);
                this.mTexture = param1;
                this.mSmoothing = TextureSmoothing.BILINEAR;
                this.mVertexDataCache = new VertexData(4, _loc_5);
                this.mVertexDataCacheInvalid = true;
            }
            else
            {
                throw new ArgumentError("Texture cannot be null");
            }
            return;
        }// end function

        override protected function onVertexDataChanged() : void
        {
            this.mVertexDataCacheInvalid = true;
            return;
        }// end function

        public function readjustSize() : void
        {
            var _loc_1:* = this.texture.frame;
            var _loc_2:* = _loc_1 ? (_loc_1.width) : (this.texture.width);
            var _loc_3:* = _loc_1 ? (_loc_1.height) : (this.texture.height);
            mVertexData.setPosition(0, 0, 0);
            mVertexData.setPosition(1, _loc_2, 0);
            mVertexData.setPosition(2, 0, _loc_3);
            mVertexData.setPosition(3, _loc_2, _loc_3);
            this.onVertexDataChanged();
            return;
        }// end function

        public function setTexCoords(param1:int, param2:Point) : void
        {
            mVertexData.setTexCoords(param1, param2.x, param2.y);
            this.onVertexDataChanged();
            return;
        }// end function

        public function setTexCoordsTo(param1:int, param2:Number, param3:Number) : void
        {
            mVertexData.setTexCoords(param1, param2, param3);
            this.onVertexDataChanged();
            return;
        }// end function

        public function getTexCoords(param1:int, param2:Point = null) : Point
        {
            if (param2 == null)
            {
                param2 = new Point();
            }
            mVertexData.getTexCoords(param1, param2);
            return param2;
        }// end function

        override public function copyVertexDataTo(param1:VertexData, param2:int = 0) : void
        {
            this.copyVertexDataTransformedTo(param1, param2, null);
            return;
        }// end function

        override public function copyVertexDataTransformedTo(param1:VertexData, param2:int = 0, param3:Matrix = null) : void
        {
            if (this.mVertexDataCacheInvalid)
            {
                this.mVertexDataCacheInvalid = false;
                mVertexData.copyTo(this.mVertexDataCache);
                this.mTexture.adjustVertexData(this.mVertexDataCache, 0, 4);
            }
            this.mVertexDataCache.copyTransformedTo(param1, param2, param3, 0, 4);
            return;
        }// end function

        public function get texture() : Texture
        {
            return this.mTexture;
        }// end function

        public function set texture(param1:Texture) : void
        {
            if (param1 == null)
            {
                throw new ArgumentError("Texture cannot be null");
            }
            if (param1 != this.mTexture)
            {
                this.mTexture = param1;
                mVertexData.setPremultipliedAlpha(this.mTexture.premultipliedAlpha);
                this.mVertexDataCache.setPremultipliedAlpha(this.mTexture.premultipliedAlpha, false);
                this.onVertexDataChanged();
            }
            return;
        }// end function

        public function get smoothing() : String
        {
            return this.mSmoothing;
        }// end function

        public function set smoothing(param1:String) : void
        {
            if (TextureSmoothing.isValid(param1))
            {
                this.mSmoothing = param1;
            }
            else
            {
                throw new ArgumentError("Invalid smoothing mode: " + param1);
            }
            return;
        }// end function

        override public function render(param1:RenderSupport, param2:Number) : void
        {
            param1.batchQuad(this, param2, this.mTexture, this.mSmoothing);
            return;
        }// end function

        public static function fromBitmap(param1:Bitmap, param2:Boolean = true, param3:Number = 1) : Image
        {
            return new Image(Texture.fromBitmap(param1, param2, false, param3));
        }// end function

    }
}
