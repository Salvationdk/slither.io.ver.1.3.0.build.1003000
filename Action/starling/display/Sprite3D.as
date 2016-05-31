package starling.display
{
    import flash.geom.*;
    import starling.core.*;
    import starling.events.*;
    import starling.utils.*;

    public class Sprite3D extends DisplayObjectContainer
    {
        private var mRotationX:Number;
        private var mRotationY:Number;
        private var mScaleZ:Number;
        private var mPivotZ:Number;
        private var mZ:Number;
        private var mTransformationMatrix:Matrix;
        private var mTransformationMatrix3D:Matrix3D;
        private var mTransformationChanged:Boolean;
        private static const E:Number = 1e-005;
        private static var sHelperPoint:Vector3D = new Vector3D();
        private static var sHelperPointAlt:Vector3D = new Vector3D();
        private static var sHelperMatrix:Matrix3D = new Matrix3D();

        public function Sprite3D()
        {
            this.mScaleZ = 1;
            var _loc_1:* = 0;
            this.mZ = 0;
            this.mPivotZ = _loc_1;
            this.mRotationY = _loc_1;
            this.mRotationX = _loc_1;
            this.mTransformationMatrix = new Matrix();
            this.mTransformationMatrix3D = new Matrix3D();
            setIs3D(true);
            addEventListener(Event.ADDED, this.onAddedChild);
            addEventListener(Event.REMOVED, this.onRemovedChild);
            return;
        }// end function

        override public function render(param1:RenderSupport, param2:Number) : void
        {
            if (this.is2D)
            {
                super.render(param1, param2);
            }
            else
            {
                param1.finishQuadBatch();
                param1.pushMatrix3D();
                param1.transformMatrix3D(this);
                super.render(param1, param2);
                param1.finishQuadBatch();
                param1.popMatrix3D();
            }
            return;
        }// end function

        override public function hitTest(param1:Point, param2:Boolean = false) : DisplayObject
        {
            if (this.is2D)
            {
                return super.hitTest(param1, param2);
            }
            if (param2 && (!visible || !touchable))
            {
                return null;
            }
            sHelperMatrix.copyFrom(this.transformationMatrix3D);
            sHelperMatrix.invert();
            stage.getCameraPosition(this, sHelperPoint);
            MatrixUtil.transformCoords3D(sHelperMatrix, param1.x, param1.y, 0, sHelperPointAlt);
            MathUtil.intersectLineWithXYPlane(sHelperPoint, sHelperPointAlt, param1);
            return super.hitTest(param1, param2);
        }// end function

        private function onAddedChild(event:Event) : void
        {
            this.recursivelySetIs3D(event.target as DisplayObject, true);
            return;
        }// end function

        private function onRemovedChild(event:Event) : void
        {
            this.recursivelySetIs3D(event.target as DisplayObject, false);
            return;
        }// end function

        private function recursivelySetIs3D(param1:DisplayObject, param2:Boolean) : void
        {
            var _loc_3:* = null;
            var _loc_4:* = 0;
            var _loc_5:* = 0;
            if (param1 is Sprite3D)
            {
                return;
            }
            if (param1 is DisplayObjectContainer)
            {
                _loc_3 = param1 as DisplayObjectContainer;
                _loc_4 = _loc_3.numChildren;
                _loc_5 = 0;
                while (_loc_5 < _loc_4)
                {
                    
                    this.recursivelySetIs3D(_loc_3.getChildAt(_loc_5), param2);
                    _loc_5++;
                }
            }
            param1.setIs3D(param2);
            return;
        }// end function

        private function updateMatrices() : void
        {
            var _loc_1:* = this.x;
            var _loc_2:* = this.y;
            var _loc_3:* = this.scaleX;
            var _loc_4:* = this.scaleY;
            var _loc_5:* = this.pivotX;
            var _loc_6:* = this.pivotY;
            var _loc_7:* = this.rotation;
            this.mTransformationMatrix3D.identity();
            if (_loc_3 != 1 || _loc_4 != 1 || this.mScaleZ != 1)
            {
                this.mTransformationMatrix3D.appendScale(_loc_3 || E, _loc_4 || E, this.mScaleZ || E);
            }
            if (this.mRotationX != 0)
            {
                this.mTransformationMatrix3D.appendRotation(rad2deg(this.mRotationX), Vector3D.X_AXIS);
            }
            if (this.mRotationY != 0)
            {
                this.mTransformationMatrix3D.appendRotation(rad2deg(this.mRotationY), Vector3D.Y_AXIS);
            }
            if (_loc_7 != 0)
            {
                this.mTransformationMatrix3D.appendRotation(rad2deg(_loc_7), Vector3D.Z_AXIS);
            }
            if (_loc_1 != 0 || _loc_2 != 0 || this.mZ != 0)
            {
                this.mTransformationMatrix3D.appendTranslation(_loc_1, _loc_2, this.mZ);
            }
            if (_loc_5 != 0 || _loc_6 != 0 || this.mPivotZ != 0)
            {
                this.mTransformationMatrix3D.prependTranslation(-_loc_5, -_loc_6, -this.mPivotZ);
            }
            if (this.is2D)
            {
                MatrixUtil.convertTo2D(this.mTransformationMatrix3D, this.mTransformationMatrix);
            }
            else
            {
                this.mTransformationMatrix.identity();
            }
            return;
        }// end function

        final private function get is2D() : Boolean
        {
            return this.mZ > -E && this.mZ < E && this.mRotationX > -E && this.mRotationX < E && this.mRotationY > -E && this.mRotationY < E && this.mPivotZ > -E && this.mPivotZ < E;
        }// end function

        override public function get transformationMatrix() : Matrix
        {
            if (this.mTransformationChanged)
            {
                this.updateMatrices();
                this.mTransformationChanged = false;
            }
            return this.mTransformationMatrix;
        }// end function

        override public function set transformationMatrix(param1:Matrix) : void
        {
            super.transformationMatrix = param1;
            var _loc_2:* = 0;
            this.mZ = 0;
            this.mPivotZ = _loc_2;
            this.mRotationY = _loc_2;
            this.mRotationX = _loc_2;
            this.mTransformationChanged = true;
            return;
        }// end function

        override public function get transformationMatrix3D() : Matrix3D
        {
            if (this.mTransformationChanged)
            {
                this.updateMatrices();
                this.mTransformationChanged = false;
            }
            return this.mTransformationMatrix3D;
        }// end function

        override public function set x(param1:Number) : void
        {
            super.x = param1;
            this.mTransformationChanged = true;
            return;
        }// end function

        override public function set y(param1:Number) : void
        {
            super.y = param1;
            this.mTransformationChanged = true;
            return;
        }// end function

        public function get z() : Number
        {
            return this.mZ;
        }// end function

        public function set z(param1:Number) : void
        {
            this.mZ = param1;
            this.mTransformationChanged = true;
            return;
        }// end function

        override public function set pivotX(param1:Number) : void
        {
            super.pivotX = param1;
            this.mTransformationChanged = true;
            return;
        }// end function

        override public function set pivotY(param1:Number) : void
        {
            super.pivotY = param1;
            this.mTransformationChanged = true;
            return;
        }// end function

        public function get pivotZ() : Number
        {
            return this.mPivotZ;
        }// end function

        public function set pivotZ(param1:Number) : void
        {
            this.mPivotZ = param1;
            this.mTransformationChanged = true;
            return;
        }// end function

        override public function set scaleX(param1:Number) : void
        {
            super.scaleX = param1;
            this.mTransformationChanged = true;
            return;
        }// end function

        override public function set scaleY(param1:Number) : void
        {
            super.scaleY = param1;
            this.mTransformationChanged = true;
            return;
        }// end function

        public function get scaleZ() : Number
        {
            return this.mScaleZ;
        }// end function

        public function set scaleZ(param1:Number) : void
        {
            this.mScaleZ = param1;
            this.mTransformationChanged = true;
            return;
        }// end function

        override public function set skewX(param1:Number) : void
        {
            throw new Error("3D objects do not support skewing");
        }// end function

        override public function set skewY(param1:Number) : void
        {
            throw new Error("3D objects do not support skewing");
        }// end function

        override public function set rotation(param1:Number) : void
        {
            super.rotation = param1;
            this.mTransformationChanged = true;
            return;
        }// end function

        public function get rotationX() : Number
        {
            return this.mRotationX;
        }// end function

        public function set rotationX(param1:Number) : void
        {
            this.mRotationX = MathUtil.normalizeAngle(param1);
            this.mTransformationChanged = true;
            return;
        }// end function

        public function get rotationY() : Number
        {
            return this.mRotationY;
        }// end function

        public function set rotationY(param1:Number) : void
        {
            this.mRotationY = MathUtil.normalizeAngle(param1);
            this.mTransformationChanged = true;
            return;
        }// end function

        public function get rotationZ() : Number
        {
            return rotation;
        }// end function

        public function set rotationZ(param1:Number) : void
        {
            this.rotation = param1;
            return;
        }// end function

    }
}
