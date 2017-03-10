package com.tinychat.ui.mediators.soundcloud
{
    import com.tinychat.controller.commands.broadcast.media.signals.*;
    import com.tinychat.model.soundcloud.*;
    import com.tinychat.services.soundcloud.*;
    import com.tinychat.ui.components.soundcloud.*;
    import com.tinychat.ui.mediators.screen.*;

    public class SoundCloudTrackSelectionScreenMediator extends ScreenMediator
    {
        public var view:SoundCloudTrackSelectionScreen;
        public var searchService:SoundCloudTracksService;
        public var startMediaBroadcast:StartMediaBroadcast;

        public function SoundCloudTrackSelectionScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.title = "SoundCloud track selection";
            this.view.searchingText = "Searching for {0}...";
            this.view.headerDisplayText = "Search for tracks or enter a SoundCloud id#:";
            this.view.playButtonLabelText = "Play";
            this.view.searchRequest.add(this.searchRequestHandler);
            this.view.selectionMade.add(this.selectionMadeHandler);
            this.searchService.success.add(this.serviceSuccessHandler);
            this.searchService.load("");
            return;
        }// end function

        override public function onRemove() : void
        {
            this.view.searchRequest.remove(this.searchRequestHandler);
            this.view.selectionMade.remove(this.selectionMadeHandler);
            this.searchService.success.remove(this.serviceSuccessHandler);
            return;
        }// end function

        private function searchRequestHandler(param1:String) : void
        {
            this.searchService.load(param1);
            return;
        }// end function

        private function selectionMadeHandler(param1:SoundCloudTrack) : void
        {
            this.startMediaBroadcast.dispatch(param1);
            complete();
            return;
        }// end function

        private function serviceSuccessHandler(param1:SoundCloudTracks) : void
        {
            this.view.dataProvider = param1;
            return;
        }// end function

    }
}
