package starling.display
{
    import __AS3__.vec.*;
    import flash.geom.*;
    import starling.core.*;
    import starling.events.*;
    import starling.utils.*;

    public class Sprite extends DisplayObjectContainer
    {
        private var mFlattenedContents:Vector.<QuadBatch>;
        private var mFlattenRequested:Boolean;
        private var mFlattenOptimized:Boolean;
        private var mClipRect:Rectangle;
        private static var sHelperMatrix:Matrix = new Matrix();
        private static var sHelperPoint:Point = new Point();
        private static var sHelperRect:Rectangle = new Rectangle();

        public function Sprite()
        {
            return;
        }// end function

        override public function dispose() : void
        {
            this.disposeFlattenedContents();
            super.dispose();
            return;
        }// end function

        private function disposeFlattenedContents() : void
        {
            var _loc_1:* = 0;
            var _loc_2:* = 0;
            if (this.mFlattenedContents)
            {
                _loc_1 = 0;
                _loc_2 = this.mFlattenedContents.length;
                while (_loc_1 < _loc_2)
                {
                    
                    this.mFlattenedContents[_loc_1].dispose();
                    _loc_1++;
                }
                this.mFlattenedContents = null;
            }
            return;
        }// end function

        public function flatten(param1:Boolean = false) : void
        {
            this.mFlattenRequested = true;
            this.mFlattenOptimized = param1;
            broadcastEventWith(Event.FLATTEN);
            return;
        }// end function

        public function unflatten() : void
        {
            this.mFlattenRequested = false;
            this.disposeFlattenedContents();
            return;
        }// end function

        public function get isFlattened() : Boolean
        {
            return this.mFlattenedContents != null || this.mFlattenRequested;
        }// end function

        public function get clipRect() : Rectangle
        {
            return this.mClipRect;
        }// end function

        public function set clipRect(param1:Rectangle) : void
        {
            if (this.mClipRect && param1)
            {
                this.mClipRect.copyFrom(param1);
            }
            else
            {
                this.mClipRect = param1 ? (param1.clone()) : (null);
            }
            return;
        }// end function

        public function getClipRect(param1:DisplayObject, param2:Rectangle = null) : Rectangle
        {
            var _loc_3:* = NaN;
            var _loc_4:* = NaN;
            var _loc_11:* = null;
            if (this.mClipRect == null)
            {
                return null;
            }
            if (param2 == null)
            {
                param2 = new Rectangle();
            }
            var _loc_5:* = Number.MAX_VALUE;
            var _loc_6:* = -Number.MAX_VALUE;
            var _loc_7:* = Number.MAX_VALUE;
            var _loc_8:* = -Number.MAX_VALUE;
            var _loc_9:* = getTransformationMatrix(param1, sHelperMatrix);
            var _loc_10:* = 0;
            while (_loc_10 < 4)
            {
                
                switch(_loc_10)
                {
                    case 0:
                    {
                        _loc_3 = this.mClipRect.left;
                        _loc_4 = this.mClipRect.top;
                        break;
                    }
                    case 1:
                    {
                        _loc_3 = this.mClipRect.left;
                        _loc_4 = this.mClipRect.bottom;
                        break;
                    }
                    case 2:
                    {
                        _loc_3 = this.mClipRect.right;
                        _loc_4 = this.mClipRect.top;
                        break;
                    }
                    case 3:
                    {
                        _loc_3 = this.mClipRect.right;
                        _loc_4 = this.mClipRect.bottom;
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }
                _loc_11 = MatrixUtil.transformCoords(_loc_9, _loc_3, _loc_4, sHelperPoint);
                if (_loc_5 > _loc_11.x)
                {
                    _loc_5 = _loc_11.x;
                }
                if (_loc_6 < _loc_11.x)
                {
                    _loc_6 = _loc_11.x;
                }
                if (_loc_7 > _loc_11.y)
                {
                    _loc_7 = _loc_11.y;
                }
                if (_loc_8 < _loc_11.y)
                {
                    _loc_8 = _loc_11.y;
                }
                _loc_10++;
            }
            param2.setTo(_loc_5, _loc_7, _loc_6 - _loc_5, _loc_8 - _loc_7);
            return param2;
        }// end function

        override public function getBounds(param1:DisplayObject, param2:Rectangle = null) : Rectangle
        {
            var _loc_3:* = super.getBounds(param1, param2);
            if (this.mClipRect)
            {
                RectangleUtil.intersect(_loc_3, this.getClipRect(param1, sHelperRect), _loc_3);
            }
            return _loc_3;
        }// end function

        override public function hitTest(param1:Point, param2:Boolean = false) : DisplayObject
        {
            if (this.mClipRect != null && !this.mClipRect.containsPoint(param1))
            {
                return null;
            }
            return super.hitTest(param1, param2);
        }// end function

        override public function render(param1:RenderSupport, param2:Number) : void
        {
            var _loc_3:* = null;
            var _loc_4:* = NaN;
            var _loc_5:* = 0;
            var _loc_6:* = null;
            var _loc_7:* = 0;
            var _loc_8:* = null;
            var _loc_9:* = null;
            if (this.mClipRect)
            {
                _loc_3 = param1.pushClipRect(this.getClipRect(stage, sHelperRect));
                if (_loc_3.isEmpty())
                {
                    param1.popClipRect();
                    return;
                }
            }
            if (this.mFlattenedContents || this.mFlattenRequested)
            {
                if (this.mFlattenedContents == null)
                {
                    this.mFlattenedContents = new Vector.<QuadBatch>(0);
                }
                if (this.mFlattenRequested)
                {
                    QuadBatch.compile(this, this.mFlattenedContents);
                    if (this.mFlattenOptimized)
                    {
                        QuadBatch.optimize(this.mFlattenedContents);
                    }
                    param1.applyClipRect();
                    this.mFlattenRequested = false;
                }
                _loc_4 = param2 * this.alpha;
                _loc_5 = this.mFlattenedContents.length;
                _loc_6 = param1.mvpMatrix3D;
                param1.finishQuadBatch();
                param1.raiseDrawCount(_loc_5);
                _loc_7 = 0;
                while (_loc_7 < _loc_5)
                {
                    
                    _loc_8 = this.mFlattenedContents[_loc_7];
                    _loc_9 = _loc_8.blendMode == BlendMode.AUTO ? (param1.blendMode) : (_loc_8.blendMode);
                    _loc_8.renderCustom(_loc_6, _loc_4, _loc_9);
                    _loc_7++;
                }
            }
            else
            {
                super.render(param1, param2);
            }
            if (this.mClipRect)
            {
                param1.popClipRect();
            }
            return;
        }// end function

    }
}
