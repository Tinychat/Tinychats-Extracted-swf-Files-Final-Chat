package org.osmf.netmocker
{
    import flash.errors.*;
    import flash.net.*;
    import org.osmf.media.*;
    import org.osmf.net.*;

    public class MockNetConnection extends NetConnection
    {
        private var _resource:URLResource;
        private var eventInterceptor:NetStatusEventInterceptor;
        private var _expectation:NetConnectionExpectation;
        private var _expectedFMSVersion:String;
        private static const asAdobe:RegExp = /as=adobe/;
        private static const teConnect:RegExp = /te=connect/;
        private static const EVENT_DELAY:int = 100;
        private static const LEVEL_STATUS:String = "status";
        private static const LEVEL_ERROR:String = "error";
        private static const IO_MESSAGE:String = "io_message";
        private static const ARGUMENT_MESSAGE:String = "argument_message";
        private static const SECURITY_MESSAGE:String = "security_message";

        public function MockNetConnection()
        {
            this._expectation = NetConnectionExpectation.VALID_CONNECTION;
            this.eventInterceptor = new NetStatusEventInterceptor(this);
            return;
        }// end function

        public function set expectation(value:NetConnectionExpectation) : void
        {
            this._expectation = value;
            return;
        }// end function

        public function get expectation() : NetConnectionExpectation
        {
            return this._expectation;
        }// end function

        public function set expectedFMSVersion(value:String) : void
        {
            this._expectedFMSVersion = value;
            return;
        }// end function

        public function get expectedFMSVersion() : String
        {
            return this._expectedFMSVersion;
        }// end function

        override public function addHeader(operation:String, mustUnderstand:Boolean = false, param:Object = null) : void
        {
            trace("MockNetConnection.addHeader");
            return;
        }// end function

        override public function call(command:String, responder:Responder, ... args) : void
        {
            return;
        }// end function

        override public function close() : void
        {
            super.close();
            this.eventInterceptor.dispatchNetStatusEvent(NetConnectionCodes.CONNECT_CLOSED, LEVEL_STATUS);
            return;
        }// end function

        override public function connect(command:String, ... args) : void
        {
            switch(this._expectation)
            {
                case NetConnectionExpectation.VALID_CONNECTION:
                {
                    this.connectToValidServer(command);
                    break;
                }
                case NetConnectionExpectation.CONNECT_WITH_PARAMS:
                {
                    if (args.length > 0)
                    {
                        this.connectToValidServer(command);
                    }
                    else
                    {
                        this.throwIOError();
                    }
                    break;
                }
                case NetConnectionExpectation.CONNECT_WITH_FMTA:
                {
                    if (args.length > 0)
                    {
                    }
                    if (this.hasFMTA(args))
                    {
                        this.connectToValidServer(command, args);
                    }
                    else
                    {
                        this.throwIOError();
                    }
                    break;
                }
                case NetConnectionExpectation.INVALID_FMS_SERVER:
                {
                    this.connectToInvalidServer();
                    break;
                }
                case NetConnectionExpectation.REJECTED_CONNECTION:
                {
                    this.connectToRejectingServer();
                    break;
                }
                case NetConnectionExpectation.INVALID_FMS_APPLICATION:
                {
                    this.connectToInvalidApplication();
                    break;
                }
                case NetConnectionExpectation.IO_ERROR:
                {
                    this.throwIOError();
                    break;
                }
                case NetConnectionExpectation.ARGUMENT_ERROR:
                {
                    this.throwArgumentError();
                    break;
                }
                case NetConnectionExpectation.SECURITY_ERROR:
                {
                    this.throwSecurityError();
                    break;
                }
                case NetConnectionExpectation.CONNECT_WITH_REDIRECT:
                {
                    this.performRedirect();
                    break;
                }
                default:
                {
                    throw new IllegalOperationError();
                    break;
                }
            }
            return;
        }// end function

        private function hasFMTA(parameters:Array) : Boolean
        {
            var _loc_4:String = null;
            var _loc_2:Boolean = false;
            var _loc_3:Boolean = false;
            for each (_loc_4 in parameters)
            {
                
                if (asAdobe.test(_loc_4))
                {
                    _loc_2 = true;
                }
                if (teConnect.test(_loc_4))
                {
                    _loc_3 = true;
                }
            }
            if (_loc_2)
            {
            }
            return _loc_3;
        }// end function

        private function connectToValidServer(command:String, params:Array = null) : void
        {
            if (command == null)
            {
                super.connect(null);
                this.eventInterceptor.dispatchNetStatusEvent(NetConnectionCodes.CONNECT_SUCCESS, LEVEL_STATUS, 0, null, null, false, this.expectedFMSVersion);
            }
            else
            {
                this.eventInterceptor.dispatchNetStatusEvent(NetConnectionCodes.CONNECT_SUCCESS, LEVEL_STATUS, EVENT_DELAY, this, params, false, this.expectedFMSVersion);
            }
            return;
        }// end function

        private function performRedirect() : void
        {
            this._expectation = NetConnectionExpectation.VALID_CONNECTION;
            this.eventInterceptor.dispatchNetStatusEvent(NetConnectionCodes.CONNECT_REJECTED, LEVEL_ERROR, EVENT_DELAY, null, null, true);
            return;
        }// end function

        private function connectToInvalidServer() : void
        {
            this.eventInterceptor.dispatchNetStatusEvent(NetConnectionCodes.CONNECT_FAILED, LEVEL_ERROR, EVENT_DELAY);
            return;
        }// end function

        private function connectToRejectingServer() : void
        {
            var _loc_1:Array = [{code:NetConnectionCodes.CONNECT_REJECTED, level:LEVEL_ERROR}, {code:NetConnectionCodes.CONNECT_CLOSED, level:LEVEL_STATUS}];
            this.eventInterceptor.dispatchNetStatusEvents(_loc_1, EVENT_DELAY);
            return;
        }// end function

        private function connectToInvalidApplication() : void
        {
            var _loc_1:Array = [{code:NetConnectionCodes.CONNECT_INVALIDAPP, level:LEVEL_ERROR}, {code:NetConnectionCodes.CONNECT_CLOSED, level:LEVEL_STATUS}];
            this.eventInterceptor.dispatchNetStatusEvents(_loc_1, EVENT_DELAY);
            return;
        }// end function

        private function throwIOError() : void
        {
            throw new IOError(IO_MESSAGE);
        }// end function

        private function throwArgumentError() : void
        {
            throw new ArgumentError(ARGUMENT_MESSAGE);
        }// end function

        private function throwSecurityError() : void
        {
            throw new SecurityError(SECURITY_MESSAGE);
        }// end function

    }
}
