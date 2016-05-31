package starling.textures
{
    import starling.core.*;

    public class TextureOptions extends Object
    {
        private var mScale:Number;
        private var mFormat:String;
        private var mMipMapping:Boolean;
        private var mOptimizeForRenderToTexture:Boolean = false;
        private var mOnReady:Function = null;
        private var mRepeat:Boolean = false;

        public function TextureOptions(param1:Number = 1, param2:Boolean = false, param3:String = "bgra", param4:Boolean = false)
        {
            this.mScale = param1;
            this.mFormat = param3;
            this.mMipMapping = param2;
            this.mRepeat = param4;
            return;
        }// end function

        public function clone() : TextureOptions
        {
            var _loc_1:* = new TextureOptions(this.mScale, this.mMipMapping, this.mFormat, this.mRepeat);
            _loc_1.mOptimizeForRenderToTexture = this.mOptimizeForRenderToTexture;
            _loc_1.mOnReady = this.mOnReady;
            return _loc_1;
        }// end function

        public function get scale() : Number
        {
            return this.mScale;
        }// end function

        public function set scale(param1:Number) : void
        {
            this.mScale = param1 > 0 ? (param1) : (Starling.contentScaleFactor);
            return;
        }// end function

        public function get format() : String
        {
            return this.mFormat;
        }// end function

        public function set format(param1:String) : void
        {
            this.mFormat = param1;
            return;
        }// end function

        public function get mipMapping() : Boolean
        {
            return this.mMipMapping;
        }// end function

        public function set mipMapping(param1:Boolean) : void
        {
            this.mMipMapping = param1;
            return;
        }// end function

        public function get optimizeForRenderToTexture() : Boolean
        {
            return this.mOptimizeForRenderToTexture;
        }// end function

        public function set optimizeForRenderToTexture(param1:Boolean) : void
        {
            this.mOptimizeForRenderToTexture = param1;
            return;
        }// end function

        public function get repeat() : Boolean
        {
            return this.mRepeat;
        }// end function

        public function set repeat(param1:Boolean) : void
        {
            this.mRepeat = param1;
            return;
        }// end function

        public function get onReady() : Function
        {
            return this.mOnReady;
        }// end function

        public function set onReady(param1:Function) : void
        {
            this.mOnReady = param1;
            return;
        }// end function

    }
}
