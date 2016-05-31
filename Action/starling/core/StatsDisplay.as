package starling.core
{
    import flash.system.*;
    import starling.display.*;
    import starling.events.*;
    import starling.text.*;
    import starling.utils.*;

    class StatsDisplay extends Sprite
    {
        private const UPDATE_INTERVAL:Number = 0.5;
        private var mBackground:Quad;
        private var mTextField:TextField;
        private var mFrameCount:int = 0;
        private var mTotalTime:Number = 0;
        private var mFps:Number = 0;
        private var mMemory:Number = 0;
        private var mDrawCount:int = 0;

        function StatsDisplay()
        {
            this.mBackground = new Quad(50, 25, 0);
            this.mTextField = new TextField(48, 25, "", BitmapFont.MINI, BitmapFont.NATIVE_SIZE, 16777215);
            this.mTextField.x = 2;
            this.mTextField.hAlign = HAlign.LEFT;
            this.mTextField.vAlign = VAlign.TOP;
            addChild(this.mBackground);
            addChild(this.mTextField);
            blendMode = BlendMode.NONE;
            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
            return;
        }// end function

        private function onAddedToStage() : void
        {
            addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
            var _loc_1:* = 0;
            this.mFrameCount = 0;
            this.mTotalTime = _loc_1;
            this.update();
            return;
        }// end function

        private function onRemovedFromStage() : void
        {
            removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
            return;
        }// end function

        private function onEnterFrame(event:EnterFrameEvent) : void
        {
            this.mTotalTime = this.mTotalTime + event.passedTime;
            var _loc_2:* = this;
            var _loc_3:* = this.mFrameCount + 1;
            _loc_2.mFrameCount = _loc_3;
            if (this.mTotalTime > this.UPDATE_INTERVAL)
            {
                this.update();
                var _loc_2:* = 0;
                this.mTotalTime = 0;
                this.mFrameCount = _loc_2;
            }
            return;
        }// end function

        public function update() : void
        {
            this.mFps = this.mTotalTime > 0 ? (this.mFrameCount / this.mTotalTime) : (0);
            this.mMemory = System.totalMemory * 9.54e-007;
            this.mTextField.text = "FPS: " + this.mFps.toFixed(this.mFps < 100 ? (1) : (0)) + "\nMEM: " + this.mMemory.toFixed(this.mMemory < 100 ? (1) : (0)) + "\nDRW: " + (this.mTotalTime > 0 ? (this.mDrawCount - 2) : (this.mDrawCount));
            return;
        }// end function

        override public function render(param1:RenderSupport, param2:Number) : void
        {
            param1.finishQuadBatch();
            super.render(param1, param2);
            return;
        }// end function

        public function get drawCount() : int
        {
            return this.mDrawCount;
        }// end function

        public function set drawCount(param1:int) : void
        {
            this.mDrawCount = param1;
            return;
        }// end function

        public function get fps() : Number
        {
            return this.mFps;
        }// end function

        public function set fps(param1:Number) : void
        {
            this.mFps = param1;
            return;
        }// end function

        public function get memory() : Number
        {
            return this.mMemory;
        }// end function

        public function set memory(param1:Number) : void
        {
            this.mMemory = param1;
            return;
        }// end function

    }
}
