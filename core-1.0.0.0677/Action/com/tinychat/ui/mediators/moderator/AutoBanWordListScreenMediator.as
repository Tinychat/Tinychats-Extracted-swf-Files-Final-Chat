package com.tinychat.ui.mediators.moderator
{
    import com.tinychat.model.moderator.*;
    import com.tinychat.ui.components.moderator.*;
    import com.tinychat.ui.mediators.screen.*;

    public class AutoBanWordListScreenMediator extends ScreenMediator
    {
        public var view:AutoBanWordListScreen;
        public var list:AutoBanWordList;

        public function AutoBanWordListScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.title = "Auto-ban word list";
            this.view.confirmLabel = "Close";
            this.view.addLabel = "Add";
            this.view.dataProvider = this.list;
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
            this.close();
            return;
        }// end function

        private function canceledHandler() : void
        {
            this.close();
            return;
        }// end function

        private function close() : void
        {
            this.list.updateCookie();
            complete();
            return;
        }// end function

    }
}
