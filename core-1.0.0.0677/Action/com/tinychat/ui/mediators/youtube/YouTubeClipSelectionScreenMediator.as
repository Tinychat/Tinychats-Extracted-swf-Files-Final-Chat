package com.tinychat.ui.mediators.youtube
{
    import com.tinychat.controller.commands.broadcast.media.signals.*;
    import com.tinychat.model.media.*;
    import com.tinychat.model.utils.*;
    import com.tinychat.model.youtube.*;
    import com.tinychat.services.youtube.*;
    import com.tinychat.ui.components.youtube.*;
    import com.tinychat.ui.mediators.screen.*;
    import flash.events.*;

    public class YouTubeClipSelectionScreenMediator extends ScreenMediator
    {
        public var view:YouTubeClipSelectionScreen;
        public var feedService:YouTubeFeedService;
        public var searchService:YouTubeSearchService;
        public var startMediaBroadcast:StartMediaBroadcast;
        public var mediaPlaylist:PlaylistProxy;
        public var osVersion:OsVersion;

        public function YouTubeClipSelectionScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.title = "YouTube video selection";
            this.view.searchingText = "Searching for {0}...";
            this.view.headerDisplayText = "Search for videos or enter a YouTube URL:";
            this.view.playButtonLabelText = "Play";
            this.view.info = this.osVersion.name == OsVersion.MAC_OS ? ("Click to start playing any video, or Command+Click to add to the playlist") : ("Click to start playing any video, or Ctrl+Click to add to the playlist");
            this.view.listProvider = this.mediaPlaylist.list;
            this.view.selectedItemPlaylist = this.mediaPlaylist.selectedClip;
            this.view.loop.selected = this.mediaPlaylist.loop;
            this.view.shuffle.selected = this.mediaPlaylist.shuffle;
            this.view.loop.addEventListener(Event.CHANGE, this.changeLoopHandler);
            this.view.shuffle.addEventListener(Event.CHANGE, this.changeShuffleHandler);
            this.view.searchRequest.add(this.searchRequestHandler);
            this.view.selectionMade.add(this.selectionMadeHandler);
            this.view.addToPlaylist.add(this.addToPlaylistHandler);
            this.view.deleteToPlaylist.add(this.deleteToPlaylistHandler);
            this.view.playToPlaylist.add(this.playToPlaylistHandler);
            this.feedService.success.add(this.serviceSuccessHandler);
            this.searchService.success.add(this.serviceSuccessHandler);
            this.mediaPlaylist.selected.add(this.selectedMediaHandler);
            this.feedService.load();
            return;
        }// end function

        override public function onRemove() : void
        {
            this.view.loop.removeEventListener(Event.CHANGE, this.changeLoopHandler);
            this.view.shuffle.removeEventListener(Event.CHANGE, this.changeShuffleHandler);
            this.view.searchRequest.remove(this.searchRequestHandler);
            this.view.selectionMade.remove(this.selectionMadeHandler);
            this.view.addToPlaylist.remove(this.addToPlaylistHandler);
            this.view.deleteToPlaylist.remove(this.deleteToPlaylistHandler);
            this.view.playToPlaylist.remove(this.playToPlaylistHandler);
            this.feedService.success.remove(this.serviceSuccessHandler);
            this.searchService.success.remove(this.serviceSuccessHandler);
            this.mediaPlaylist.selected.remove(this.selectedMediaHandler);
            return;
        }// end function

        private function searchRequestHandler(param1:String) : void
        {
            this.searchService.load(param1);
            return;
        }// end function

        private function selectionMadeHandler(param1:YouTubeClip) : void
        {
            this.mediaPlaylist.stop();
            this.startMediaBroadcast.dispatch(param1);
            return;
        }// end function

        private function serviceSuccessHandler(param1:YouTubeFeed) : void
        {
            this.view.dataProvider = param1;
            return;
        }// end function

        private function addToPlaylistHandler(param1:YouTubeClip) : void
        {
            if (!this.mediaPlaylist.list.hasItemWith(param1))
            {
                this.mediaPlaylist.addClipItem(param1);
            }
            return;
        }// end function

        private function deleteToPlaylistHandler(param1:YouTubeClip) : void
        {
            if (this.mediaPlaylist.list.hasItemWith(param1))
            {
                this.mediaPlaylist.removeClipItem(param1);
            }
            return;
        }// end function

        private function playToPlaylistHandler(param1:YouTubeClip) : void
        {
            this.mediaPlaylist.startPlayList(param1);
            return;
        }// end function

        private function selectedMediaHandler() : void
        {
            this.view.selectedItemPlaylist = this.mediaPlaylist.selectedClip;
            return;
        }// end function

        private function changeLoopHandler(event:Event) : void
        {
            this.mediaPlaylist.loop = event.currentTarget.selected;
            return;
        }// end function

        private function changeShuffleHandler(event:Event) : void
        {
            this.mediaPlaylist.shuffle = event.currentTarget.selected;
            return;
        }// end function

    }
}
