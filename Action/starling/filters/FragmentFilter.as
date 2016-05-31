package starling.filters
{
    import __AS3__.vec.*;
    import flash.display3D.*;
    import flash.errors.*;
    import flash.geom.*;
    import flash.system.*;
    import flash.utils.*;
    import starling.core.*;
    import starling.display.*;
    import starling.errors.*;
    import starling.events.*;
    import starling.textures.*;
    import starling.utils.*;

    public class FragmentFilter extends Object
    {
        private const MIN_TEXTURE_SIZE:int = 64;
        protected const PMA:Boolean = true;
        protected const STD_VERTEX_SHADER:String;
        protected const STD_FRAGMENT_SHADER:String = "tex oc, v0, fs0 <2d, clamp, linear, mipnone>";
        private var mVertexPosAtID:int = 0;
        private var mTexCoordsAtID:int = 1;
        private var mBaseTextureID:int = 0;
        private var mMvpConstantID:int = 0;
        private var mNumPasses:int;
        private var mPassTextures:Vector.<Texture>;
        private var mMode:String;
        private var mResolution:Number;
        private var mMarginX:Number;
        private var mMarginY:Number;
        private var mOffsetX:Number;
        private var mOffsetY:Number;
        private var mVertexData:VertexData;
        private var mVertexBuffer:VertexBuffer3D;
        private var mIndexData:Vector.<uint>;
        private var mIndexBuffer:IndexBuffer3D;
        private var mCacheRequested:Boolean;
        private var mCache:QuadBatch;
        private var mHelperMatrix:Matrix;
        private var mHelperMatrix3D:Matrix3D;
        private var mHelperRect:Rectangle;
        private var mHelperRect2:Rectangle;
        private static var sStageBounds:Rectangle = new Rectangle();
        private static var sTransformationMatrix:Matrix = new Matrix();

        public function FragmentFilter(param1:int = 1, param2:Number = 1)
        {
            this.STD_VERTEX_SHADER = "m44 op, va0, vc0 \n" + "mov v0, va1      \n";
            this.mHelperMatrix = new Matrix();
            this.mHelperMatrix3D = new Matrix3D();
            this.mHelperRect = new Rectangle();
            this.mHelperRect2 = new Rectangle();
            if (Capabilities.isDebugger && getQualifiedClassName(this) == "starling.filters::FragmentFilter")
            {
                throw new AbstractClassError();
            }
            if (param1 < 1)
            {
                throw new ArgumentError("At least one pass is required.");
            }
            this.mNumPasses = param1;
            var _loc_3:* = 0;
            this.mMarginY = 0;
            this.mMarginX = _loc_3;
            var _loc_3:* = 0;
            this.mOffsetY = 0;
            this.mOffsetX = _loc_3;
            this.mResolution = param2;
            this.mPassTextures = new Vector.<Texture>(0);
            this.mMode = FragmentFilterMode.REPLACE;
            this.mVertexData = new VertexData(4);
            this.mVertexData.setTexCoords(0, 0, 0);
            this.mVertexData.setTexCoords(1, 1, 0);
            this.mVertexData.setTexCoords(2, 0, 1);
            this.mVertexData.setTexCoords(3, 1, 1);
            new Vector.<uint>(6)[0] = 0;
            new Vector.<uint>(6)[1] = 1;
            new Vector.<uint>(6)[2] = 2;
            new Vector.<uint>(6)[3] = 1;
            new Vector.<uint>(6)[4] = 3;
            new Vector.<uint>(6)[5] = 2;
            this.mIndexData = new Vector.<uint>(6);
            this.mIndexData.fixed = true;
            if (Starling.current.contextValid)
            {
                this.createPrograms();
            }
            Starling.current.stage3D.addEventListener(Event.CONTEXT3D_CREATE, this.onContextCreated, false, 0, true);
            return;
        }// end function

        public function dispose() : void
        {
            Starling.current.stage3D.removeEventListener(Event.CONTEXT3D_CREATE, this.onContextCreated);
            if (this.mVertexBuffer)
            {
                this.mVertexBuffer.dispose();
            }
            if (this.mIndexBuffer)
            {
                this.mIndexBuffer.dispose();
            }
            this.disposePassTextures();
            this.disposeCache();
            return;
        }// end function

        private function onContextCreated(param1:Object) : void
        {
            this.mVertexBuffer = null;
            this.mIndexBuffer = null;
            this.disposePassTextures();
            this.createPrograms();
            if (this.mCache)
            {
                this.cache();
            }
            return;
        }// end function

        public function render(param1:DisplayObject, param2:RenderSupport, param3:Number) : void
        {
            if (this.mode == FragmentFilterMode.ABOVE)
            {
                param1.render(param2, param3);
            }
            if (this.mCacheRequested)
            {
                this.mCacheRequested = false;
                this.mCache = this.renderPasses(param1, param2, 1, true);
                this.disposePassTextures();
            }
            if (this.mCache)
            {
                this.mCache.render(param2, param3);
            }
            else
            {
                this.renderPasses(param1, param2, param3, false);
            }
            if (this.mode == FragmentFilterMode.BELOW)
            {
                param1.render(param2, param3);
            }
            return;
        }// end function

        private function renderPasses(param1:DisplayObject, param2:RenderSupport, param3:Number, param4:Boolean = false) : QuadBatch
        {
            var _loc_5:* = null;
            var _loc_15:* = 0;
            var _loc_16:* = null;
            var _loc_17:* = false;
            var _loc_19:* = null;
            var _loc_20:* = null;
            var _loc_6:* = null;
            var _loc_7:* = Starling.context;
            var _loc_8:* = param1.stage;
            var _loc_9:* = Starling.current.stage;
            var _loc_10:* = Starling.current.contentScaleFactor;
            var _loc_11:* = this.mHelperMatrix;
            var _loc_12:* = this.mHelperMatrix3D;
            var _loc_13:* = this.mHelperRect;
            var _loc_14:* = this.mHelperRect2;
            if (_loc_7 == null)
            {
                throw new MissingContextError();
            }
            _loc_17 = !param4 && this.mOffsetX == 0 && this.mOffsetY == 0;
            this.calculateBounds(param1, _loc_8, this.mResolution * _loc_10, _loc_17, _loc_13, _loc_14);
            if (_loc_13.isEmpty())
            {
                this.disposePassTextures();
                return param4 ? (new QuadBatch()) : (null);
            }
            this.updateBuffers(_loc_7, _loc_14);
            this.updatePassTextures(_loc_14.width, _loc_14.height, this.mResolution * _loc_10);
            param2.finishQuadBatch();
            param2.raiseDrawCount(this.mNumPasses);
            param2.pushMatrix();
            param2.pushMatrix3D();
            param2.pushClipRect(_loc_14, false);
            _loc_11.copyFrom(param2.projectionMatrix);
            _loc_12.copyFrom(param2.projectionMatrix3D);
            _loc_16 = param2.renderTarget;
            _loc_15 = param2.stencilReferenceValue;
            if (_loc_16 && !SystemUtil.supportsRelaxedTargetClearRequirement)
            {
                throw new IllegalOperationError("To nest filters, you need at least Flash Player / AIR version 15.");
            }
            if (param4)
            {
                _loc_6 = Texture.empty(_loc_14.width, _loc_14.height, this.PMA, false, true, this.mResolution * _loc_10);
            }
            param2.renderTarget = this.mPassTextures[0];
            param2.clear();
            param2.blendMode = BlendMode.NORMAL;
            param2.stencilReferenceValue = 0;
            param2.setProjectionMatrix(_loc_13.x, _loc_13.y, _loc_14.width, _loc_14.height, _loc_9.stageWidth, _loc_9.stageHeight, _loc_9.cameraPosition);
            param1.render(param2, param3);
            param2.finishQuadBatch();
            RenderSupport.setBlendFactors(this.PMA);
            param2.loadIdentity();
            _loc_7.setVertexBufferAt(this.mVertexPosAtID, this.mVertexBuffer, VertexData.POSITION_OFFSET, Context3DVertexBufferFormat.FLOAT_2);
            _loc_7.setVertexBufferAt(this.mTexCoordsAtID, this.mVertexBuffer, VertexData.TEXCOORD_OFFSET, Context3DVertexBufferFormat.FLOAT_2);
            var _loc_18:* = 0;
            while (_loc_18 < this.mNumPasses)
            {
                
                if (_loc_18 < (this.mNumPasses - 1))
                {
                    param2.renderTarget = this.getPassTexture((_loc_18 + 1));
                    param2.clear();
                }
                else if (param4)
                {
                    param2.renderTarget = _loc_6;
                    param2.clear();
                }
                else
                {
                    param2.popClipRect();
                    param2.projectionMatrix = _loc_11;
                    param2.projectionMatrix3D = _loc_12;
                    param2.renderTarget = _loc_16;
                    param2.translateMatrix(this.mOffsetX, this.mOffsetY);
                    param2.stencilReferenceValue = _loc_15;
                    param2.blendMode = param1.blendMode;
                    param2.applyBlendMode(this.PMA);
                }
                _loc_5 = this.getPassTexture(_loc_18);
                _loc_7.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX, this.mMvpConstantID, param2.mvpMatrix3D, true);
                _loc_7.setTextureAt(this.mBaseTextureID, _loc_5.base);
                this.activate(_loc_18, _loc_7, _loc_5);
                _loc_7.drawTriangles(this.mIndexBuffer, 0, 2);
                this.deactivate(_loc_18, _loc_7, _loc_5);
                _loc_18++;
            }
            _loc_7.setVertexBufferAt(this.mVertexPosAtID, null);
            _loc_7.setVertexBufferAt(this.mTexCoordsAtID, null);
            _loc_7.setTextureAt(this.mBaseTextureID, null);
            param2.popMatrix();
            param2.popMatrix3D();
            if (param4)
            {
                param2.projectionMatrix.copyFrom(_loc_11);
                param2.projectionMatrix3D.copyFrom(_loc_12);
                param2.renderTarget = _loc_16;
                param2.popClipRect();
                _loc_19 = new QuadBatch();
                _loc_20 = new Image(_loc_6);
                param1.getTransformationMatrix(_loc_8, sTransformationMatrix).invert();
                MatrixUtil.prependTranslation(sTransformationMatrix, _loc_13.x + this.mOffsetX, _loc_13.y + this.mOffsetY);
                _loc_19.addImage(_loc_20, 1, sTransformationMatrix);
                _loc_19.ownsTexture = true;
                return _loc_19;
            }
            return null;
        }// end function

        private function updateBuffers(param1:Context3D, param2:Rectangle) : void
        {
            this.mVertexData.setPosition(0, param2.x, param2.y);
            this.mVertexData.setPosition(1, param2.right, param2.y);
            this.mVertexData.setPosition(2, param2.x, param2.bottom);
            this.mVertexData.setPosition(3, param2.right, param2.bottom);
            if (this.mVertexBuffer == null)
            {
                this.mVertexBuffer = param1.createVertexBuffer(4, VertexData.ELEMENTS_PER_VERTEX);
                this.mIndexBuffer = param1.createIndexBuffer(6);
                this.mIndexBuffer.uploadFromVector(this.mIndexData, 0, 6);
            }
            this.mVertexBuffer.uploadFromVector(this.mVertexData.rawData, 0, 4);
            return;
        }// end function

        private function updatePassTextures(param1:Number, param2:Number, param3:Number) : void
        {
            var _loc_6:* = 0;
            var _loc_4:* = this.mNumPasses > 1 ? (2) : (1);
            var _loc_5:* = this.mPassTextures.length != _loc_4 || Math.abs(this.mPassTextures[0].nativeWidth - param1 * param3) > 0.1 || Math.abs(this.mPassTextures[0].nativeHeight - param2 * param3) > 0.1;
            if (this.mPassTextures.length != _loc_4 || Math.abs(this.mPassTextures[0].nativeWidth - param1 * param3) > 0.1 || Math.abs(this.mPassTextures[0].nativeHeight - param2 * param3) > 0.1)
            {
                this.disposePassTextures();
                _loc_6 = 0;
                while (_loc_6 < _loc_4)
                {
                    
                    this.mPassTextures[_loc_6] = Texture.empty(param1, param2, this.PMA, false, true, param3);
                    _loc_6++;
                }
            }
            return;
        }// end function

        private function getPassTexture(param1:int) : Texture
        {
            return this.mPassTextures[param1 % 2];
        }// end function

        private function calculateBounds(param1:DisplayObject, param2:DisplayObject, param3:Number, param4:Boolean, param5:Rectangle, param6:Rectangle) : void
        {
            var _loc_7:* = null;
            var _loc_10:* = 0;
            var _loc_11:* = NaN;
            var _loc_12:* = NaN;
            var _loc_8:* = this.mMarginX;
            var _loc_9:* = this.mMarginY;
            if (param2 is Stage)
            {
                _loc_7 = param2 as Stage;
                if (param1 == _loc_7 || param1 == param1.root)
                {
                    var _loc_13:* = 0;
                    _loc_9 = 0;
                    _loc_8 = _loc_13;
                    param5.setTo(0, 0, _loc_7.stageWidth, _loc_7.stageHeight);
                }
                else
                {
                    param1.getBounds(_loc_7, param5);
                }
                if (param4)
                {
                    sStageBounds.setTo(0, 0, _loc_7.stageWidth, _loc_7.stageHeight);
                    RectangleUtil.intersect(param5, sStageBounds, param5);
                }
            }
            else
            {
                param1.getBounds(param2, param5);
            }
            if (!param5.isEmpty())
            {
                param5.inflate(_loc_8, _loc_9);
                _loc_10 = this.MIN_TEXTURE_SIZE / param3;
                _loc_11 = param5.width > _loc_10 ? (param5.width) : (_loc_10);
                _loc_12 = param5.height > _loc_10 ? (param5.height) : (_loc_10);
                param6.setTo(param5.x, param5.y, getNextPowerOfTwo(_loc_11 * param3) / param3, getNextPowerOfTwo(_loc_12 * param3) / param3);
            }
            return;
        }// end function

        private function disposePassTextures() : void
        {
            var _loc_1:* = null;
            for each (_loc_1 in this.mPassTextures)
            {
                
                _loc_1.dispose();
            }
            _loc_3.length = 0;
            return;
        }// end function

        private function disposeCache() : void
        {
            if (this.mCache)
            {
                this.mCache.dispose();
                this.mCache = null;
            }
            return;
        }// end function

        protected function createPrograms() : void
        {
            throw new Error("Method has to be implemented in subclass!");
        }// end function

        protected function activate(param1:int, param2:Context3D, param3:Texture) : void
        {
            throw new Error("Method has to be implemented in subclass!");
        }// end function

        protected function deactivate(param1:int, param2:Context3D, param3:Texture) : void
        {
            return;
        }// end function

        protected function assembleAgal(param1:String = null, param2:String = null) : Program3D
        {
            if (param1 == null)
            {
                param1 = this.STD_FRAGMENT_SHADER;
            }
            if (param2 == null)
            {
                param2 = this.STD_VERTEX_SHADER;
            }
            return RenderSupport.assembleAgal(param2, param1);
        }// end function

        public function cache() : void
        {
            this.mCacheRequested = true;
            this.disposeCache();
            return;
        }// end function

        public function clearCache() : void
        {
            this.mCacheRequested = false;
            this.disposeCache();
            return;
        }// end function

        function compile(param1:DisplayObject) : QuadBatch
        {
            var _loc_2:* = null;
            var _loc_3:* = null;
            var _loc_4:* = null;
            if (this.mCache)
            {
                return this.mCache;
            }
            _loc_3 = param1.stage;
            _loc_2 = new RenderSupport();
            param1.getTransformationMatrix(_loc_3, _loc_2.modelViewMatrix);
            _loc_4 = this.renderPasses(param1, _loc_2, 1, true);
            _loc_2.dispose();
            return _loc_4;
        }// end function

        public function get isCached() : Boolean
        {
            return this.mCache != null || this.mCacheRequested;
        }// end function

        public function get resolution() : Number
        {
            return this.mResolution;
        }// end function

        public function set resolution(param1:Number) : void
        {
            if (param1 <= 0)
            {
                throw new ArgumentError("Resolution must be > 0");
            }
            this.mResolution = param1;
            return;
        }// end function

        public function get mode() : String
        {
            return this.mMode;
        }// end function

        public function set mode(param1:String) : void
        {
            this.mMode = param1;
            return;
        }// end function

        public function get offsetX() : Number
        {
            return this.mOffsetX;
        }// end function

        public function set offsetX(param1:Number) : void
        {
            this.mOffsetX = param1;
            return;
        }// end function

        public function get offsetY() : Number
        {
            return this.mOffsetY;
        }// end function

        public function set offsetY(param1:Number) : void
        {
            this.mOffsetY = param1;
            return;
        }// end function

        protected function get marginX() : Number
        {
            return this.mMarginX;
        }// end function

        protected function set marginX(param1:Number) : void
        {
            this.mMarginX = param1;
            return;
        }// end function

        protected function get marginY() : Number
        {
            return this.mMarginY;
        }// end function

        protected function set marginY(param1:Number) : void
        {
            this.mMarginY = param1;
            return;
        }// end function

        protected function set numPasses(param1:int) : void
        {
            this.mNumPasses = param1;
            return;
        }// end function

        protected function get numPasses() : int
        {
            return this.mNumPasses;
        }// end function

        final protected function get vertexPosAtID() : int
        {
            return this.mVertexPosAtID;
        }// end function

        final protected function set vertexPosAtID(param1:int) : void
        {
            this.mVertexPosAtID = param1;
            return;
        }// end function

        final protected function get texCoordsAtID() : int
        {
            return this.mTexCoordsAtID;
        }// end function

        final protected function set texCoordsAtID(param1:int) : void
        {
            this.mTexCoordsAtID = param1;
            return;
        }// end function

        final protected function get baseTextureID() : int
        {
            return this.mBaseTextureID;
        }// end function

        final protected function set baseTextureID(param1:int) : void
        {
            this.mBaseTextureID = param1;
            return;
        }// end function

        final protected function get mvpConstantID() : int
        {
            return this.mMvpConstantID;
        }// end function

        final protected function set mvpConstantID(param1:int) : void
        {
            this.mMvpConstantID = param1;
            return;
        }// end function

    }
}
