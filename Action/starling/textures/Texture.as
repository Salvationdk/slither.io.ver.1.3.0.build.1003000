package starling.textures
{
    import __AS3__.vec.*;
    import flash.display.*;
    import flash.display3D.*;
    import flash.display3D.textures.*;
    import flash.geom.*;
    import flash.media.*;
    import flash.net.*;
    import flash.system.*;
    import flash.utils.*;
    import starling.core.*;
    import starling.errors.*;
    import starling.utils.*;

    public class Texture extends Object
    {

        public function Texture()
        {
            if (Capabilities.isDebugger && getQualifiedClassName(this) == "starling.textures::Texture")
            {
                throw new AbstractClassError();
            }
            return;
        }// end function

        public function dispose() : void
        {
            return;
        }// end function

        public function adjustVertexData(param1:VertexData, param2:int, param3:int) : void
        {
            return;
        }// end function

        public function adjustTexCoords(param1:Vector.<Number>, param2:int = 0, param3:int = 0, param4:int = -1) : void
        {
            return;
        }// end function

        public function get frame() : Rectangle
        {
            return null;
        }// end function

        public function get repeat() : Boolean
        {
            return false;
        }// end function

        public function get width() : Number
        {
            return 0;
        }// end function

        public function get height() : Number
        {
            return 0;
        }// end function

        public function get nativeWidth() : Number
        {
            return 0;
        }// end function

        public function get nativeHeight() : Number
        {
            return 0;
        }// end function

        public function get scale() : Number
        {
            return 1;
        }// end function

        public function get base() : TextureBase
        {
            return null;
        }// end function

        public function get root() : ConcreteTexture
        {
            return null;
        }// end function

        public function get format() : String
        {
            return Context3DTextureFormat.BGRA;
        }// end function

        public function get mipMapping() : Boolean
        {
            return false;
        }// end function

        public function get premultipliedAlpha() : Boolean
        {
            return false;
        }// end function

        public static function fromData(param1:Object, param2:TextureOptions = null) : Texture
        {
            var _loc_3:* = null;
            if (param1 is Bitmap)
            {
                param1 = (param1 as Bitmap).bitmapData;
            }
            if (param2 == null)
            {
                param2 = new TextureOptions();
            }
            if (param1 is Class)
            {
                _loc_3 = fromEmbeddedAsset(param1 as Class, param2.mipMapping, param2.optimizeForRenderToTexture, param2.scale, param2.format, param2.repeat);
            }
            else if (param1 is BitmapData)
            {
                _loc_3 = fromBitmapData(param1 as BitmapData, param2.mipMapping, param2.optimizeForRenderToTexture, param2.scale, param2.format, param2.repeat);
            }
            else if (param1 is ByteArray)
            {
                _loc_3 = fromAtfData(param1 as ByteArray, param2.scale, param2.mipMapping, param2.onReady, param2.repeat);
            }
            else
            {
                throw new ArgumentError("Unsupported \'data\' type: " + getQualifiedClassName(param1));
            }
            return _loc_3;
        }// end function

        public static function fromEmbeddedAsset(param1:Class, param2:Boolean = true, param3:Boolean = false, param4:Number = 1, param5:String = "bgra", param6:Boolean = false) : Texture
        {
            var texture:Texture;
            var assetClass:* = param1;
            var mipMapping:* = param2;
            var optimizeForRenderToTexture:* = param3;
            var scale:* = param4;
            var format:* = param5;
            var repeat:* = param6;
            var asset:* = new assetClass;
            if (asset is Bitmap)
            {
                texture = Texture.fromBitmap(asset as Bitmap, mipMapping, optimizeForRenderToTexture, scale, format, repeat);
                texture.root.onRestore = function () : void
            {
                texture.root.uploadBitmap(new assetClass());
                return;
            }// end function
            ;
            }
            else if (asset is ByteArray)
            {
                texture = Texture.fromAtfData(asset as ByteArray, scale, mipMapping, null, repeat);
                texture.root.onRestore = function () : void
            {
                texture.root.uploadAtfData(new assetClass());
                return;
            }// end function
            ;
            }
            else
            {
                throw new ArgumentError("Invalid asset type: " + getQualifiedClassName(asset));
            }
            asset;
            return texture;
        }// end function

        public static function fromBitmap(param1:Bitmap, param2:Boolean = true, param3:Boolean = false, param4:Number = 1, param5:String = "bgra", param6:Boolean = false) : Texture
        {
            return fromBitmapData(param1.bitmapData, param2, param3, param4, param5, param6);
        }// end function

        public static function fromBitmapData(param1:BitmapData, param2:Boolean = true, param3:Boolean = false, param4:Number = 1, param5:String = "bgra", param6:Boolean = false) : Texture
        {
            var texture:Texture;
            var data:* = param1;
            var generateMipMaps:* = param2;
            var optimizeForRenderToTexture:* = param3;
            var scale:* = param4;
            var format:* = param5;
            var repeat:* = param6;
            texture = Texture.empty(data.width / scale, data.height / scale, true, generateMipMaps, optimizeForRenderToTexture, scale, format, repeat);
            texture.root.uploadBitmapData(data);
            texture.root.onRestore = function () : void
            {
                texture.root.uploadBitmapData(data);
                return;
            }// end function
            ;
            return texture;
        }// end function

        public static function fromAtfData(param1:ByteArray, param2:Number = 1, param3:Boolean = true, param4:Function = null, param5:Boolean = false) : Texture
        {
            var concreteTexture:ConcreteTexture;
            var data:* = param1;
            var scale:* = param2;
            var useMipMaps:* = param3;
            var async:* = param4;
            var repeat:* = param5;
            var context:* = Starling.context;
            if (context == null)
            {
                throw new MissingContextError();
            }
            var atfData:* = new AtfData(data);
            var nativeTexture:* = context.createTexture(atfData.width, atfData.height, atfData.format, false);
            concreteTexture = new ConcreteTexture(nativeTexture, atfData.format, atfData.width, atfData.height, useMipMaps && atfData.numTextures > 1, false, false, scale, repeat);
            concreteTexture.uploadAtfData(data, 0, async);
            concreteTexture.onRestore = function () : void
            {
                concreteTexture.uploadAtfData(data, 0);
                return;
            }// end function
            ;
            return concreteTexture;
        }// end function

        public static function fromNetStream(param1:NetStream, param2:Number = 1, param3:Function = null) : Texture
        {
            var stream:* = param1;
            var scale:* = param2;
            var onComplete:* = param3;
            if (stream.client == stream && !("onMetaData" in stream))
            {
                stream.client = {onMetaData:function (param1:Object) : void
            {
                return;
            }// end function
            };
            }
            return fromVideoAttachment("NetStream", stream, scale, onComplete);
        }// end function

        public static function fromCamera(param1:Camera, param2:Number = 1, param3:Function = null) : Texture
        {
            return fromVideoAttachment("Camera", param1, param2, param3);
        }// end function

        private static function fromVideoAttachment(param1:String, param2:Object, param3:Number, param4:Function) : Texture
        {
            var TEXTURE_READY:String;
            var base:TextureBase;
            var texture:ConcreteVideoTexture;
            var type:* = param1;
            var attachment:* = param2;
            var scale:* = param3;
            var onComplete:* = param4;
            TEXTURE_READY;
            if (!SystemUtil.supportsVideoTexture)
            {
                throw new NotSupportedError("Video Textures are not supported on this platform");
            }
            var context:* = Starling.context;
            if (context == null)
            {
                throw new MissingContextError();
            }
            var _loc_6:* = context;
            base = _loc_6["createVideoTexture"]();
            var _loc_6:* = base;
            _loc_6["attach" + type](attachment);
            _loc_6.addEventListener(TEXTURE_READY, function (param1:Object) : void
            {
                base.removeEventListener(TEXTURE_READY, arguments.callee);
                execute(onComplete, texture);
                return;
            }// end function
            );
            texture = new ConcreteVideoTexture(base, scale);
            texture.onRestore = function () : void
            {
                texture.root.attachVideo(type, attachment);
                return;
            }// end function
            ;
            return texture;
        }// end function

        public static function fromColor(param1:Number, param2:Number, param3:uint = 4.29497e+009, param4:Boolean = false, param5:Number = -1, param6:String = "bgra") : Texture
        {
            var texture:Texture;
            var width:* = param1;
            var height:* = param2;
            var color:* = param3;
            var optimizeForRenderToTexture:* = param4;
            var scale:* = param5;
            var format:* = param6;
            texture = Texture.empty(width, height, true, false, optimizeForRenderToTexture, scale, format);
            texture.root.clear(color, Color.getAlpha(color) / 255);
            texture.root.onRestore = function () : void
            {
                texture.root.clear(color, Color.getAlpha(color) / 255);
                return;
            }// end function
            ;
            return texture;
        }// end function

        public static function empty(param1:Number, param2:Number, param3:Boolean = true, param4:Boolean = true, param5:Boolean = false, param6:Number = -1, param7:String = "bgra", param8:Boolean = false) : Texture
        {
            var _loc_9:* = 0;
            var _loc_10:* = 0;
            var _loc_11:* = null;
            if (param6 <= 0)
            {
                param6 = Starling.contentScaleFactor;
            }
            var _loc_12:* = Starling.context;
            if (Starling.context == null)
            {
                throw new MissingContextError();
            }
            var _loc_13:* = param1 * param6;
            var _loc_14:* = param2 * param6;
            var _loc_15:* = !param4 && !param8 && Starling.current.profile != "baselineConstrained" && "createRectangleTexture" in _loc_12 && param7.indexOf("compressed") == -1;
            if (!param4 && !param8 && Starling.current.profile != "baselineConstrained" && "createRectangleTexture" in _loc_12 && param7.indexOf("compressed") == -1)
            {
                _loc_9 = Math.ceil(_loc_13 - 1e-009);
                _loc_10 = Math.ceil(_loc_14 - 1e-009);
                var _loc_17:* = _loc_12;
                _loc_11 = _loc_17["createRectangleTexture"](_loc_9, _loc_10, param7, param5);
            }
            else
            {
                _loc_9 = getNextPowerOfTwo(_loc_13);
                _loc_10 = getNextPowerOfTwo(_loc_14);
                _loc_11 = _loc_12.createTexture(_loc_9, _loc_10, param7, param5);
            }
            var _loc_16:* = new ConcreteTexture(_loc_11, param7, _loc_9, _loc_10, param4, param3, param5, param6, param8);
            _loc_16.onRestore = _loc_16.clear;
            if (_loc_9 - _loc_13 < 0.001 && _loc_10 - _loc_14 < 0.001)
            {
                return _loc_16;
            }
            return new SubTexture(_loc_16, new Rectangle(0, 0, param1, param2), true);
        }// end function

        public static function fromTexture(param1:Texture, param2:Rectangle = null, param3:Rectangle = null, param4:Boolean = false) : Texture
        {
            return new SubTexture(param1, param2, false, param3, param4);
        }// end function

        public static function get maxSize() : int
        {
            var _loc_1:* = Starling.current;
            var _loc_2:* = _loc_1 ? (_loc_1.profile) : ("baseline");
            if (_loc_2 == "baseline" || _loc_2 == "baselineConstrained")
            {
                return 2048;
            }
            return 4096;
        }// end function

    }
}
