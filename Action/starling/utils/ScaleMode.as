package starling.utils
{
    import starling.errors.*;

    public class ScaleMode extends Object
    {
        public static const NONE:String = "none";
        public static const NO_BORDER:String = "noBorder";
        public static const SHOW_ALL:String = "showAll";

        public function ScaleMode()
        {
            throw new AbstractClassError();
        }// end function

        public static function isValid(param1:String) : Boolean
        {
            return param1 == NONE || param1 == NO_BORDER || param1 == SHOW_ALL;
        }// end function

    }
}
