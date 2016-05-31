package starling.text
{
    import flash.utils.*;
    import starling.display.*;
    import starling.textures.*;

    public class BitmapChar extends Object
    {
        private var mTexture:Texture;
        private var mCharID:int;
        private var mXOffset:Number;
        private var mYOffset:Number;
        private var mXAdvance:Number;
        private var mKernings:Dictionary;

        public function BitmapChar(param1:int, param2:Texture, param3:Number, param4:Number, param5:Number)
        {
            this.mCharID = param1;
            this.mTexture = param2;
            this.mXOffset = param3;
            this.mYOffset = param4;
            this.mXAdvance = param5;
            this.mKernings = null;
            return;
        }// end function

        public function addKerning(param1:int, param2:Number) : void
        {
            if (this.mKernings == null)
            {
                this.mKernings = new Dictionary();
            }
            this.mKernings[param1] = param2;
            return;
        }// end function

        public function getKerning(param1:int) : Number
        {
            if (this.mKernings == null || this.mKernings[param1] == undefined)
            {
                return 0;
            }
            return this.mKernings[param1];
        }// end function

        public function createImage() : Image
        {
            return new Image(this.mTexture);
        }// end function

        public function get charID() : int
        {
            return this.mCharID;
        }// end function

        public function get xOffset() : Number
        {
            return this.mXOffset;
        }// end function

        public function get yOffset() : Number
        {
            return this.mYOffset;
        }// end function

        public function get xAdvance() : Number
        {
            return this.mXAdvance;
        }// end function

        public function get texture() : Texture
        {
            return this.mTexture;
        }// end function

        public function get width() : Number
        {
            return this.mTexture.width;
        }// end function

        public function get height() : Number
        {
            return this.mTexture.height;
        }// end function

    }
}
