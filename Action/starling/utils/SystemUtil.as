package starling.utils
{
    import flash.display3D.*;
    import flash.events.*;
    import flash.system.*;
    import flash.utils.*;
    import starling.errors.*;

    public class SystemUtil extends Object
    {
        private static var sInitialized:Boolean = false;
        private static var sApplicationActive:Boolean = true;
        private static var sWaitingCalls:Array = [];
        private static var sPlatform:String;
        private static var sVersion:String;
        private static var sAIR:Boolean;
        private static var sSupportsDepthAndStencil:Boolean = true;

        public function SystemUtil()
        {
            throw new AbstractClassError();
        }// end function

        public static function initialize() : void
        {
            var nativeAppClass:Object;
            var nativeApp:EventDispatcher;
            var appDescriptor:XML;
            var ns:Namespace;
            var ds:String;
            if (sInitialized)
            {
                return;
            }
            sInitialized = true;
            sPlatform = Capabilities.version.substr(0, 3);
            sVersion = Capabilities.version.substr(4);
            try
            {
                nativeAppClass = getDefinitionByName("flash.desktop::NativeApplication");
                nativeApp = nativeAppClass["nativeApplication"] as EventDispatcher;
                nativeApp.addEventListener(Event.ACTIVATE, onActivate, false, 0, true);
                nativeApp.addEventListener(Event.DEACTIVATE, onDeactivate, false, 0, true);
                appDescriptor = nativeApp["applicationDescriptor"];
                ns = appDescriptor.namespace();
                ds = ns::depthAndStencil.toString().toLowerCase();
                sSupportsDepthAndStencil = ds == "true";
                sAIR = true;
            }
            catch (e:Error)
            {
                sAIR = false;
            }
            return;
        }// end function

        private static function onActivate(param1:Object) : void
        {
            var _loc_2:* = null;
            sApplicationActive = true;
            for each (_loc_2 in sWaitingCalls)
            {
                
                _loc_2[0].apply(null, _loc_2[1]);
            }
            sWaitingCalls = [];
            return;
        }// end function

        private static function onDeactivate(param1:Object) : void
        {
            sApplicationActive = false;
            return;
        }// end function

        public static function executeWhenApplicationIsActive(param1:Function, ... args) : void
        {
            initialize();
            if (sApplicationActive)
            {
                param1.apply(null, args);
            }
            else
            {
                sWaitingCalls.push([param1, args]);
            }
            return;
        }// end function

        public static function get isApplicationActive() : Boolean
        {
            initialize();
            return sApplicationActive;
        }// end function

        public static function get isAIR() : Boolean
        {
            initialize();
            return sAIR;
        }// end function

        public static function get isDesktop() : Boolean
        {
            initialize();
            return /(WIN|MAC|LNX)/.exec(sPlatform) != null;
        }// end function

        public static function get platform() : String
        {
            initialize();
            return sPlatform;
        }// end function

        public static function get version() : String
        {
            initialize();
            return sVersion;
        }// end function

        public static function get supportsRelaxedTargetClearRequirement() : Boolean
        {
            return parseInt(/\d+/.exec(sVersion)[0]) >= 15;
        }// end function

        public static function get supportsDepthAndStencil() : Boolean
        {
            return sSupportsDepthAndStencil;
        }// end function

        public static function get supportsVideoTexture() : Boolean
        {
            return Context3D["supportsVideoTexture"];
        }// end function

    }
}
