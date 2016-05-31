package starling.display
{
    import flash.geom.*;
    import starling.core.*;
    import starling.utils.*;

    public class Quad extends DisplayObject
    {
        private var mTinted:Boolean;
        protected var mVertexData:VertexData;
        private static var sHelperPoint:Point = new Point();
        private static var sHelperPoint3D:Vector3D = new Vector3D();
        private static var sHelperMatrix:Matrix = new Matrix();
        private static var sHelperMatrix3D:Matrix3D = new Matrix3D();

        public function Quad(param1:Number, param2:Number, param3:uint = 16777215, param4:Boolean = true)
        {
            if (param1 == 0 || param2 == 0)
            {
                throw new ArgumentError("Invalid size: width and height must not be zero");
            }
            this.mTinted = param3 != 16777215;
            this.mVertexData = new VertexData(4, param4);
            this.mVertexData.setPosition(0, 0, 0);
            this.mVertexData.setPosition(1, param1, 0);
            this.mVertexData.setPosition(2, 0, param2);
            this.mVertexData.setPosition(3, param1, param2);
            this.mVertexData.setUniformColor(param3);
            this.onVertexDataChanged();
            return;
        }// end function

        protected function onVertexDataChanged() : void
        {
            return;
        }// end function

        override public function getBounds(param1:DisplayObject, param2:Rectangle = null) : Rectangle
        {
            var _loc_3:* = NaN;
            var _loc_4:* = NaN;
            if (param2 == null)
            {
                param2 = new Rectangle();
            }
            if (param1 == this)
            {
                this.mVertexData.getPosition(3, sHelperPoint);
                param2.setTo(0, 0, sHelperPoint.x, sHelperPoint.y);
            }
            else if (param1 == parent && rotation == 0)
            {
                _loc_3 = this.scaleX;
                _loc_4 = this.scaleY;
                this.mVertexData.getPosition(3, sHelperPoint);
                param2.setTo(x - pivotX * _loc_3, y - pivotY * _loc_4, sHelperPoint.x * _loc_3, sHelperPoint.y * _loc_4);
                if (_loc_3 < 0)
                {
                    param2.width = param2.width * -1;
                    param2.x = param2.x - param2.width;
                }
                if (_loc_4 < 0)
                {
                    param2.height = param2.height * -1;
                    param2.y = param2.y - param2.height;
                }
            }
            else if (is3D && stage)
            {
                stage.getCameraPosition(param1, sHelperPoint3D);
                getTransformationMatrix3D(param1, sHelperMatrix3D);
                this.mVertexData.getBoundsProjected(sHelperMatrix3D, sHelperPoint3D, 0, 4, param2);
            }
            else
            {
                getTransformationMatrix(param1, sHelperMatrix);
                this.mVertexData.getBounds(sHelperMatrix, 0, 4, param2);
            }
            return param2;
        }// end function

        public function getVertexColor(param1:int) : uint
        {
            return this.mVertexData.getColor(param1);
        }// end function

        public function setVertexColor(param1:int, param2:uint) : void
        {
            this.mVertexData.setColor(param1, param2);
            this.onVertexDataChanged();
            if (param2 != 16777215)
            {
                this.mTinted = true;
            }
            else
            {
                this.mTinted = this.mVertexData.tinted;
            }
            return;
        }// end function

        public function getVertexAlpha(param1:int) : Number
        {
            return this.mVertexData.getAlpha(param1);
        }// end function

        public function setVertexAlpha(param1:int, param2:Number) : void
        {
            this.mVertexData.setAlpha(param1, param2);
            this.onVertexDataChanged();
            if (param2 != 1)
            {
                this.mTinted = true;
            }
            else
            {
                this.mTinted = this.mVertexData.tinted;
            }
            return;
        }// end function

        public function get color() : uint
        {
            return this.mVertexData.getColor(0);
        }// end function

        public function set color(param1:uint) : void
        {
            this.mVertexData.setUniformColor(param1);
            this.onVertexDataChanged();
            if (param1 != 16777215 || alpha != 1)
            {
                this.mTinted = true;
            }
            else
            {
                this.mTinted = this.mVertexData.tinted;
            }
            return;
        }// end function

        override public function set alpha(param1:Number) : void
        {
            super.alpha = param1;
            if (param1 < 1)
            {
                this.mTinted = true;
            }
            else
            {
                this.mTinted = this.mVertexData.tinted;
            }
            return;
        }// end function

        public function copyVertexDataTo(param1:VertexData, param2:int = 0) : void
        {
            this.mVertexData.copyTo(param1, param2);
            return;
        }// end function

        public function copyVertexDataTransformedTo(param1:VertexData, param2:int = 0, param3:Matrix = null) : void
        {
            this.mVertexData.copyTransformedTo(param1, param2, param3, 0, 4);
            return;
        }// end function

        override public function render(param1:RenderSupport, param2:Number) : void
        {
            param1.batchQuad(this, param2);
            return;
        }// end function

        public function get tinted() : Boolean
        {
            return this.mTinted;
        }// end function

        public function get premultipliedAlpha() : Boolean
        {
            return this.mVertexData.premultipliedAlpha;
        }// end function

    }
}
