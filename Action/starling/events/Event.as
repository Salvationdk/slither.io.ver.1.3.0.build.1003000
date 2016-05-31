package starling.events
{
    import __AS3__.vec.*;
    import flash.utils.*;
    import starling.utils.*;

    public class Event extends Object
    {
        private var mTarget:EventDispatcher;
        private var mCurrentTarget:EventDispatcher;
        private var mType:String;
        private var mBubbles:Boolean;
        private var mStopsPropagation:Boolean;
        private var mStopsImmediatePropagation:Boolean;
        private var mData:Object;
        public static const ADDED:String = "added";
        public static const ADDED_TO_STAGE:String = "addedToStage";
        public static const ENTER_FRAME:String = "enterFrame";
        public static const REMOVED:String = "removed";
        public static const REMOVED_FROM_STAGE:String = "removedFromStage";
        public static const TRIGGERED:String = "triggered";
        public static const FLATTEN:String = "flatten";
        public static const RESIZE:String = "resize";
        public static const COMPLETE:String = "complete";
        public static const CONTEXT3D_CREATE:String = "context3DCreate";
        public static const RENDER:String = "render";
        public static const ROOT_CREATED:String = "rootCreated";
        public static const REMOVE_FROM_JUGGLER:String = "removeFromJuggler";
        public static const TEXTURES_RESTORED:String = "texturesRestored";
        public static const IO_ERROR:String = "ioError";
        public static const SECURITY_ERROR:String = "securityError";
        public static const PARSE_ERROR:String = "parseError";
        public static const FATAL_ERROR:String = "fatalError";
        public static const CHANGE:String = "change";
        public static const CANCEL:String = "cancel";
        public static const SCROLL:String = "scroll";
        public static const OPEN:String = "open";
        public static const CLOSE:String = "close";
        public static const SELECT:String = "select";
        public static const READY:String = "ready";
        private static var sEventPool:Vector.<Event> = new Vector.<Event>(0);

        public function Event(param1:String, param2:Boolean = false, param3:Object = null)
        {
            this.mType = param1;
            this.mBubbles = param2;
            this.mData = param3;
            return;
        }// end function

        public function stopPropagation() : void
        {
            this.mStopsPropagation = true;
            return;
        }// end function

        public function stopImmediatePropagation() : void
        {
            var _loc_1:* = true;
            this.mStopsImmediatePropagation = true;
            this.mStopsPropagation = _loc_1;
            return;
        }// end function

        public function toString() : String
        {
            return formatString("[{0} type=\"{1}\" bubbles={2}]", getQualifiedClassName(this).split("::").pop(), this.mType, this.mBubbles);
        }// end function

        public function get bubbles() : Boolean
        {
            return this.mBubbles;
        }// end function

        public function get target() : EventDispatcher
        {
            return this.mTarget;
        }// end function

        public function get currentTarget() : EventDispatcher
        {
            return this.mCurrentTarget;
        }// end function

        public function get type() : String
        {
            return this.mType;
        }// end function

        public function get data() : Object
        {
            return this.mData;
        }// end function

        function setTarget(param1:EventDispatcher) : void
        {
            this.mTarget = param1;
            return;
        }// end function

        function setCurrentTarget(param1:EventDispatcher) : void
        {
            this.mCurrentTarget = param1;
            return;
        }// end function

        function setData(param1:Object) : void
        {
            this.mData = param1;
            return;
        }// end function

        function get stopsPropagation() : Boolean
        {
            return this.mStopsPropagation;
        }// end function

        function get stopsImmediatePropagation() : Boolean
        {
            return this.mStopsImmediatePropagation;
        }// end function

        function reset(param1:String, param2:Boolean = false, param3:Object = null) : Event
        {
            this.mType = param1;
            this.mBubbles = param2;
            this.mData = param3;
            var _loc_4:* = null;
            this.mCurrentTarget = null;
            this.mTarget = _loc_4;
            var _loc_4:* = false;
            this.mStopsImmediatePropagation = false;
            this.mStopsPropagation = _loc_4;
            return this;
        }// end function

        static function fromPool(param1:String, param2:Boolean = false, param3:Object = null) : Event
        {
            if (sEventPool.length)
            {
                return sEventPool.pop().reset(param1, param2, param3);
            }
            return new Event(param1, param2, param3);
        }// end function

        static function toPool(event:Event) : void
        {
            var _loc_2:* = null;
            event.mCurrentTarget = null;
            event.mTarget = _loc_2;
            event.mData = _loc_2;
            sEventPool[sEventPool.length] = event;
            return;
        }// end function

    }
}
