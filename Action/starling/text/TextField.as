package starling.text
{
    import flash.display.*;
    import flash.display3D.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.text.*;
    import flash.utils.*;
    import starling.core.*;
    import starling.display.*;
    import starling.events.*;
    import starling.textures.*;
    import starling.utils.*;

    public class TextField extends DisplayObjectContainer
    {
        private var mFontSize:Number;
        private var mColor:uint;
        private var mText:String;
        private var mFontName:String;
        private var mHAlign:String;
        private var mVAlign:String;
        private var mBold:Boolean;
        private var mItalic:Boolean;
        private var mUnderline:Boolean;
        private var mAutoScale:Boolean;
        private var mAutoSize:String;
        private var mKerning:Boolean;
        private var mLeading:Number;
        private var mNativeFilters:Array;
        private var mRequiresRedraw:Boolean;
        private var mIsHtmlText:Boolean;
        private var mTextBounds:Rectangle;
        private var mBatchable:Boolean;
        private var mHitArea:Rectangle;
        private var mBorder:DisplayObjectContainer;
        private var mImage:Image;
        private var mQuadBatch:QuadBatch;
        private static const BITMAP_FONT_DATA_NAME:String = "starling.display.TextField.BitmapFonts";
        private static var sDefaultTextureFormat:String = "BGRA_PACKED" in Context3DTextureFormat ? ("bgraPacked4444") : ("bgra");
        private static var sHelperMatrix:Matrix = new Matrix();
        private static var sNativeTextField:TextField = new TextField();
        private static var sStringCache:Dictionary = new Dictionary();

        public function TextField(param1:int, param2:int, param3:String, param4:String = "Verdana", param5:Number = 12, param6:uint = 0, param7:Boolean = false)
        {
            this.mText = param3 ? (param3) : ("");
            this.mFontSize = param5;
            this.mColor = param6;
            this.mHAlign = HAlign.CENTER;
            this.mVAlign = VAlign.CENTER;
            this.mBorder = null;
            this.mKerning = true;
            this.mLeading = 0;
            this.mBold = param7;
            this.mAutoSize = TextFieldAutoSize.NONE;
            this.mHitArea = new Rectangle(0, 0, param1, param2);
            this.fontName = param4;
            addEventListener(Event.FLATTEN, this.onFlatten);
            return;
        }// end function

        override public function dispose() : void
        {
            removeEventListener(Event.FLATTEN, this.onFlatten);
            if (this.mImage)
            {
                this.mImage.texture.dispose();
            }
            if (this.mQuadBatch)
            {
                this.mQuadBatch.dispose();
            }
            super.dispose();
            return;
        }// end function

        private function onFlatten() : void
        {
            if (this.mRequiresRedraw)
            {
                this.redraw();
            }
            return;
        }// end function

        override public function render(param1:RenderSupport, param2:Number) : void
        {
            if (this.mRequiresRedraw)
            {
                this.redraw();
            }
            super.render(param1, param2);
            return;
        }// end function

        public function redraw() : void
        {
            if (this.mRequiresRedraw)
            {
                if (getBitmapFont(this.mFontName))
                {
                    this.createComposedContents();
                }
                else
                {
                    this.createRenderedContents();
                }
                this.updateBorder();
                this.mRequiresRedraw = false;
            }
            return;
        }// end function

        private function createRenderedContents() : void
        {
            var texture:Texture;
            var scale:Number;
            var bitmapData:BitmapData;
            if (this.mQuadBatch)
            {
                this.mQuadBatch.removeFromParent(true);
                this.mQuadBatch = null;
            }
            if (this.mTextBounds == null)
            {
                this.mTextBounds = new Rectangle();
            }
            scale = Starling.contentScaleFactor;
            bitmapData = this.renderText(scale, this.mTextBounds);
            var format:* = sDefaultTextureFormat;
            var maxTextureSize:* = Texture.maxSize;
            var shrinkHelper:Number;
            while (bitmapData.width > maxTextureSize || bitmapData.height > maxTextureSize)
            {
                
                scale = scale * Math.min((maxTextureSize - shrinkHelper) / bitmapData.width, (maxTextureSize - shrinkHelper) / bitmapData.height);
                bitmapData.dispose();
                bitmapData = this.renderText(scale, this.mTextBounds);
                shrinkHelper = (shrinkHelper + 1);
            }
            this.mHitArea.width = bitmapData.width / scale;
            this.mHitArea.height = bitmapData.height / scale;
            texture = Texture.fromBitmapData(bitmapData, false, false, scale, format);
            texture.root.onRestore = function () : void
            {
                if (mTextBounds == null)
                {
                    mTextBounds = new Rectangle();
                }
                bitmapData = renderText(scale, mTextBounds);
                texture.root.uploadBitmapData(bitmapData);
                bitmapData.dispose();
                bitmapData = null;
                return;
            }// end function
            ;
            bitmapData.dispose();
            bitmapData;
            if (this.mImage == null)
            {
                this.mImage = new Image(texture);
                this.mImage.touchable = false;
                addChild(this.mImage);
            }
            else
            {
                this.mImage.texture.dispose();
                this.mImage.texture = texture;
                this.mImage.readjustSize();
            }
            return;
        }// end function

        protected function formatText(param1:TextField, param2:TextFormat) : void
        {
            return;
        }// end function

        private function renderText(param1:Number, param2:Rectangle) : BitmapData
        {
            var _loc_3:* = this.mHitArea.width * param1;
            var _loc_4:* = this.mHitArea.height * param1;
            var _loc_5:* = this.mHAlign;
            var _loc_6:* = this.mVAlign;
            if (this.isHorizontalAutoSize)
            {
                _loc_3 = int.MAX_VALUE;
                _loc_5 = HAlign.LEFT;
            }
            if (this.isVerticalAutoSize)
            {
                _loc_4 = int.MAX_VALUE;
                _loc_6 = VAlign.TOP;
            }
            var _loc_7:* = new TextFormat(this.mFontName, this.mFontSize * param1, this.mColor, this.mBold, this.mItalic, this.mUnderline, null, null, _loc_5);
            _loc_7.kerning = this.mKerning;
            _loc_7.leading = this.mLeading;
            sNativeTextField.defaultTextFormat = _loc_7;
            sNativeTextField.width = _loc_3;
            sNativeTextField.height = _loc_4;
            sNativeTextField.antiAliasType = AntiAliasType.ADVANCED;
            sNativeTextField.selectable = false;
            sNativeTextField.multiline = true;
            sNativeTextField.wordWrap = true;
            if (this.mIsHtmlText)
            {
                sNativeTextField.htmlText = this.mText;
            }
            else
            {
                sNativeTextField.text = this.mText;
            }
            sNativeTextField.embedFonts = true;
            sNativeTextField.filters = this.mNativeFilters;
            if (sNativeTextField.textWidth == 0 || sNativeTextField.textHeight == 0)
            {
                sNativeTextField.embedFonts = false;
            }
            this.formatText(sNativeTextField, _loc_7);
            if (this.mAutoScale)
            {
                this.autoScaleNativeTextField(sNativeTextField);
            }
            var _loc_8:* = sNativeTextField.textWidth;
            var _loc_9:* = sNativeTextField.textHeight;
            if (this.isHorizontalAutoSize)
            {
                var _loc_16:* = Math.ceil(_loc_8 + 5);
                _loc_3 = Math.ceil(_loc_8 + 5);
                sNativeTextField.width = _loc_16;
            }
            if (this.isVerticalAutoSize)
            {
                var _loc_16:* = Math.ceil(_loc_9 + 4);
                _loc_4 = Math.ceil(_loc_9 + 4);
                sNativeTextField.height = _loc_16;
            }
            if (_loc_3 < 1)
            {
                _loc_3 = 1;
            }
            if (_loc_4 < 1)
            {
                _loc_4 = 1;
            }
            var _loc_10:* = 0;
            if (_loc_5 == HAlign.LEFT)
            {
                _loc_10 = 2;
            }
            else if (_loc_5 == HAlign.CENTER)
            {
                _loc_10 = (_loc_3 - _loc_8) / 2;
            }
            else if (_loc_5 == HAlign.RIGHT)
            {
                _loc_10 = _loc_3 - _loc_8 - 2;
            }
            var _loc_11:* = 0;
            if (_loc_6 == VAlign.TOP)
            {
                _loc_11 = 2;
            }
            else if (_loc_6 == VAlign.CENTER)
            {
                _loc_11 = (_loc_4 - _loc_9) / 2;
            }
            else if (_loc_6 == VAlign.BOTTOM)
            {
                _loc_11 = _loc_4 - _loc_9 - 2;
            }
            var _loc_12:* = this.calculateFilterOffset(sNativeTextField, _loc_5, _loc_6);
            var _loc_13:* = new BitmapData(_loc_3, _loc_4, true, 0);
            var _loc_14:* = new Matrix(1, 0, 0, 1, _loc_12.x, _loc_12.y + int(_loc_11) - 2);
            var _loc_15:* = "drawWithQuality" in _loc_13 ? (_loc_13["drawWithQuality"]) : (null);
            if (("drawWithQuality" in _loc_13 ? (_loc_13["drawWithQuality"]) : (null)) is Function)
            {
                _loc_15.call(_loc_13, sNativeTextField, _loc_14, null, null, null, false, StageQuality.MEDIUM);
            }
            else
            {
                _loc_13.draw(sNativeTextField, _loc_14);
            }
            sNativeTextField.text = "";
            param2.setTo((_loc_10 + _loc_12.x) / param1, (_loc_11 + _loc_12.y) / param1, _loc_8 / param1, _loc_9 / param1);
            return _loc_13;
        }// end function

        private function autoScaleNativeTextField(param1:TextField) : void
        {
            var _loc_5:* = null;
            var _loc_2:* = Number(param1.defaultTextFormat.size);
            var _loc_3:* = param1.height - 4;
            var _loc_4:* = param1.width - 4;
            while (param1.textWidth > _loc_4 || param1.textHeight > _loc_3)
            {
                
                if (_loc_2 <= 4)
                {
                    break;
                }
                _loc_5 = param1.defaultTextFormat;
                _loc_5.size = _loc_2 - 1;
                param1.defaultTextFormat = _loc_5;
                if (this.mIsHtmlText)
                {
                    param1.htmlText = this.mText;
                    continue;
                }
                param1.text = this.mText;
            }
            return;
        }// end function

        private function calculateFilterOffset(param1:TextField, param2:String, param3:String) : Point
        {
            var _loc_6:* = NaN;
            var _loc_7:* = NaN;
            var _loc_8:* = null;
            var _loc_9:* = null;
            var _loc_10:* = NaN;
            var _loc_11:* = NaN;
            var _loc_12:* = NaN;
            var _loc_13:* = NaN;
            var _loc_14:* = NaN;
            var _loc_15:* = NaN;
            var _loc_16:* = NaN;
            var _loc_17:* = NaN;
            var _loc_18:* = NaN;
            var _loc_19:* = null;
            var _loc_4:* = new Point();
            var _loc_5:* = param1.filters;
            if (param1.filters != null && _loc_5.length > 0)
            {
                _loc_6 = param1.textWidth;
                _loc_7 = param1.textHeight;
                _loc_8 = new Rectangle();
                for each (_loc_9 in _loc_5)
                {
                    
                    _loc_10 = "blurX" in _loc_9 ? (_loc_9["blurX"]) : (0);
                    _loc_11 = "blurY" in _loc_9 ? (_loc_9["blurY"]) : (0);
                    _loc_12 = "angle" in _loc_9 ? (_loc_9["angle"]) : (0);
                    _loc_13 = "distance" in _loc_9 ? (_loc_9["distance"]) : (0);
                    _loc_14 = deg2rad(_loc_12);
                    _loc_15 = _loc_10 * 1.33;
                    _loc_16 = _loc_11 * 1.33;
                    _loc_17 = Math.cos(_loc_14) * _loc_13 - _loc_15 / 2;
                    _loc_18 = Math.sin(_loc_14) * _loc_13 - _loc_16 / 2;
                    _loc_19 = new Rectangle(_loc_17, _loc_18, _loc_6 + _loc_15, _loc_7 + _loc_16);
                    _loc_8 = _loc_8.union(_loc_19);
                }
                if (param2 == HAlign.LEFT && _loc_8.x < 0)
                {
                    _loc_4.x = -_loc_8.x;
                }
                else if (param2 == HAlign.RIGHT && _loc_8.y > 0)
                {
                    _loc_4.x = -(_loc_8.right - _loc_6);
                }
                if (param3 == VAlign.TOP && _loc_8.y < 0)
                {
                    _loc_4.y = -_loc_8.y;
                }
                else if (param3 == VAlign.BOTTOM && _loc_8.y > 0)
                {
                    _loc_4.y = -(_loc_8.bottom - _loc_7);
                }
            }
            return _loc_4;
        }// end function

        private function createComposedContents() : void
        {
            if (this.mImage)
            {
                this.mImage.removeFromParent(true);
                this.mImage.texture.dispose();
                this.mImage = null;
            }
            if (this.mQuadBatch == null)
            {
                this.mQuadBatch = new QuadBatch();
                this.mQuadBatch.touchable = false;
                addChild(this.mQuadBatch);
            }
            else
            {
                this.mQuadBatch.reset();
            }
            var _loc_1:* = getBitmapFont(this.mFontName);
            if (_loc_1 == null)
            {
                throw new Error("Bitmap font not registered: " + this.mFontName);
            }
            var _loc_2:* = this.mHitArea.width;
            var _loc_3:* = this.mHitArea.height;
            var _loc_4:* = this.mHAlign;
            var _loc_5:* = this.mVAlign;
            if (this.isHorizontalAutoSize)
            {
                _loc_2 = int.MAX_VALUE;
                _loc_4 = HAlign.LEFT;
            }
            if (this.isVerticalAutoSize)
            {
                _loc_3 = int.MAX_VALUE;
                _loc_5 = VAlign.TOP;
            }
            _loc_1.fillQuadBatch(this.mQuadBatch, _loc_2, _loc_3, this.mText, this.mFontSize, this.mColor, _loc_4, _loc_5, this.mAutoScale, this.mKerning, this.mLeading);
            this.mQuadBatch.batchable = this.mBatchable;
            if (this.mAutoSize != TextFieldAutoSize.NONE)
            {
                this.mTextBounds = this.mQuadBatch.getBounds(this.mQuadBatch, this.mTextBounds);
                if (this.isHorizontalAutoSize)
                {
                    this.mHitArea.width = this.mTextBounds.x + this.mTextBounds.width;
                }
                if (this.isVerticalAutoSize)
                {
                    this.mHitArea.height = this.mTextBounds.y + this.mTextBounds.height;
                }
            }
            else
            {
                this.mTextBounds = null;
            }
            return;
        }// end function

        private function updateBorder() : void
        {
            if (this.mBorder == null)
            {
                return;
            }
            var _loc_1:* = this.mHitArea.width;
            var _loc_2:* = this.mHitArea.height;
            var _loc_3:* = this.mBorder.getChildAt(0) as Quad;
            var _loc_4:* = this.mBorder.getChildAt(1) as Quad;
            var _loc_5:* = this.mBorder.getChildAt(2) as Quad;
            var _loc_6:* = this.mBorder.getChildAt(3) as Quad;
            _loc_3.width = _loc_1;
            _loc_3.height = 1;
            _loc_5.width = _loc_1;
            _loc_5.height = 1;
            _loc_6.width = 1;
            _loc_6.height = _loc_2;
            _loc_4.width = 1;
            _loc_4.height = _loc_2;
            _loc_4.x = _loc_1 - 1;
            _loc_5.y = _loc_2 - 1;
            var _loc_7:* = this.mColor;
            _loc_6.color = this.mColor;
            _loc_5.color = _loc_7;
            _loc_4.color = _loc_7;
            _loc_3.color = _loc_7;
            return;
        }// end function

        private function get isHorizontalAutoSize() : Boolean
        {
            return this.mAutoSize == TextFieldAutoSize.HORIZONTAL || this.mAutoSize == TextFieldAutoSize.BOTH_DIRECTIONS;
        }// end function

        private function get isVerticalAutoSize() : Boolean
        {
            return this.mAutoSize == TextFieldAutoSize.VERTICAL || this.mAutoSize == TextFieldAutoSize.BOTH_DIRECTIONS;
        }// end function

        public function get textBounds() : Rectangle
        {
            if (this.mRequiresRedraw)
            {
                this.redraw();
            }
            if (this.mTextBounds == null)
            {
                this.mTextBounds = this.mQuadBatch.getBounds(this.mQuadBatch);
            }
            return this.mTextBounds.clone();
        }// end function

        override public function getBounds(param1:DisplayObject, param2:Rectangle = null) : Rectangle
        {
            if (this.mRequiresRedraw)
            {
                this.redraw();
            }
            getTransformationMatrix(param1, sHelperMatrix);
            return RectangleUtil.getBounds(this.mHitArea, sHelperMatrix, param2);
        }// end function

        override public function hitTest(param1:Point, param2:Boolean = false) : DisplayObject
        {
            if (param2 && (!visible || !touchable))
            {
                return null;
            }
            if (this.mHitArea.containsPoint(param1) && hitTestMask(param1))
            {
                return this;
            }
            return null;
        }// end function

        override public function set width(param1:Number) : void
        {
            this.mHitArea.width = param1;
            this.mRequiresRedraw = true;
            return;
        }// end function

        override public function set height(param1:Number) : void
        {
            this.mHitArea.height = param1;
            this.mRequiresRedraw = true;
            return;
        }// end function

        public function get text() : String
        {
            return this.mText;
        }// end function

        public function set text(param1:String) : void
        {
            if (param1 == null)
            {
                param1 = "";
            }
            if (this.mText != param1)
            {
                this.mText = param1;
                this.mRequiresRedraw = true;
            }
            return;
        }// end function

        public function get fontName() : String
        {
            return this.mFontName;
        }// end function

        public function set fontName(param1:String) : void
        {
            if (this.mFontName != param1)
            {
                if (param1 == BitmapFont.MINI && bitmapFonts[param1] == undefined)
                {
                    registerBitmapFont(new BitmapFont());
                }
                this.mFontName = param1;
                this.mRequiresRedraw = true;
            }
            return;
        }// end function

        public function get fontSize() : Number
        {
            return this.mFontSize;
        }// end function

        public function set fontSize(param1:Number) : void
        {
            if (this.mFontSize != param1)
            {
                this.mFontSize = param1;
                this.mRequiresRedraw = true;
            }
            return;
        }// end function

        public function get color() : uint
        {
            return this.mColor;
        }// end function

        public function set color(param1:uint) : void
        {
            if (this.mColor != param1)
            {
                this.mColor = param1;
                this.mRequiresRedraw = true;
            }
            return;
        }// end function

        public function get hAlign() : String
        {
            return this.mHAlign;
        }// end function

        public function set hAlign(param1:String) : void
        {
            if (!HAlign.isValid(param1))
            {
                throw new ArgumentError("Invalid horizontal align: " + param1);
            }
            if (this.mHAlign != param1)
            {
                this.mHAlign = param1;
                this.mRequiresRedraw = true;
            }
            return;
        }// end function

        public function get vAlign() : String
        {
            return this.mVAlign;
        }// end function

        public function set vAlign(param1:String) : void
        {
            if (!VAlign.isValid(param1))
            {
                throw new ArgumentError("Invalid vertical align: " + param1);
            }
            if (this.mVAlign != param1)
            {
                this.mVAlign = param1;
                this.mRequiresRedraw = true;
            }
            return;
        }// end function

        public function get border() : Boolean
        {
            return this.mBorder != null;
        }// end function

        public function set border(param1:Boolean) : void
        {
            var _loc_2:* = 0;
            if (param1 && this.mBorder == null)
            {
                this.mBorder = new Sprite();
                addChild(this.mBorder);
                _loc_2 = 0;
                while (_loc_2 < 4)
                {
                    
                    this.mBorder.addChild(new Quad(1, 1));
                    _loc_2++;
                }
                this.updateBorder();
            }
            else if (!param1 && this.mBorder != null)
            {
                this.mBorder.removeFromParent(true);
                this.mBorder = null;
            }
            return;
        }// end function

        public function get bold() : Boolean
        {
            return this.mBold;
        }// end function

        public function set bold(param1:Boolean) : void
        {
            if (this.mBold != param1)
            {
                this.mBold = param1;
                this.mRequiresRedraw = true;
            }
            return;
        }// end function

        public function get italic() : Boolean
        {
            return this.mItalic;
        }// end function

        public function set italic(param1:Boolean) : void
        {
            if (this.mItalic != param1)
            {
                this.mItalic = param1;
                this.mRequiresRedraw = true;
            }
            return;
        }// end function

        public function get underline() : Boolean
        {
            return this.mUnderline;
        }// end function

        public function set underline(param1:Boolean) : void
        {
            if (this.mUnderline != param1)
            {
                this.mUnderline = param1;
                this.mRequiresRedraw = true;
            }
            return;
        }// end function

        public function get kerning() : Boolean
        {
            return this.mKerning;
        }// end function

        public function set kerning(param1:Boolean) : void
        {
            if (this.mKerning != param1)
            {
                this.mKerning = param1;
                this.mRequiresRedraw = true;
            }
            return;
        }// end function

        public function get autoScale() : Boolean
        {
            return this.mAutoScale;
        }// end function

        public function set autoScale(param1:Boolean) : void
        {
            if (this.mAutoScale != param1)
            {
                this.mAutoScale = param1;
                this.mRequiresRedraw = true;
            }
            return;
        }// end function

        public function get autoSize() : String
        {
            return this.mAutoSize;
        }// end function

        public function set autoSize(param1:String) : void
        {
            if (this.mAutoSize != param1)
            {
                this.mAutoSize = param1;
                this.mRequiresRedraw = true;
            }
            return;
        }// end function

        public function get batchable() : Boolean
        {
            return this.mBatchable;
        }// end function

        public function set batchable(param1:Boolean) : void
        {
            this.mBatchable = param1;
            if (this.mQuadBatch)
            {
                this.mQuadBatch.batchable = param1;
            }
            return;
        }// end function

        public function get nativeFilters() : Array
        {
            return this.mNativeFilters;
        }// end function

        public function set nativeFilters(param1:Array) : void
        {
            this.mNativeFilters = param1.concat();
            this.mRequiresRedraw = true;
            return;
        }// end function

        public function get isHtmlText() : Boolean
        {
            return this.mIsHtmlText;
        }// end function

        public function set isHtmlText(param1:Boolean) : void
        {
            if (this.mIsHtmlText != param1)
            {
                this.mIsHtmlText = param1;
                this.mRequiresRedraw = true;
            }
            return;
        }// end function

        public function get leading() : Number
        {
            return this.mLeading;
        }// end function

        public function set leading(param1:Number) : void
        {
            if (this.mLeading != param1)
            {
                this.mLeading = param1;
                this.mRequiresRedraw = true;
            }
            return;
        }// end function

        public static function get defaultTextureFormat() : String
        {
            return sDefaultTextureFormat;
        }// end function

        public static function set defaultTextureFormat(param1:String) : void
        {
            sDefaultTextureFormat = param1;
            return;
        }// end function

        public static function registerBitmapFont(param1:BitmapFont, param2:String = null) : String
        {
            if (param2 == null)
            {
                param2 = param1.name;
            }
            bitmapFonts[convertToLowerCase(param2)] = param1;
            return param2;
        }// end function

        public static function unregisterBitmapFont(param1:String, param2:Boolean = true) : void
        {
            param1 = convertToLowerCase(param1);
            if (param2 && bitmapFonts[param1] != undefined)
            {
                bitmapFonts[param1].dispose();
            }
            delete bitmapFonts[param1];
            return;
        }// end function

        public static function getBitmapFont(param1:String) : BitmapFont
        {
            return bitmapFonts[convertToLowerCase(param1)];
        }// end function

        private static function get bitmapFonts() : Dictionary
        {
            var _loc_1:* = Starling.current.contextData[BITMAP_FONT_DATA_NAME] as Dictionary;
            if (_loc_1 == null)
            {
                _loc_1 = new Dictionary();
                Starling.current.contextData[BITMAP_FONT_DATA_NAME] = _loc_1;
            }
            return _loc_1;
        }// end function

        private static function convertToLowerCase(param1:String) : String
        {
            var _loc_2:* = sStringCache[param1];
            if (_loc_2 == null)
            {
                _loc_2 = param1.toLowerCase();
                sStringCache[param1] = _loc_2;
            }
            return _loc_2;
        }// end function

    }
}
