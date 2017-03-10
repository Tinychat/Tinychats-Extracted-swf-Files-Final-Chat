package com.tinychat.controller.commands.room.connection.callbacks
{
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.model.sounds.*;
    import org.robotlegs.mvcs.*;

    public class RoomMutedCommand extends Command
    {
        public var microphoneVolume:MicrophoneVolume;
        public var postNotice:PostActionNotice;
        private static const FORCE_MUTE_TIMEOUT:Number = 5000;

        public function RoomMutedCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.microphoneVolume.forceMute(FORCE_MUTE_TIMEOUT);
            this.postNotice.dispatch("*Your microphone has been temporarily muted by a moderator.*");
            return;
        }// end function

    }
}
