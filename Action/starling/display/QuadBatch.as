package starling.display
{
    import __AS3__.vec.*;
    import flash.display3D.*;
    import flash.errors.*;
    import flash.geom.*;
    import flash.utils.*;
    import starling.core.*;
    import starling.errors.*;
    import starling.events.*;
    import starling.filters.*;
    import starling.textures.*;
    import starling.utils.*;

    public class QuadBatch extends DisplayObject
    {
        private var mNumQuads:int;
        private var mSyncRequired:Boolean;
        private var mBatchable:Boolean;
        private var mForceTinted:Boolean;
        private var mOwnsTexture:Boolean;
        private var mTinted:Boolean;
        private var mTexture:Texture;
        private var mSmoothing:String;
        private var mVertexBuffer:VertexBuffer3D;
        private var mIndexData:Vector.<uint>;
        private var mIndexBuffer:IndexBuffer3D;
        protected var mVertexData:VertexData;
        public static const MAX_NUM_QUADS:int = 16383;
        private static const QUAD_PROGRAM_NAME:String = "QB_q";
        private static var sHelperMatrix:Matrix = new Matrix();
        private static var sRenderAlpha:Vector.<Number> = new Vector.<Number>(4);
        private static var sProgramNameCache:Dictionary = new Dictionary();

        public function QuadBatch()
        {
            this.mVertexData = new VertexData(0, true);
            this.mIndexData = new Vector.<uint>(0);
            this.mNumQuads = 0;
            this.mTinted = false;
            this.mSyncRequired = false;
            this.mBatchable = false;
            this.mForceTinted = false;
            this.mOwnsTexture = false;
            Starling.current.stage3D.addEventListener(Event.CONTEXT3D_CREATE, this.onContextCreated, false, 0, true);
            return;
        }// end function

        override public function dispose() : void
        {
            Starling.current.stage3D.removeEventListener(Event.CONTEXT3D_CREATE, this.onContextCreated);
            this.destroyBuffers();
            this.mVertexData.numVertices = 0;
            this.mIndexData.length = 0;
            this.mNumQuads = 0;
            if (this.mTexture && this.mOwnsTexture)
            {
                this.mTexture.dispose();
            }
            super.dispose();
            return;
        }// end function

        private function onContextCreated(param1:Object) : void
        {
            this.createBuffers();
            return;
        }// end function

        protected function onVertexDataChanged() : void
        {
            this.mSyncRequired = true;
            return;
        }// end function

        public function clone() : QuadBatch
        {
            var _loc_1:* = new QuadBatch();
            _loc_1.mVertexData = this.mVertexData.clone(0, this.mNumQuads * 4);
            _loc_1.mIndexData = this.mIndexData.slice(0, this.mNumQuads * 6);
            _loc_1.mNumQuads = this.mNumQuads;
            _loc_1.mTinted = this.mTinted;
            _loc_1.mTexture = this.mTexture;
            _loc_1.mSmoothing = this.mSmoothing;
            _loc_1.mSyncRequired = true;
            _loc_1.blendMode = blendMode;
            _loc_1.alpha = alpha;
            return _loc_1;
        }// end function

        private function expand() : void
        {
            var _loc_1:* = this.capacity;
            if (_loc_1 >= MAX_NUM_QUADS)
            {
                throw new Error("Exceeded maximum number of quads!");
            }
            this.capacity = _loc_1 < 8 ? (16) : (_loc_1 * 2);
            return;
        }// end function

        private function createBuffers() : void
        {
            this.destroyBuffers();
            var _loc_1:* = this.mVertexData.numVertices;
            var _loc_2:* = this.mIndexData.length;
            var _loc_3:* = Starling.context;
            if (_loc_1 == 0)
            {
                return;
            }
            if (_loc_3 == null)
            {
                throw new MissingContextError();
            }
            this.mVertexBuffer = _loc_3.createVertexBuffer(_loc_1, VertexData.ELEMENTS_PER_VERTEX);
            this.mVertexBuffer.uploadFromVector(this.mVertexData.rawData, 0, _loc_1);
            this.mIndexBuffer = _loc_3.createIndexBuffer(_loc_2);
            this.mIndexBuffer.uploadFromVector(this.mIndexData, 0, _loc_2);
            this.mSyncRequired = false;
            return;
        }// end function

        private function destroyBuffers() : void
        {
            if (this.mVertexBuffer)
            {
                this.mVertexBuffer.dispose();
                this.mVertexBuffer = null;
            }
            if (this.mIndexBuffer)
            {
                this.mIndexBuffer.dispose();
                this.mIndexBuffer = null;
            }
            return;
        }// end function

        private function syncBuffers() : void
        {
            if (this.mVertexBuffer == null)
            {
                this.createBuffers();
            }
            else
            {
                this.mVertexBuffer.uploadFromVector(this.mVertexData.rawData, 0, this.mVertexData.numVertices);
                this.mSyncRequired = false;
            }
            return;
        }// end function

        public function renderCustom(param1:Matrix3D, param2:Number = 1, param3:String = null) : void
        {
            if (this.mNumQuads == 0)
            {
                return;
            }
            if (this.mSyncRequired)
            {
                this.syncBuffers();
            }
            var _loc_4:* = this.mVertexData.premultipliedAlpha;
            var _loc_5:* = Starling.context;
            var _loc_6:* = this.mTinted || param2 != 1;
            var _loc_7:* = _loc_4 ? (param2) : (1);
            sRenderAlpha[2] = _loc_4 ? (param2) : (1);
            sRenderAlpha[1] = _loc_7;
            sRenderAlpha[0] = _loc_7;
            sRenderAlpha[3] = param2;
            RenderSupport.setBlendFactors(_loc_4, param3 ? (param3) : (this.blendMode));
            _loc_5.setProgram(this.getProgram(_loc_6));
            _loc_5.setProgramConstantsFromVector(Context3DProgramType.VERTEX, 0, sRenderAlpha, 1);
            _loc_5.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX, 1, param1, true);
            _loc_5.setVertexBufferAt(0, this.mVertexBuffer, VertexData.POSITION_OFFSET, Context3DVertexBufferFormat.FLOAT_2);
            if (this.mTexture == null || _loc_6)
            {
                _loc_5.setVertexBufferAt(1, this.mVertexBuffer, VertexData.COLOR_OFFSET, Context3DVertexBufferFormat.FLOAT_4);
            }
            if (this.mTexture)
            {
                _loc_5.setTextureAt(0, this.mTexture.base);
                _loc_5.setVertexBufferAt(2, this.mVertexBuffer, VertexData.TEXCOORD_OFFSET, Context3DVertexBufferFormat.FLOAT_2);
            }
            _loc_5.drawTriangles(this.mIndexBuffer, 0, this.mNumQuads * 2);
            if (this.mTexture)
            {
                _loc_5.setTextureAt(0, null);
                _loc_5.setVertexBufferAt(2, null);
            }
            _loc_5.setVertexBufferAt(1, null);
            _loc_5.setVertexBufferAt(0, null);
            return;
        }// end function

        public function reset() : void
        {
            if (this.mTexture && this.mOwnsTexture)
            {
                this.mTexture.dispose();
            }
            this.mNumQuads = 0;
            this.mTexture = null;
            this.mSmoothing = null;
            this.mSyncRequired = true;
            return;
        }// end function

        public function addImage(param1:Image, param2:Number = 1, param3:Matrix = null, param4:String = null) : void
        {
            this.addQuad(param1, param2, param1.texture, param1.smoothing, param3, param4);
            return;
        }// end function

        public function addQuad(param1:Quad, param2:Number = 1, param3:Texture = null, param4:String = null, param5:Matrix = null, param6:String = null) : void
        {
            if (param5 == null)
            {
                param5 = param1.transformationMatrix;
            }
            var _loc_7:* = param2 * param1.alpha;
            var _loc_8:* = this.mNumQuads * 4;
            if ((this.mNumQuads + 1) > this.mVertexData.numVertices / 4)
            {
                this.expand();
            }
            if (this.mNumQuads == 0)
            {
                this.blendMode = param6 ? (param6) : (param1.blendMode);
                this.mTexture = param3;
                this.mTinted = this.mForceTinted || param1.tinted || param2 != 1;
                this.mSmoothing = param4;
                this.mVertexData.setPremultipliedAlpha(param1.premultipliedAlpha);
            }
            param1.copyVertexDataTransformedTo(this.mVertexData, _loc_8, param5);
            if (_loc_7 != 1)
            {
                this.mVertexData.scaleAlpha(_loc_8, _loc_7, 4);
            }
            this.mSyncRequired = true;
            var _loc_9:* = this;
            var _loc_10:* = this.mNumQuads + 1;
            _loc_9.mNumQuads = _loc_10;
            return;
        }// end function

        public function addQuadBatch(param1:QuadBatch, param2:Number = 1, param3:Matrix = null, param4:String = null) : void
        {
            if (param3 == null)
            {
                param3 = param1.transformationMatrix;
            }
            var _loc_5:* = param2 * param1.alpha;
            var _loc_6:* = this.mNumQuads * 4;
            var _loc_7:* = param1.numQuads;
            if (this.mNumQuads + _loc_7 > this.capacity)
            {
                this.capacity = this.mNumQuads + _loc_7;
            }
            if (this.mNumQuads == 0)
            {
                this.blendMode = param4 ? (param4) : (param1.blendMode);
                this.mTexture = param1.mTexture;
                this.mTinted = this.mForceTinted || param1.mTinted || param2 != 1;
                this.mSmoothing = param1.mSmoothing;
                this.mVertexData.setPremultipliedAlpha(param1.mVertexData.premultipliedAlpha, false);
            }
            param1.mVertexData.copyTransformedTo(this.mVertexData, _loc_6, param3, 0, _loc_7 * 4);
            if (_loc_5 != 1)
            {
                this.mVertexData.scaleAlpha(_loc_6, _loc_5, _loc_7 * 4);
            }
            this.mSyncRequired = true;
            this.mNumQuads = this.mNumQuads + _loc_7;
            return;
        }// end function

        public function isStateChange(param1:Boolean, param2:Number, param3:Texture, param4:String, param5:String, param6:int = 1) : Boolean
        {
            if (this.mNumQuads == 0)
            {
                return false;
            }
            if (this.mNumQuads + param6 > MAX_NUM_QUADS)
            {
                return true;
            }
            if (this.mTexture == null && param3 == null)
            {
                return this.blendMode != param5;
            }
            if (this.mTexture != null && param3 != null)
            {
                return this.mTexture.base != param3.base || this.mTexture.repeat != param3.repeat || this.mSmoothing != param4 || this.mTinted != (this.mForceTinted || param1 || param2 != 1) || this.blendMode != param5;
            }
            return true;
        }// end function

        public function transformQuad(param1:int, param2:Matrix) : void
        {
            this.mVertexData.transformVertex(param1 * 4, param2, 4);
            this.mSyncRequired = true;
            return;
        }// end function

        public function getVertexColor(param1:int, param2:int) : uint
        {
            return this.mVertexData.getColor(param1 * 4 + param2);
        }// end function

        public function setVertexColor(param1:int, param2:int, param3:uint) : void
        {
            this.mVertexData.setColor(param1 * 4 + param2, param3);
            this.mSyncRequired = true;
            return;
        }// end function

        public function getVertexAlpha(param1:int, param2:int) : Number
        {
            return this.mVertexData.getAlpha(param1 * 4 + param2);
        }// end function

        public function setVertexAlpha(param1:int, param2:int, param3:Number) : void
        {
            this.mVertexData.setAlpha(param1 * 4 + param2, param3);
            this.mSyncRequired = true;
            return;
        }// end function

        public function getQuadColor(param1:int) : uint
        {
            return this.mVertexData.getColor(param1 * 4);
        }// end function

        public function setQuadColor(param1:int, param2:uint) : void
        {
            var _loc_3:* = 0;
            while (_loc_3 < 4)
            {
                
                this.mVertexData.setColor(param1 * 4 + _loc_3, param2);
                _loc_3++;
            }
            this.mSyncRequired = true;
            return;
        }// end function

        public function getQuadAlpha(param1:int) : Number
        {
            return this.mVertexData.getAlpha(param1 * 4);
        }// end function

        public function setQuadAlpha(param1:int, param2:Number) : void
        {
            var _loc_3:* = 0;
            while (_loc_3 < 4)
            {
                
                this.mVertexData.setAlpha(param1 * 4 + _loc_3, param2);
                _loc_3++;
            }
            this.mSyncRequired = true;
            return;
        }// end function

        public function setQuad(param1:Number, param2:Quad) : void
        {
            var _loc_3:* = param2.transformationMatrix;
            var _loc_4:* = param2.alpha;
            var _loc_5:* = param1 * 4;
            param2.copyVertexDataTransformedTo(this.mVertexData, _loc_5, _loc_3);
            if (_loc_4 != 1)
            {
                this.mVertexData.scaleAlpha(_loc_5, _loc_4, 4);
            }
            this.mSyncRequired = true;
            return;
        }// end function

        public function getQuadBounds(param1:int, param2:Matrix = null, param3:Rectangle = null) : Rectangle
        {
            return this.mVertexData.getBounds(param2, param1 * 4, 4, param3);
        }// end function

        override public function getBounds(param1:DisplayObject, param2:Rectangle = null) : Rectangle
        {
            if (param2 == null)
            {
                param2 = new Rectangle();
            }
            var _loc_3:* = param1 == this ? (null) : (getTransformationMatrix(param1, sHelperMatrix));
            return this.mVertexData.getBounds(_loc_3, 0, this.mNumQuads * 4, param2);
        }// end function

        override public function render(param1:RenderSupport, param2:Number) : void
        {
            if (this.mNumQuads)
            {
                if (this.mBatchable)
                {
                    param1.batchQuadBatch(this, param2);
                }
                else
                {
                    param1.finishQuadBatch();
                    param1.raiseDrawCount();
                    this.renderCustom(param1.mvpMatrix3D, alpha * param2, param1.blendMode);
                }
            }
            return;
        }// end function

        public function get numQuads() : int
        {
            return this.mNumQuads;
        }// end function

        public function get tinted() : Boolean
        {
            return this.mTinted || this.mForceTinted;
        }// end function

        public function get texture() : Texture
        {
            return this.mTexture;
        }// end function

        public function get smoothing() : String
        {
            return this.mSmoothing;
        }// end function

        public function get premultipliedAlpha() : Boolean
        {
            return this.mVertexData.premultipliedAlpha;
        }// end function

        public function get batchable() : Boolean
        {
            return this.mBatchable;
        }// end function

        public function set batchable(param1:Boolean) : void
        {
            this.mBatchable = param1;
            return;
        }// end function

        public function get forceTinted() : Boolean
        {
            return this.mForceTinted;
        }// end function

        public function set forceTinted(param1:Boolean) : void
        {
            this.mForceTinted = param1;
            return;
        }// end function

        public function get ownsTexture() : Boolean
        {
            return this.mOwnsTexture;
        }// end function

        public function set ownsTexture(param1:Boolean) : void
        {
            this.mOwnsTexture = param1;
            return;
        }// end function

        public function get capacity() : int
        {
            return this.mVertexData.numVertices / 4;
        }// end function

        public function set capacity(param1:int) : void
        {
            var _loc_2:* = this.capacity;
            if (param1 == _loc_2)
            {
                return;
            }
            if (param1 == 0)
            {
                throw new Error("Capacity must be > 0");
            }
            if (param1 > MAX_NUM_QUADS)
            {
                param1 = MAX_NUM_QUADS;
            }
            if (this.mNumQuads > param1)
            {
                this.mNumQuads = param1;
            }
            this.mVertexData.numVertices = param1 * 4;
            this.mIndexData.length = param1 * 6;
            var _loc_3:* = _loc_2;
            while (_loc_3 < param1)
            {
                
                this.mIndexData[int(_loc_3 * 6)] = _loc_3 * 4;
                this.mIndexData[int(_loc_3 * 6 + 1)] = _loc_3 * 4 + 1;
                this.mIndexData[int(_loc_3 * 6 + 2)] = _loc_3 * 4 + 2;
                this.mIndexData[int(_loc_3 * 6 + 3)] = _loc_3 * 4 + 1;
                this.mIndexData[int(_loc_3 * 6 + 4)] = _loc_3 * 4 + 3;
                this.mIndexData[int(_loc_3 * 6 + 5)] = _loc_3 * 4 + 2;
                _loc_3++;
            }
            this.destroyBuffers();
            this.mSyncRequired = true;
            return;
        }// end function

        private function getProgram(param1:Boolean) : Program3D
        {
            var _loc_5:* = null;
            var _loc_6:* = null;
            var _loc_2:* = Starling.current;
            var _loc_3:* = QUAD_PROGRAM_NAME;
            if (this.mTexture)
            {
                _loc_3 = getImageProgramName(param1, this.mTexture.mipMapping, this.mTexture.repeat, this.mTexture.format, this.mSmoothing);
            }
            var _loc_4:* = _loc_2.getProgram(_loc_3);
            if (!_loc_2.getProgram(_loc_3))
            {
                if (!this.mTexture)
                {
                    _loc_5 = "m44 op, va0, vc1 \n" + "mul v0, va1, vc0 \n";
                    _loc_6 = "mov oc, v0       \n";
                }
                else
                {
                    _loc_5 = param1 ? ("m44 op, va0, vc1 \n" + "mul v0, va1, vc0 \n" + "mov v1, va2      \n") : ("m44 op, va0, vc1 \n" + "mov v1, va2      \n");
                    _loc_6 = param1 ? ("tex ft1,  v1, fs0 <???> \n" + "mul  oc, ft1,  v0       \n") : ("tex  oc,  v1, fs0 <???> \n");
                    _loc_6 = _loc_6.replace("<???>", RenderSupport.getTextureLookupFlags(this.mTexture.format, this.mTexture.mipMapping, this.mTexture.repeat, this.smoothing));
                }
                _loc_4 = _loc_2.registerProgramFromSource(_loc_3, _loc_5, _loc_6);
            }
            return _loc_4;
        }// end function

        public static function compile(param1:DisplayObject, param2:Vector.<QuadBatch>) : void
        {
            compileObject(param1, param2, -1, new Matrix());
            return;
        }// end function

        public static function optimize(param1:Vector.<QuadBatch>) : void
        {
            var _loc_2:* = null;
            var _loc_3:* = null;
            var _loc_5:* = 0;
            var _loc_4:* = 0;
            while (_loc_4 < param1.length)
            {
                
                _loc_2 = param1[_loc_4];
                _loc_5 = _loc_4 + 1;
                while (_loc_5 < param1.length)
                {
                    
                    _loc_3 = param1[_loc_5];
                    if (!_loc_2.isStateChange(_loc_3.tinted, 1, _loc_3.texture, _loc_3.smoothing, _loc_3.blendMode))
                    {
                        _loc_2.addQuadBatch(_loc_3);
                        _loc_3.dispose();
                        param1.splice(_loc_5, 1);
                        continue;
                    }
                    _loc_5++;
                }
                _loc_4++;
            }
            return;
        }// end function

        private static function compileObject(param1:DisplayObject, param2:Vector.<QuadBatch>, param3:int, param4:Matrix, param5:Number = 1, param6:String = null, param7:Boolean = false) : int
        {
            var _loc_8:* = 0;
            var _loc_9:* = null;
            var _loc_16:* = 0;
            var _loc_17:* = null;
            var _loc_18:* = null;
            var _loc_19:* = null;
            var _loc_20:* = null;
            var _loc_21:* = null;
            var _loc_22:* = false;
            var _loc_23:* = 0;
            var _loc_24:* = null;
            if (param1 is Sprite3D)
            {
                throw new IllegalOperationError("Sprite3D objects cannot be flattened");
            }
            var _loc_10:* = false;
            var _loc_11:* = param1.alpha;
            var _loc_12:* = param1 as DisplayObjectContainer;
            var _loc_13:* = param1 as Quad;
            var _loc_14:* = param1 as QuadBatch;
            var _loc_15:* = param1.filter;
            if (param3 == -1)
            {
                _loc_10 = true;
                param3 = 0;
                _loc_11 = 1;
                param6 = param1.blendMode;
                param7 = true;
                if (param2.length == 0)
                {
                    param2[0] = new QuadBatch;
                }
                else
                {
                    param2[0].reset();
                    param2[0].ownsTexture = false;
                }
            }
            else
            {
                if (param1.mask)
                {
                    trace("[Starling] Masks are ignored on children of a flattened sprite.");
                }
                if (param1 is Sprite && (param1 as Sprite).clipRect)
                {
                    trace("[Starling] ClipRects are ignored on children of a flattened sprite.");
                }
            }
            if (_loc_15 && !param7)
            {
                if (_loc_15.mode == FragmentFilterMode.ABOVE)
                {
                    param3 = compileObject(param1, param2, param3, param4, param5, param6, true);
                }
                param3 = compileObject(_loc_15.compile(param1), param2, param3, param4, param5, param6);
                param2[param3].ownsTexture = true;
                if (_loc_15.mode == FragmentFilterMode.BELOW)
                {
                    param3 = compileObject(param1, param2, param3, param4, param5, param6, true);
                }
            }
            else if (_loc_12)
            {
                _loc_16 = _loc_12.numChildren;
                _loc_17 = new Matrix();
                _loc_8 = 0;
                while (_loc_8 < _loc_16)
                {
                    
                    _loc_18 = _loc_12.getChildAt(_loc_8);
                    if (_loc_18.hasVisibleArea)
                    {
                        _loc_19 = _loc_18.blendMode == BlendMode.AUTO ? (param6) : (_loc_18.blendMode);
                        _loc_17.copyFrom(param4);
                        RenderSupport.transformMatrixForObject(_loc_17, _loc_18);
                        param3 = compileObject(_loc_18, param2, param3, _loc_17, param5 * _loc_11, _loc_19);
                    }
                    _loc_8++;
                }
            }
            else if (_loc_13 || _loc_14)
            {
                if (_loc_13)
                {
                    _loc_24 = _loc_13 as Image;
                    _loc_20 = _loc_24 ? (_loc_24.texture) : (null);
                    _loc_21 = _loc_24 ? (_loc_24.smoothing) : (null);
                    _loc_22 = _loc_13.tinted;
                    _loc_23 = 1;
                }
                else
                {
                    _loc_20 = _loc_14.mTexture;
                    _loc_21 = _loc_14.mSmoothing;
                    _loc_22 = _loc_14.mTinted;
                    _loc_23 = _loc_14.mNumQuads;
                }
                _loc_9 = param2[param3];
                if (_loc_9.isStateChange(_loc_22, param5 * _loc_11, _loc_20, _loc_21, param6, _loc_23))
                {
                    param3++;
                    if (param2.length <= param3)
                    {
                        param2.push(new QuadBatch);
                    }
                    _loc_9 = param2[param3];
                    _loc_9.reset();
                    _loc_9.ownsTexture = false;
                }
                if (_loc_13)
                {
                    _loc_9.addQuad(_loc_13, param5, _loc_20, _loc_21, param4, param6);
                }
                else
                {
                    _loc_9.addQuadBatch(_loc_14, param5, param4, param6);
                }
            }
            else
            {
                throw new Error("Unsupported display object: " + getQualifiedClassName(param1));
            }
            if (_loc_10)
            {
                _loc_8 = param2.length - 1;
                while (_loc_8 > param3)
                {
                    
                    param2.pop().dispose();
                    _loc_8 = _loc_8 - 1;
                }
            }
            return param3;
        }// end function

        private static function getImageProgramName(param1:Boolean, param2:Boolean = true, param3:Boolean = false, param4:String = "bgra", param5:String = "bilinear") : String
        {
            var _loc_6:* = 0;
            if (param1)
            {
                _loc_6 = _loc_6 | 1;
            }
            if (param2)
            {
                _loc_6 = _loc_6 | 1 << 1;
            }
            if (param3)
            {
                _loc_6 = _loc_6 | 1 << 2;
            }
            if (param5 == TextureSmoothing.NONE)
            {
                _loc_6 = _loc_6 | 1 << 3;
            }
            else if (param5 == TextureSmoothing.TRILINEAR)
            {
                _loc_6 = _loc_6 | 1 << 4;
            }
            if (param4 == Context3DTextureFormat.COMPRESSED)
            {
                _loc_6 = _loc_6 | 1 << 5;
            }
            else if (param4 == "compressedAlpha")
            {
                _loc_6 = _loc_6 | 1 << 6;
            }
            var _loc_7:* = sProgramNameCache[_loc_6];
            if (sProgramNameCache[_loc_6] == null)
            {
                _loc_7 = "QB_i." + _loc_6.toString(16);
                sProgramNameCache[_loc_6] = _loc_7;
            }
            return _loc_7;
        }// end function

        new Vector.<Number>(4)[0] = 1;
        new Vector.<Number>(4)[1] = 1;
        new Vector.<Number>(4)[2] = 1;
        new Vector.<Number>(4)[3] = 1;
    }
}
