package gaim
{
    import __AS3__.vec.*;

    public class SnakePointDeadpool extends Object
    {
        public var os:Vector.<SnakePoint>;
        public var len:int = 0;
        public var end_pos:int = 0;

        public function SnakePointDeadpool()
        {
            this.os = new Vector.<SnakePoint>;
            return;
        }// end function

        public function add(param1:SnakePoint)
        {
            if (this.end_pos == this.len)
            {
                this.os.push(param1);
                var _loc_2:* = this;
                var _loc_3:* = this.len + 1;
                _loc_2.len = _loc_3;
            }
            else
            {
                this.os[this.end_pos] = param1;
            }
            var _loc_2:* = this;
            var _loc_3:* = this.end_pos + 1;
            _loc_2.end_pos = _loc_3;
            return;
        }// end function

        public function get() : SnakePoint
        {
            var _loc_1:* = null;
            if (this.end_pos >= 1)
            {
                var _loc_2:* = this;
                var _loc_3:* = this.end_pos - 1;
                _loc_2.end_pos = _loc_3;
                _loc_1 = this.os[this.end_pos];
                this.os[this.end_pos] = null;
                return _loc_1;
            }
            return null;
        }// end function

    }
}
