package com.tinychat.controller.commands.broadcast.media.send
{
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.media.*;
    import com.tinychat.model.room.connection.calls.*;
    import com.tinychat.model.user.*;
    import flash.errors.*;
    import org.robotlegs.mvcs.*;

    public class AbstractSendMediaBroadcastCommand extends Command
    {
        public var sender:PrivateMessageSender;
        public var postChat:PostMediaNotice;
        public var users:RoomUsers;
        private var broadcast:MediaBroadcast;

        public function AbstractSendMediaBroadcastCommand(param1:MediaBroadcast)
        {
            this.broadcast = param1;
            return;
        }// end function

        override public function execute() : void
        {
            this.performAction(this.broadcast);
            return;
        }// end function

        protected function get currentUser() : User
        {
            return this.users.currentUser;
        }// end function

        protected function performAction(param1:MediaBroadcast) : void
        {
            throw new IllegalOperationError("Must be over-ridden in sub-class.");
        }// end function

    }
}
