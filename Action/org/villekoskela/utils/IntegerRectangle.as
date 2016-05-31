package org.villekoskela.utils
{

    public class IntegerRectangle extends Object
    {
        public var x:int;
        public var y:int;
        public var width:int;
        public var height:int;
        public var right:int;
        public var bottom:int;
        public var id:int;

        public function IntegerRectangle(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0)
        {
            this.x = param1;
            this.y = param2;
            this.width = param3;
            this.height = param4;
            this.right = param1 + param3;
            this.bottom = param2 + param4;
            return;
        }// end function

    }
}
