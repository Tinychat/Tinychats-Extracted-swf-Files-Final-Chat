package com.tinychat.controller.commands.room.connection.callbacks
{
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.controller.commands.social.network.mqtt.*;
    import com.tinychat.model.flashvars.*;
    import com.tinychat.model.room.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.room.connection.calls.*;
    import com.tinychat.model.social.chat.conversation.tinychat.*;
    import com.tinychat.model.sounds.*;
    import org.robotlegs.mvcs.*;

    public class JoinsdoneCommand extends SignalCommand
    {
        public var connection:RoomConnection;
        public var flashvars:FlashvarsProxy;
        public var roomSettings:RoomSettingsProxy;
        public var userCount:RoomUserCount;
        public var publicChat:PublicChat;
        public var postNotice:PostActionNotice;
        public var chatSoundEffect:ChatSoundEffect;
        public var giftSoundEffect:GiftSoundEffect;

        public function JoinsdoneCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            if (this.roomSettings.pro)
            {
                this.connection.call(new RoomCallPro(this.flashvars));
            }
            var _loc_1:* = this.userCount.count <= 5;
            this.chatSoundEffect.enabled = _loc_1;
            this.publicChat.receiveNotices = _loc_1;
            this.giftSoundEffect.enabled = true;
            this.postNotice.dispatch("*Type /help for a list of commands.*");
            if (this.roomSettings.topic != "")
            {
                this.postNotice.dispatch(this.roomSettings.topic);
            }
            commandMap.execute(MqttInitSequenceCommand);
            return;
        }// end function

    }
}
