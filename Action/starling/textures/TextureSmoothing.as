package starling.textures
{
    import starling.errors.*;

    public class TextureSmoothing extends Object
    {
        public static const NONE:String = "none";
        public static const BILINEAR:String = "bilinear";
        public static const TRILINEAR:String = "trilinear";

        public function TextureSmoothing()
        {
            throw new AbstractClassError();
        }// end function

        public static function isValid(param1:String) : Boolean
        {
            return param1 == NONE || param1 == BILINEAR || param1 == TRILINEAR;
        }// end function

    }
}
