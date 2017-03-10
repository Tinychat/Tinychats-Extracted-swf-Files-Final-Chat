package com.tinychat.model.api
{
    import com.tinychat.model.securitypanel.*;
    import org.osflash.signals.*;

    public interface SecurityPanelProxy
    {

        public function SecurityPanelProxy();

        function open(param1:SecurityPanelNames) : void;

        function get isOpen() : Boolean;

        function get openedPanelName() : SecurityPanelNames;

        function close() : void;

        function get closed() : ISignal;

        function get isAuthorized() : Boolean;

        function get authorizationChanged() : ISignal;

        function get isUnresponsive() : Boolean;

    }
}
