package com.tinychat.ui.mediators.connection
{

    public class ConnectionFailedScreenMediator extends ConnectionRetryScreenBaseMediator
    {

        public function ConnectionFailedScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            view.title = "Connection failed!";
            view.infoMessageText = "We weren\'t able to connect to the chat room. Please check your connection and try again.";
            view.statusLabelText = "Retrying to connect in... {0}";
            view.confirmLabel = "Retry";
            return;
        }// end function

    }
}
