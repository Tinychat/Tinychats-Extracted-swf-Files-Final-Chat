package com.tinychat.model.gifts
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.room.connection.callbacks.arguments.*;
    import com.tinychat.model.room.connection.calls.*;
    import com.tinychat.model.user.*;
    import com.tinychat.model.userinfo.*;
    import org.osflash.signals.*;

    public class GiftCommunicator extends Object
    {
        private var users:RoomUsers;
        private var parser:RoomConnection;
        private var sender:PrepareGiftSender;
        private var pendingUser:UserIdentity;
        private var showInfoGifts:Boolean;
        private var _giftRequestSatisfied:Signal;

        public function GiftCommunicator(param1:RoomConnection, param2:PrepareGiftSender, param3:RoomUsers)
        {
            this.parser = param1;
            this.sender = param2;
            this.users = param3;
            this.showInfoGifts = true;
            this._giftRequestSatisfied = new Signal(String, UserIdentity);
            this.parser.gift_profile.add(this.userinfoHandler);
            return;
        }// end function

        public function get giftRequestSatisfied() : ISignal
        {
            return this._giftRequestSatisfied;
        }// end function

        public function sendGiftRequest(param1:UserIdentity) : void
        {
            this.pendingUser = param1;
            this.sender.send(param1);
            return;
        }// end function

        private function userinfoHandler(param1:RoomCallbackPrepareGiftArguments) : void
        {
            if (this.pendingUser)
            {
            }
            if (param1.tinychatUsername)
            {
            }
            if (this.pendingUser.id == param1.toIdentity().id)
            {
                this._giftRequestSatisfied.dispatch(param1.tinychatUsername, this.pendingUser);
                this.pendingUser = null;
            }
            else
            {
                if (this.showInfoGifts)
                {
                }
                if (this.users.isCurrentUser(param1.toIdentity()))
                {
                    this.users.isCurrentUser(param1.toIdentity());
                }
                if (param1.tinychatUsername == UserinfoCommunicator.NO_INFO_TOKEN)
                {
                    this.showInfoGifts = false;
                    this._giftRequestSatisfied.dispatch(param1.tinychatUsername, param1.toIdentity());
                }
            }
            return;
        }// end function

    }
}
