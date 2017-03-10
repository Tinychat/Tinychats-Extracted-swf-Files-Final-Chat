package com.tinychat.ui.mediators.alerts
{
    import com.tinychat.model.utils.url.*;
    import com.tinychat.ui.components.alerts.*;
    import com.tinychat.ui.mediators.screen.*;

    public class LinkBlockedScreenMediator extends ScreenMediator
    {
        public var view:LinkBlockedScreen;
        public var url:Url;

        public function LinkBlockedScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.title = "Link blocked!";
            this.view.statusLabelText = "This link has been identified as a possible threat and has been blocked.";
            this.view.confirmLabel = "Ok";
            this.view.url = this.url;
            this.view.confirmed.add(this.confirmedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.view.confirmed.remove(this.confirmedHandler);
            return;
        }// end function

        private function confirmedHandler() : void
        {
            complete();
            return;
        }// end function

    }
}
