package com.tinychat.ui.components.broadcast.screens
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.securitypanel.*;
    import com.tinychat.ui.components.spark.*;
    import flash.events.*;
    import org.osflash.signals.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.utils.*;

    public class BroadcastAuthorizationScreen extends TitleWindowElementBase implements Disposable
    {
        public var infoDisplay:TextBase;
        public var helpDisplay:RichEditableText;
        private var _securityPanel:SecurityPanelProxy;
        private var _lastOpenedPanel:SecurityPanelNames;
        private var _receivedAuthorization:Signal;
        private var _infoDisplayText:String;
        private var _helpDisplayText:String;
        private var infoDisplayTextChanged:Boolean;
        private var helpDisplayTextChanged:Boolean;
        private static const STATE_PRIVACY_PANEL_OPEN:String = "privacyPanelOpen";
        private static const STATE_PRIVACY_PANEL_OPEN_AND_ALLOWED:String = "privacyPanelOpenAndAllowed";
        private static const STATE_DEVICE_ACCESS_PANEL_OPEN:String = "deviceAccessPanelOpen";
        private static const STATE_PANELS_CLOSED:String = "panelsClosed";
        private static var _skinParts:Object = {confirm:false, cancel:false, helpDisplay:true, infoDisplay:true, loadingIndicator:false, titleDisplay:false, statusLabel:false};

        public function BroadcastAuthorizationScreen()
        {
            this._receivedAuthorization = new Signal();
            return;
        }// end function

        public function set infoDisplayText(param1:String) : void
        {
            if (this._infoDisplayText != param1)
            {
                this._infoDisplayText = param1;
                this.infoDisplayTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set helpDisplayText(param1:String) : void
        {
            if (this._helpDisplayText != param1)
            {
                this._helpDisplayText = param1;
                this.helpDisplayTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function get receivedAuthorization() : ISignal
        {
            return this._receivedAuthorization;
        }// end function

        public function set securityPanel(param1:SecurityPanelProxy) : void
        {
            this._securityPanel = param1;
            this._securityPanel.closed.add(this.securityPanelClosedHandler);
            this._securityPanel.authorizationChanged.add(this.securityPanelAuthorizationChangedHandler);
            this.showPrivacyPanel();
            invalidateSkinState();
            return;
        }// end function

        public function dispose() : void
        {
            this._securityPanel.closed.remove(this.securityPanelClosedHandler);
            this._securityPanel.authorizationChanged.remove(this.securityPanelAuthorizationChangedHandler);
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.infoDisplayTextChanged)
            {
            }
            if (this.infoDisplay)
            {
                this.infoDisplay.text = this._infoDisplayText;
                this.infoDisplayTextChanged = false;
            }
            if (this.helpDisplayTextChanged)
            {
            }
            if (this.helpDisplay)
            {
                this.helpDisplay.textFlow = TextFlowUtil.importFromString(this._helpDisplayText);
                this.helpDisplayTextChanged = false;
            }
            return;
        }// end function

        override protected function getCurrentSkinState() : String
        {
            if (this._securityPanel)
            {
                if (this._securityPanel.isOpen)
                {
                    if (this._securityPanel.isAuthorized)
                    {
                        return STATE_PRIVACY_PANEL_OPEN_AND_ALLOWED;
                    }
                    if (this._securityPanel.openedPanelName == SecurityPanelNames.PRIVACY)
                    {
                        return STATE_PRIVACY_PANEL_OPEN;
                    }
                    return STATE_DEVICE_ACCESS_PANEL_OPEN;
                }
                else
                {
                    return STATE_PANELS_CLOSED;
                }
            }
            return STATE_PRIVACY_PANEL_OPEN;
        }// end function

        override protected function confirmClickHandler(event:MouseEvent) : void
        {
            this.showPrivacyPanel();
            invalidateSkinState();
            return;
        }// end function

        private function showPrivacyPanel() : void
        {
            this._lastOpenedPanel = SecurityPanelNames.PRIVACY;
            this._securityPanel.open(SecurityPanelNames.PRIVACY);
            return;
        }// end function

        private function showDeviceAccessPanel() : void
        {
            this._lastOpenedPanel = SecurityPanelNames.DEVICE_ACCESS;
            this._securityPanel.open(SecurityPanelNames.DEVICE_ACCESS);
            return;
        }// end function

        private function securityPanelAuthorizationChangedHandler(param1:Boolean) : void
        {
            invalidateSkinState();
            return;
        }// end function

        private function securityPanelClosedHandler() : void
        {
            if (this._securityPanel.isAuthorized)
            {
                this._receivedAuthorization.dispatch();
            }
            else if (this._lastOpenedPanel == SecurityPanelNames.PRIVACY)
            {
                this.showDeviceAccessPanel();
            }
            invalidateSkinState();
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
