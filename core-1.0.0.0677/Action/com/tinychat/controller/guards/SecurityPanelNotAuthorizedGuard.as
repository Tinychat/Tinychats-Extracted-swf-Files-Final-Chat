package com.tinychat.controller.guards
{
    import com.tinychat.model.api.*;

    public class SecurityPanelNotAuthorizedGuard extends Object implements IGuard
    {
        public var securityPanelProxy:SecurityPanelProxy;

        public function SecurityPanelNotAuthorizedGuard()
        {
            return;
        }// end function

        public function approve() : Boolean
        {
            return !this.securityPanelProxy.isAuthorized;
        }// end function

    }
}
