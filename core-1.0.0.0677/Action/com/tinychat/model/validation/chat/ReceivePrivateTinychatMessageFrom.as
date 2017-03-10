package com.tinychat.model.validation.chat
{
    import com.tinychat.controller.guards.chat.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;

    public class ReceivePrivateTinychatMessageFrom extends ReceivePublicTinychatMessageFrom
    {
        private var receivePrivateMessages:ReceiveTinychatPrivateMessagesGuard;

        public function ReceivePrivateTinychatMessageFrom(param1:RoomUsers, param2:ReceiveTinychatPrivateMessagesGuard)
        {
            this.receivePrivateMessages = param2;
            super(param1);
            return;
        }// end function

        override public function isValid(param1:Identity) : Boolean
        {
            if (this.receivePrivateMessages.approve())
            {
                return super.isValid(param1);
            }
            return false;
        }// end function

    }
}
