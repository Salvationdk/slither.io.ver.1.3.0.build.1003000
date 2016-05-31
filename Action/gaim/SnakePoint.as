package gaim
{
    import __AS3__.vec.*;

    public class SnakePoint extends Object
    {
        public var exs:Vector.<Number>;
        public var eys:Vector.<Number>;
        public var efs:Vector.<Number>;
        public var ems:Vector.<Number>;
        public var eiu:int;
        public var xx:Number;
        public var yy:Number;
        public var fx:Number;
        public var fy:Number;
        public var da:Number;
        public var ebx:Number;
        public var eby:Number;
        public var pid:int;
        public var dying:Boolean;

        public function SnakePoint()
        {
            this.exs = new Vector.<Number>;
            this.eys = new Vector.<Number>;
            this.efs = new Vector.<Number>;
            this.ems = new Vector.<Number>;
            return;
        }// end function

    }
}
