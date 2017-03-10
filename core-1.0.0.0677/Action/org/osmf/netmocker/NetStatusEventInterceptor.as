package org.osmf.netmocker
{
    import flash.events.*;
    import flash.net.*;
    import flash.utils.*;
    import org.osmf.net.*;

    class NetStatusEventInterceptor extends Object
    {
        private var isClosed:Boolean = false;
        private var netStatusEventDispatcher:IEventDispatcher;

        function NetStatusEventInterceptor(netStatusEventDispatcher:IEventDispatcher)
        {
            this.netStatusEventDispatcher = netStatusEventDispatcher;
            netStatusEventDispatcher.addEventListener(NetStatusEvent.NET_STATUS, this.onNetStatusEvent, false, int.MAX_VALUE);
            return;
        }// end function

        public function dispatchNetStatusEvent(code:String, level:String, delay:int = 0, nc:NetConnection = null, params:Array = null, signalRedirect:Boolean = false, fmsVersion:String = null) : void
        {
            switch(code)
            {
                case NetConnectionCodes.CONNECT_CLOSED:
                {
                    this.isClosed = true;
                    break;
                }
                default:
                {
                    this.isClosed = false;
                    break;
                    break;
                }
            }
            this.dispatchNetStatusEvents([{code:code, level:level, nc:nc, params:params}], delay, signalRedirect, fmsVersion);
            return;
        }// end function

        public function dispatchNetStatusEvents(objectInfos:Array, delay:int = 0, signalRedirect:Boolean = false, fmsVersion:String = null) : void
        {
            var timer:Timer;
            var onDelayTimerComplete:Function;
            var objectInfos:* = objectInfos;
            var delay:* = delay;
            var signalRedirect:* = signalRedirect;
            var fmsVersion:* = fmsVersion;
            if (delay > 0)
            {
                onDelayTimerComplete = function (event:TimerEvent) : void
            {
                timer.removeEventListener(TimerEvent.TIMER_COMPLETE, onDelayTimerComplete);
                doDispatchNetStatusEvents(objectInfos, signalRedirect, fmsVersion);
                return;
            }// end function
            ;
                timer = new Timer(delay, 1);
                timer.addEventListener(TimerEvent.TIMER_COMPLETE, onDelayTimerComplete);
                timer.start();
            }
            else
            {
                this.doDispatchNetStatusEvents(objectInfos, signalRedirect, fmsVersion);
            }
            return;
        }// end function

        private function doDispatchNetStatusEvents(objectInfos:Array, signalRedirect:Boolean = false, fmsVersion:String = null) : void
        {
            var _loc_5:Object = null;
            var _loc_6:Object = null;
            var _loc_7:MockNetConnection = null;
            var _loc_4:String = "";
            for each (_loc_5 in objectInfos)
            {
                
                if (_loc_5["nc"] is NetConnection)
                {
                    _loc_7 = _loc_5["nc"] as MockNetConnection;
                    if (_loc_7)
                    {
                    }
                    if (_loc_7.expectation == NetConnectionExpectation.CONNECT_WITH_PARAMS)
                    {
                        _loc_7.connect(null, "a", "b");
                    }
                    else
                    {
                        if (_loc_7)
                        {
                        }
                        if (_loc_7.expectation == NetConnectionExpectation.CONNECT_WITH_FMTA)
                        {
                            _loc_7.connect.call(_loc_7, null, _loc_5["params"]);
                        }
                        else
                        {
                            (_loc_5["nc"] as NetConnection).connect(null);
                        }
                    }
                }
                if (_loc_5.hasOwnProperty("details"))
                {
                    _loc_4 = _loc_5["details"];
                }
                _loc_6 = {code:_loc_5["code"], level:_loc_5["level"], details:_loc_4, mockEvent:true};
                if (signalRedirect)
                {
                    _loc_6.ex = new Object();
                    _loc_6.ex.code = 302;
                    _loc_6.ex.redirect = "rtmp://example.com/redirect";
                }
                if (fmsVersion)
                {
                    _loc_6.data = new Object();
                    _loc_6.data.version = fmsVersion;
                }
                this.netStatusEventDispatcher.dispatchEvent(new NetStatusEvent(NetStatusEvent.NET_STATUS, false, false, _loc_6));
            }
            return;
        }// end function

        private function onNetStatusEvent(event:NetStatusEvent) : void
        {
            if (event.info.hasOwnProperty("mockEvent") != false)
            {
                if (this.isClosed)
                {
                }
            }
            if (event.info.code != NetConnectionCodes.CONNECT_CLOSED)
            {
                event.stopImmediatePropagation();
            }
            else
            {
                delete event.info.mockEvent;
            }
            return;
        }// end function

    }
}
