package com.tinychat.model.proxies
{
    import com.tinychat.model.securitypanel.*;
    import com.tinychat.model.utils.*;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.system.*;
    import flash.utils.*;
    import org.osflash.signals.*;
    import org.osmf.netmocker.*;

    public class InternalSecurityPanel extends Object implements SecurityPanelProxy
    {
        private var authorizationListeningDevice:EventDispatcher;
        private var mockConnection:MockNetConnection;
        private var mockStream:MockNetStream;
        private var checkForClosedPoller:Timer;
        private var bitmapData:BitmapData;
        private var stage:Stage;
        private var flashVersion:FlashVersion;
        private var osVersion:OsVersion;
        private var _isOpen:Boolean;
        private var _authorizationChanged:Signal;
        private var _closed:Signal;
        private var _openedPanelName:SecurityPanelNames;
        public static const DEVICE_ACCESS_PANEL:String = "deviceAccessPanel";

        public function InternalSecurityPanel(param1:Stage, param2:FlashVersion, param3:OsVersion)
        {
            this.stage = param1;
            this.flashVersion = param2;
            this.osVersion = param3;
            this.registerStatusListener();
            this.mockConnection = new MockNetConnection();
            this.mockConnection.connect(null);
            this.mockStream = new MockNetStream(this.mockConnection);
            this._authorizationChanged = new Signal(Boolean);
            this._closed = new Signal();
            this._closed.add(this.closedHandler);
            this.bitmapData = new BitmapData(1, 1);
            this.checkForClosedPoller = new Timer(100);
            return;
        }// end function

        public function open(param1:SecurityPanelNames) : void
        {
            this._isOpen = true;
            this._openedPanelName = param1;
            if (param1 == SecurityPanelNames.DEVICE_ACCESS)
            {
                if (this.authorizationListeningDevice is Camera)
                {
                    this.mockStream.attachCamera(this.authorizationListeningDevice as Camera);
                }
                else
                {
                    this.mockStream.attachAudio(this.authorizationListeningDevice as Microphone);
                }
            }
            else
            {
                Security.showSettings(param1.toString());
            }
            setTimeout(this.registerPanelCloseListeners, 500);
            return;
        }// end function

        public function close() : void
        {
            return;
        }// end function

        public function get isOpen() : Boolean
        {
            return this._isOpen;
        }// end function

        public function get closed() : ISignal
        {
            return this._closed;
        }// end function

        public function get isAuthorized() : Boolean
        {
            if (this.authorizationListeningDevice)
            {
            }
            return !Object(this.authorizationListeningDevice).muted;
        }// end function

        public function get authorizationChanged() : ISignal
        {
            return this._authorizationChanged;
        }// end function

        public function get isUnresponsive() : Boolean
        {
            if (this.osVersion.name == OsVersion.MAC_OS)
            {
            }
            if (this.osVersion.majorVersion == "10")
            {
            }
            if (parseInt(this.osVersion.minorVersion) >= 7)
            {
            }
            return !this.flashVersion.isEqualToOrGreaterThan(10, 3, 183, 5);
        }// end function

        public function get openedPanelName() : SecurityPanelNames
        {
            return this._openedPanelName;
        }// end function

        private function registerPanelCloseListeners() : void
        {
            this.stage.addEventListener(MouseEvent.MOUSE_MOVE, this.mouseMoveHandler);
            this.checkForClosedPoller.addEventListener(TimerEvent.TIMER, this.checkForClosePollerHandler);
            this.checkForClosedPoller.start();
            return;
        }// end function

        private function registerStatusListener() : void
        {
            if (this.authorizationListeningDevice)
            {
                this.authorizationListeningDevice.removeEventListener(StatusEvent.STATUS, this.authorizationStatusHandler);
            }
            this.loadAuthorizationListeningDevice();
            if (this.authorizationListeningDevice)
            {
                this.authorizationListeningDevice.addEventListener(StatusEvent.STATUS, this.authorizationStatusHandler);
            }
            return;
        }// end function

        private function loadAuthorizationListeningDevice() : void
        {
            this.authorizationListeningDevice = Camera.getCamera();
            if (!this.authorizationListeningDevice)
            {
                this.authorizationListeningDevice = Microphone.getMicrophone();
            }
            return;
        }// end function

        private function authorizationStatusHandler(event:StatusEvent) : void
        {
            if (event.code == "Camera.Unmuted")
            {
                this._authorizationChanged.dispatch(true);
            }
            else if (event.code == "Camera.Muted")
            {
                this._authorizationChanged.dispatch(false);
            }
            return;
        }// end function

        private function checkForClosePollerHandler(event:TimerEvent) : void
        {
            try
            {
                this.bitmapData.draw(this.stage);
                this._closed.dispatch();
            }
            catch (error:Error)
            {
            }
            return;
        }// end function

        private function mouseMoveHandler(event:MouseEvent) : void
        {
            this._closed.dispatch();
            return;
        }// end function

        private function closedHandler() : void
        {
            this._isOpen = false;
            this._openedPanelName = null;
            this.mockStream.attachAudio(null);
            this.mockStream.attachCamera(null);
            this.stage.removeEventListener(MouseEvent.MOUSE_MOVE, this.mouseMoveHandler);
            this.checkForClosedPoller.removeEventListener(TimerEvent.TIMER, this.checkForClosePollerHandler);
            this.checkForClosedPoller.stop();
            return;
        }// end function

    }
}
