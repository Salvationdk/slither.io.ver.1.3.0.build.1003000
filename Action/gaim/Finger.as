package gaim
{

    public class Finger extends Object
    {
        public var xx:Number;
        public var yy:Number;
        public var rx:Number;
        public var ry:Number;
        public var avx:Number;
        public var avy:Number;
        public var ofx:Number;
        public var ofy:Number;
        public var sx:Number;
        public var sy:Number;
        public var touch_id:Object;
        public var a:Number;
        public var dead_fr:Number = 0;
        public var dead:Boolean = false;
        public var accel:Boolean = false;
        public var accel_a:Number = 0;
        public var accel_fr:Number = 0;

        public function Finger()
        {
            return;
        }// end function

    }
}
