package starling.text
{
    import __AS3__.vec.*;
    import flash.geom.*;
    import flash.utils.*;
    import starling.display.*;
    import starling.textures.*;
    import starling.utils.*;

    public class BitmapFont extends Object
    {
        private var mTexture:Texture;
        private var mChars:Dictionary;
        private var mName:String;
        private var mSize:Number;
        private var mLineHeight:Number;
        private var mBaseline:Number;
        private var mOffsetX:Number;
        private var mOffsetY:Number;
        private var mHelperImage:Image;
        public static const NATIVE_SIZE:int = -1;
        public static const MINI:String = "mini";
        private static const CHAR_SPACE:int = 32;
        private static const CHAR_TAB:int = 9;
        private static const CHAR_NEWLINE:int = 10;
        private static const CHAR_CARRIAGE_RETURN:int = 13;
        private static var sLines:Array = [];

        public function BitmapFont(param1:Texture = null, param2:XML = null)
        {
            if (param1 == null && param2 == null)
            {
                param1 = MiniBitmapFont.texture;
                param2 = MiniBitmapFont.xml;
            }
            else if (param1 != null && param2 == null)
            {
                throw new ArgumentError("fontXml cannot be null!");
            }
            this.mName = "unknown";
            var _loc_3:* = 14;
            this.mBaseline = 14;
            this.mSize = _loc_3;
            this.mLineHeight = _loc_3;
            var _loc_3:* = 0;
            this.mOffsetY = 0;
            this.mOffsetX = _loc_3;
            this.mTexture = param1;
            this.mChars = new Dictionary();
            this.mHelperImage = new Image(param1);
            this.parseFontXml(param2);
            return;
        }// end function

        public function dispose() : void
        {
            if (this.mTexture)
            {
                this.mTexture.dispose();
            }
            return;
        }// end function

        private function parseFontXml(param1:XML) : void
        {
            var _loc_6:* = null;
            var _loc_7:* = null;
            var _loc_8:* = 0;
            var _loc_9:* = NaN;
            var _loc_10:* = NaN;
            var _loc_11:* = NaN;
            var _loc_12:* = null;
            var _loc_13:* = null;
            var _loc_14:* = null;
            var _loc_15:* = 0;
            var _loc_16:* = 0;
            var _loc_17:* = NaN;
            var _loc_2:* = this.mTexture.scale;
            var _loc_3:* = this.mTexture.frame;
            var _loc_4:* = _loc_3 ? (_loc_3.x) : (0);
            var _loc_5:* = _loc_3 ? (_loc_3.y) : (0);
            this.mName = cleanMasterString(param1.info.@face);
            this.mSize = parseFloat(param1.info.@size) / _loc_2;
            this.mLineHeight = parseFloat(param1.common.@lineHeight) / _loc_2;
            this.mBaseline = parseFloat(param1.common.@base) / _loc_2;
            if (param1.info.@smooth.toString() == "0")
            {
                this.smoothing = TextureSmoothing.NONE;
            }
            if (this.mSize <= 0)
            {
                trace("[Starling] Warning: invalid font size in \'" + this.mName + "\' font.");
                this.mSize = this.mSize == 0 ? (16) : (this.mSize * -1);
            }
            for each (_loc_6 in param1.chars.char)
            {
                
                _loc_8 = parseInt(_loc_6.@id);
                _loc_9 = parseFloat(_loc_6.@xoffset) / _loc_2;
                _loc_10 = parseFloat(_loc_6.@yoffset) / _loc_2;
                _loc_11 = parseFloat(_loc_6.@xadvance) / _loc_2;
                _loc_12 = new Rectangle();
                _loc_12.x = parseFloat(_loc_6.@x) / _loc_2 + _loc_4;
                _loc_12.y = parseFloat(_loc_6.@y) / _loc_2 + _loc_5;
                _loc_12.width = parseFloat(_loc_6.@width) / _loc_2;
                _loc_12.height = parseFloat(_loc_6.@height) / _loc_2;
                _loc_13 = Texture.fromTexture(this.mTexture, _loc_12);
                _loc_14 = new BitmapChar(_loc_8, _loc_13, _loc_9, _loc_10, _loc_11);
                this.addChar(_loc_8, _loc_14);
            }
            for each (_loc_7 in param1.kernings.kerning)
            {
                
                _loc_15 = parseInt(_loc_7.@first);
                _loc_16 = parseInt(_loc_7.@second);
                _loc_17 = parseFloat(_loc_7.@amount) / _loc_2;
                if (_loc_16 in this.mChars)
                {
                    this.getChar(_loc_16).addKerning(_loc_15, _loc_17);
                }
            }
            return;
        }// end function

        public function getChar(param1:int) : BitmapChar
        {
            return this.mChars[param1];
        }// end function

        public function addChar(param1:int, param2:BitmapChar) : void
        {
            this.mChars[param1] = param2;
            return;
        }// end function

        public function getCharIDs(param1:Vector.<int> = null) : Vector.<int>
        {
            var _loc_2:* = undefined;
            if (param1 == null)
            {
                param1 = new Vector.<int>(0);
            }
            for (_loc_2 in this.mChars)
            {
                
                param1[param1.length] = int(_loc_2);
            }
            return param1;
        }// end function

        public function hasChars(param1:String) : Boolean
        {
            var _loc_2:* = 0;
            if (param1 == null)
            {
                return true;
            }
            var _loc_3:* = param1.length;
            var _loc_4:* = 0;
            while (_loc_4 < _loc_3)
            {
                
                _loc_2 = param1.charCodeAt(_loc_4);
                if (_loc_2 != CHAR_SPACE && _loc_2 != CHAR_TAB && _loc_2 != CHAR_NEWLINE && _loc_2 != CHAR_CARRIAGE_RETURN && this.getChar(_loc_2) == null)
                {
                    return false;
                }
                _loc_4++;
            }
            return true;
        }// end function

        public function createSprite(param1:Number, param2:Number, param3:String, param4:Number = -1, param5:uint = 16777215, param6:String = "center", param7:String = "center", param8:Boolean = true, param9:Boolean = true) : Sprite
        {
            var _loc_14:* = null;
            var _loc_15:* = null;
            var _loc_10:* = this.arrangeChars(param1, param2, param3, param4, param6, param7, param8, param9);
            var _loc_11:* = _loc_10.length;
            var _loc_12:* = new Sprite();
            var _loc_13:* = 0;
            while (_loc_13 < _loc_11)
            {
                
                _loc_14 = _loc_10[_loc_13];
                _loc_15 = _loc_14.char.createImage();
                _loc_15.x = _loc_14.x;
                _loc_15.y = _loc_14.y;
                var _loc_16:* = _loc_14.scale;
                _loc_15.scaleY = _loc_14.scale;
                _loc_15.scaleX = _loc_16;
                _loc_15.color = param5;
                _loc_12.addChild(_loc_15);
                _loc_13++;
            }
            CharLocation.rechargePool();
            return _loc_12;
        }// end function

        public function fillQuadBatch(param1:QuadBatch, param2:Number, param3:Number, param4:String, param5:Number = -1, param6:uint = 16777215, param7:String = "center", param8:String = "center", param9:Boolean = true, param10:Boolean = true, param11:Number = 0) : void
        {
            var _loc_15:* = null;
            var _loc_12:* = this.arrangeChars(param2, param3, param4, param5, param7, param8, param9, param10, param11);
            var _loc_13:* = _loc_12.length;
            this.mHelperImage.color = param6;
            var _loc_14:* = 0;
            while (_loc_14 < _loc_13)
            {
                
                _loc_15 = _loc_12[_loc_14];
                this.mHelperImage.texture = _loc_15.char.texture;
                this.mHelperImage.readjustSize();
                this.mHelperImage.x = _loc_15.x;
                this.mHelperImage.y = _loc_15.y;
                var _loc_16:* = _loc_15.scale;
                this.mHelperImage.scaleY = _loc_15.scale;
                this.mHelperImage.scaleX = _loc_16;
                param1.addImage(this.mHelperImage);
                _loc_14++;
            }
            CharLocation.rechargePool();
            return;
        }// end function

        private function arrangeChars(param1:Number, param2:Number, param3:String, param4:Number = -1, param5:String = "center", param6:String = "center", param7:Boolean = true, param8:Boolean = true, param9:Number = 0) : Vector.<CharLocation>
        {
            var _loc_11:* = null;
            var _loc_12:* = 0;
            var _loc_13:* = NaN;
            var _loc_14:* = NaN;
            var _loc_15:* = NaN;
            var _loc_21:* = 0;
            var _loc_22:* = 0;
            var _loc_23:* = NaN;
            var _loc_24:* = NaN;
            var _loc_25:* = null;
            var _loc_26:* = 0;
            var _loc_27:* = false;
            var _loc_28:* = 0;
            var _loc_29:* = null;
            var _loc_30:* = 0;
            var _loc_31:* = 0;
            var _loc_32:* = null;
            var _loc_33:* = 0;
            var _loc_34:* = null;
            var _loc_35:* = NaN;
            var _loc_36:* = 0;
            if (param3 == null || param3.length == 0)
            {
                return CharLocation.vectorFromPool();
            }
            if (param4 < 0)
            {
                param4 = param4 * (-this.mSize);
            }
            var _loc_10:* = false;
            while (!_loc_10)
            {
                
                sLines.length = 0;
                _loc_15 = param4 / this.mSize;
                _loc_13 = param1 / _loc_15;
                _loc_14 = param2 / _loc_15;
                if (this.mLineHeight <= _loc_14)
                {
                    _loc_21 = -1;
                    _loc_22 = -1;
                    _loc_23 = 0;
                    _loc_24 = 0;
                    _loc_25 = CharLocation.vectorFromPool();
                    _loc_12 = param3.length;
                    _loc_26 = 0;
                    while (_loc_26 < _loc_12)
                    {
                        
                        _loc_27 = false;
                        _loc_28 = param3.charCodeAt(_loc_26);
                        _loc_29 = this.getChar(_loc_28);
                        if (_loc_28 == CHAR_NEWLINE || _loc_28 == CHAR_CARRIAGE_RETURN)
                        {
                            _loc_27 = true;
                        }
                        else if (_loc_29 == null)
                        {
                            trace("[Starling] Missing character: " + _loc_28);
                        }
                        else
                        {
                            if (_loc_28 == CHAR_SPACE || _loc_28 == CHAR_TAB)
                            {
                                _loc_21 = _loc_26;
                            }
                            if (param8)
                            {
                                _loc_23 = _loc_23 + _loc_29.getKerning(_loc_22);
                            }
                            _loc_11 = CharLocation.instanceFromPool(_loc_29);
                            _loc_11.x = _loc_23 + _loc_29.xOffset;
                            _loc_11.y = _loc_24 + _loc_29.yOffset;
                            _loc_25[_loc_25.length] = _loc_11;
                            _loc_23 = _loc_23 + _loc_29.xAdvance;
                            _loc_22 = _loc_28;
                            if (_loc_11.x + _loc_29.width > _loc_13)
                            {
                                if (param7 && _loc_21 == -1)
                                {
                                    break;
                                }
                                _loc_30 = _loc_21 == -1 ? (1) : (_loc_26 - _loc_21);
                                _loc_31 = _loc_25.length - _loc_30;
                                _loc_25.splice(_loc_31, _loc_30);
                                if (_loc_25.length == 0)
                                {
                                    break;
                                }
                                _loc_26 = _loc_26 - _loc_30;
                                _loc_27 = true;
                            }
                        }
                        if (_loc_26 == (_loc_12 - 1))
                        {
                            sLines[sLines.length] = _loc_25;
                            _loc_10 = true;
                        }
                        else if (_loc_27)
                        {
                            sLines[sLines.length] = _loc_25;
                            if (_loc_21 == _loc_26)
                            {
                                _loc_25.pop();
                            }
                            if (_loc_24 + param9 + 2 * this.mLineHeight <= _loc_14)
                            {
                                _loc_25 = CharLocation.vectorFromPool();
                                _loc_23 = 0;
                                _loc_24 = _loc_24 + (this.mLineHeight + param9);
                                _loc_21 = -1;
                                _loc_22 = -1;
                            }
                            else
                            {
                                break;
                            }
                        }
                        _loc_26++;
                    }
                }
                if (param7 && !_loc_10 && param4 > 3)
                {
                    param4 = param4 - 1;
                    continue;
                }
                _loc_10 = true;
            }
            var _loc_16:* = CharLocation.vectorFromPool();
            var _loc_17:* = sLines.length;
            var _loc_18:* = _loc_24 + this.mLineHeight;
            var _loc_19:* = 0;
            if (param6 == VAlign.BOTTOM)
            {
                _loc_19 = _loc_14 - _loc_18;
            }
            else if (param6 == VAlign.CENTER)
            {
                _loc_19 = (_loc_14 - _loc_18) / 2;
            }
            var _loc_20:* = 0;
            while (_loc_20 < _loc_17)
            {
                
                _loc_32 = sLines[_loc_20];
                _loc_12 = _loc_32.length;
                if (_loc_12 == 0)
                {
                }
                else
                {
                    _loc_33 = 0;
                    _loc_34 = _loc_32[(_loc_32.length - 1)];
                    _loc_35 = _loc_34.x - _loc_34.char.xOffset + _loc_34.char.xAdvance;
                    if (param5 == HAlign.RIGHT)
                    {
                        _loc_33 = _loc_13 - _loc_35;
                    }
                    else if (param5 == HAlign.CENTER)
                    {
                        _loc_33 = (_loc_13 - _loc_35) / 2;
                    }
                    _loc_36 = 0;
                    while (_loc_36 < _loc_12)
                    {
                        
                        _loc_11 = _loc_32[_loc_36];
                        _loc_11.x = _loc_15 * (_loc_11.x + _loc_33 + this.mOffsetX);
                        _loc_11.y = _loc_15 * (_loc_11.y + _loc_19 + this.mOffsetY);
                        _loc_11.scale = _loc_15;
                        if (_loc_11.char.width > 0 && _loc_11.char.height > 0)
                        {
                            _loc_16[_loc_16.length] = _loc_11;
                        }
                        _loc_36++;
                    }
                }
                _loc_20++;
            }
            return _loc_16;
        }// end function

        public function get name() : String
        {
            return this.mName;
        }// end function

        public function get size() : Number
        {
            return this.mSize;
        }// end function

        public function get lineHeight() : Number
        {
            return this.mLineHeight;
        }// end function

        public function set lineHeight(param1:Number) : void
        {
            this.mLineHeight = param1;
            return;
        }// end function

        public function get smoothing() : String
        {
            return this.mHelperImage.smoothing;
        }// end function

        public function set smoothing(param1:String) : void
        {
            this.mHelperImage.smoothing = param1;
            return;
        }// end function

        public function get baseline() : Number
        {
            return this.mBaseline;
        }// end function

        public function set baseline(param1:Number) : void
        {
            this.mBaseline = param1;
            return;
        }// end function

        public function get offsetX() : Number
        {
            return this.mOffsetX;
        }// end function

        public function set offsetX(param1:Number) : void
        {
            this.mOffsetX = param1;
            return;
        }// end function

        public function get offsetY() : Number
        {
            return this.mOffsetY;
        }// end function

        public function set offsetY(param1:Number) : void
        {
            this.mOffsetY = param1;
            return;
        }// end function

        public function get texture() : Texture
        {
            return this.mTexture;
        }// end function

    }
}

