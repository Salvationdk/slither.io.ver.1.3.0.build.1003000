package starling.core
{
    import __AS3__.vec.*;
    import com.adobe.utils.*;
    import flash.display3D.*;
    import flash.geom.*;
    import starling.display.*;
    import starling.errors.*;
    import starling.textures.*;
    import starling.utils.*;

    public class RenderSupport extends Object
    {
        private var mProjectionMatrix:Matrix;
        private var mModelViewMatrix:Matrix;
        private var mMvpMatrix:Matrix;
        private var mMatrixStack:Vector.<Matrix>;
        private var mMatrixStackSize:int;
        private var mProjectionMatrix3D:Matrix3D;
        private var mModelViewMatrix3D:Matrix3D;
        private var mMvpMatrix3D:Matrix3D;
        private var mMatrixStack3D:Vector.<Matrix3D>;
        private var mMatrixStack3DSize:int;
        private var mDrawCount:int;
        private var mBlendMode:String;
        private var mClipRectStack:Vector.<Rectangle>;
        private var mClipRectStackSize:int;
        private var mQuadBatches:Vector.<QuadBatch>;
        private var mCurrentQuadBatchID:int;
        private var mMasks:Vector.<DisplayObject>;
        private var mStencilReferenceValue:uint = 0;
        private static const RENDER_TARGET_NAME:String = "Starling.renderTarget";
        private static var sPoint:Point = new Point();
        private static var sPoint3D:Vector3D = new Vector3D();
        private static var sClipRect:Rectangle = new Rectangle();
        private static var sBufferRect:Rectangle = new Rectangle();
        private static var sScissorRect:Rectangle = new Rectangle();
        private static var sAssembler:AGALMiniAssembler = new AGALMiniAssembler();
        private static var sMatrix3D:Matrix3D = new Matrix3D();
        private static var sMatrixData:Vector.<Number> = new Vector.<Number>(16);

        public function RenderSupport()
        {
            this.mMasks = new Vector.<DisplayObject>(0);
            this.mProjectionMatrix = new Matrix();
            this.mModelViewMatrix = new Matrix();
            this.mMvpMatrix = new Matrix();
            this.mMatrixStack = new Vector.<Matrix>(0);
            this.mMatrixStackSize = 0;
            this.mProjectionMatrix3D = new Matrix3D();
            this.mModelViewMatrix3D = new Matrix3D();
            this.mMvpMatrix3D = new Matrix3D();
            this.mMatrixStack3D = new Vector.<Matrix3D>(0);
            this.mMatrixStack3DSize = 0;
            this.mDrawCount = 0;
            this.mBlendMode = BlendMode.NORMAL;
            this.mClipRectStack = new Vector.<Rectangle>(0);
            this.mCurrentQuadBatchID = 0;
            new Vector.<QuadBatch>(1)[0] = this.createQuadBatch();
            this.mQuadBatches = new Vector.<QuadBatch>(1);
            this.loadIdentity();
            this.setProjectionMatrix(0, 0, 400, 300);
            return;
        }// end function

        public function dispose() : void
        {
            var _loc_1:* = null;
            for each (_loc_1 in this.mQuadBatches)
            {
                
                _loc_1.dispose();
            }
            return;
        }// end function

        public function setProjectionMatrix(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number = 0, param6:Number = 0, param7:Vector3D = null) : void
        {
            var _loc_8:* = NaN;
            if (param5 <= 0)
            {
                param5 = param3;
            }
            if (param6 <= 0)
            {
                param6 = param4;
            }
            if (param7 == null)
            {
                param7 = sPoint3D;
                param7.setTo(param5 / 2, param6 / 2, param5 / Math.tan(0.5) * 0.5);
            }
            this.mProjectionMatrix.setTo(2 / param3, 0, 0, -2 / param4, (-(2 * param1 + param3)) / param3, (2 * param2 + param4) / param4);
            _loc_8 = Math.abs(param7.z);
            var _loc_9:* = param7.x - param5 / 2;
            var _loc_10:* = param7.y - param6 / 2;
            var _loc_11:* = _loc_8 * 20;
            var _loc_12:* = 1;
            var _loc_13:* = param5 / param3;
            var _loc_14:* = param6 / param4;
            sMatrixData[0] = 2 * _loc_8 / param5;
            sMatrixData[5] = -2 * _loc_8 / param6;
            sMatrixData[10] = _loc_11 / (_loc_11 - _loc_12);
            sMatrixData[14] = (-_loc_11) * _loc_12 / (_loc_11 - _loc_12);
            sMatrixData[11] = 1;
            sMatrixData[0] = sMatrixData[0] * _loc_13;
            sMatrixData[5] = sMatrixData[5] * _loc_14;
            sMatrixData[8] = (_loc_13 - 1) - 2 * _loc_13 * (param1 - _loc_9) / param5;
            sMatrixData[9] = -_loc_14 + 1 + 2 * _loc_14 * (param2 - _loc_10) / param6;
            this.mProjectionMatrix3D.copyRawDataFrom(sMatrixData);
            this.mProjectionMatrix3D.prependTranslation((-param5) / 2 - _loc_9, (-param6) / 2 - _loc_10, _loc_8);
            this.applyClipRect();
            return;
        }// end function

        public function setOrthographicProjection(param1:Number, param2:Number, param3:Number, param4:Number) : void
        {
            var _loc_5:* = Starling.current.stage;
            sClipRect.setTo(param1, param2, param3, param4);
            this.setProjectionMatrix(param1, param2, param3, param4, _loc_5.stageWidth, _loc_5.stageHeight, _loc_5.cameraPosition);
            return;
        }// end function

        public function loadIdentity() : void
        {
            this.mModelViewMatrix.identity();
            this.mModelViewMatrix3D.identity();
            return;
        }// end function

        public function translateMatrix(param1:Number, param2:Number) : void
        {
            MatrixUtil.prependTranslation(this.mModelViewMatrix, param1, param2);
            return;
        }// end function

        public function rotateMatrix(param1:Number) : void
        {
            MatrixUtil.prependRotation(this.mModelViewMatrix, param1);
            return;
        }// end function

        public function scaleMatrix(param1:Number, param2:Number) : void
        {
            MatrixUtil.prependScale(this.mModelViewMatrix, param1, param2);
            return;
        }// end function

        public function prependMatrix(param1:Matrix) : void
        {
            MatrixUtil.prependMatrix(this.mModelViewMatrix, param1);
            return;
        }// end function

        public function transformMatrix(param1:DisplayObject) : void
        {
            MatrixUtil.prependMatrix(this.mModelViewMatrix, param1.transformationMatrix);
            return;
        }// end function

        public function pushMatrix() : void
        {
            if (this.mMatrixStack.length < (this.mMatrixStackSize + 1))
            {
                this.mMatrixStack.push(new Matrix());
            }
            var _loc_1:* = this;
            _loc_1.mMatrixStackSize = this.mMatrixStackSize + 1;
            this.mMatrixStack[int(this.mMatrixStackSize++)].copyFrom(this.mModelViewMatrix);
            return;
        }// end function

        public function popMatrix() : void
        {
            var _loc_1:* = this;
            this.mMatrixStackSize = (this.mMatrixStackSize - 1);
            _loc_1.mMatrixStackSize = this.mMatrixStackSize - 1;
            this.mModelViewMatrix.copyFrom(this.mMatrixStack[int(this.mMatrixStackSize)]);
            return;
        }// end function

        public function resetMatrix() : void
        {
            this.mMatrixStackSize = 0;
            this.mMatrixStack3DSize = 0;
            this.loadIdentity();
            return;
        }// end function

        public function get mvpMatrix() : Matrix
        {
            this.mMvpMatrix.copyFrom(this.mModelViewMatrix);
            this.mMvpMatrix.concat(this.mProjectionMatrix);
            return this.mMvpMatrix;
        }// end function

        public function get modelViewMatrix() : Matrix
        {
            return this.mModelViewMatrix;
        }// end function

        public function get projectionMatrix() : Matrix
        {
            return this.mProjectionMatrix;
        }// end function

        public function set projectionMatrix(param1:Matrix) : void
        {
            this.mProjectionMatrix.copyFrom(param1);
            this.applyClipRect();
            return;
        }// end function

        public function transformMatrix3D(param1:DisplayObject) : void
        {
            this.mModelViewMatrix3D.prepend(MatrixUtil.convertTo3D(this.mModelViewMatrix, sMatrix3D));
            this.mModelViewMatrix3D.prepend(param1.transformationMatrix3D);
            this.mModelViewMatrix.identity();
            return;
        }// end function

        public function pushMatrix3D() : void
        {
            if (this.mMatrixStack3D.length < (this.mMatrixStack3DSize + 1))
            {
                this.mMatrixStack3D.push(new Matrix3D());
            }
            var _loc_1:* = this;
            _loc_1.mMatrixStack3DSize = this.mMatrixStack3DSize + 1;
            this.mMatrixStack3D[int(this.mMatrixStack3DSize++)].copyFrom(this.mModelViewMatrix3D);
            return;
        }// end function

        public function popMatrix3D() : void
        {
            var _loc_1:* = this;
            this.mMatrixStack3DSize = (this.mMatrixStack3DSize - 1);
            _loc_1.mMatrixStack3DSize = this.mMatrixStack3DSize - 1;
            this.mModelViewMatrix3D.copyFrom(this.mMatrixStack3D[int(this.mMatrixStack3DSize)]);
            return;
        }// end function

        public function get mvpMatrix3D() : Matrix3D
        {
            if (this.mMatrixStack3DSize == 0)
            {
                MatrixUtil.convertTo3D(this.mvpMatrix, this.mMvpMatrix3D);
            }
            else
            {
                this.mMvpMatrix3D.copyFrom(this.mProjectionMatrix3D);
                this.mMvpMatrix3D.prepend(this.mModelViewMatrix3D);
                this.mMvpMatrix3D.prepend(MatrixUtil.convertTo3D(this.mModelViewMatrix, sMatrix3D));
            }
            return this.mMvpMatrix3D;
        }// end function

        public function get projectionMatrix3D() : Matrix3D
        {
            return this.mProjectionMatrix3D;
        }// end function

        public function set projectionMatrix3D(param1:Matrix3D) : void
        {
            this.mProjectionMatrix3D.copyFrom(param1);
            return;
        }// end function

        public function applyBlendMode(param1:Boolean) : void
        {
            setBlendFactors(param1, this.mBlendMode);
            return;
        }// end function

        public function get blendMode() : String
        {
            return this.mBlendMode;
        }// end function

        public function set blendMode(param1:String) : void
        {
            if (param1 != BlendMode.AUTO)
            {
                this.mBlendMode = param1;
            }
            return;
        }// end function

        public function get renderTarget() : Texture
        {
            return Starling.current.contextData[RENDER_TARGET_NAME];
        }// end function

        public function set renderTarget(param1:Texture) : void
        {
            this.setRenderTarget(param1);
            return;
        }// end function

        public function setRenderTarget(param1:Texture, param2:int = 0) : void
        {
            Starling.current.contextData[RENDER_TARGET_NAME] = param1;
            this.applyClipRect();
            if (param1)
            {
                Starling.context.setRenderToTexture(param1.base, SystemUtil.supportsDepthAndStencil, param2);
            }
            else
            {
                Starling.context.setRenderToBackBuffer();
            }
            return;
        }// end function

        public function pushClipRect(param1:Rectangle, param2:Boolean = true) : Rectangle
        {
            if (this.mClipRectStack.length < (this.mClipRectStackSize + 1))
            {
                this.mClipRectStack.push(new Rectangle());
            }
            this.mClipRectStack[this.mClipRectStackSize].copyFrom(param1);
            param1 = this.mClipRectStack[this.mClipRectStackSize];
            if (param2 && this.mClipRectStackSize > 0)
            {
                RectangleUtil.intersect(param1, this.mClipRectStack[(this.mClipRectStackSize - 1)], param1);
            }
            var _loc_3:* = this;
            var _loc_4:* = this.mClipRectStackSize + 1;
            _loc_3.mClipRectStackSize = _loc_4;
            this.applyClipRect();
            return param1;
        }// end function

        public function popClipRect() : void
        {
            if (this.mClipRectStackSize > 0)
            {
                var _loc_1:* = this;
                var _loc_2:* = this.mClipRectStackSize - 1;
                _loc_1.mClipRectStackSize = _loc_2;
                this.applyClipRect();
            }
            return;
        }// end function

        public function applyClipRect() : void
        {
            var _loc_2:* = 0;
            var _loc_3:* = 0;
            var _loc_4:* = null;
            var _loc_5:* = null;
            this.finishQuadBatch();
            var _loc_1:* = Starling.context;
            if (_loc_1 == null)
            {
                return;
            }
            if (this.mClipRectStackSize > 0)
            {
                _loc_4 = this.mClipRectStack[(this.mClipRectStackSize - 1)];
                _loc_5 = this.renderTarget;
                if (_loc_5)
                {
                    _loc_2 = _loc_5.root.nativeWidth;
                    _loc_3 = _loc_5.root.nativeHeight;
                }
                else
                {
                    _loc_2 = Starling.current.backBufferWidth;
                    _loc_3 = Starling.current.backBufferHeight;
                }
                MatrixUtil.transformCoords(this.mProjectionMatrix, _loc_4.x, _loc_4.y, sPoint);
                sClipRect.x = (sPoint.x * 0.5 + 0.5) * _loc_2;
                sClipRect.y = (0.5 - sPoint.y * 0.5) * _loc_3;
                MatrixUtil.transformCoords(this.mProjectionMatrix, _loc_4.right, _loc_4.bottom, sPoint);
                sClipRect.right = (sPoint.x * 0.5 + 0.5) * _loc_2;
                sClipRect.bottom = (0.5 - sPoint.y * 0.5) * _loc_3;
                sBufferRect.setTo(0, 0, _loc_2, _loc_3);
                RectangleUtil.intersect(sClipRect, sBufferRect, sScissorRect);
                if (sScissorRect.width < 1 || sScissorRect.height < 1)
                {
                    sScissorRect.setTo(0, 0, 1, 1);
                }
                _loc_1.setScissorRectangle(sScissorRect);
            }
            else
            {
                _loc_1.setScissorRectangle(null);
            }
            return;
        }// end function

        public function pushMask(param1:DisplayObject) : void
        {
            this.mMasks[this.mMasks.length] = param1;
            var _loc_3:* = this;
            var _loc_4:* = this.mStencilReferenceValue + 1;
            _loc_3.mStencilReferenceValue = _loc_4;
            var _loc_2:* = Starling.context;
            if (_loc_2 == null)
            {
                return;
            }
            this.finishQuadBatch();
            _loc_2.setStencilActions(Context3DTriangleFace.FRONT_AND_BACK, Context3DCompareMode.EQUAL, Context3DStencilAction.INCREMENT_SATURATE);
            this.drawMask(param1);
            _loc_2.setStencilReferenceValue(this.mStencilReferenceValue);
            _loc_2.setStencilActions(Context3DTriangleFace.FRONT_AND_BACK, Context3DCompareMode.EQUAL, Context3DStencilAction.KEEP);
            return;
        }// end function

        public function popMask() : void
        {
            var _loc_1:* = this.mMasks.pop();
            var _loc_3:* = this;
            var _loc_4:* = this.mStencilReferenceValue - 1;
            _loc_3.mStencilReferenceValue = _loc_4;
            var _loc_2:* = Starling.context;
            if (_loc_2 == null)
            {
                return;
            }
            this.finishQuadBatch();
            _loc_2.setStencilActions(Context3DTriangleFace.FRONT_AND_BACK, Context3DCompareMode.EQUAL, Context3DStencilAction.DECREMENT_SATURATE);
            this.drawMask(_loc_1);
            _loc_2.setStencilReferenceValue(this.mStencilReferenceValue);
            _loc_2.setStencilActions(Context3DTriangleFace.FRONT_AND_BACK, Context3DCompareMode.EQUAL, Context3DStencilAction.KEEP);
            return;
        }// end function

        private function drawMask(param1:DisplayObject) : void
        {
            this.pushMatrix();
            var _loc_2:* = param1.stage;
            if (_loc_2)
            {
                param1.getTransformationMatrix(_loc_2, this.mModelViewMatrix);
            }
            else
            {
                this.transformMatrix(param1);
            }
            param1.render(this, 0);
            this.finishQuadBatch();
            this.popMatrix();
            return;
        }// end function

        public function get stencilReferenceValue() : uint
        {
            return this.mStencilReferenceValue;
        }// end function

        public function set stencilReferenceValue(param1:uint) : void
        {
            this.mStencilReferenceValue = param1;
            if (Starling.current.contextValid)
            {
                Starling.context.setStencilReferenceValue(param1);
            }
            return;
        }// end function

        public function batchQuad(param1:Quad, param2:Number, param3:Texture = null, param4:String = null) : void
        {
            if (this.mQuadBatches[this.mCurrentQuadBatchID].isStateChange(param1.tinted, param2, param3, param4, this.mBlendMode))
            {
                this.finishQuadBatch();
            }
            this.mQuadBatches[this.mCurrentQuadBatchID].addQuad(param1, param2, param3, param4, this.mModelViewMatrix, this.mBlendMode);
            return;
        }// end function

        public function batchQuadBatch(param1:QuadBatch, param2:Number) : void
        {
            if (this.mQuadBatches[this.mCurrentQuadBatchID].isStateChange(param1.tinted, param2, param1.texture, param1.smoothing, this.mBlendMode))
            {
                this.finishQuadBatch();
            }
            this.mQuadBatches[this.mCurrentQuadBatchID].addQuadBatch(param1, param2, this.mModelViewMatrix, this.mBlendMode);
            return;
        }// end function

        public function finishQuadBatch() : void
        {
            var _loc_1:* = this.mQuadBatches[this.mCurrentQuadBatchID];
            if (_loc_1.numQuads != 0)
            {
                if (this.mMatrixStack3DSize == 0)
                {
                    _loc_1.renderCustom(this.mProjectionMatrix3D);
                }
                else
                {
                    this.mMvpMatrix3D.copyFrom(this.mProjectionMatrix3D);
                    this.mMvpMatrix3D.prepend(this.mModelViewMatrix3D);
                    _loc_1.renderCustom(this.mMvpMatrix3D);
                }
                _loc_1.reset();
                var _loc_2:* = this;
                var _loc_3:* = this.mCurrentQuadBatchID + 1;
                _loc_2.mCurrentQuadBatchID = _loc_3;
                var _loc_2:* = this;
                var _loc_3:* = this.mDrawCount + 1;
                _loc_2.mDrawCount = _loc_3;
                if (this.mQuadBatches.length <= this.mCurrentQuadBatchID)
                {
                    this.mQuadBatches.push(this.createQuadBatch());
                }
            }
            return;
        }// end function

        public function nextFrame() : void
        {
            this.resetMatrix();
            this.trimQuadBatches();
            this.mMasks.length = 0;
            this.mCurrentQuadBatchID = 0;
            this.mBlendMode = BlendMode.NORMAL;
            this.mDrawCount = 0;
            return;
        }// end function

        private function trimQuadBatches() : void
        {
            var _loc_3:* = 0;
            var _loc_4:* = 0;
            var _loc_1:* = this.mCurrentQuadBatchID + 1;
            var _loc_2:* = this.mQuadBatches.length;
            if (_loc_2 >= 16 && _loc_2 > 2 * _loc_1)
            {
                _loc_3 = _loc_2 - _loc_1;
                _loc_4 = 0;
                while (_loc_4 < _loc_3)
                {
                    
                    this.mQuadBatches.pop().dispose();
                    _loc_4++;
                }
            }
            return;
        }// end function

        private function createQuadBatch() : QuadBatch
        {
            var _loc_1:* = Starling.current.profile;
            var _loc_2:* = _loc_1 != "baselineConstrained" && _loc_1 != "baseline";
            var _loc_3:* = new QuadBatch();
            _loc_3.forceTinted = _loc_2;
            return _loc_3;
        }// end function

        public function clear(param1:uint = 0, param2:Number = 0) : void
        {
            RenderSupport.clear(param1, param2);
            return;
        }// end function

        public function raiseDrawCount(param1:uint = 1) : void
        {
            this.mDrawCount = this.mDrawCount + param1;
            return;
        }// end function

        public function get drawCount() : int
        {
            return this.mDrawCount;
        }// end function

        public static function transformMatrixForObject(param1:Matrix, param2:DisplayObject) : void
        {
            MatrixUtil.prependMatrix(param1, param2.transformationMatrix);
            return;
        }// end function

        public static function setDefaultBlendFactors(param1:Boolean) : void
        {
            setBlendFactors(param1);
            return;
        }// end function

        public static function setBlendFactors(param1:Boolean, param2:String = "normal") : void
        {
            var _loc_3:* = BlendMode.getBlendFactors(param2, param1);
            Starling.context.setBlendFactors(_loc_3[0], _loc_3[1]);
            return;
        }// end function

        public static function clear(param1:uint = 0, param2:Number = 0) : void
        {
            Starling.context.clear(Color.getRed(param1) / 255, Color.getGreen(param1) / 255, Color.getBlue(param1) / 255, param2);
            return;
        }// end function

        public static function assembleAgal(param1:String, param2:String, param3:Program3D = null) : Program3D
        {
            var _loc_4:* = null;
            if (param3 == null)
            {
                _loc_4 = Starling.context;
                if (_loc_4 == null)
                {
                    throw new MissingContextError();
                }
                param3 = _loc_4.createProgram();
            }
            param3.upload(sAssembler.assemble(Context3DProgramType.VERTEX, param1), sAssembler.assemble(Context3DProgramType.FRAGMENT, param2));
            return param3;
        }// end function

        public static function getTextureLookupFlags(param1:String, param2:Boolean, param3:Boolean = false, param4:String = "bilinear") : String
        {
            var _loc_5:* = ["2d", param3 ? ("repeat") : ("clamp")];
            if (param1 == Context3DTextureFormat.COMPRESSED)
            {
                _loc_5.push("dxt1");
            }
            else if (param1 == "compressedAlpha")
            {
                _loc_5.push("dxt5");
            }
            if (param4 == TextureSmoothing.NONE)
            {
                _loc_5.push("nearest", param2 ? ("mipnearest") : ("mipnone"));
            }
            else if (param4 == TextureSmoothing.BILINEAR)
            {
                _loc_5.push("linear", param2 ? ("mipnearest") : ("mipnone"));
            }
            else
            {
                _loc_5.push("linear", param2 ? ("miplinear") : ("mipnone"));
            }
            return "<" + _loc_5.join() + ">";
        }// end function

        new Vector.<Number>(16)[0] = 0;
        new Vector.<Number>(16)[1] = 0;
        new Vector.<Number>(16)[2] = 0;
        new Vector.<Number>(16)[3] = 0;
        new Vector.<Number>(16)[4] = 0;
        new Vector.<Number>(16)[5] = 0;
        new Vector.<Number>(16)[6] = 0;
        new Vector.<Number>(16)[7] = 0;
        new Vector.<Number>(16)[8] = 0;
        new Vector.<Number>(16)[9] = 0;
        new Vector.<Number>(16)[10] = 0;
        new Vector.<Number>(16)[11] = 0;
        new Vector.<Number>(16)[12] = 0;
        new Vector.<Number>(16)[13] = 0;
        new Vector.<Number>(16)[14] = 0;
        new Vector.<Number>(16)[15] = 0;
    }
}
