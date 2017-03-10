package com.tinychat.ui.mediators.moderator
{
    import __AS3__.vec.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.room.*;
    import com.tinychat.ui.components.moderator.*;
    import com.tinychat.ui.mediators.screen.*;

    public class BanListScreenMediator extends ScreenMediator
    {
        public var view:BanListScreen;
        public var banProxy:BanListProxy;

        public function BanListScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.banProxy.load();
            this.view.title = "Banned users";
            this.view.emptyListDisplayText = "The ban list is currently empty.";
            this.view.confirmLabel = "Forgive";
            this.view.cancelLabel = "Close";
            this.view.dataProvider = this.banProxy.list;
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
            var _loc_2:UserIdentity = null;
            var _loc_1:* = new Vector.<UserIdentity>;
            for each (_loc_2 in this.view.selectedItems)
            {
                
                _loc_1.push(_loc_2);
            }
            this.banProxy.forgive(_loc_1);
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
            complete();
            return;
        }// end function

    }
}
