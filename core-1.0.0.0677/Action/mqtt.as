package 
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.utils.*;
    import mqtt.*;

    public class mqtt extends Sprite
    {
        private const MQTTCONNECT:int = 16;
        private const MQTTPUBLISH:int = 48;
        private const MQTTSUBSCRIBE:int = 128;
        private const MQTTUNSUBSCRIBE:int = 160;
        private const MQTTPINGREQ:int = 192;
        private const KEEPALIVE:int = 15000;
        private var sessionSend:Boolean;
        private var sessionOpened:Boolean;
        private var sk:Socket;
        private var buf:ByteArray;
        private var parms:Object;
        private var msg_id:int;
        private var pending_messages:Object;
        public var event_data:Object;
        public static const MQTT_CONNECTED:String = "mqttconnected";
        public static const MQTT_CLOSED:String = "mqttclosed";
        public static const MQTT_MESSAGE:String = "mqttmessage";
        public static const MQTT_SUBSCRIBED:String = "mqttsubscribed";
        public static const MQTT_UNSUBSCRIBED:String = "mqttunsubscribed";

        public function mqtt()
        {
            this.sessionOpened = false;
            return;
        }// end function

        public function connect(param1:Object) : void
        {
            if (this.sessionOpened)
            {
                return;
            }
            this.sessionSend = false;
            this.sessionOpened = false;
            this.msg_id = 0;
            this.pending_messages = {};
            this.parms = param1;
            this.buf = new ByteArray();
            this.sk = new Socket();
            this.sk.addEventListener(Event.CLOSE, this.closeHandler);
            this.sk.addEventListener(Event.CONNECT, this.connectHandler);
            this.sk.addEventListener(IOErrorEvent.IO_ERROR, this.ioErrorHandler);
            this.sk.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.securityErrorHandler);
            this.sk.addEventListener(ProgressEvent.SOCKET_DATA, this.socketDataHandler);
            this.sk.connect(param1.host, param1.port);
            return;
        }// end function

        private function closeHandler(event:Event) : void
        {
            this.sessionSend = false;
            this.sessionOpened = false;
            dispatchEvent(new Event(MQTT_CLOSED));
            return;
        }// end function

        private function connectHandler(event:Event) : void
        {
            this.openSession();
            return;
        }// end function

        private function ioErrorHandler(event:Event) : void
        {
            return;
        }// end function

        private function securityErrorHandler(event:Event) : void
        {
            return;
        }// end function

        private function socketDataHandler(event:Event) : void
        {
            if (this.sk.bytesAvailable >= 2)
            {
                this.sk.readBytes(this.buf, this.buf.position);
                this.process(this.buf);
            }
            return;
        }// end function

        private function sendBuffer(param1:ByteArray) : void
        {
            this.sk.writeBytes(param1);
            this.sk.flush();
            return;
        }// end function

        private function openSession() : void
        {
            var _loc_1:int = 0;
            var _loc_2:* = 18 + this.parms.id.length + this.parms.username.length + this.parms.password.length;
            if (_loc_2 > 128)
            {
                return;
            }
            var _loc_3:* = new ByteArray();
            _loc_3.endian = Endian.BIG_ENDIAN;
            var _loc_4:* = _loc_1 + 1;
            _loc_3[_loc_4] = this.MQTTCONNECT;
            var _loc_5:* = _loc_1 + 1;
            _loc_3[_loc_5] = _loc_2;
            _loc_3.position = _loc_1;
            _loc_3.writeUTF("MQIsdp");
            _loc_1 = _loc_3.position;
            var _loc_6:* = _loc_1 + 1;
            _loc_3[_loc_6] = 3;
            var _loc_7:* = _loc_1 + 1;
            _loc_3[_loc_7] = 194;
            var _loc_8:* = _loc_1 + 1;
            _loc_3[_loc_8] = 0;
            var _loc_9:* = _loc_1 + 1;
            _loc_3[_loc_9] = this.KEEPALIVE / 500;
            var _loc_10:* = _loc_1 + 1;
            _loc_3[_loc_10] = 0;
            _loc_3.position = 14;
            _loc_3.writeUTF(this.parms.id);
            _loc_3.writeUTF(this.parms.username);
            _loc_3.writeUTF(this.parms.password);
            this.sendBuffer(_loc_3);
            this.sessionSend = true;
            return;
        }// end function

        public function subscribe(param1:String) : void
        {
            var _loc_2:int = 0;
            var _loc_3:ByteArray = null;
            if (this.sk.connected)
            {
                _loc_2 = 0;
                _loc_3 = new ByteArray();
                if (param1.length > 123)
                {
                    return;
                }
                var _loc_4:* = _loc_2 + 1;
                _loc_3[_loc_4] = this.MQTTSUBSCRIBE;
                var _loc_5:* = _loc_2 + 1;
                _loc_3[_loc_5] = 5 + param1.length;
                _loc_3.position = _loc_2;
                this.pending_messages[this.msg_id] = param1;
                _loc_3.writeShort(this.msg_id);
                (this.msg_id + 1);
                _loc_3.writeUTF(param1);
                _loc_3[6 + param1.length] = 0;
                this.sendBuffer(_loc_3);
            }
            return;
        }// end function

        public function unsubscribe(param1:String) : void
        {
            var _loc_2:int = 0;
            var _loc_3:ByteArray = null;
            if (this.sk.connected)
            {
                _loc_2 = 0;
                _loc_3 = new ByteArray();
                if (param1.length > 124)
                {
                    return;
                }
                var _loc_4:* = _loc_2 + 1;
                _loc_3[_loc_4] = this.MQTTUNSUBSCRIBE;
                var _loc_5:* = _loc_2 + 1;
                _loc_3[_loc_5] = 4 + param1.length;
                _loc_3.position = _loc_2;
                this.pending_messages[this.msg_id] = param1;
                _loc_3.writeShort(this.msg_id);
                (this.msg_id + 1);
                _loc_3.writeUTF(param1);
                this.sendBuffer(_loc_3);
            }
            return;
        }// end function

        public function publish(param1:String, param2:String) : void
        {
            var _loc_3:int = 0;
            var _loc_4:int = 0;
            var _loc_5:ByteArray = null;
            var _loc_6:ByteArray = null;
            var _loc_7:uint = 0;
            if (this.sk.connected)
            {
                _loc_3 = 0;
                _loc_4 = 0;
                _loc_5 = new ByteArray();
                _loc_5.writeUTF(param1);
                _loc_3 = 0;
                _loc_6 = new ByteArray();
                var _loc_8:* = _loc_3 + 1;
                _loc_6[_loc_8] = this.MQTTPUBLISH;
                _loc_7 = param2.length + _loc_5.length;
                if (_loc_7 > 1400)
                {
                    return;
                }
                do
                {
                    
                    _loc_6[_loc_3] = _loc_7 % 128;
                    _loc_7 = _loc_7 / 128;
                    if (_loc_7 > 0)
                    {
                        _loc_6[_loc_3] = _loc_6[_loc_3] | 128;
                    }
                    _loc_3 = _loc_3 + 1;
                }while (_loc_7 > 0)
                _loc_6.position = _loc_3;
                _loc_6.writeBytes(_loc_5);
                _loc_6.writeUTFBytes(param2);
                this.sendBuffer(_loc_6);
            }
            return;
        }// end function

        private function process(param1:ByteArray) : void
        {
            var _loc_3:int = 0;
            var _loc_4:int = 0;
            var _loc_5:uint = 0;
            var _loc_6:int = 0;
            var _loc_7:uint = 0;
            var _loc_8:int = 0;
            var _loc_9:String = null;
            var _loc_10:String = null;
            var _loc_11:ByteArray = null;
            var _loc_12:uint = 0;
            var _loc_13:int = 0;
            var _loc_2:* = param1.position;
            while (param1.bytesAvailable)
            {
                
                _loc_3 = param1[_loc_2] >> 4;
                if (_loc_3 == 2)
                {
                    if (this.sessionOpened)
                    {
                        this.sk.close();
                        return;
                    }
                    if (param1.bytesAvailable < 4)
                    {
                        return;
                    }
                    param1.position = _loc_2 + 4;
                    this.sessionOpened = true;
                    dispatchEvent(new Event(MQTT_CONNECTED, true));
                    _loc_2 = param1.position;
                    continue;
                }
                if (_loc_3 == 3)
                {
                    _loc_4 = 1;
                    _loc_5 = 0;
                    _loc_6 = 1;
                    _loc_7 = 0;
                    do
                    {
                        
                        _loc_7 = param1[_loc_2 + _loc_6];
                        _loc_6 = _loc_6 + 1;
                        _loc_5 = _loc_5 + (_loc_7 & 127) * _loc_4;
                        _loc_4 = _loc_4 * 128;
                    }while ((_loc_7 & 128) != 0)
                    if (param1.bytesAvailable < _loc_5 + _loc_6)
                    {
                        return;
                    }
                    param1.position = _loc_2 + _loc_6;
                    _loc_8 = param1[_loc_2 + _loc_6] << 8 | param1[_loc_2 + _loc_6 + 1];
                    _loc_9 = param1.readUTF();
                    _loc_5 = _loc_5 - (_loc_9.length + 2);
                    _loc_10 = param1.readUTFBytes(_loc_5);
                    this.event_data = {topic:_loc_9, payload:_loc_10};
                    dispatchEvent(new Event(MQTT_MESSAGE));
                    _loc_2 = param1.position;
                    continue;
                }
                if (_loc_3 == 12)
                {
                    _loc_11 = new ByteArray();
                    _loc_11.writeByte(208);
                    _loc_11.writeByte(0);
                    this.sendBuffer(_loc_11);
                    param1.position = _loc_2 + 2;
                    _loc_2 = param1.position;
                    continue;
                }
                if (_loc_3 == 13)
                {
                    _loc_2 = _loc_2 + 2;
                    param1.position = _loc_2;
                    continue;
                }
                if (_loc_3 == 9)
                {
                    _loc_12 = param1[(_loc_2 + 1)];
                    if (param1.bytesAvailable < _loc_12)
                    {
                        return;
                    }
                    param1.position = _loc_2 + 2;
                    _loc_13 = param1.readUnsignedShort();
                    this.event_data = {topic:this.pending_messages[_loc_13]};
                    dispatchEvent(new Event(MQTT_SUBSCRIBED));
                    param1.position = param1.position + (_loc_12 - 2);
                    _loc_2 = param1.position;
                }
            }
            param1.clear();
            return;
        }// end function

        private function ping() : void
        {
            var _loc_1:* = new ByteArray();
            _loc_1.writeByte(this.MQTTPINGREQ);
            _loc_1.writeByte(0);
            this.sendBuffer(_loc_1);
            return;
        }// end function

        private function disconnect() : void
        {
            var _loc_1:* = new ByteArray();
            _loc_1[0] = 224;
            _loc_1[1] = 0;
            this.sendBuffer(_loc_1);
            return;
        }// end function

    }
}
