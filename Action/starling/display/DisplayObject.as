package starling.display
{
    import __AS3__.vec.*;
    import flash.errors.*;
    import flash.geom.*;
    import flash.system.*;
    import flash.ui.*;
    import flash.utils.*;
    import starling.core.*;
    import starling.errors.*;
    import starling.events.*;
    import starling.filters.*;
    import starling.utils.*;

    public class DisplayObject extends EventDispatcher
    {
        private var mX:Number;
        private var mY:Number;
        private var mPivotX:Number;
        private var mPivotY:Number;
        private var mScaleX:Number;
        private var mScaleY:Number;
        private var mSkewX:Number;
        private var mSkewY:Number;
        private var mRotation:Number;
        private var mAlpha:Number;
        private var mVisible:Boolean;
        private var mTouchable:Boolean;
        private var mBlendMode:String;
        private var mName:String;
        private var mUseHandCursor:Boolean;
        private var mParent:DisplayObjectContainer;
        private var mTransformationMatrix:Matrix;
        private var mTransformationMatrix3D:Matrix3D;
        private var mOrientationChanged:Boolean;
        private var mFilter:FragmentFilter;
        private var mIs3D:Boolean;
        private var mMask:DisplayObject;
        private var mIsMask:Boolean;
        private static var sAncestors:Vector.<DisplayObject> = new Vector.<DisplayObject>(0);
        private static var sHelperPoint:Point = new Point();
        private static var sHelperPoint3D:Vector3D = new Vector3D();
        private static var sHelperRect:Rectangle = new Rectangle();
        private static var sHelperMatrix:Matrix = new Matrix();
        private static var sHelperMatrixAlt:Matrix = new Matrix();
        private static var sHelperMatrix3D:Matrix3D = new Matrix3D();
        private static var sHelperMatrixAlt3D:Matrix3D = new Matrix3D();

        public function DisplayObject()
        {
            if (Capabilities.isDebugger && getQualifiedClassName(this) == "starling.display::DisplayObject")
            {
                throw new AbstractClassError();
            }
            var _loc_1:* = 0;
            this.mSkewY = 0;
            this.mSkewX = _loc_1;
            this.mRotation = _loc_1;
            this.mPivotY = _loc_1;
            this.mPivotX = _loc_1;
            this.mY = _loc_1;
            this.mX = _loc_1;
            var _loc_1:* = 1;
            this.mAlpha = 1;
            this.mScaleY = _loc_1;
            this.mScaleX = _loc_1;
            var _loc_1:* = true;
            this.mTouchable = true;
            this.mVisible = _loc_1;
            this.mBlendMode = BlendMode.AUTO;
            this.mTransformationMatrix = new Matrix();
            var _loc_1:* = false;
            this.mUseHandCursor = false;
            this.mOrientationChanged = _loc_1;
            return;
        }// end function

        public function dispose() : void
        {
            if (this.mFilter)
            {
                this.mFilter.dispose();
            }
            if (this.mMask)
            {
                this.mMask.dispose();
            }
            this.removeEventListeners();
            this.mask = null;
            return;
        }// end function

        public function removeFromParent(param1:Boolean = false) : void
        {
            if (this.mParent)
            {
                this.mParent.removeChild(this, param1);
            }
            else if (param1)
            {
                this.dispose();
            }
            return;
        }// end function

        public function getTransformationMatrix(param1:DisplayObject, param2:Matrix = null) : Matrix
        {
            var _loc_3:* = null;
            var _loc_4:* = null;
            if (param2)
            {
                param2.identity();
            }
            else
            {
                param2 = new Matrix();
            }
            if (param1 == this)
            {
                return param2;
            }
            if (param1 == this.mParent || param1 == null && this.mParent == null)
            {
                param2.copyFrom(this.transformationMatrix);
                return param2;
            }
            if (param1 == null || param1 == this.base)
            {
                _loc_4 = this;
                while (_loc_4 != param1)
                {
                    
                    param2.concat(_loc_4.transformationMatrix);
                    _loc_4 = _loc_4.mParent;
                }
                return param2;
            }
            else if (param1.mParent == this)
            {
                param1.getTransformationMatrix(this, param2);
                param2.invert();
                return param2;
            }
            _loc_3 = this.findCommonParent(this, param1);
            _loc_4 = this;
            while (_loc_4 != _loc_3)
            {
                
                param2.concat(_loc_4.transformationMatrix);
                _loc_4 = _loc_4.mParent;
            }
            if (_loc_3 == param1)
            {
                return param2;
            }
            sHelperMatrix.identity();
            _loc_4 = param1;
            while (_loc_4 != _loc_3)
            {
                
                sHelperMatrix.concat(_loc_4.transformationMatrix);
                _loc_4 = _loc_4.mParent;
            }
            sHelperMatrix.invert();
            param2.concat(sHelperMatrix);
            return param2;
        }// end function

        public function getBounds(param1:DisplayObject, param2:Rectangle = null) : Rectangle
        {
            throw new AbstractMethodError();
        }// end function

        public function hitTest(param1:Point, param2:Boolean = false) : DisplayObject
        {
            if (param2 && (!this.mVisible || !this.mTouchable))
            {
                return null;
            }
            if (this.mMask && !this.hitTestMask(param1))
            {
                return null;
            }
            if (this.getBounds(this, sHelperRect).containsPoint(param1))
            {
                return this;
            }
            return null;
        }// end function

        public function hitTestMask(param1:Point) : Boolean
        {
            if (this.mMask)
            {
                if (this.mMask.stage)
                {
                    this.getTransformationMatrix(this.mMask, sHelperMatrixAlt);
                }
                else
                {
                    sHelperMatrixAlt.copyFrom(this.mMask.transformationMatrix);
                    sHelperMatrixAlt.invert();
                }
                MatrixUtil.transformPoint(sHelperMatrixAlt, param1, sHelperPoint);
                return this.mMask.hitTest(sHelperPoint, true) != null;
            }
            else
            {
                return true;
            }
        }// end function

        public function localToGlobal(param1:Point, param2:Point = null) : Point
        {
            if (this.is3D)
            {
                sHelperPoint3D.setTo(param1.x, param1.y, 0);
                return this.local3DToGlobal(sHelperPoint3D, param2);
            }
            this.getTransformationMatrix(this.base, sHelperMatrixAlt);
            return MatrixUtil.transformPoint(sHelperMatrixAlt, param1, param2);
        }// end function

        public function globalToLocal(param1:Point, param2:Point = null) : Point
        {
            if (this.is3D)
            {
                this.globalToLocal3D(param1, sHelperPoint3D);
                return MathUtil.intersectLineWithXYPlane(this.stage.cameraPosition, sHelperPoint3D, param2);
            }
            this.getTransformationMatrix(this.base, sHelperMatrixAlt);
            sHelperMatrixAlt.invert();
            return MatrixUtil.transformPoint(sHelperMatrixAlt, param1, param2);
        }// end function

        public function render(param1:RenderSupport, param2:Number) : void
        {
            throw new AbstractMethodError();
        }// end function

        public function get hasVisibleArea() : Boolean
        {
            return this.mAlpha != 0 && this.mVisible && !this.mIsMask && this.mScaleX != 0 && this.mScaleY != 0;
        }// end function

        public function alignPivot(param1:String = "center", param2:String = "center") : void
        {
            var _loc_3:* = this.getBounds(this);
            this.mOrientationChanged = true;
            if (param1 == HAlign.LEFT)
            {
                this.mPivotX = _loc_3.x;
            }
            else if (param1 == HAlign.CENTER)
            {
                this.mPivotX = _loc_3.x + _loc_3.width / 2;
            }
            else if (param1 == HAlign.RIGHT)
            {
                this.mPivotX = _loc_3.x + _loc_3.width;
            }
            else
            {
                throw new ArgumentError("Invalid horizontal alignment: " + param1);
            }
            if (param2 == VAlign.TOP)
            {
                this.mPivotY = _loc_3.y;
            }
            else if (param2 == VAlign.CENTER)
            {
                this.mPivotY = _loc_3.y + _loc_3.height / 2;
            }
            else if (param2 == VAlign.BOTTOM)
            {
                this.mPivotY = _loc_3.y + _loc_3.height;
            }
            else
            {
                throw new ArgumentError("Invalid vertical alignment: " + param2);
            }
            return;
        }// end function

        public function getTransformationMatrix3D(param1:DisplayObject, param2:Matrix3D = null) : Matrix3D
        {
            var _loc_3:* = null;
            var _loc_4:* = null;
            if (param2)
            {
                param2.identity();
            }
            else
            {
                param2 = new Matrix3D();
            }
            if (param1 == this)
            {
                return param2;
            }
            if (param1 == this.mParent || param1 == null && this.mParent == null)
            {
                param2.copyFrom(this.transformationMatrix3D);
                return param2;
            }
            if (param1 == null || param1 == this.base)
            {
                _loc_4 = this;
                while (_loc_4 != param1)
                {
                    
                    param2.append(_loc_4.transformationMatrix3D);
                    _loc_4 = _loc_4.mParent;
                }
                return param2;
            }
            else if (param1.mParent == this)
            {
                param1.getTransformationMatrix3D(this, param2);
                param2.invert();
                return param2;
            }
            _loc_3 = this.findCommonParent(this, param1);
            _loc_4 = this;
            while (_loc_4 != _loc_3)
            {
                
                param2.append(_loc_4.transformationMatrix3D);
                _loc_4 = _loc_4.mParent;
            }
            if (_loc_3 == param1)
            {
                return param2;
            }
            sHelperMatrix3D.identity();
            _loc_4 = param1;
            while (_loc_4 != _loc_3)
            {
                
                sHelperMatrix3D.append(_loc_4.transformationMatrix3D);
                _loc_4 = _loc_4.mParent;
            }
            sHelperMatrix3D.invert();
            param2.append(sHelperMatrix3D);
            return param2;
        }// end function

        public function local3DToGlobal(param1:Vector3D, param2:Point = null) : Point
        {
            var _loc_3:* = this.stage;
            if (_loc_3 == null)
            {
                throw new IllegalOperationError("Object not connected to stage");
            }
            this.getTransformationMatrix3D(_loc_3, sHelperMatrixAlt3D);
            MatrixUtil.transformPoint3D(sHelperMatrixAlt3D, param1, sHelperPoint3D);
            return MathUtil.intersectLineWithXYPlane(_loc_3.cameraPosition, sHelperPoint3D, param2);
        }// end function

        public function globalToLocal3D(param1:Point, param2:Vector3D = null) : Vector3D
        {
            var _loc_3:* = this.stage;
            if (_loc_3 == null)
            {
                throw new IllegalOperationError("Object not connected to stage");
            }
            this.getTransformationMatrix3D(_loc_3, sHelperMatrixAlt3D);
            sHelperMatrixAlt3D.invert();
            return MatrixUtil.transformCoords3D(sHelperMatrixAlt3D, param1.x, param1.y, 0, param2);
        }// end function

        function setParent(param1:DisplayObjectContainer) : void
        {
            var _loc_2:* = param1;
            while (_loc_2 != this && _loc_2 != null)
            {
                
                _loc_2 = _loc_2.mParent;
            }
            if (_loc_2 == this)
            {
                throw new ArgumentError("An object cannot be added as a child to itself or one " + "of its children (or children\'s children, etc.)");
            }
            this.mParent = param1;
            return;
        }// end function

        function setIs3D(param1:Boolean) : void
        {
            this.mIs3D = param1;
            return;
        }// end function

        function get isMask() : Boolean
        {
            return this.mIsMask;
        }// end function

        final private function isEquivalent(param1:Number, param2:Number, param3:Number = 0.0001) : Boolean
        {
            return param1 - param3 < param2 && param1 + param3 > param2;
        }// end function

        final private function findCommonParent(param1:DisplayObject, param2:DisplayObject) : DisplayObject
        {
            var _loc_3:* = param1;
            while (_loc_3)
            {
                
                sAncestors[sAncestors.length] = _loc_3;
                _loc_3 = _loc_3.mParent;
            }
            _loc_3 = param2;
            while (_loc_3 && sAncestors.indexOf(_loc_3) == -1)
            {
                
                _loc_3 = _loc_3.mParent;
            }
            sAncestors.length = 0;
            if (_loc_3)
            {
                return _loc_3;
            }
            throw new ArgumentError("Object not connected to target");
        }// end function

        override public function dispatchEvent(event:Event) : void
        {
            if (event.type == Event.REMOVED_FROM_STAGE && this.stage == null)
            {
                return;
            }
            super.dispatchEvent(event);
            return;
        }// end function

        override public function addEventListener(param1:String, param2:Function) : void
        {
            if (param1 == Event.ENTER_FRAME && !hasEventListener(param1))
            {
                this.addEventListener(Event.ADDED_TO_STAGE, this.addEnterFrameListenerToStage);
                this.addEventListener(Event.REMOVED_FROM_STAGE, this.removeEnterFrameListenerFromStage);
                if (this.stage)
                {
                    this.addEnterFrameListenerToStage();
                }
            }
            super.addEventListener(param1, param2);
            return;
        }// end function

        override public function removeEventListener(param1:String, param2:Function) : void
        {
            super.removeEventListener(param1, param2);
            if (param1 == Event.ENTER_FRAME && !hasEventListener(param1))
            {
                this.removeEventListener(Event.ADDED_TO_STAGE, this.addEnterFrameListenerToStage);
                this.removeEventListener(Event.REMOVED_FROM_STAGE, this.removeEnterFrameListenerFromStage);
                this.removeEnterFrameListenerFromStage();
            }
            return;
        }// end function

        override public function removeEventListeners(param1:String = null) : void
        {
            if ((param1 == null || param1 == Event.ENTER_FRAME) && hasEventListener(Event.ENTER_FRAME))
            {
                this.removeEventListener(Event.ADDED_TO_STAGE, this.addEnterFrameListenerToStage);
                this.removeEventListener(Event.REMOVED_FROM_STAGE, this.removeEnterFrameListenerFromStage);
                this.removeEnterFrameListenerFromStage();
            }
            super.removeEventListeners(param1);
            return;
        }// end function

        private function addEnterFrameListenerToStage() : void
        {
            Starling.current.stage.addEnterFrameListener(this);
            return;
        }// end function

        private function removeEnterFrameListenerFromStage() : void
        {
            Starling.current.stage.removeEnterFrameListener(this);
            return;
        }// end function

        public function get transformationMatrix() : Matrix
        {
            var _loc_1:* = NaN;
            var _loc_2:* = NaN;
            var _loc_3:* = NaN;
            var _loc_4:* = NaN;
            var _loc_5:* = NaN;
            var _loc_6:* = NaN;
            var _loc_7:* = NaN;
            var _loc_8:* = NaN;
            if (this.mOrientationChanged)
            {
                this.mOrientationChanged = false;
                if (this.mSkewX == 0 && this.mSkewY == 0)
                {
                    if (this.mRotation == 0)
                    {
                        this.mTransformationMatrix.setTo(this.mScaleX, 0, 0, this.mScaleY, this.mX - this.mPivotX * this.mScaleX, this.mY - this.mPivotY * this.mScaleY);
                    }
                    else
                    {
                        _loc_1 = Math.cos(this.mRotation);
                        _loc_2 = Math.sin(this.mRotation);
                        _loc_3 = this.mScaleX * _loc_1;
                        _loc_4 = this.mScaleX * _loc_2;
                        _loc_5 = this.mScaleY * (-_loc_2);
                        _loc_6 = this.mScaleY * _loc_1;
                        _loc_7 = this.mX - this.mPivotX * _loc_3 - this.mPivotY * _loc_5;
                        _loc_8 = this.mY - this.mPivotX * _loc_4 - this.mPivotY * _loc_6;
                        this.mTransformationMatrix.setTo(_loc_3, _loc_4, _loc_5, _loc_6, _loc_7, _loc_8);
                    }
                }
                else
                {
                    this.mTransformationMatrix.identity();
                    this.mTransformationMatrix.scale(this.mScaleX, this.mScaleY);
                    MatrixUtil.skew(this.mTransformationMatrix, this.mSkewX, this.mSkewY);
                    this.mTransformationMatrix.rotate(this.mRotation);
                    this.mTransformationMatrix.translate(this.mX, this.mY);
                    if (this.mPivotX != 0 || this.mPivotY != 0)
                    {
                        this.mTransformationMatrix.tx = this.mX - this.mTransformationMatrix.a * this.mPivotX - this.mTransformationMatrix.c * this.mPivotY;
                        this.mTransformationMatrix.ty = this.mY - this.mTransformationMatrix.b * this.mPivotX - this.mTransformationMatrix.d * this.mPivotY;
                    }
                }
            }
            return this.mTransformationMatrix;
        }// end function

        public function set transformationMatrix(param1:Matrix) : void
        {
            var _loc_2:* = Math.PI / 4;
            this.mOrientationChanged = false;
            this.mTransformationMatrix.copyFrom(param1);
            var _loc_3:* = 0;
            this.mPivotY = 0;
            this.mPivotX = _loc_3;
            this.mX = param1.tx;
            this.mY = param1.ty;
            this.mSkewX = Math.atan((-param1.c) / param1.d);
            this.mSkewY = Math.atan(param1.b / param1.a);
            if (this.mSkewX != this.mSkewX)
            {
                this.mSkewX = 0;
            }
            if (this.mSkewY != this.mSkewY)
            {
                this.mSkewY = 0;
            }
            this.mScaleY = this.mSkewX > -_loc_2 && this.mSkewX < _loc_2 ? (param1.d / Math.cos(this.mSkewX)) : ((-param1.c) / Math.sin(this.mSkewX));
            this.mScaleX = this.mSkewY > -_loc_2 && this.mSkewY < _loc_2 ? (param1.a / Math.cos(this.mSkewY)) : (param1.b / Math.sin(this.mSkewY));
            if (this.isEquivalent(this.mSkewX, this.mSkewY))
            {
                this.mRotation = this.mSkewX;
                var _loc_3:* = 0;
                this.mSkewY = 0;
                this.mSkewX = _loc_3;
            }
            else
            {
                this.mRotation = 0;
            }
            return;
        }// end function

        public function get transformationMatrix3D() : Matrix3D
        {
            if (this.mTransformationMatrix3D == null)
            {
                this.mTransformationMatrix3D = new Matrix3D();
            }
            return MatrixUtil.convertTo3D(this.transformationMatrix, this.mTransformationMatrix3D);
        }// end function

        public function get is3D() : Boolean
        {
            return this.mIs3D;
        }// end function

        public function get useHandCursor() : Boolean
        {
            return this.mUseHandCursor;
        }// end function

        public function set useHandCursor(param1:Boolean) : void
        {
            if (param1 == this.mUseHandCursor)
            {
                return;
            }
            this.mUseHandCursor = param1;
            if (this.mUseHandCursor)
            {
                this.addEventListener(TouchEvent.TOUCH, this.onTouch);
            }
            else
            {
                this.removeEventListener(TouchEvent.TOUCH, this.onTouch);
            }
            return;
        }// end function

        private function onTouch(event:TouchEvent) : void
        {
            Mouse.cursor = event.interactsWith(this) ? (MouseCursor.BUTTON) : (MouseCursor.AUTO);
            return;
        }// end function

        public function get bounds() : Rectangle
        {
            return this.getBounds(this.mParent);
        }// end function

        public function get width() : Number
        {
            return this.getBounds(this.mParent, sHelperRect).width;
        }// end function

        public function set width(param1:Number) : void
        {
            this.scaleX = 1;
            var _loc_2:* = this.width;
            if (_loc_2 != 0)
            {
                this.scaleX = param1 / _loc_2;
            }
            return;
        }// end function

        public function get height() : Number
        {
            return this.getBounds(this.mParent, sHelperRect).height;
        }// end function

        public function set height(param1:Number) : void
        {
            this.scaleY = 1;
            var _loc_2:* = this.height;
            if (_loc_2 != 0)
            {
                this.scaleY = param1 / _loc_2;
            }
            return;
        }// end function

        public function get x() : Number
        {
            return this.mX;
        }// end function

        public function set x(param1:Number) : void
        {
            if (this.mX != param1)
            {
                this.mX = param1;
                this.mOrientationChanged = true;
            }
            return;
        }// end function

        public function get y() : Number
        {
            return this.mY;
        }// end function

        public function set y(param1:Number) : void
        {
            if (this.mY != param1)
            {
                this.mY = param1;
                this.mOrientationChanged = true;
            }
            return;
        }// end function

        public function get pivotX() : Number
        {
            return this.mPivotX;
        }// end function

        public function set pivotX(param1:Number) : void
        {
            if (this.mPivotX != param1)
            {
                this.mPivotX = param1;
                this.mOrientationChanged = true;
            }
            return;
        }// end function

        public function get pivotY() : Number
        {
            return this.mPivotY;
        }// end function

        public function set pivotY(param1:Number) : void
        {
            if (this.mPivotY != param1)
            {
                this.mPivotY = param1;
                this.mOrientationChanged = true;
            }
            return;
        }// end function

        public function get scaleX() : Number
        {
            return this.mScaleX;
        }// end function

        public function set scaleX(param1:Number) : void
        {
            if (this.mScaleX != param1)
            {
                this.mScaleX = param1;
                this.mOrientationChanged = true;
            }
            return;
        }// end function

        public function get scaleY() : Number
        {
            return this.mScaleY;
        }// end function

        public function set scaleY(param1:Number) : void
        {
            if (this.mScaleY != param1)
            {
                this.mScaleY = param1;
                this.mOrientationChanged = true;
            }
            return;
        }// end function

        public function get skewX() : Number
        {
            return this.mSkewX;
        }// end function

        public function set skewX(param1:Number) : void
        {
            param1 = MathUtil.normalizeAngle(param1);
            if (this.mSkewX != param1)
            {
                this.mSkewX = param1;
                this.mOrientationChanged = true;
            }
            return;
        }// end function

        public function get skewY() : Number
        {
            return this.mSkewY;
        }// end function

        public function set skewY(param1:Number) : void
        {
            param1 = MathUtil.normalizeAngle(param1);
            if (this.mSkewY != param1)
            {
                this.mSkewY = param1;
                this.mOrientationChanged = true;
            }
            return;
        }// end function

        public function get rotation() : Number
        {
            return this.mRotation;
        }// end function

        public function set rotation(param1:Number) : void
        {
            param1 = MathUtil.normalizeAngle(param1);
            if (this.mRotation != param1)
            {
                this.mRotation = param1;
                this.mOrientationChanged = true;
            }
            return;
        }// end function

        public function get alpha() : Number
        {
            return this.mAlpha;
        }// end function

        public function set alpha(param1:Number) : void
        {
            this.mAlpha = param1 < 0 ? (0) : (param1 > 1 ? (1) : (param1));
            return;
        }// end function

        public function get visible() : Boolean
        {
            return this.mVisible;
        }// end function

        public function set visible(param1:Boolean) : void
        {
            this.mVisible = param1;
            return;
        }// end function

        public function get touchable() : Boolean
        {
            return this.mTouchable;
        }// end function

        public function set touchable(param1:Boolean) : void
        {
            this.mTouchable = param1;
            return;
        }// end function

        public function get blendMode() : String
        {
            return this.mBlendMode;
        }// end function

        public function set blendMode(param1:String) : void
        {
            this.mBlendMode = param1;
            return;
        }// end function

        public function get name() : String
        {
            return this.mName;
        }// end function

        public function set name(param1:String) : void
        {
            this.mName = param1;
            return;
        }// end function

        public function get filter() : FragmentFilter
        {
            return this.mFilter;
        }// end function

        public function set filter(param1:FragmentFilter) : void
        {
            this.mFilter = param1;
            return;
        }// end function

        public function get mask() : DisplayObject
        {
            return this.mMask;
        }// end function

        public function set mask(param1:DisplayObject) : void
        {
            if (this.mMask != param1)
            {
                if (this.mMask)
                {
                    this.mMask.mIsMask = false;
                }
                if (param1)
                {
                    param1.mIsMask = true;
                }
                this.mMask = param1;
            }
            return;
        }// end function

        public function get parent() : DisplayObjectContainer
        {
            return this.mParent;
        }// end function

        public function get base() : DisplayObject
        {
            var _loc_1:* = this;
            while (_loc_1.mParent)
            {
                
                _loc_1 = _loc_1.mParent;
            }
            return _loc_1;
        }// end function

        public function get root() : DisplayObject
        {
            var _loc_1:* = this;
            while (_loc_1.mParent)
            {
                
                if (_loc_1.mParent is Stage)
                {
                    return _loc_1;
                }
                _loc_1 = _loc_1.parent;
            }
            return null;
        }// end function

        public function get stage() : Stage
        {
            return this.base as Stage;
        }// end function

    }
}
