package com.tinychat.controller.commands.mappings
{
    import com.tinychat.controller.commands.broadcast.media.receive.*;
    import com.tinychat.controller.commands.broadcast.media.send.*;
    import com.tinychat.controller.commands.broadcast.media.signals.*;
    import com.tinychat.model.parsers.privatemessage.*;

    public class MediaMappingCommand extends MappingCommand
    {

        public function MediaMappingCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            signalCommandMap.mapSignalClass(CloseMediaBroadcast, CloseMediaBroadcastCommand);
            signalCommandMap.mapSignalClass(PauseMediaBroadcast, PauseMediaBroadcastCommand);
            signalCommandMap.mapSignalClass(PlayMediaBroadcast, PlayMediaBroadcastCommand);
            signalCommandMap.mapSignalClass(SeekMediaBroadcast, SeekMediaBroadcastCommand);
            signalCommandMap.mapSignalClass(StartMediaBroadcast, StartMediaBroadcastCommand);
            var _loc_1:* = injector.getInstance(PrivateMessageParser);
            signalCommandMap.mapSignal(_loc_1.mediaBroadcastClosed, MediaBroadcastClosedCommand);
            signalCommandMap.mapSignal(_loc_1.mediaBroadcastPaused, MediaBroadcastPausedCommand);
            signalCommandMap.mapSignal(_loc_1.mediaBroadcastPlayed, MediaBroadcastPlayedCommand);
            signalCommandMap.mapSignal(_loc_1.mediaBroadcastSought, MediaBroadcastSoughtCommand);
            signalCommandMap.mapSignal(_loc_1.mediaBroadcastStarted, MediaBroadcastStartedCommand);
            signalCommandMap.mapSignal(_loc_1.mediaBroadcastStartedPaused, MediaBroadcastStartedPausedCommand);
            return;
        }// end function

    }
}
