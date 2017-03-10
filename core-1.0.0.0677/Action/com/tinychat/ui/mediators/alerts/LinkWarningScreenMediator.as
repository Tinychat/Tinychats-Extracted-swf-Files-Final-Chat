package com.tinychat.ui.mediators.alerts
{
    import com.tinychat.model.utils.url.*;
    import com.tinychat.ui.components.alerts.*;
    import com.tinychat.ui.mediators.screen.*;
    import flash.net.*;

    public class LinkWarningScreenMediator extends ScreenMediator
    {
        public var view:LinkWarningScreen;
        public var url:Url;

        public function LinkWarningScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.title = "Be careful! This link leads you off Tinychat!";
            this.view.statusLabelText = "For your safety, never enter your tinychat password after you click a link. " + "Tinychat has no downloads or required plugins. Any site asking you to download, " + "login or install a plugin to view it is FAKE. When in doubt, just type tinychat.com into your browser.";
            this.view.confirmLabel = "Open link";
            this.view.cancelLabel = "Cancel";
            this.view.url = this.url;
            this.view.confirmed.add(this.confirmedHandler);
            this.view.canceled.add(this.canceledHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.view.confirmed.remove(this.confirmedHandler);
            this.view.canceled.remove(this.canceledHandler);
            return;
        }// end function

        private function confirmedHandler() : void
        {
            navigateToURL(new URLRequest(this.url.href), "_blank");
            complete();
            return;
        }// end function

        private function canceledHandler() : void
        {
            canceled();
            return;
        }// end function

    }
}
