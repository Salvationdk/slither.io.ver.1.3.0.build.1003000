package com.adobe.utils
{
    import flash.display3D.*;
    import flash.utils.*;

    public class AGALMiniAssembler extends Object
    {
        private var _agalcode:ByteArray = null;
        private var _error:String = "";
        private var debugEnabled:Boolean = false;
        public var verbose:Boolean = false;
        static const REGEXP_OUTER_SPACES:RegExp = /^\s+|\s+$/g;
        private static var initialized:Boolean = false;
        private static const OPMAP:Dictionary = new Dictionary();
        private static const REGMAP:Dictionary = new Dictionary();
        private static const SAMPLEMAP:Dictionary = new Dictionary();
        private static const MAX_NESTING:int = 4;
        private static const MAX_OPCODES:int = 2048;
        private static const FRAGMENT:String = "fragment";
        private static const VERTEX:String = "vertex";
        private static const SAMPLER_TYPE_SHIFT:uint = 8;
        private static const SAMPLER_DIM_SHIFT:uint = 12;
        private static const SAMPLER_SPECIAL_SHIFT:uint = 16;
        private static const SAMPLER_REPEAT_SHIFT:uint = 20;
        private static const SAMPLER_MIPMAP_SHIFT:uint = 24;
        private static const SAMPLER_FILTER_SHIFT:uint = 28;
        private static const REG_WRITE:uint = 1;
        private static const REG_READ:uint = 2;
        private static const REG_FRAG:uint = 32;
        private static const REG_VERT:uint = 64;
        private static const OP_SCALAR:uint = 1;
        private static const OP_SPECIAL_TEX:uint = 8;
        private static const OP_SPECIAL_MATRIX:uint = 16;
        private static const OP_FRAG_ONLY:uint = 32;
        private static const OP_VERT_ONLY:uint = 64;
        private static const OP_NO_DEST:uint = 128;
        private static const OP_VERSION2:uint = 256;
        private static const OP_INCNEST:uint = 512;
        private static const OP_DECNEST:uint = 1024;
        private static const MOV:String = "mov";
        private static const ADD:String = "add";
        private static const SUB:String = "sub";
        private static const MUL:String = "mul";
        private static const DIV:String = "div";
        private static const RCP:String = "rcp";
        private static const MIN:String = "min";
        private static const MAX:String = "max";
        private static const FRC:String = "frc";
        private static const SQT:String = "sqt";
        private static const RSQ:String = "rsq";
        private static const POW:String = "pow";
        private static const LOG:String = "log";
        private static const EXP:String = "exp";
        private static const NRM:String = "nrm";
        private static const SIN:String = "sin";
        private static const COS:String = "cos";
        private static const CRS:String = "crs";
        private static const DP3:String = "dp3";
        private static const DP4:String = "dp4";
        private static const ABS:String = "abs";
        private static const NEG:String = "neg";
        private static const SAT:String = "sat";
        private static const M33:String = "m33";
        private static const M44:String = "m44";
        private static const M34:String = "m34";
        private static const DDX:String = "ddx";
        private static const DDY:String = "ddy";
        private static const IFE:String = "ife";
        private static const INE:String = "ine";
        private static const IFG:String = "ifg";
        private static const IFL:String = "ifl";
        private static const ELS:String = "els";
        private static const EIF:String = "eif";
        private static const TED:String = "ted";
        private static const KIL:String = "kil";
        private static const TEX:String = "tex";
        private static const SGE:String = "sge";
        private static const SLT:String = "slt";
        private static const SGN:String = "sgn";
        private static const SEQ:String = "seq";
        private static const SNE:String = "sne";
        private static const VA:String = "va";
        private static const VC:String = "vc";
        private static const VT:String = "vt";
        private static const VO:String = "vo";
        private static const VI:String = "vi";
        private static const FC:String = "fc";
        private static const FT:String = "ft";
        private static const FS:String = "fs";
        private static const FO:String = "fo";
        private static const FD:String = "fd";
        private static const D2:String = "2d";
        private static const D3:String = "3d";
        private static const CUBE:String = "cube";
        private static const MIPNEAREST:String = "mipnearest";
        private static const MIPLINEAR:String = "miplinear";
        private static const MIPNONE:String = "mipnone";
        private static const NOMIP:String = "nomip";
        private static const NEAREST:String = "nearest";
        private static const LINEAR:String = "linear";
        private static const ANISOTROPIC2X:String = "anisotropic2x";
        private static const ANISOTROPIC4X:String = "anisotropic4x";
        private static const ANISOTROPIC8X:String = "anisotropic8x";
        private static const ANISOTROPIC16X:String = "anisotropic16x";
        private static const CENTROID:String = "centroid";
        private static const SINGLE:String = "single";
        private static const IGNORESAMPLER:String = "ignoresampler";
        private static const REPEAT:String = "repeat";
        private static const WRAP:String = "wrap";
        private static const CLAMP:String = "clamp";
        private static const REPEAT_U_CLAMP_V:String = "repeat_u_clamp_v";
        private static const CLAMP_U_REPEAT_V:String = "clamp_u_repeat_v";
        private static const RGBA:String = "rgba";
        private static const DXT1:String = "dxt1";
        private static const DXT5:String = "dxt5";
        private static const VIDEO:String = "video";

        public function AGALMiniAssembler(param1:Boolean = false) : void
        {
            this.debugEnabled = param1;
            if (!initialized)
            {
                init();
            }
            return;
        }// end function

        public function get error() : String
        {
            return this._error;
        }// end function

        public function get agalcode() : ByteArray
        {
            return this._agalcode;
        }// end function

        public function assemble2(param1:Context3D, param2:uint, param3:String, param4:String) : Program3D
        {
            var _loc_5:* = this.assemble(VERTEX, param3, param2);
            var _loc_6:* = this.assemble(FRAGMENT, param4, param2);
            var _loc_7:* = param1.createProgram();
            _loc_7.upload(_loc_5, _loc_6);
            return _loc_7;
        }// end function

        public function assemble(param1:String, param2:String, param3:uint = 1, param4:Boolean = false) : ByteArray
        {
            var _loc_10:* = 0;
            var _loc_12:* = null;
            var _loc_13:* = 0;
            var _loc_14:* = 0;
            var _loc_15:* = null;
            var _loc_16:* = null;
            var _loc_17:* = null;
            var _loc_18:* = null;
            var _loc_19:* = false;
            var _loc_20:* = 0;
            var _loc_21:* = 0;
            var _loc_22:* = 0;
            var _loc_23:* = false;
            var _loc_24:* = null;
            var _loc_25:* = null;
            var _loc_26:* = null;
            var _loc_27:* = null;
            var _loc_28:* = 0;
            var _loc_29:* = 0;
            var _loc_30:* = null;
            var _loc_31:* = false;
            var _loc_32:* = false;
            var _loc_33:* = 0;
            var _loc_34:* = 0;
            var _loc_35:* = 0;
            var _loc_36:* = 0;
            var _loc_37:* = 0;
            var _loc_38:* = 0;
            var _loc_39:* = null;
            var _loc_40:* = null;
            var _loc_41:* = null;
            var _loc_42:* = null;
            var _loc_43:* = 0;
            var _loc_44:* = 0;
            var _loc_45:* = NaN;
            var _loc_46:* = null;
            var _loc_47:* = null;
            var _loc_48:* = 0;
            var _loc_49:* = 0;
            var _loc_50:* = null;
            var _loc_5:* = getTimer();
            this._agalcode = new ByteArray();
            this._error = "";
            var _loc_6:* = false;
            if (param1 == FRAGMENT)
            {
                _loc_6 = true;
            }
            else if (param1 != VERTEX)
            {
                this._error = "ERROR: mode needs to be \"" + FRAGMENT + "\" or \"" + VERTEX + "\" but is \"" + param1 + "\".";
            }
            this.agalcode.endian = Endian.LITTLE_ENDIAN;
            this.agalcode.writeByte(160);
            this.agalcode.writeUnsignedInt(param3);
            this.agalcode.writeByte(161);
            this.agalcode.writeByte(_loc_6 ? (1) : (0));
            this.initregmap(param3, param4);
            var _loc_7:* = param2.replace(/[\f\n\r\v]+/g, "\n").split("\n");
            var _loc_8:* = 0;
            var _loc_9:* = 0;
            var _loc_11:* = _loc_7.length;
            _loc_10 = 0;
            while (_loc_10 < _loc_11 && this._error == "")
            {
                
                _loc_12 = new String(_loc_7[_loc_10]);
                _loc_12 = _loc_12.replace(REGEXP_OUTER_SPACES, "");
                _loc_13 = _loc_12.search("//");
                if (_loc_13 != -1)
                {
                    _loc_12 = _loc_12.slice(0, _loc_13);
                }
                _loc_14 = _loc_12.search(/<.*>/g);
                if (_loc_14 != -1)
                {
                    _loc_15 = _loc_12.slice(_loc_14).match(/([\w\.\-\+]+)/gi);
                    _loc_12 = _loc_12.slice(0, _loc_14);
                }
                _loc_16 = _loc_12.match(/^\w{3}/ig);
                if (!_loc_16)
                {
                    if (_loc_12.length >= 3)
                    {
                        trace("warning: bad line " + _loc_10 + ": " + _loc_7[_loc_10]);
                    }
                }
                else
                {
                    _loc_17 = OPMAP[_loc_16[0]];
                    if (this.debugEnabled)
                    {
                        trace(_loc_17);
                    }
                    if (_loc_17 == null)
                    {
                        if (_loc_12.length >= 3)
                        {
                            trace("warning: bad line " + _loc_10 + ": " + _loc_7[_loc_10]);
                        }
                    }
                    else
                    {
                        _loc_12 = _loc_12.slice(_loc_12.search(_loc_17.name) + _loc_17.name.length);
                        if (_loc_17.flags & OP_VERSION2 && param3 < 2)
                        {
                            this._error = "error: opcode requires version 2.";
                            break;
                        }
                        if (_loc_17.flags & OP_VERT_ONLY && _loc_6)
                        {
                            this._error = "error: opcode is only allowed in vertex programs.";
                            break;
                        }
                        if (_loc_17.flags & OP_FRAG_ONLY && !_loc_6)
                        {
                            this._error = "error: opcode is only allowed in fragment programs.";
                            break;
                        }
                        if (this.verbose)
                        {
                            trace("emit opcode=" + _loc_17);
                        }
                        this.agalcode.writeUnsignedInt(_loc_17.emitCode);
                        _loc_9++;
                        if (_loc_9 > MAX_OPCODES)
                        {
                            this._error = "error: too many opcodes. maximum is " + MAX_OPCODES + ".";
                            break;
                        }
                        _loc_18 = _loc_12.match(/vc\[([vof][acostdip]?)(\d*)?(\.[xyzw](\+\d{1,3})?)?\](\.[xyzw]{1,4})?|([vof][acostdip]?)(\d*)?(\.[xyzw]{1,4})?/gi);
                        if (!_loc_18 || _loc_18.length != _loc_17.numRegister)
                        {
                            this._error = "error: wrong number of operands. found " + _loc_18.length + " but expected " + _loc_17.numRegister + ".";
                            break;
                        }
                        _loc_19 = false;
                        _loc_20 = 64 + 64 + 32;
                        _loc_21 = _loc_18.length;
                        _loc_22 = 0;
                        while (_loc_22 < _loc_21)
                        {
                            
                            _loc_23 = false;
                            _loc_24 = _loc_18[_loc_22].match(/\[.*\]/ig);
                            if (_loc_24 && _loc_24.length > 0)
                            {
                                _loc_18[_loc_22] = _loc_18[_loc_22].replace(_loc_24[0], "0");
                                if (this.verbose)
                                {
                                    trace("IS REL");
                                }
                                _loc_23 = true;
                            }
                            _loc_25 = _loc_18[_loc_22].match(/^\b[A-Za-z]{1,2}/ig);
                            if (!_loc_25)
                            {
                                this._error = "error: could not parse operand " + _loc_22 + " (" + _loc_18[_loc_22] + ").";
                                _loc_19 = true;
                                break;
                            }
                            _loc_26 = REGMAP[_loc_25[0]];
                            if (this.debugEnabled)
                            {
                                trace(_loc_26);
                            }
                            if (_loc_26 == null)
                            {
                                this._error = "error: could not find register name for operand " + _loc_22 + " (" + _loc_18[_loc_22] + ").";
                                _loc_19 = true;
                                break;
                            }
                            if (_loc_6)
                            {
                                if (!(_loc_26.flags & REG_FRAG))
                                {
                                    this._error = "error: register operand " + _loc_22 + " (" + _loc_18[_loc_22] + ") only allowed in vertex programs.";
                                    _loc_19 = true;
                                    break;
                                }
                                if (_loc_23)
                                {
                                    this._error = "error: register operand " + _loc_22 + " (" + _loc_18[_loc_22] + ") relative adressing not allowed in fragment programs.";
                                    _loc_19 = true;
                                    break;
                                }
                            }
                            else if (!(_loc_26.flags & REG_VERT))
                            {
                                this._error = "error: register operand " + _loc_22 + " (" + _loc_18[_loc_22] + ") only allowed in fragment programs.";
                                _loc_19 = true;
                                break;
                            }
                            _loc_18[_loc_22] = _loc_18[_loc_22].slice(_loc_18[_loc_22].search(_loc_26.name) + _loc_26.name.length);
                            _loc_27 = _loc_23 ? (_loc_24[0].match(/\d+/)) : (_loc_18[_loc_22].match(/\d+/));
                            _loc_28 = 0;
                            if (_loc_27)
                            {
                                _loc_28 = uint(_loc_27[0]);
                            }
                            if (_loc_26.range < _loc_28)
                            {
                                this._error = "error: register operand " + _loc_22 + " (" + _loc_18[_loc_22] + ") index exceeds limit of " + (_loc_26.range + 1) + ".";
                                _loc_19 = true;
                                break;
                            }
                            _loc_29 = 0;
                            _loc_30 = _loc_18[_loc_22].match(/(\.[xyzw]{1,4})/);
                            _loc_31 = _loc_22 == 0 && !(_loc_17.flags & OP_NO_DEST);
                            _loc_32 = _loc_22 == 2 && _loc_17.flags & OP_SPECIAL_TEX;
                            _loc_33 = 0;
                            _loc_34 = 0;
                            _loc_35 = 0;
                            if (_loc_31 && _loc_23)
                            {
                                this._error = "error: relative can not be destination";
                                _loc_19 = true;
                                break;
                            }
                            if (_loc_30)
                            {
                                _loc_29 = 0;
                                _loc_37 = _loc_30[0].length;
                                _loc_38 = 1;
                                while (_loc_38 < _loc_37)
                                {
                                    
                                    _loc_36 = _loc_30[0].charCodeAt(_loc_38) - "x".charCodeAt(0);
                                    if (_loc_36 > 2)
                                    {
                                        _loc_36 = 3;
                                    }
                                    if (_loc_31)
                                    {
                                        _loc_29 = _loc_29 | 1 << _loc_36;
                                    }
                                    else
                                    {
                                        _loc_29 = _loc_29 | _loc_36 << ((_loc_38 - 1) << 1);
                                    }
                                    _loc_38++;
                                }
                                if (!_loc_31)
                                {
                                    while (_loc_38 <= 4)
                                    {
                                        
                                        _loc_29 = _loc_29 | _loc_36 << ((_loc_38 - 1) << 1);
                                        _loc_38++;
                                    }
                                }
                            }
                            else
                            {
                                _loc_29 = _loc_31 ? (15) : (228);
                            }
                            if (_loc_23)
                            {
                                _loc_39 = _loc_24[0].match(/[A-Za-z]{1,2}/ig);
                                _loc_40 = REGMAP[_loc_39[0]];
                                if (_loc_40 == null)
                                {
                                    this._error = "error: bad index register";
                                    _loc_19 = true;
                                    break;
                                }
                                _loc_33 = _loc_40.emitCode;
                                _loc_41 = _loc_24[0].match(/(\.[xyzw]{1,1})/);
                                if (_loc_41.length == 0)
                                {
                                    this._error = "error: bad index register select";
                                    _loc_19 = true;
                                    break;
                                }
                                _loc_34 = _loc_41[0].charCodeAt(1) - "x".charCodeAt(0);
                                if (_loc_34 > 2)
                                {
                                    _loc_34 = 3;
                                }
                                _loc_42 = _loc_24[0].match(/\+\d{1,3}/ig);
                                if (_loc_42.length > 0)
                                {
                                    _loc_35 = _loc_42[0];
                                }
                                if (_loc_35 < 0 || _loc_35 > 255)
                                {
                                    this._error = "error: index offset " + _loc_35 + " out of bounds. [0..255]";
                                    _loc_19 = true;
                                    break;
                                }
                                if (this.verbose)
                                {
                                    trace("RELATIVE: type=" + _loc_33 + "==" + _loc_39[0] + " sel=" + _loc_34 + "==" + _loc_41[0] + " idx=" + _loc_28 + " offset=" + _loc_35);
                                }
                            }
                            if (this.verbose)
                            {
                                trace("  emit argcode=" + _loc_26 + "[" + _loc_28 + "][" + _loc_29 + "]");
                            }
                            if (_loc_31)
                            {
                                this.agalcode.writeShort(_loc_28);
                                this.agalcode.writeByte(_loc_29);
                                this.agalcode.writeByte(_loc_26.emitCode);
                                _loc_20 = _loc_20 - 32;
                            }
                            else if (_loc_32)
                            {
                                if (this.verbose)
                                {
                                    trace("  emit sampler");
                                }
                                _loc_43 = 5;
                                _loc_44 = _loc_15 == null ? (0) : (_loc_15.length);
                                _loc_45 = 0;
                                _loc_38 = 0;
                                while (_loc_38 < _loc_44)
                                {
                                    
                                    if (this.verbose)
                                    {
                                        trace("    opt: " + _loc_15[_loc_38]);
                                    }
                                    _loc_46 = SAMPLEMAP[_loc_15[_loc_38]];
                                    if (_loc_46 == null)
                                    {
                                        _loc_45 = Number(_loc_15[_loc_38]);
                                        if (this.verbose)
                                        {
                                            trace("    bias: " + _loc_45);
                                        }
                                    }
                                    else
                                    {
                                        if (_loc_46.flag != SAMPLER_SPECIAL_SHIFT)
                                        {
                                            _loc_43 = _loc_43 & ~(15 << _loc_46.flag);
                                        }
                                        _loc_43 = _loc_43 | uint(_loc_46.mask) << uint(_loc_46.flag);
                                    }
                                    _loc_38++;
                                }
                                this.agalcode.writeShort(_loc_28);
                                this.agalcode.writeByte(int(_loc_45 * 8));
                                this.agalcode.writeByte(0);
                                this.agalcode.writeUnsignedInt(_loc_43);
                                if (this.verbose)
                                {
                                    trace("    bits: " + (_loc_43 - 5));
                                }
                                _loc_20 = _loc_20 - 64;
                            }
                            else
                            {
                                if (_loc_22 == 0)
                                {
                                    this.agalcode.writeUnsignedInt(0);
                                    _loc_20 = _loc_20 - 32;
                                }
                                this.agalcode.writeShort(_loc_28);
                                this.agalcode.writeByte(_loc_35);
                                this.agalcode.writeByte(_loc_29);
                                this.agalcode.writeByte(_loc_26.emitCode);
                                this.agalcode.writeByte(_loc_33);
                                this.agalcode.writeShort(_loc_23 ? (_loc_34 | 1 << 15) : (0));
                                _loc_20 = _loc_20 - 64;
                            }
                            _loc_22++;
                        }
                        _loc_22 = 0;
                        while (_loc_22 < _loc_20)
                        {
                            
                            this.agalcode.writeByte(0);
                            _loc_22 = _loc_22 + 8;
                        }
                        if (_loc_19)
                        {
                            break;
                        }
                    }
                }
                _loc_10++;
            }
            if (this._error != "")
            {
                this._error = this._error + ("\n  at line " + _loc_10 + " " + _loc_7[_loc_10]);
                this.agalcode.length = 0;
                trace(this._error);
            }
            if (this.debugEnabled)
            {
                _loc_47 = "generated bytecode:";
                _loc_48 = this.agalcode.length;
                _loc_49 = 0;
                while (_loc_49 < _loc_48)
                {
                    
                    if (!(_loc_49 % 16))
                    {
                        _loc_47 = _loc_47 + "\n";
                    }
                    if (!(_loc_49 % 4))
                    {
                        _loc_47 = _loc_47 + " ";
                    }
                    _loc_50 = this.agalcode[_loc_49].toString(16);
                    if (_loc_50.length < 2)
                    {
                        _loc_50 = "0" + _loc_50;
                    }
                    _loc_47 = _loc_47 + _loc_50;
                    _loc_49 = _loc_49 + 1;
                }
                trace(_loc_47);
            }
            if (this.verbose)
            {
                trace("AGALMiniAssembler.assemble time: " + (getTimer() - _loc_5) / 1000 + "s");
            }
            return this.agalcode;
        }// end function

        private function initregmap(param1:uint, param2:Boolean) : void
        {
            REGMAP[VA] = new Register(VA, "vertex attribute", 0, param2 ? (1024) : (param1 == 1 || param1 == 2 ? (7) : (15)), REG_VERT | REG_READ);
            REGMAP[VC] = new Register(VC, "vertex constant", 1, param2 ? (1024) : (param1 == 1 ? (127) : (249)), REG_VERT | REG_READ);
            REGMAP[VT] = new Register(VT, "vertex temporary", 2, param2 ? (1024) : (param1 == 1 ? (7) : (25)), REG_VERT | REG_WRITE | REG_READ);
            REGMAP[VO] = new Register(VO, "vertex output", 3, param2 ? (1024) : (0), REG_VERT | REG_WRITE);
            REGMAP[VI] = new Register(VI, "varying", 4, param2 ? (1024) : (param1 == 1 ? (7) : (9)), REG_VERT | REG_FRAG | REG_READ | REG_WRITE);
            REGMAP[FC] = new Register(FC, "fragment constant", 1, param2 ? (1024) : (param1 == 1 ? (27) : (param1 == 2 ? (63) : (199))), REG_FRAG | REG_READ);
            REGMAP[FT] = new Register(FT, "fragment temporary", 2, param2 ? (1024) : (param1 == 1 ? (7) : (25)), REG_FRAG | REG_WRITE | REG_READ);
            REGMAP[FS] = new Register(FS, "texture sampler", 5, param2 ? (1024) : (7), REG_FRAG | REG_READ);
            REGMAP[FO] = new Register(FO, "fragment output", 3, param2 ? (1024) : (param1 == 1 ? (0) : (3)), REG_FRAG | REG_WRITE);
            REGMAP[FD] = new Register(FD, "fragment depth output", 6, param2 ? (1024) : (param1 == 1 ? (-1) : (0)), REG_FRAG | REG_WRITE);
            REGMAP["op"] = REGMAP[VO];
            REGMAP["i"] = REGMAP[VI];
            REGMAP["v"] = REGMAP[VI];
            REGMAP["oc"] = REGMAP[FO];
            REGMAP["od"] = REGMAP[FD];
            REGMAP["fi"] = REGMAP[VI];
            return;
        }// end function

        private static function init() : void
        {
            initialized = true;
            OPMAP[MOV] = new OpCode(MOV, 2, 0, 0);
            OPMAP[ADD] = new OpCode(ADD, 3, 1, 0);
            OPMAP[SUB] = new OpCode(SUB, 3, 2, 0);
            OPMAP[MUL] = new OpCode(MUL, 3, 3, 0);
            OPMAP[DIV] = new OpCode(DIV, 3, 4, 0);
            OPMAP[RCP] = new OpCode(RCP, 2, 5, 0);
            OPMAP[MIN] = new OpCode(MIN, 3, 6, 0);
            OPMAP[MAX] = new OpCode(MAX, 3, 7, 0);
            OPMAP[FRC] = new OpCode(FRC, 2, 8, 0);
            OPMAP[SQT] = new OpCode(SQT, 2, 9, 0);
            OPMAP[RSQ] = new OpCode(RSQ, 2, 10, 0);
            OPMAP[POW] = new OpCode(POW, 3, 11, 0);
            OPMAP[LOG] = new OpCode(LOG, 2, 12, 0);
            OPMAP[EXP] = new OpCode(EXP, 2, 13, 0);
            OPMAP[NRM] = new OpCode(NRM, 2, 14, 0);
            OPMAP[SIN] = new OpCode(SIN, 2, 15, 0);
            OPMAP[COS] = new OpCode(COS, 2, 16, 0);
            OPMAP[CRS] = new OpCode(CRS, 3, 17, 0);
            OPMAP[DP3] = new OpCode(DP3, 3, 18, 0);
            OPMAP[DP4] = new OpCode(DP4, 3, 19, 0);
            OPMAP[ABS] = new OpCode(ABS, 2, 20, 0);
            OPMAP[NEG] = new OpCode(NEG, 2, 21, 0);
            OPMAP[SAT] = new OpCode(SAT, 2, 22, 0);
            OPMAP[M33] = new OpCode(M33, 3, 23, OP_SPECIAL_MATRIX);
            OPMAP[M44] = new OpCode(M44, 3, 24, OP_SPECIAL_MATRIX);
            OPMAP[M34] = new OpCode(M34, 3, 25, OP_SPECIAL_MATRIX);
            OPMAP[DDX] = new OpCode(DDX, 2, 26, OP_VERSION2 | OP_FRAG_ONLY);
            OPMAP[DDY] = new OpCode(DDY, 2, 27, OP_VERSION2 | OP_FRAG_ONLY);
            OPMAP[IFE] = new OpCode(IFE, 2, 28, OP_NO_DEST | OP_VERSION2 | OP_INCNEST | OP_SCALAR);
            OPMAP[INE] = new OpCode(INE, 2, 29, OP_NO_DEST | OP_VERSION2 | OP_INCNEST | OP_SCALAR);
            OPMAP[IFG] = new OpCode(IFG, 2, 30, OP_NO_DEST | OP_VERSION2 | OP_INCNEST | OP_SCALAR);
            OPMAP[IFL] = new OpCode(IFL, 2, 31, OP_NO_DEST | OP_VERSION2 | OP_INCNEST | OP_SCALAR);
            OPMAP[ELS] = new OpCode(ELS, 0, 32, OP_NO_DEST | OP_VERSION2 | OP_INCNEST | OP_DECNEST | OP_SCALAR);
            OPMAP[EIF] = new OpCode(EIF, 0, 33, OP_NO_DEST | OP_VERSION2 | OP_DECNEST | OP_SCALAR);
            OPMAP[KIL] = new OpCode(KIL, 1, 39, OP_NO_DEST | OP_FRAG_ONLY);
            OPMAP[TEX] = new OpCode(TEX, 3, 40, OP_FRAG_ONLY | OP_SPECIAL_TEX);
            OPMAP[SGE] = new OpCode(SGE, 3, 41, 0);
            OPMAP[SLT] = new OpCode(SLT, 3, 42, 0);
            OPMAP[SGN] = new OpCode(SGN, 2, 43, 0);
            OPMAP[SEQ] = new OpCode(SEQ, 3, 44, 0);
            OPMAP[SNE] = new OpCode(SNE, 3, 45, 0);
            SAMPLEMAP[RGBA] = new Sampler(RGBA, SAMPLER_TYPE_SHIFT, 0);
            SAMPLEMAP[DXT1] = new Sampler(DXT1, SAMPLER_TYPE_SHIFT, 1);
            SAMPLEMAP[DXT5] = new Sampler(DXT5, SAMPLER_TYPE_SHIFT, 2);
            SAMPLEMAP[VIDEO] = new Sampler(VIDEO, SAMPLER_TYPE_SHIFT, 3);
            SAMPLEMAP[D2] = new Sampler(D2, SAMPLER_DIM_SHIFT, 0);
            SAMPLEMAP[D3] = new Sampler(D3, SAMPLER_DIM_SHIFT, 2);
            SAMPLEMAP[CUBE] = new Sampler(CUBE, SAMPLER_DIM_SHIFT, 1);
            SAMPLEMAP[MIPNEAREST] = new Sampler(MIPNEAREST, SAMPLER_MIPMAP_SHIFT, 1);
            SAMPLEMAP[MIPLINEAR] = new Sampler(MIPLINEAR, SAMPLER_MIPMAP_SHIFT, 2);
            SAMPLEMAP[MIPNONE] = new Sampler(MIPNONE, SAMPLER_MIPMAP_SHIFT, 0);
            SAMPLEMAP[NOMIP] = new Sampler(NOMIP, SAMPLER_MIPMAP_SHIFT, 0);
            SAMPLEMAP[NEAREST] = new Sampler(NEAREST, SAMPLER_FILTER_SHIFT, 0);
            SAMPLEMAP[LINEAR] = new Sampler(LINEAR, SAMPLER_FILTER_SHIFT, 1);
            SAMPLEMAP[ANISOTROPIC2X] = new Sampler(ANISOTROPIC2X, SAMPLER_FILTER_SHIFT, 2);
            SAMPLEMAP[ANISOTROPIC4X] = new Sampler(ANISOTROPIC4X, SAMPLER_FILTER_SHIFT, 3);
            SAMPLEMAP[ANISOTROPIC8X] = new Sampler(ANISOTROPIC8X, SAMPLER_FILTER_SHIFT, 4);
            SAMPLEMAP[ANISOTROPIC16X] = new Sampler(ANISOTROPIC16X, SAMPLER_FILTER_SHIFT, 5);
            SAMPLEMAP[CENTROID] = new Sampler(CENTROID, SAMPLER_SPECIAL_SHIFT, 1 << 0);
            SAMPLEMAP[SINGLE] = new Sampler(SINGLE, SAMPLER_SPECIAL_SHIFT, 1 << 1);
            SAMPLEMAP[IGNORESAMPLER] = new Sampler(IGNORESAMPLER, SAMPLER_SPECIAL_SHIFT, 1 << 2);
            SAMPLEMAP[REPEAT] = new Sampler(REPEAT, SAMPLER_REPEAT_SHIFT, 1);
            SAMPLEMAP[WRAP] = new Sampler(WRAP, SAMPLER_REPEAT_SHIFT, 1);
            SAMPLEMAP[CLAMP] = new Sampler(CLAMP, SAMPLER_REPEAT_SHIFT, 0);
            SAMPLEMAP[CLAMP_U_REPEAT_V] = new Sampler(CLAMP_U_REPEAT_V, SAMPLER_REPEAT_SHIFT, 2);
            SAMPLEMAP[REPEAT_U_CLAMP_V] = new Sampler(REPEAT_U_CLAMP_V, SAMPLER_REPEAT_SHIFT, 3);
            return;
        }// end function

    }
}

