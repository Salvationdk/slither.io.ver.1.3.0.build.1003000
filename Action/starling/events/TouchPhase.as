package starling.events
{
    import starling.errors.*;

    final public class TouchPhase extends Object
    {
        public static const HOVER:String = "hover";
        public static const BEGAN:String = "began";
        public static const MOVED:String = "moved";
        public static const STATIONARY:String = "stationary";
        public static const ENDED:String = "ended";

        public function TouchPhase()
        {
            throw new AbstractClassError();
        }// end function

    }
}
