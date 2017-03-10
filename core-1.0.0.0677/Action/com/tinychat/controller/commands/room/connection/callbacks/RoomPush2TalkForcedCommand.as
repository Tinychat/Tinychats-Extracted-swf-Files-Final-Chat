package com.tinychat.controller.commands.room.connection.callbacks
{
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.model.sounds.*;
    import org.robotlegs.mvcs.*;

    public class RoomPush2TalkForcedCommand extends Command
    {
        public var microphoneMode:MicrophoneMode;
        public var postNotice:PostActionNotice;

        public function RoomPush2TalkForcedCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            if (!this.microphoneMode.pushToTalk)
            {
                this.microphoneMode.pushToTalk = true;
                this.postNotice.dispatch("*A moderator has set your microphone mode to Push-to-Talk.*");
            }
            return;
        }// end function

    }
}