import __AS3__.vec.*;

import flash.geom.*;

import flash.utils.*;

import starling.display.*;

import starling.textures.*;

import starling.utils.*;

class CharLocation extends Object
{
    public var char:BitmapChar;
    public var scale:Number;
    public var x:Number;
    public var y:Number;
    private static var sInstancePool:Vector.<CharLocation> = new Vector.<CharLocation>(0);
    private static var sVectorPool:Array = [];
    private static var sInstanceLoan:Vector.<CharLocation> = new Vector.<CharLocation>(0);
    private static var sVectorLoan:Array = [];

    function CharLocation(param1:BitmapChar)
    {
        this.reset(param1);
        return;
    }// end function

    private function reset(param1:BitmapChar) : CharLocation
    {
        this.char = param1;
        return this;
    }// end function

    public static function instanceFromPool(param1:BitmapChar) : CharLocation
    {
        var _loc_2:* = sInstancePool.length > 0 ? (sInstancePool.pop()) : (new CharLocation(param1));
        _loc_2.reset(param1);
        sInstanceLoan[sInstanceLoan.length] = _loc_2;
        return _loc_2;
    }// end function

    public static function vectorFromPool() : Vector.<CharLocation>
    {
        var _loc_1:* = sVectorPool.length > 0 ? (sVectorPool.pop()) : (new Vector.<CharLocation>(0));
        _loc_1.length = 0;
        sVectorLoan[sVectorLoan.length] = _loc_1;
        return _loc_1;
    }// end function

    public static function rechargePool() : void
    {
        var _loc_1:* = null;
        var _loc_2:* = null;
        while (sInstanceLoan.length > 0)
        {
            
            _loc_1 = sInstanceLoan.pop();
            _loc_1.char = null;
            sInstancePool[sInstancePool.length] = _loc_1;
        }
        while (sVectorLoan.length > 0)
        {
            
            _loc_2 = sVectorLoan.pop();
            _loc_2.length = 0;
            sVectorPool[sVectorPool.length] = _loc_2;
        }
        return;
    }// end function

}

