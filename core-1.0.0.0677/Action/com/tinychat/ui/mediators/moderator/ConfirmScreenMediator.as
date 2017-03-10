package com.tinychat.ui.mediators.moderator
{
    import com.tinychat.ui.components.moderator.*;
    import com.tinychat.ui.mediators.screen.*;

    public class ConfirmScreenMediator extends ScreenMediator
    {
        public var view:ConfirmScreen;

        public function ConfirmScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
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

        protected function confirmedHandler() : void
        {
            this.close();
            return;
        }// end function

        protected function canceledHandler() : void
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
