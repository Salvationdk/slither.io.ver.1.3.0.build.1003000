package starling.events
{
    import flash.display.*;
    import flash.geom.*;
    import starling.core.*;
    import starling.display.*;
    import starling.textures.*;

    class TouchMarker extends Sprite
    {
        private var mCenter:Point;
        private var mTexture:Texture;

        function TouchMarker()
        {
            var _loc_2:* = null;
            this.mCenter = new Point();
            this.mTexture = this.createTexture();
            var _loc_1:* = 0;
            while (_loc_1 < 2)
            {
                
                _loc_2 = new Image(this.mTexture);
                _loc_2.pivotX = this.mTexture.width / 2;
                _loc_2.pivotY = this.mTexture.height / 2;
                _loc_2.touchable = false;
                addChild(_loc_2);
                _loc_1++;
            }
            return;
        }// end function

        override public function dispose() : void
        {
            this.mTexture.dispose();
            super.dispose();
            return;
        }// end function

        public function moveMarker(param1:Number, param2:Number, param3:Boolean = false) : void
        {
            if (param3)
            {
                this.mCenter.x = this.mCenter.x + (param1 - this.realMarker.x);
                this.mCenter.y = this.mCenter.y + (param2 - this.realMarker.y);
            }
            this.realMarker.x = param1;
            this.realMarker.y = param2;
            this.mockMarker.x = 2 * this.mCenter.x - param1;
            this.mockMarker.y = 2 * this.mCenter.y - param2;
            return;
        }// end function

        public function moveCenter(param1:Number, param2:Number) : void
        {
            this.mCenter.x = param1;
            this.mCenter.y = param2;
            this.moveMarker(this.realX, this.realY);
            return;
        }// end function

        private function createTexture() : Texture
        {
            var _loc_1:* = Starling.contentScaleFactor;
            var _loc_2:* = 12 * _loc_1;
            var _loc_3:* = 32 * _loc_1;
            var _loc_4:* = 32 * _loc_1;
            var _loc_5:* = 1.5 * _loc_1;
            var _loc_6:* = new Shape();
            _loc_6.graphics.lineStyle(_loc_5, 0, 0.3);
            _loc_6.graphics.drawCircle(_loc_3 / 2, _loc_4 / 2, _loc_2 + _loc_5);
            _loc_6.graphics.beginFill(16777215, 0.4);
            _loc_6.graphics.lineStyle(_loc_5, 16777215);
            _loc_6.graphics.drawCircle(_loc_3 / 2, _loc_4 / 2, _loc_2);
            _loc_6.graphics.endFill();
            var _loc_7:* = new BitmapData(_loc_3, _loc_4, true, 0);
            _loc_7.draw(_loc_6);
            return Texture.fromBitmapData(_loc_7, false, false, _loc_1);
        }// end function

        private function get realMarker() : Image
        {
            return getChildAt(0) as Image;
        }// end function

        private function get mockMarker() : Image
        {
            return getChildAt(1) as Image;
        }// end function

        public function get realX() : Number
        {
            return this.realMarker.x;
        }// end function

        public function get realY() : Number
        {
            return this.realMarker.y;
        }// end function

        public function get mockX() : Number
        {
            return this.mockMarker.x;
        }// end function

        public function get mockY() : Number
        {
            return this.mockMarker.y;
        }// end function

    }
}
