package starling.utils
{
    import starling.errors.*;

    final public class HAlign extends Object
    {
        public static const LEFT:String = "left";
        public static const CENTER:String = "center";
        public static const RIGHT:String = "right";

        public function HAlign()
        {
            throw new AbstractClassError();
        }// end function

        public static function isValid(param1:String) : Boolean
        {
            return param1 == LEFT || param1 == CENTER || param1 == RIGHT;
        }// end function

    }
}
