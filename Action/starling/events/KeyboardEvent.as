package starling.events
{

    public class KeyboardEvent extends Event
    {
        private var mCharCode:uint;
        private var mKeyCode:uint;
        private var mKeyLocation:uint;
        private var mAltKey:Boolean;
        private var mCtrlKey:Boolean;
        private var mShiftKey:Boolean;
        private var mIsDefaultPrevented:Boolean;
        public static const KEY_UP:String = "keyUp";
        public static const KEY_DOWN:String = "keyDown";

        public function KeyboardEvent(param1:String, param2:uint = 0, param3:uint = 0, param4:uint = 0, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false)
        {
            super(param1, false, param3);
            this.mCharCode = param2;
            this.mKeyCode = param3;
            this.mKeyLocation = param4;
            this.mCtrlKey = param5;
            this.mAltKey = param6;
            this.mShiftKey = param7;
            return;
        }// end function

        public function preventDefault() : void
        {
            this.mIsDefaultPrevented = true;
            return;
        }// end function

        public function isDefaultPrevented() : Boolean
        {
            return this.mIsDefaultPrevented;
        }// end function

        public function get charCode() : uint
        {
            return this.mCharCode;
        }// end function

        public function get keyCode() : uint
        {
            return this.mKeyCode;
        }// end function

        public function get keyLocation() : uint
        {
            return this.mKeyLocation;
        }// end function

        public function get altKey() : Boolean
        {
            return this.mAltKey;
        }// end function

        public function get ctrlKey() : Boolean
        {
            return this.mCtrlKey;
        }// end function

        public function get shiftKey() : Boolean
        {
            return this.mShiftKey;
        }// end function

    }
}
