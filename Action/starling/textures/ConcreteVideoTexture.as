package starling.textures
{
    import flash.display3D.*;
    import flash.display3D.textures.*;
    import flash.utils.*;

    class ConcreteVideoTexture extends ConcreteTexture
    {

        function ConcreteVideoTexture(param1:TextureBase, param2:Number = 1)
        {
            var _loc_3:* = Context3DTextureFormat.BGRA;
            var _loc_4:* = "videoWidth" in param1 ? (param1["videoWidth"]) : (0);
            var _loc_5:* = "videoHeight" in param1 ? (param1["videoHeight"]) : (0);
            super(param1, _loc_3, _loc_4, _loc_5, false, false, false, param2, false);
            if (getQualifiedClassName(param1) != "flash.display3D.textures::VideoTexture")
            {
                throw new ArgumentError("\'base\' must be VideoTexture");
            }
            return;
        }// end function

        override public function get nativeWidth() : Number
        {
            return base["videoWidth"];
        }// end function

        override public function get nativeHeight() : Number
        {
            return base["videoHeight"];
        }// end function

        override public function get width() : Number
        {
            return this.nativeWidth / scale;
        }// end function

        override public function get height() : Number
        {
            return this.nativeHeight / scale;
        }// end function

    }
}
