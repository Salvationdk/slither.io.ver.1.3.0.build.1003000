package org.villekoskela.utils
{
    import __AS3__.vec.*;
    import flash.geom.*;

    public class RectanglePacker extends Object
    {
        private var mWidth:int = 0;
        private var mHeight:int = 0;
        private var mPadding:int = 8;
        private var mPackedWidth:int = 0;
        private var mPackedHeight:int = 0;
        private var mInsertList:Array;
        private var mInsertedRectangles:Vector.<IntegerRectangle>;
        private var mFreeAreas:Vector.<IntegerRectangle>;
        private var mNewFreeAreas:Vector.<IntegerRectangle>;
        private var mOutsideRectangle:IntegerRectangle;
        private var mSortableSizeStack:Vector.<SortableSize>;
        private var mRectangleStack:Vector.<IntegerRectangle>;
        public static const VERSION:String = "1.3.0";

        public function RectanglePacker(param1:int, param2:int, param3:int = 0)
        {
            this.mInsertList = [];
            this.mInsertedRectangles = new Vector.<IntegerRectangle>;
            this.mFreeAreas = new Vector.<IntegerRectangle>;
            this.mNewFreeAreas = new Vector.<IntegerRectangle>;
            this.mSortableSizeStack = new Vector.<SortableSize>;
            this.mRectangleStack = new Vector.<IntegerRectangle>;
            this.mOutsideRectangle = new IntegerRectangle((param1 + 1), (param2 + 1), 0, 0);
            this.reset(param1, param2, param3);
            return;
        }// end function

        public function get rectangleCount() : int
        {
            return this.mInsertedRectangles.length;
        }// end function

        public function get packedWidth() : int
        {
            return this.mPackedWidth;
        }// end function

        public function get packedHeight() : int
        {
            return this.mPackedHeight;
        }// end function

        public function get padding() : int
        {
            return this.mPadding;
        }// end function

        public function reset(param1:int, param2:int, param3:int = 0) : void
        {
            while (this.mInsertedRectangles.length)
            {
                
                this.freeRectangle(this.mInsertedRectangles.pop());
            }
            while (this.mFreeAreas.length)
            {
                
                this.freeRectangle(this.mFreeAreas.pop());
            }
            this.mWidth = param1;
            this.mHeight = param2;
            this.mPackedWidth = 0;
            this.mPackedHeight = 0;
            this.mFreeAreas[0] = this.allocateRectangle(0, 0, this.mWidth, this.mHeight);
            while (this.mInsertList.length)
            {
                
                this.freeSize(this.mInsertList.pop());
            }
            this.mPadding = param3;
            return;
        }// end function

        public function getRectangle(param1:int, param2:Rectangle) : Rectangle
        {
            var _loc_3:* = this.mInsertedRectangles[param1];
            if (param2)
            {
                param2.x = _loc_3.x;
                param2.y = _loc_3.y;
                param2.width = _loc_3.width;
                param2.height = _loc_3.height;
                return param2;
            }
            return new Rectangle(_loc_3.x, _loc_3.y, _loc_3.width, _loc_3.height);
        }// end function

        public function getRectangleId(param1:int) : int
        {
            var _loc_2:* = this.mInsertedRectangles[param1];
            return _loc_2.id;
        }// end function

        public function insertRectangle(param1:int, param2:int, param3:int) : void
        {
            var _loc_4:* = this.allocateSize(param1, param2, param3);
            this.mInsertList.push(_loc_4);
            return;
        }// end function

        public function packRectangles(param1:Boolean = true) : int
        {
            var _loc_2:* = null;
            var _loc_3:* = 0;
            var _loc_4:* = 0;
            var _loc_5:* = 0;
            var _loc_6:* = null;
            var _loc_7:* = null;
            if (param1)
            {
                this.mInsertList.sortOn("width", Array.NUMERIC);
            }
            while (this.mInsertList.length > 0)
            {
                
                _loc_2 = this.mInsertList.pop() as SortableSize;
                _loc_3 = _loc_2.width;
                _loc_4 = _loc_2.height;
                _loc_5 = this.getFreeAreaIndex(_loc_3, _loc_4);
                if (_loc_5 >= 0)
                {
                    _loc_6 = this.mFreeAreas[_loc_5];
                    _loc_7 = this.allocateRectangle(_loc_6.x, _loc_6.y, _loc_3, _loc_4);
                    _loc_7.id = _loc_2.id;
                    this.generateNewFreeAreas(_loc_7, this.mFreeAreas, this.mNewFreeAreas);
                    while (this.mNewFreeAreas.length > 0)
                    {
                        
                        this.mFreeAreas[this.mFreeAreas.length] = this.mNewFreeAreas.pop();
                    }
                    this.mInsertedRectangles[this.mInsertedRectangles.length] = _loc_7;
                    if (_loc_7.right > this.mPackedWidth)
                    {
                        this.mPackedWidth = _loc_7.right;
                    }
                    if (_loc_7.bottom > this.mPackedHeight)
                    {
                        this.mPackedHeight = _loc_7.bottom;
                    }
                }
                this.freeSize(_loc_2);
            }
            return this.rectangleCount;
        }// end function

        private function filterSelfSubAreas(param1:Vector.<IntegerRectangle>) : void
        {
            var _loc_3:* = null;
            var _loc_4:* = 0;
            var _loc_5:* = null;
            var _loc_6:* = null;
            var _loc_2:* = param1.length - 1;
            while (_loc_2 >= 0)
            {
                
                _loc_3 = param1[_loc_2];
                _loc_4 = param1.length - 1;
                while (_loc_4 >= 0)
                {
                    
                    if (_loc_2 != _loc_4)
                    {
                        _loc_5 = param1[_loc_4];
                        if (_loc_3.x >= _loc_5.x && _loc_3.y >= _loc_5.y && _loc_3.right <= _loc_5.right && _loc_3.bottom <= _loc_5.bottom)
                        {
                            this.freeRectangle(_loc_3);
                            _loc_6 = param1.pop();
                            if (_loc_2 < param1.length)
                            {
                                param1[_loc_2] = _loc_6;
                            }
                            break;
                        }
                    }
                    _loc_4 = _loc_4 - 1;
                }
                _loc_2 = _loc_2 - 1;
            }
            return;
        }// end function

        private function generateNewFreeAreas(param1:IntegerRectangle, param2:Vector.<IntegerRectangle>, param3:Vector.<IntegerRectangle>) : void
        {
            var _loc_10:* = null;
            var _loc_11:* = null;
            var _loc_4:* = param1.x;
            var _loc_5:* = param1.y;
            var _loc_6:* = (param1.right + 1) + this.mPadding;
            var _loc_7:* = (param1.bottom + 1) + this.mPadding;
            var _loc_8:* = null;
            if (this.mPadding == 0)
            {
                _loc_8 = param1;
            }
            var _loc_9:* = param2.length - 1;
            while (_loc_9 >= 0)
            {
                
                _loc_10 = param2[_loc_9];
                if (!(_loc_4 >= _loc_10.right || _loc_6 <= _loc_10.x || _loc_5 >= _loc_10.bottom || _loc_7 <= _loc_10.y))
                {
                    if (!_loc_8)
                    {
                        _loc_8 = this.allocateRectangle(_loc_8.x, _loc_8.y, _loc_8.width + this.mPadding, _loc_8.height + this.mPadding);
                    }
                    this.generateDividedAreas(_loc_8, _loc_10, param3);
                    _loc_11 = param2.pop();
                    if (_loc_9 < param2.length)
                    {
                        param2[_loc_9] = _loc_11;
                    }
                }
                _loc_9 = _loc_9 - 1;
            }
            if (_loc_8 && _loc_8 != param1)
            {
                this.freeRectangle(_loc_8);
            }
            this.filterSelfSubAreas(param3);
            return;
        }// end function

        private function generateDividedAreas(param1:IntegerRectangle, param2:IntegerRectangle, param3:Vector.<IntegerRectangle>) : void
        {
            var _loc_4:* = 0;
            var _loc_5:* = param2.right - param1.right;
            if (param2.right - param1.right > 0)
            {
                param3[param3.length] = this.allocateRectangle(param1.right, param2.y, _loc_5, param2.height);
                _loc_4++;
            }
            var _loc_6:* = param1.x - param2.x;
            if (param1.x - param2.x > 0)
            {
                param3[param3.length] = this.allocateRectangle(param2.x, param2.y, _loc_6, param2.height);
                _loc_4++;
            }
            var _loc_7:* = param2.bottom - param1.bottom;
            if (param2.bottom - param1.bottom > 0)
            {
                param3[param3.length] = this.allocateRectangle(param2.x, param1.bottom, param2.width, _loc_7);
                _loc_4++;
            }
            var _loc_8:* = param1.y - param2.y;
            if (param1.y - param2.y > 0)
            {
                param3[param3.length] = this.allocateRectangle(param2.x, param2.y, param2.width, _loc_8);
                _loc_4++;
            }
            if (_loc_4 == 0 && (param1.width < param2.width || param1.height < param2.height))
            {
                param3[param3.length] = param2;
            }
            else
            {
                this.freeRectangle(param2);
            }
            return;
        }// end function

        private function getFreeAreaIndex(param1:int, param2:int) : int
        {
            var _loc_9:* = null;
            var _loc_3:* = this.mOutsideRectangle;
            var _loc_4:* = -1;
            var _loc_5:* = param1 + this.mPadding;
            var _loc_6:* = param2 + this.mPadding;
            var _loc_7:* = this.mFreeAreas.length;
            var _loc_8:* = this.mFreeAreas.length - 1;
            while (_loc_8 >= 0)
            {
                
                _loc_9 = this.mFreeAreas[_loc_8];
                if (_loc_9.x < this.mPackedWidth || _loc_9.y < this.mPackedHeight)
                {
                    if (_loc_9.x < _loc_3.x && _loc_5 <= _loc_9.width && _loc_6 <= _loc_9.height)
                    {
                        _loc_4 = _loc_8;
                        if (_loc_5 == _loc_9.width && _loc_9.width <= _loc_9.height && _loc_9.right < this.mWidth || _loc_6 == _loc_9.height && _loc_9.height <= _loc_9.width)
                        {
                            break;
                        }
                        _loc_3 = _loc_9;
                    }
                }
                else if (_loc_9.x < _loc_3.x && param1 <= _loc_9.width && param2 <= _loc_9.height)
                {
                    _loc_4 = _loc_8;
                    if (param1 == _loc_9.width && _loc_9.width <= _loc_9.height && _loc_9.right < this.mWidth || param2 == _loc_9.height && _loc_9.height <= _loc_9.width)
                    {
                        break;
                    }
                    _loc_3 = _loc_9;
                }
                _loc_8 = _loc_8 - 1;
            }
            return _loc_4;
        }// end function

        private function allocateRectangle(param1:int, param2:int, param3:int, param4:int) : IntegerRectangle
        {
            var _loc_5:* = null;
            if (this.mRectangleStack.length > 0)
            {
                _loc_5 = this.mRectangleStack.pop();
                _loc_5.x = param1;
                _loc_5.y = param2;
                _loc_5.width = param3;
                _loc_5.height = param4;
                _loc_5.right = param1 + param3;
                _loc_5.bottom = param2 + param4;
                return _loc_5;
            }
            return new IntegerRectangle(param1, param2, param3, param4);
        }// end function

        private function freeRectangle(param1:IntegerRectangle) : void
        {
            this.mRectangleStack[this.mRectangleStack.length] = param1;
            return;
        }// end function

        private function allocateSize(param1:int, param2:int, param3:int) : SortableSize
        {
            var _loc_4:* = null;
            if (this.mSortableSizeStack.length > 0)
            {
                _loc_4 = this.mSortableSizeStack.pop();
                _loc_4.width = param1;
                _loc_4.height = param2;
                _loc_4.id = param3;
                return _loc_4;
            }
            return new SortableSize(param1, param2, param3);
        }// end function

        private function freeSize(param1:SortableSize) : void
        {
            this.mSortableSizeStack[this.mSortableSizeStack.length] = param1;
            return;
        }// end function

    }
}
