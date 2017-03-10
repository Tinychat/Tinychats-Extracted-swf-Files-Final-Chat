package com.tinychat.ui.mediators.connection
{

    public class ConnectionLostScreenMediator extends ConnectionRetryScreenBaseMediator
    {

        public function ConnectionLostScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            view.title = "Connection lost!";
            view.infoMessageText = "The connection to the chat room was interrupted.";
            view.statusLabelText = "Retrying to connect in... {0}";
            view.confirmLabel = "Retry";
            return;
        }// end function

    }
}
