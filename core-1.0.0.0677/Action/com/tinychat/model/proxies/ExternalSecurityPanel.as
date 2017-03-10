package com.tinychat.model.proxies
{
    import com.tinychat.model.javascript.*;
    import com.tinychat.model.securitypanel.*;
    import flash.media.*;
    import org.osflash.signals.*;

    public class ExternalSecurityPanel extends Object implements SecurityPanelProxy
    {
        private var javascript:ApplicationJavascript;
        private var _isOpen:Boolean;
        private var _closed:Signal;
        private var _openedPanelName:SecurityPanelNames;

        public function ExternalSecurityPanel(param1:ApplicationJavascript)
        {
            this.javascript = param1;
            this._closed = new Signal();
            param1.securityPanelClosed.add(this.securityPanelClosedHandler);
            return;
        }// end function

        public function get isOpen() : Boolean
        {
            return this._isOpen;
        }// end function

        public function get openedPanelName() : SecurityPanelNames
        {
            return this._openedPanelName;
        }// end function

        public function open(param1:SecurityPanelNames) : void
        {
            if (!this._isOpen)
            {
                this.javascript.openSecurityPanel(param1.toString());
                this._isOpen = true;
                this._openedPanelName = param1;
            }
            return;
        }// end function

        public function close() : void
        {
            if (this._isOpen)
            {
                this.javascript.closeSecurityPanel();
                this._isOpen = false;
                this._openedPanelName = null;
            }
            return;
        }// end function

        public function get closed() : ISignal
        {
            return this._closed;
        }// end function

        public function get isAuthorized() : Boolean
        {
            return !Microphone.getMicrophone().muted;
        }// end function

        public function get authorizationChanged() : ISignal
        {
            return this.javascript.securityPanelAuthorizationChanged;
        }// end function

        public function get isUnresponsive() : Boolean
        {
            return false;
        }// end function

        private function securityPanelClosedHandler() : void
        {
            this._isOpen = false;
            this._closed.dispatch();
            return;
        }// end function

    }
}
