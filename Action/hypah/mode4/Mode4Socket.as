package hypah.mode4
{
    import flash.events.*;
    import flash.net.*;
    import flash.utils.*;

    dynamic public class Mode4Socket extends Object
    {
        public var x:Socket = null;
        public var connecting:Boolean = false;
        public var did_connect:Boolean = false;
        public var pba:ByteArray;
        public var onConnect:Object;
        public var onClose:Object;
        public var onError:Object;
        public var receive:Object;
        private var hal:Object = false;
        public var hbc:int = 4;

        public function Mode4Socket()
        {
            this.pba = new ByteArray();
            this.onConnect = function ()
            {
                trace("need to override onConnect() function in a Mode4Socket");
                return;
            }// end function
            ;
            this.onClose = function ()
            {
                trace("need to override onClose() function in a Mode4Socket");
                return;
            }// end function
            ;
            this.onError = function ()
            {
                trace("need to override onError() function in a Mode4Socket");
                return;
            }// end function
            ;
            this.receive = function (param1:ByteArray)
            {
                return;
            }// end function
            ;
            try
            {
                this.x = new Socket();
            }
            catch (e)
            {
                trace("what the...");
                x = null;
                return;
            }
            this.x.addEventListener(Event.CLOSE, this.onClose_internal);
            this.x.addEventListener(Event.CONNECT, this.onConnect_internal);
            this.x.addEventListener(ErrorEvent.ERROR, this.onError_internal);
            this.x.addEventListener(IOErrorEvent.IO_ERROR, this.onError_internal);
            this.x.addEventListener(ProgressEvent.SOCKET_DATA, this.onPartialData);
            this.hal = true;
            return;
        }// end function

        public function connect(param1:String, param2:int) : void
        {
            this.connecting = true;
            if (this.x != null)
            {
                this.x.connect(param1, param2);
            }
            return;
        }// end function

        public function close()
        {
            this.connecting = false;
            this.did_connect = false;
            this.onClose_internal("");
            if (this.x != null)
            {
                try
                {
                    this.x.close();
                }
                catch (e)
                {
                }
            }
            return;
        }// end function

        public function send(param1:String)
        {
            var _loc_2:* = new ByteArray();
            _loc_2.writeUTFBytes(param1);
            this.sendBytes(_loc_2);
            return;
        }// end function

        public function sendBytes(param1:ByteArray)
        {
            var ba:* = param1;
            if (ba.length >= 16777215)
            {
                trace("tried sending invalid packet; length is too long;  " + ba.length);
                return;
            }
            var tba:* = new ByteArray();
            var l:* = ba.length;
            if (this.hbc == 4)
            {
                tba.writeByte(l >> 24 & 255);
                tba.writeByte(l >> 16 & 255);
                tba.writeByte(l >> 8 & 255);
                tba.writeByte(l & 255);
            }
            else if (this.hbc == 3)
            {
                tba.writeByte(l >> 16 & 255);
                tba.writeByte(l >> 8 & 255);
                tba.writeByte(l & 255);
            }
            else if (this.hbc == 2)
            {
                tba.writeByte(l >> 8 & 255);
                tba.writeByte(l & 255);
            }
            else if (this.hbc == 1)
            {
                tba.writeByte(l & 255);
            }
            tba.writeBytes(ba);
            if (this.x != null)
            {
                try
                {
                    this.x.writeBytes(tba);
                    this.x.flush();
                }
                catch (e)
                {
                    close();
                }
            }
            return;
        }// end function

        private function onConnect_internal(param1)
        {
            this.connecting = false;
            this.did_connect = true;
            this.onConnect();
            return;
        }// end function

        private function onClose_internal(param1)
        {
            this.connecting = false;
            this.did_connect = false;
            if (this.hal)
            {
                this.hal = false;
                if (this.x != null)
                {
                    this.x.removeEventListener(Event.CLOSE, this.onClose_internal);
                    this.x.removeEventListener(Event.CONNECT, this.onConnect_internal);
                    this.x.removeEventListener(ErrorEvent.ERROR, this.onError_internal);
                    this.x.removeEventListener(IOErrorEvent.IO_ERROR, this.onError_internal);
                    this.x.removeEventListener(ProgressEvent.SOCKET_DATA, this.onPartialData);
                }
            }
            this.onClose();
            return;
        }// end function

        private function onError_internal(param1)
        {
            this.connecting = false;
            this.did_connect = false;
            this.onError(param1);
            if (this.x != null)
            {
                try
                {
                    this.x.close();
                }
                catch (e)
                {
                }
            }
            this.onClose_internal("");
            return;
        }// end function

        private function onPartialData(event:ProgressEvent)
        {
            var _loc_4:* = null;
            var _loc_5:* = 0;
            var _loc_6:* = 0;
            var _loc_7:* = 0;
            var _loc_2:* = event.target;
            var _loc_3:* = _loc_2.bytesAvailable;
            if (_loc_3 > 0)
            {
                _loc_4 = new ByteArray();
                _loc_2.readBytes(_loc_4, 0, _loc_3);
                this.pba.writeBytes(_loc_4);
                _loc_5 = 0;
                _loc_6 = this.pba.length;
                while (true)
                {
                    
                    if (_loc_5 + this.hbc <= _loc_6)
                    {
                        if (this.hbc == 4)
                        {
                            _loc_7 = this.pba[_loc_5] << 24 | this.pba[(_loc_5 + 1)] << 16 | this.pba[_loc_5 + 2] << 8 | this.pba[_loc_5 + 3];
                        }
                        else if (this.hbc == 3)
                        {
                            _loc_7 = this.pba[_loc_5] << 16 | this.pba[(_loc_5 + 1)] << 8 | this.pba[_loc_5 + 2];
                        }
                        else if (this.hbc == 2)
                        {
                            _loc_7 = this.pba[_loc_5] << 8 | this.pba[(_loc_5 + 1)];
                        }
                        else if (this.hbc == 1)
                        {
                            _loc_7 = this.pba[_loc_5];
                        }
                    }
                    else
                    {
                        break;
                    }
                    if (_loc_5 + this.hbc + _loc_7 <= _loc_6)
                    {
                        _loc_5 = _loc_5 + this.hbc;
                        if (_loc_7 > 0)
                        {
                            _loc_4 = new ByteArray();
                            _loc_4.writeBytes(this.pba, _loc_5, _loc_7);
                            this.receive(_loc_4);
                        }
                        _loc_5 = _loc_5 + _loc_7;
                        continue;
                    }
                    break;
                }
                if (_loc_5 > 0)
                {
                    _loc_4 = new ByteArray();
                    if (_loc_6 != _loc_5)
                    {
                        _loc_4.writeBytes(this.pba, _loc_5, _loc_6 - _loc_5);
                    }
                    this.pba = _loc_4;
                }
            }
            return;
        }// end function

    }
}
