package com.tinychat.model.social.network.facebook
{
    import com.tinychat.model.utils.array.*;
    import flash.events.*;
    import flash.net.*;
    import flash.utils.*;
    import org.osflash.signals.*;

    public class FacebookXmppSocket extends Object
    {
        private var socket:XMLSocket;
        private var servers:Array;
        private var retryTimer:Timer;
        private var retryAttempts:uint;
        private var userInvokedClose:Boolean;
        private var pingTimer:Timer;
        private var userId:String;
        private var sessionKey:String;
        private var _connected:Signal;
        private var _disconnected:Signal;
        private var _message:Signal;
        private var _presence:Signal;
        private static const SERVER_IPS:Array = ["209.212.145.133", "209.212.145.134", "209.212.145.135", "209.212.145.136"];
        private static const SERVER_PORT:uint = 5222;
        private static const CONNECTION_ATTEMPT_TIMEOUT:uint = 5000;
        private static const RETRY_ATTEMPT_TIMEOUT:uint = 30000;
        private static const MAX_RETRY_ATTEMPTS:uint = 5;
        private static const PING_TIMEOUT:uint = 60000;

        public function FacebookXmppSocket()
        {
            this.socket = new XMLSocket();
            this.socket.timeout = CONNECTION_ATTEMPT_TIMEOUT;
            this.retryTimer = new Timer(RETRY_ATTEMPT_TIMEOUT, 1);
            this.pingTimer = new Timer(PING_TIMEOUT);
            this._connected = new Signal();
            this._disconnected = new Signal();
            this._message = new Signal(XML);
            this._presence = new Signal(XML);
            return;
        }// end function

        public function get connected() : ISignal
        {
            return this._connected;
        }// end function

        public function get disconnected() : ISignal
        {
            return this._disconnected;
        }// end function

        public function get message() : ISignal
        {
            return this._message;
        }// end function

        public function get presence() : ISignal
        {
            return this._presence;
        }// end function

        public function get isConnected() : Boolean
        {
            return this.socket.connected;
        }// end function

        public function connect(param1:String, param2:String) : void
        {
            if (!this.socket.connected)
            {
                this.userId = param1;
                this.sessionKey = param2;
                this.retryAttempts = 0;
                this.addSocketHandlers();
                this.doConnect();
            }
            return;
        }// end function

        public function disconnect() : void
        {
            this.socket.close();
            this.removeSocketHandlers();
            this.pingTimer.removeEventListener(TimerEvent.TIMER, this.pingTimerHandler);
            this.pingTimer.stop();
            this._disconnected.dispatch();
            return;
        }// end function

        public function send(param1:Object) : void
        {
            try
            {
                this.socket.send(param1);
            }
            catch (error:Error)
            {
            }
            return;
        }// end function

        private function get server() : String
        {
            if (this.servers)
            {
            }
            if (this.servers.length == 0)
            {
                this.servers = SERVER_IPS.concat();
            }
            var _loc_1:* = getRandomArrayIndex(this.servers);
            return this.servers.splice(_loc_1, 1)[0];
        }// end function

        private function doConnect() : void
        {
            var _loc_1:* = this.server;
            this.socket.connect(_loc_1, SERVER_PORT);
            return;
        }// end function

        private function retryConnecting() : void
        {
            if (!this.retryTimer.running)
            {
                var _loc_1:String = this;
                var _loc_2:* = this.retryAttempts + 1;
                _loc_1.retryAttempts = _loc_2;
                this.retryTimer.addEventListener(TimerEvent.TIMER, this.retryTimerHandler);
                this.retryTimer.reset();
                this.retryTimer.start();
            }
            return;
        }// end function

        private function connectHandler(event:Event) : void
        {
            this.send("session=" + this.sessionKey);
            this.retryTimer.stop();
            setTimeout(this.connectionSuccess, 1000);
            return;
        }// end function

        private function connectionSuccess() : void
        {
            if (this.socket.connected)
            {
                this.pingTimer.addEventListener(TimerEvent.TIMER, this.pingTimerHandler);
                this.pingTimer.start();
                this._connected.dispatch();
            }
            return;
        }// end function

        private function closeHandler(event:Event) : void
        {
            this.connectionLostHandler();
            return;
        }// end function

        private function securityErrorHandler(event:SecurityErrorEvent) : void
        {
            this.connectionLostHandler();
            return;
        }// end function

        private function dataHandler(event:DataEvent) : void
        {
            var response:XMLList;
            var node:XML;
            var event:* = event;
            try
            {
                response = XMLList(event.data);
            }
            catch (error:Error)
            {
                return;
            }
            var _loc_3:int = 0;
            var _loc_4:* = response;
            while (_loc_4 in _loc_3)
            {
                
                node = _loc_4[_loc_3];
                switch(node.localName())
                {
                    case "presence":
                    {
                        this._presence.dispatch(node);
                        break;
                    }
                    case "message":
                    {
                        this._message.dispatch(node);
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }
            }
            return;
        }// end function

        private function connectionLostHandler() : void
        {
            this._disconnected.dispatch();
            if (this.retryAttempts < MAX_RETRY_ATTEMPTS)
            {
                this.retryConnecting();
            }
            return;
        }// end function

        private function retryTimerHandler(event:TimerEvent) : void
        {
            this.retryTimer.stop();
            this.retryTimer.removeEventListener(TimerEvent.TIMER, this.retryTimerHandler);
            this.doConnect();
            return;
        }// end function

        private function pingTimerHandler(event:TimerEvent) : void
        {
            var _loc_2:* = "<presence from=\"-" + this.userId + "@chat.facebook.com\" type=\"available\" />";
            this.send(_loc_2);
            return;
        }// end function

        private function addSocketHandlers() : void
        {
            this.socket.addEventListener(Event.CONNECT, this.connectHandler);
            this.socket.addEventListener(Event.CLOSE, this.closeHandler);
            this.socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.securityErrorHandler);
            this.socket.addEventListener(DataEvent.DATA, this.dataHandler);
            return;
        }// end function

        private function removeSocketHandlers() : void
        {
            this.socket.removeEventListener(Event.CONNECT, this.connectHandler);
            this.socket.removeEventListener(Event.CLOSE, this.closeHandler);
            this.socket.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.securityErrorHandler);
            this.socket.removeEventListener(DataEvent.DATA, this.dataHandler);
            return;
        }// end function

    }
}
