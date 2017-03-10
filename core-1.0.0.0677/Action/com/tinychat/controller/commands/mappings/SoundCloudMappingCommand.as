package com.tinychat.controller.commands.mappings
{
    import com.tinychat.model.broadcast.soundcloud.*;
    import com.tinychat.services.soundcloud.*;
    import com.tinychat.ui.components.controlbar.buttons.*;
    import com.tinychat.ui.components.soundcloud.*;
    import com.tinychat.ui.mediators.controlbar.buttons.*;
    import com.tinychat.ui.mediators.soundcloud.*;

    public class SoundCloudMappingCommand extends MappingCommand
    {
        private static const SOUND_TRACKS:String = "https://api.soundcloud.com/tracks.json";

        public function SoundCloudMappingCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            injector.mapClass(SoundCloudTrackService, SoundCloudTrackService);
            injector.mapClass(SoundCloudTracksService, SoundCloudTracksService);
            injector.mapValue(String, SOUND_TRACKS, "SoundCloudTracksServiceUrl");
            injector.mapSingleton(SoundCloudBroadcasts);
            mediatorMap.mapView(SoundCloudButton, SoundCloudButtonMediator);
            mediatorMap.mapView(SoundCloudTrackSelectionScreen, SoundCloudTrackSelectionScreenMediator);
            return;
        }// end function

    }
}
