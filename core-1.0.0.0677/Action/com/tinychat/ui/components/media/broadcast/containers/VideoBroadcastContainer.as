package com.tinychat.ui.components.broadcast.containers
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.monitor.*;
    import flash.display.*;
    import flash.events.*;

    public class VideoBroadcastContainer extends AudioBroadcastContainer
    {
        protected var video:VideoElement;
        protected var videoActivityMonitor:BroadcastActivityMonitor;
        private var _audioOnly:Boolean;
        static const STATE_VIDEO_WAITING:String = "videoWaiting";
        static const STATE_AUDIO_ONLY:String = "audioOnly";
        static const STATE_AUDIO_ONLY_AND_OVER:String = "audioOnlyAndOver";
        private static var _skinParts:Object = {volumeControl:false, nameDisplay:false, contentGroup:false, iconAchiev:false, proIndicator:false, audioActivityIndicator:false, videoControlsOverlay:false};

        public function VideoBroadcastContainer(param1:Broadcast, param2:VideoElement, param3:BroadcastActivityMonitor = null, param4:BroadcastActivityMonitor = null)
        {
            this.video = param2;
            this.videoActivityMonitor = param4;
            addEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
            addEventListener(Event.REMOVED_FROM_STAGE, this.removedFromStageHandler);
            super(param1, param3);
            return;
        }// end function

        public function get audioOnly() : Boolean
        {
            return this._audioOnly;
        }// end function

        override public function dispose() : void
        {
            super.dispose();
            this.video.dispose();
            return;
        }// end function

        protected function setAudioOnly(param1:Boolean) : void
        {
            if (this._audioOnly != param1)
            {
                this._audioOnly = param1;
                invalidateSkinState();
            }
            return;
        }// end function

        protected function startVideoActivityPolling(param1:Broadcast) : void
        {
            if (this.videoActivityMonitor)
            {
                this.videoActivityMonitor.broadcast = param1 as UserBroadcast;
                this.videoActivityMonitor.startActivityPolling(1000, this.videoActivityPollerHandler);
                invalidateSkinState();
            }
            return;
        }// end function

        protected function stopVideoActivityPolling() : void
        {
            if (this.videoActivityMonitor)
            {
                this.videoActivityMonitor.stopActivityPolling();
                this.videoActivityMonitor.broadcast = null;
                invalidateSkinState();
            }
            return;
        }// end function

        override protected function set broadcast(param1:Broadcast) : void
        {
            if (this.userBroadcast != param1)
            {
            }
            if (this.userBroadcast)
            {
                this.userBroadcast.videoFilterChanged.remove(this.videoFilterChangedHandler);
                this.stopVideoActivityPolling();
                this.video.filters = [];
            }
            super.broadcast = param1;
            if (this.userBroadcast)
            {
                this.userBroadcast.applyVideoFiltersTo(DisplayObject(this.video));
                this.userBroadcast.videoFilterChanged.add(this.videoFilterChangedHandler);
            }
            return;
        }// end function

        override protected function getCurrentSkinState() : String
        {
            if (this._audioOnly)
            {
                if (isOverState)
                {
                    return STATE_AUDIO_ONLY_AND_OVER;
                }
                return STATE_AUDIO_ONLY;
            }
            else
            {
                if (isOverState)
                {
                    return STATE_OVER;
                }
                if (this.videoActivityMonitor)
                {
                }
                if (this.videoActivityMonitor.polling)
                {
                    return STATE_VIDEO_WAITING;
                }
                return super.getCurrentSkinState();
            }
        }// end function

        override protected function createChildren() : void
        {
            super.createChildren();
            this.addVideo();
            return;
        }// end function

        protected function addVideo() : void
        {
            if (contentGroup)
            {
            }
            if (this.video.parent == null)
            {
                this.video.percentWidth = 100;
                this.video.percentHeight = 100;
                contentGroup.addElement(this.video);
            }
            return;
        }// end function

        protected function removeVideo() : void
        {
            if (this.video.parent != null)
            {
                contentGroup.removeElement(this.video);
            }
            return;
        }// end function

        protected function videoActivityPollerHandler(param1:Number) : void
        {
            if (param1 > 0)
            {
                this.setAudioOnly(false);
                this.stopVideoActivityPolling();
            }
            return;
        }// end function

        protected function addedToStageHandler(event:Event) : void
        {
            this.addVideo();
            return;
        }// end function

        protected function removedFromStageHandler(event:Event) : void
        {
            this.removeVideo();
            return;
        }// end function

        private function videoFilterChangedHandler() : void
        {
            this.userBroadcast.applyVideoFiltersTo(DisplayObject(this.video));
            return;
        }// end function

        private function get userBroadcast() : UserBroadcast
        {
            return broadcast as UserBroadcast;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
