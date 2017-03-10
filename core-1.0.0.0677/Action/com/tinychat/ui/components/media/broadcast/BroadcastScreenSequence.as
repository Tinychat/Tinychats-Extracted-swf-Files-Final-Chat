package com.tinychat.ui.components.broadcast
{
    import com.tinychat.controller.guards.*;
    import com.tinychat.model.api.*;
    import com.tinychat.ui.components.broadcast.screens.*;
    import com.tinychat.ui.screensequence.*;
    import mx.core.*;
    import org.robotlegs.core.*;

    public class BroadcastScreenSequence extends ScreenSequencer
    {
        private var securityPanel:SecurityPanelProxy;

        public function BroadcastScreenSequence(param1:IInjector, param2:IVisualElementContainer, param3:SecurityPanelProxy)
        {
            super(param1, param2);
            this.securityPanel = param3;
            if (param3.isUnresponsive)
            {
                addScreen(BroadcastAuthorizationWorkaroundScreen, SecurityPanelNotAuthorizedGuard);
            }
            else
            {
                addScreen(BroadcastAuthorizationScreen, SecurityPanelNotAuthorizedGuard);
            }
            param3.authorizationChanged.add(this.authorizationChangedHandler);
            completed.add(this.completeHandler);
            interrupted.add(this.interruptedHandler);
            return;
        }// end function

        private function authorizationChangedHandler(param1:Boolean) : void
        {
            if (!param1)
            {
            }
            if (currentIndex != 0)
            {
                start();
            }
            return;
        }// end function

        private function completeHandler() : void
        {
            this.removeAuthorizationChangedHandler();
            return;
        }// end function

        private function interruptedHandler() : void
        {
            this.removeAuthorizationChangedHandler();
            return;
        }// end function

        private function removeAuthorizationChangedHandler() : void
        {
            this.securityPanel.authorizationChanged.remove(this.authorizationChangedHandler);
            return;
        }// end function

    }
}
