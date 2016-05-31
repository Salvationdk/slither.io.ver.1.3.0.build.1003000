package starling.display
{
    import __AS3__.vec.*;
    import flash.display.*;
    import flash.errors.*;
    import flash.geom.*;
    import starling.core.*;
    import starling.events.*;
    import starling.filters.*;
    import starling.utils.*;

    public class Stage extends DisplayObjectContainer
    {
        private var mWidth:int;
        private var mHeight:int;
        private var mColor:uint;
        private var mFieldOfView:Number;
        private var mProjectionOffset:Point;
        private var mCameraPosition:Vector3D;
        private var mEnterFrameEvent:EnterFrameEvent;
        private var mEnterFrameListeners:Vector.<DisplayObject>;
        private static var sHelperMatrix:Matrix3D = new Matrix3D();

        public function Stage(param1:int, param2:int, param3:uint = 0)
        {
            this.mWidth = param1;
            this.mHeight = param2;
            this.mColor = param3;
            this.mFieldOfView = 1;
            this.mProjectionOffset = new Point();
            this.mCameraPosition = new Vector3D();
            this.mEnterFrameEvent = new EnterFrameEvent(Event.ENTER_FRAME, 0);
            this.mEnterFrameListeners = new Vector.<DisplayObject>(0);
            return;
        }// end function

        public function advanceTime(param1:Number) : void
        {
            this.mEnterFrameEvent.reset(Event.ENTER_FRAME, false, param1);
            broadcastEvent(this.mEnterFrameEvent);
            return;
        }// end function

        override public function hitTest(param1:Point, param2:Boolean = false) : DisplayObject
        {
            if (param2 && (!visible || !touchable))
            {
                return null;
            }
            if (param1.x < 0 || param1.x > this.mWidth || param1.y < 0 || param1.y > this.mHeight)
            {
                return null;
            }
            var _loc_3:* = super.hitTest(param1, param2);
            if (_loc_3 == null)
            {
                _loc_3 = this;
            }
            return _loc_3;
        }// end function

        public function drawToBitmapData(param1:BitmapData = null, param2:Boolean = true) : BitmapData
        {
            var _loc_5:* = 0;
            var _loc_6:* = 0;
            var _loc_3:* = new RenderSupport();
            var _loc_4:* = Starling.current;
            if (param1 == null)
            {
                _loc_5 = _loc_4.backBufferWidth * _loc_4.backBufferPixelsPerPoint;
                _loc_6 = _loc_4.backBufferHeight * _loc_4.backBufferPixelsPerPoint;
                param1 = new BitmapData(_loc_5, _loc_6, param2);
            }
            _loc_3.renderTarget = null;
            _loc_3.setProjectionMatrix(0, 0, this.mWidth, this.mHeight, this.mWidth, this.mHeight, this.cameraPosition);
            if (param2)
            {
                _loc_3.clear();
            }
            else
            {
                _loc_3.clear(this.mColor, 1);
            }
            render(_loc_3, 1);
            _loc_3.finishQuadBatch();
            _loc_3.dispose();
            _loc_4.context.drawToBitmapData(param1);
            _loc_4.context.present();
            return param1;
        }// end function

        public function getCameraPosition(param1:DisplayObject = null, param2:Vector3D = null) : Vector3D
        {
            getTransformationMatrix3D(param1, sHelperMatrix);
            return MatrixUtil.transformCoords3D(sHelperMatrix, this.mWidth / 2 + this.mProjectionOffset.x, this.mHeight / 2 + this.mProjectionOffset.y, -this.focalLength, param2);
        }// end function

        function addEnterFrameListener(param1:DisplayObject) : void
        {
            this.mEnterFrameListeners.push(param1);
            return;
        }// end function

        function removeEnterFrameListener(param1:DisplayObject) : void
        {
            var _loc_2:* = this.mEnterFrameListeners.indexOf(param1);
            if (_loc_2 >= 0)
            {
                this.mEnterFrameListeners.splice(_loc_2, 1);
            }
            return;
        }// end function

        public function getChildEventListeners(param1:DisplayObject, param2:String, param3:Vector.<DisplayObject>) : void
        {
            var _loc_4:* = 0;
            var _loc_5:* = 0;
            if (param2 == Event.ENTER_FRAME && param1 == this)
            {
                _loc_4 = 0;
                _loc_5 = this.mEnterFrameListeners.length;
                while (_loc_4 < _loc_5)
                {
                    
                    param3[param3.length] = this.mEnterFrameListeners[_loc_4];
                    _loc_4++;
                }
            }
            else
            {
                super.getChildEventListeners(param1, param2, param3);
            }
            return;
        }// end function

        override public function set width(param1:Number) : void
        {
            throw new IllegalOperationError("Cannot set width of stage");
        }// end function

        override public function set height(param1:Number) : void
        {
            throw new IllegalOperationError("Cannot set height of stage");
        }// end function

        override public function set x(param1:Number) : void
        {
            throw new IllegalOperationError("Cannot set x-coordinate of stage");
        }// end function

        override public function set y(param1:Number) : void
        {
            throw new IllegalOperationError("Cannot set y-coordinate of stage");
        }// end function

        override public function set scaleX(param1:Number) : void
        {
            throw new IllegalOperationError("Cannot scale stage");
        }// end function

        override public function set scaleY(param1:Number) : void
        {
            throw new IllegalOperationError("Cannot scale stage");
        }// end function

        override public function set rotation(param1:Number) : void
        {
            throw new IllegalOperationError("Cannot rotate stage");
        }// end function

        override public function set skewX(param1:Number) : void
        {
            throw new IllegalOperationError("Cannot skew stage");
        }// end function

        override public function set skewY(param1:Number) : void
        {
            throw new IllegalOperationError("Cannot skew stage");
        }// end function

        override public function set filter(param1:FragmentFilter) : void
        {
            throw new IllegalOperationError("Cannot add filter to stage. Add it to \'root\' instead!");
        }// end function

        public function get color() : uint
        {
            return this.mColor;
        }// end function

        public function set color(param1:uint) : void
        {
            this.mColor = param1;
            return;
        }// end function

        public function get stageWidth() : int
        {
            return this.mWidth;
        }// end function

        public function set stageWidth(param1:int) : void
        {
            this.mWidth = param1;
            return;
        }// end function

        public function get stageHeight() : int
        {
            return this.mHeight;
        }// end function

        public function set stageHeight(param1:int) : void
        {
            this.mHeight = param1;
            return;
        }// end function

        public function get focalLength() : Number
        {
            return this.mWidth / (2 * Math.tan(this.mFieldOfView / 2));
        }// end function

        public function set focalLength(param1:Number) : void
        {
            this.mFieldOfView = 2 * Math.atan(this.stageWidth / (2 * param1));
            return;
        }// end function

        public function get fieldOfView() : Number
        {
            return this.mFieldOfView;
        }// end function

        public function set fieldOfView(param1:Number) : void
        {
            this.mFieldOfView = param1;
            return;
        }// end function

        public function get projectionOffset() : Point
        {
            return this.mProjectionOffset;
        }// end function

        public function set projectionOffset(param1:Point) : void
        {
            this.mProjectionOffset.setTo(param1.x, param1.y);
            return;
        }// end function

        public function get cameraPosition() : Vector3D
        {
            return this.getCameraPosition(null, this.mCameraPosition);
        }// end function

    }
}
