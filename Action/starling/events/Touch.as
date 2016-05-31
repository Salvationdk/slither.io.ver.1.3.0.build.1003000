package starling.events
{
    import __AS3__.vec.*;
    import flash.geom.*;
    import starling.display.*;
    import starling.utils.*;

    public class Touch extends Object
    {
        private var mID:int;
        private var mGlobalX:Number;
        private var mGlobalY:Number;
        private var mPreviousGlobalX:Number;
        private var mPreviousGlobalY:Number;
        private var mTapCount:int;
        private var mPhase:String;
        private var mTarget:DisplayObject;
        private var mTimestamp:Number;
        private var mPressure:Number;
        private var mWidth:Number;
        private var mHeight:Number;
        private var mCancelled:Boolean;
        private var mBubbleChain:Vector.<EventDispatcher>;
        private static var sHelperPoint:Point = new Point();

        public function Touch(param1:int)
        {
            this.mID = param1;
            this.mTapCount = 0;
            this.mPhase = TouchPhase.HOVER;
            var _loc_2:* = 1;
            this.mHeight = 1;
            this.mWidth = _loc_2;
            this.mPressure = _loc_2;
            this.mBubbleChain = new Vector.<EventDispatcher>(0);
            return;
        }// end function

        public function getLocation(param1:DisplayObject, param2:Point = null) : Point
        {
            sHelperPoint.setTo(this.mGlobalX, this.mGlobalY);
            return param1.globalToLocal(sHelperPoint, param2);
        }// end function

        public function getPreviousLocation(param1:DisplayObject, param2:Point = null) : Point
        {
            sHelperPoint.setTo(this.mPreviousGlobalX, this.mPreviousGlobalY);
            return param1.globalToLocal(sHelperPoint, param2);
        }// end function

        public function getMovement(param1:DisplayObject, param2:Point = null) : Point
        {
            if (param2 == null)
            {
                param2 = new Point();
            }
            this.getLocation(param1, param2);
            var _loc_3:* = param2.x;
            var _loc_4:* = param2.y;
            this.getPreviousLocation(param1, param2);
            param2.setTo(_loc_3 - param2.x, _loc_4 - param2.y);
            return param2;
        }// end function

        public function isTouching(param1:DisplayObject) : Boolean
        {
            return this.mBubbleChain.indexOf(param1) != -1;
        }// end function

        public function toString() : String
        {
            return formatString("Touch {0}: globalX={1}, globalY={2}, phase={3}", this.mID, this.mGlobalX, this.mGlobalY, this.mPhase);
        }// end function

        public function clone() : Touch
        {
            var _loc_1:* = new Touch(this.mID);
            _loc_1.mGlobalX = this.mGlobalX;
            _loc_1.mGlobalY = this.mGlobalY;
            _loc_1.mPreviousGlobalX = this.mPreviousGlobalX;
            _loc_1.mPreviousGlobalY = this.mPreviousGlobalY;
            _loc_1.mPhase = this.mPhase;
            _loc_1.mTapCount = this.mTapCount;
            _loc_1.mTimestamp = this.mTimestamp;
            _loc_1.mPressure = this.mPressure;
            _loc_1.mWidth = this.mWidth;
            _loc_1.mHeight = this.mHeight;
            _loc_1.mCancelled = this.mCancelled;
            _loc_1.target = this.mTarget;
            return _loc_1;
        }// end function

        private function updateBubbleChain() : void
        {
            var _loc_1:* = 0;
            var _loc_2:* = null;
            if (this.mTarget)
            {
                _loc_1 = 1;
                _loc_2 = this.mTarget;
                this.mBubbleChain.length = 1;
                this.mBubbleChain[0] = _loc_2;
                do
                {
                    
                    this.mBubbleChain[int(_loc_1++)] = _loc_2;
                    var _loc_3:* = _loc_2.parent;
                    _loc_2 = _loc_2.parent;
                }while (_loc_3 != null)
            }
            else
            {
                this.mBubbleChain.length = 0;
            }
            return;
        }// end function

        public function get id() : int
        {
            return this.mID;
        }// end function

        public function get previousGlobalX() : Number
        {
            return this.mPreviousGlobalX;
        }// end function

        public function get previousGlobalY() : Number
        {
            return this.mPreviousGlobalY;
        }// end function

        public function get globalX() : Number
        {
            return this.mGlobalX;
        }// end function

        public function set globalX(param1:Number) : void
        {
            this.mPreviousGlobalX = this.mGlobalX != this.mGlobalX ? (param1) : (this.mGlobalX);
            this.mGlobalX = param1;
            return;
        }// end function

        public function get globalY() : Number
        {
            return this.mGlobalY;
        }// end function

        public function set globalY(param1:Number) : void
        {
            this.mPreviousGlobalY = this.mGlobalY != this.mGlobalY ? (param1) : (this.mGlobalY);
            this.mGlobalY = param1;
            return;
        }// end function

        public function get tapCount() : int
        {
            return this.mTapCount;
        }// end function

        public function set tapCount(param1:int) : void
        {
            this.mTapCount = param1;
            return;
        }// end function

        public function get phase() : String
        {
            return this.mPhase;
        }// end function

        public function set phase(param1:String) : void
        {
            this.mPhase = param1;
            return;
        }// end function

        public function get target() : DisplayObject
        {
            return this.mTarget;
        }// end function

        public function set target(param1:DisplayObject) : void
        {
            if (this.mTarget != param1)
            {
                this.mTarget = param1;
                this.updateBubbleChain();
            }
            return;
        }// end function

        public function get timestamp() : Number
        {
            return this.mTimestamp;
        }// end function

        public function set timestamp(param1:Number) : void
        {
            this.mTimestamp = param1;
            return;
        }// end function

        public function get pressure() : Number
        {
            return this.mPressure;
        }// end function

        public function set pressure(param1:Number) : void
        {
            this.mPressure = param1;
            return;
        }// end function

        public function get width() : Number
        {
            return this.mWidth;
        }// end function

        public function set width(param1:Number) : void
        {
            this.mWidth = param1;
            return;
        }// end function

        public function get height() : Number
        {
            return this.mHeight;
        }// end function

        public function set height(param1:Number) : void
        {
            this.mHeight = param1;
            return;
        }// end function

        public function get cancelled() : Boolean
        {
            return this.mCancelled;
        }// end function

        public function set cancelled(param1:Boolean) : void
        {
            this.mCancelled = param1;
            return;
        }// end function

        function dispatchEvent(event:TouchEvent) : void
        {
            if (this.mTarget)
            {
                event.dispatch(this.mBubbleChain);
            }
            return;
        }// end function

        function get bubbleChain() : Vector.<EventDispatcher>
        {
            return this.mBubbleChain.concat();
        }// end function

    }
}