import flash.display3D.*;

import flash.utils.*;

class OpCode extends Object
{
    private var _emitCode:uint;
    private var _flags:uint;
    private var _name:String;
    private var _numRegister:uint;

    function OpCode(param1:String, param2:uint, param3:uint, param4:uint)
    {
        this._name = param1;
        this._numRegister = param2;
        this._emitCode = param3;
        this._flags = param4;
        return;
    }// end function

    public function get emitCode() : uint
    {
        return this._emitCode;
    }// end function

    public function get flags() : uint
    {
        return this._flags;
    }// end function

    public function get name() : String
    {
        return this._name;
    }// end function

    public function get numRegister() : uint
    {
        return this._numRegister;
    }// end function

    public function toString() : String
    {
        return "[OpCode name=\"" + this._name + "\", numRegister=" + this._numRegister + ", emitCode=" + this._emitCode + ", flags=" + this._flags + "]";
    }// end function

}


import flash.display3D.*;

import flash.utils.*;

class Register extends Object
{
    private var _emitCode:uint;
    private var _name:String;
    private var _longName:String;
    private var _flags:uint;
    private var _range:uint;

    function Register(param1:String, param2:String, param3:uint, param4:uint, param5:uint)
    {
        this._name = param1;
        this._longName = param2;
        this._emitCode = param3;
        this._range = param4;
        this._flags = param5;
        return;
    }// end function

