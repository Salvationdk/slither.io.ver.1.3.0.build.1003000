package starling.display
{
    import __AS3__.vec.*;
    import flash.geom.*;
    import flash.system.*;
    import flash.utils.*;
    import starling.core.*;
    import starling.errors.*;
    import starling.events.*;
    import starling.filters.*;
    import starling.utils.*;

    public class DisplayObjectContainer extends DisplayObject
    {
        private var mChildren:Vector.<DisplayObject>;
        private var mTouchGroup:Boolean;
        private static var sHelperMatrix:Matrix = new Matrix();
        private static var sHelperPoint:Point = new Point();
        private static var sBroadcastListeners:Vector.<DisplayObject> = new Vector.<DisplayObject>(0);
        private static var sSortBuffer:Vector.<DisplayObject> = new Vector.<DisplayObject>(0);

        public function DisplayObjectContainer()
        {
            if (Capabilities.isDebugger && getQualifiedClassName(this) == "starling.display::DisplayObjectContainer")
            {
                throw new AbstractClassError();
            }
            this.mChildren = new Vector.<DisplayObject>(0);
            return;
        }// end function

        override public function dispose() : void
        {
            var _loc_1:* = this.mChildren.length - 1;
            while (_loc_1 >= 0)
            {
                
                this.mChildren[_loc_1].dispose();
                _loc_1 = _loc_1 - 1;
            }
            super.dispose();
            return;
        }// end function

        public function addChild(param1:DisplayObject) : DisplayObject
        {
            return this.addChildAt(param1, this.mChildren.length);
        }// end function

        public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
        {
            var _loc_4:* = null;
            var _loc_3:* = this.mChildren.length;
            if (param2 >= 0 && param2 <= _loc_3)
            {
                if (param1.parent == this)
                {
                    this.setChildIndex(param1, param2);
                }
                else
                {
                    param1.removeFromParent();
                    if (param2 == _loc_3)
                    {
                        this.mChildren[_loc_3] = param1;
                    }
                    else
                    {
                        this.spliceChildren(param2, 0, param1);
                    }
                    param1.setParent(this);
                    param1.dispatchEventWith(Event.ADDED, true);
                    if (stage)
                    {
                        _loc_4 = param1 as DisplayObjectContainer;
                        if (_loc_4)
                        {
                            _loc_4.broadcastEventWith(Event.ADDED_TO_STAGE);
                        }
                        else
                        {
                            param1.dispatchEventWith(Event.ADDED_TO_STAGE);
                        }
                    }
                }
                return param1;
            }
            else
            {
            }
            throw new RangeError("Invalid child index");
        }// end function

        public function removeChild(param1:DisplayObject, param2:Boolean = false) : DisplayObject
        {
            var _loc_3:* = this.getChildIndex(param1);
            if (_loc_3 != -1)
            {
                this.removeChildAt(_loc_3, param2);
            }
            return param1;
        }// end function

        public function removeChildAt(param1:int, param2:Boolean = false) : DisplayObject
        {
            var _loc_3:* = null;
            var _loc_4:* = null;
            if (param1 >= 0 && param1 < this.mChildren.length)
            {
                _loc_3 = this.mChildren[param1];
                _loc_3.dispatchEventWith(Event.REMOVED, true);
                if (stage)
                {
                    _loc_4 = _loc_3 as DisplayObjectContainer;
                    if (_loc_4)
                    {
                        _loc_4.broadcastEventWith(Event.REMOVED_FROM_STAGE);
                    }
                    else
                    {
                        _loc_3.dispatchEventWith(Event.REMOVED_FROM_STAGE);
                    }
                }
                _loc_3.setParent(null);
                param1 = this.mChildren.indexOf(_loc_3);
                if (param1 >= 0)
                {
                    this.spliceChildren(param1, 1);
                }
                if (param2)
                {
                    _loc_3.dispose();
                }
                return _loc_3;
            }
            else
            {
            }
            throw new RangeError("Invalid child index");
        }// end function

        public function removeChildren(param1:int = 0, param2:int = -1, param3:Boolean = false) : void
        {
            if (param2 < 0 || param2 >= this.numChildren)
            {
                param2 = this.numChildren - 1;
            }
            var _loc_4:* = param1;
            while (_loc_4 <= param2)
            {
                
                this.removeChildAt(param1, param3);
                _loc_4++;
            }
            return;
        }// end function

        public function getChildAt(param1:int) : DisplayObject
        {
            var _loc_2:* = this.mChildren.length;
            if (param1 < 0)
            {
                param1 = _loc_2 + param1;
            }
            if (param1 >= 0 && param1 < _loc_2)
            {
                return this.mChildren[param1];
            }
            throw new RangeError("Invalid child index");
        }// end function

        public function getChildByName(param1:String) : DisplayObject
        {
            var _loc_2:* = this.mChildren.length;
            var _loc_3:* = 0;
            while (_loc_3 < _loc_2)
            {
                
                if (this.mChildren[_loc_3].name == param1)
                {
                    return this.mChildren[_loc_3];
                }
                _loc_3++;
            }
            return null;
        }// end function

        public function getChildIndex(param1:DisplayObject) : int
        {
            return this.mChildren.indexOf(param1);
        }// end function

        public function setChildIndex(param1:DisplayObject, param2:int) : void
        {
            var _loc_3:* = this.getChildIndex(param1);
            if (_loc_3 == param2)
            {
                return;
            }
            if (_loc_3 == -1)
            {
                throw new ArgumentError("Not a child of this container");
            }
            this.spliceChildren(_loc_3, 1);
            this.spliceChildren(param2, 0, param1);
            return;
        }// end function

        public function swapChildren(param1:DisplayObject, param2:DisplayObject) : void
        {
            var _loc_3:* = this.getChildIndex(param1);
            var _loc_4:* = this.getChildIndex(param2);
            if (_loc_3 == -1 || _loc_4 == -1)
            {
                throw new ArgumentError("Not a child of this container");
            }
            this.swapChildrenAt(_loc_3, _loc_4);
            return;
        }// end function

        public function swapChildrenAt(param1:int, param2:int) : void
        {
            var _loc_3:* = this.getChildAt(param1);
            var _loc_4:* = this.getChildAt(param2);
            this.mChildren[param1] = _loc_4;
            this.mChildren[param2] = _loc_3;
            return;
        }// end function

        public function sortChildren(param1:Function) : void
        {
            sSortBuffer.length = this.mChildren.length;
            mergeSort(this.mChildren, param1, 0, this.mChildren.length, sSortBuffer);
            sSortBuffer.length = 0;
            return;
        }// end function

        public function contains(param1:DisplayObject) : Boolean
        {
            while (param1)
            {
                
                if (param1 == this)
                {
                    return true;
                }
                param1 = param1.parent;
            }
            return false;
        }// end function

        override public function getBounds(param1:DisplayObject, param2:Rectangle = null) : Rectangle
        {
            var _loc_4:* = NaN;
            var _loc_5:* = NaN;
            var _loc_6:* = NaN;
            var _loc_7:* = NaN;
            var _loc_8:* = 0;
            if (param2 == null)
            {
                param2 = new Rectangle();
            }
            var _loc_3:* = this.mChildren.length;
            if (_loc_3 == 0)
            {
                getTransformationMatrix(param1, sHelperMatrix);
                MatrixUtil.transformCoords(sHelperMatrix, 0, 0, sHelperPoint);
                param2.setTo(sHelperPoint.x, sHelperPoint.y, 0, 0);
            }
            else if (_loc_3 == 1)
            {
                this.mChildren[0].getBounds(param1, param2);
            }
            else
            {
                _loc_4 = Number.MAX_VALUE;
                _loc_5 = -Number.MAX_VALUE;
                _loc_6 = Number.MAX_VALUE;
                _loc_7 = -Number.MAX_VALUE;
                _loc_8 = 0;
                while (_loc_8 < _loc_3)
                {
                    
                    this.mChildren[_loc_8].getBounds(param1, param2);
                    if (_loc_4 > param2.x)
                    {
                        _loc_4 = param2.x;
                    }
                    if (_loc_5 < param2.right)
                    {
                        _loc_5 = param2.right;
                    }
                    if (_loc_6 > param2.y)
                    {
                        _loc_6 = param2.y;
                    }
                    if (_loc_7 < param2.bottom)
                    {
                        _loc_7 = param2.bottom;
                    }
                    _loc_8++;
                }
                param2.setTo(_loc_4, _loc_6, _loc_5 - _loc_4, _loc_7 - _loc_6);
            }
            return param2;
        }// end function

        override public function hitTest(param1:Point, param2:Boolean = false) : DisplayObject
        {
            var _loc_8:* = null;
            if (param2 && (!visible || !touchable))
            {
                return null;
            }
            if (!hitTestMask(param1))
            {
                return null;
            }
            var _loc_3:* = null;
            var _loc_4:* = param1.x;
            var _loc_5:* = param1.y;
            var _loc_6:* = this.mChildren.length;
            var _loc_7:* = this.mChildren.length - 1;
            while (_loc_7 >= 0)
            {
                
                _loc_8 = this.mChildren[_loc_7];
                if (_loc_8.isMask)
                {
                }
                else
                {
                    sHelperMatrix.copyFrom(_loc_8.transformationMatrix);
                    sHelperMatrix.invert();
                    MatrixUtil.transformCoords(sHelperMatrix, _loc_4, _loc_5, sHelperPoint);
                    _loc_3 = _loc_8.hitTest(sHelperPoint, param2);
                    if (_loc_3)
                    {
                        return param2 && this.mTouchGroup ? (this) : (_loc_3);
                    }
                }
                _loc_7 = _loc_7 - 1;
            }
            return null;
        }// end function

        override public function render(param1:RenderSupport, param2:Number) : void
        {
            var _loc_7:* = null;
            var _loc_8:* = null;
            var _loc_9:* = null;
            var _loc_3:* = param2 * this.alpha;
            var _loc_4:* = this.mChildren.length;
            var _loc_5:* = param1.blendMode;
            var _loc_6:* = 0;
            while (_loc_6 < _loc_4)
            {
                
                _loc_7 = this.mChildren[_loc_6];
                if (_loc_7.hasVisibleArea)
                {
                    _loc_8 = _loc_7.filter;
                    _loc_9 = _loc_7.mask;
                    param1.pushMatrix();
                    param1.transformMatrix(_loc_7);
                    param1.blendMode = _loc_7.blendMode;
                    if (_loc_9)
                    {
                        param1.pushMask(_loc_9);
                    }
                    if (_loc_8)
                    {
                        _loc_8.render(_loc_7, param1, _loc_3);
                    }
                    else
                    {
                        _loc_7.render(param1, _loc_3);
                    }
                    if (_loc_9)
                    {
                        param1.popMask();
                    }
                    param1.blendMode = _loc_5;
                    param1.popMatrix();
                }
                _loc_6++;
            }
            return;
        }// end function

        public function broadcastEvent(event:Event) : void
        {
            if (event.bubbles)
            {
                throw new ArgumentError("Broadcast of bubbling events is prohibited");
            }
            var _loc_2:* = sBroadcastListeners.length;
            this.getChildEventListeners(this, event.type, sBroadcastListeners);
            var _loc_3:* = sBroadcastListeners.length;
            var _loc_4:* = _loc_2;
            while (_loc_4 < _loc_3)
            {
                
                sBroadcastListeners[_loc_4].dispatchEvent(event);
                _loc_4++;
            }
            sBroadcastListeners.length = _loc_2;
            return;
        }// end function

        public function broadcastEventWith(param1:String, param2:Object = null) : void
        {
            var _loc_3:* = Event.fromPool(param1, false, param2);
            this.broadcastEvent(_loc_3);
            Event.toPool(_loc_3);
            return;
        }// end function

        public function get numChildren() : int
        {
            return this.mChildren.length;
        }// end function

        public function get touchGroup() : Boolean
        {
            return this.mTouchGroup;
        }// end function

        public function set touchGroup(param1:Boolean) : void
        {
            this.mTouchGroup = param1;
            return;
        }// end function

        private function spliceChildren(param1:int, param2:uint = 4.29497e+009, param3:DisplayObject = null) : void
        {
            var _loc_6:* = 0;
            var _loc_4:* = this.mChildren;
            var _loc_5:* = _loc_4.length;
            if (param1 < 0)
            {
                param1 = param1 + _loc_5;
            }
            if (param1 < 0)
            {
                param1 = 0;
            }
            else if (param1 > _loc_5)
            {
                param1 = _loc_5;
            }
            if (param1 + param2 > _loc_5)
            {
                param2 = _loc_5 - param1;
            }
            var _loc_7:* = param3 ? (1) : (0);
            var _loc_8:* = (param3 ? (1) : (0)) - param2;
            var _loc_9:* = _loc_5 + _loc_8;
            var _loc_10:* = _loc_5 - param1 - param2;
            if (_loc_8 < 0)
            {
                _loc_6 = param1 + _loc_7;
                while (_loc_10)
                {
                    
                    _loc_4[_loc_6] = _loc_4[int(_loc_6 - _loc_8)];
                    _loc_10 = _loc_10 - 1;
                    _loc_6++;
                }
                _loc_4.length = _loc_9;
            }
            else if (_loc_8 > 0)
            {
                _loc_6 = 1;
                while (_loc_10)
                {
                    
                    _loc_4[int(_loc_9 - _loc_6)] = _loc_4[int(_loc_5 - _loc_6)];
                    _loc_10 = _loc_10 - 1;
                    _loc_6++;
                }
                _loc_4.length = _loc_9;
            }
            if (param3)
            {
                _loc_4[param1] = param3;
            }
            return;
        }// end function

        function getChildEventListeners(param1:DisplayObject, param2:String, param3:Vector.<DisplayObject>) : void
        {
            var _loc_5:* = null;
            var _loc_6:* = 0;
            var _loc_7:* = 0;
            var _loc_4:* = param1 as DisplayObjectContainer;
            if (param1.hasEventListener(param2))
            {
                param3[param3.length] = param1;
            }
            if (_loc_4)
            {
                _loc_5 = _loc_4.mChildren;
                _loc_6 = _loc_5.length;
                _loc_7 = 0;
                while (_loc_7 < _loc_6)
                {
                    
                    this.getChildEventListeners(_loc_5[_loc_7], param2, param3);
                    _loc_7++;
                }
            }
            return;
        }// end function

        private static function mergeSort(param1:Vector.<DisplayObject>, param2:Function, param3:int, param4:int, param5:Vector.<DisplayObject>) : void
        {
            var _loc_6:* = 0;
            var _loc_7:* = 0;
            var _loc_8:* = 0;
            var _loc_9:* = 0;
            var _loc_10:* = 0;
            if (param4 <= 1)
            {
                return;
            }
            _loc_6 = 0;
            _loc_7 = param3 + param4;
            _loc_8 = param4 / 2;
            _loc_9 = param3;
            _loc_10 = param3 + _loc_8;
            mergeSort(param1, param2, param3, _loc_8, param5);
            mergeSort(param1, param2, param3 + _loc_8, param4 - _loc_8, param5);
            _loc_6 = 0;
            while (_loc_6 < param4)
            {
                
                if (_loc_9 < param3 + _loc_8 && (_loc_10 == _loc_7 || DisplayObjectContainer.param2(param1[_loc_9], param1[_loc_10]) <= 0))
                {
                    param5[_loc_6] = param1[_loc_9];
                    _loc_9++;
                }
                else
                {
                    param5[_loc_6] = param1[_loc_10];
                    _loc_10++;
                }
                _loc_6++;
            }
            _loc_6 = param3;
            while (_loc_6 < _loc_7)
            {
                
                param1[_loc_6] = param5[int(_loc_6 - param3)];
                _loc_6++;
            }
            return;
        }// end function

    }
}