    public function get emitCode() : uint
    {
        return this._emitCode;
    }// end function

    public function get longName() : String
    {
        return this._longName;
    }// end function

    public function get name() : String
    {
        return this._name;
    }// end function

    public function get flags() : uint
    {
        return this._flags;
    }// end function

    public function get range() : uint
    {
        return this._range;
    }// end function

    public function toString() : String
    {
        return "[Register name=\"" + this._name + "\", longName=\"" + this._longName + "\", emitCode=" + this._emitCode + ", range=" + this._range + ", flags=" + this._flags + "]";
    }// end function

}


import flash.display3D.*;

import flash.utils.*;

class Sampler extends Object
{
    private var _flag:uint;
    private var _mask:uint;
    private var _name:String;

    function Sampler(param1:String, param2:uint, param3:uint)
    {
        this._name = param1;
        this._flag = param2;
        this._mask = param3;
        return;
    }// end function

    public function get flag() : uint
    {
        return this._flag;
    }// end function

    public function get mask() : uint
    {
        return this._mask;
    }// end function

    public function get name() : String
    {
        return this._name;
    }// end function

    public function toString() : String
    {
        return "[Sampler name=\"" + this._name + "\", flag=\"" + this._flag + "\", mask=" + this.mask + "]";
    }// end function

}

