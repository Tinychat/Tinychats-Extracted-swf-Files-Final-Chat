package com.tinychat.ui.components.broadcast.containers
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.monitor.*;

    public class StreamBroadcastContainerBase extends VideoBroadcastContainer
    {
        private var streamingVideoElement:StreamingVideoElement;
        private static var _skinParts:Object = {volumeControl:false, nameDisplay:false, contentGroup:false, iconAchiev:false, proIndicator:false, audioActivityIndicator:false, videoControlsOverlay:false};

        public function StreamBroadcastContainerBase(param1:StreamBroadcast, param2:StreamingVideoElement)
        {
            this.streamingVideoElement = param2;
            super(param1, param2, new StreamBroadcastAudioActivityMonitor(param1), new BroadcastVideoActivityMonitor(param1));
            return;
        }// end function

        override public function dispose() : void
        {
            super.dispose();
            this.streamingVideoElement = null;
            return;
        }// end function

        override public function setLayoutBoundsPosition(param1:Number, param2:Number, param3:Boolean = true) : void
        {
            super.setLayoutBoundsPosition(param1, param2, param3);
            this.streamingVideoElement.updateVideoLayout();
            return;
        }// end function

        override public function setLayoutBoundsSize(param1:Number, param2:Number, param3:Boolean = true) : void
        {
            super.setLayoutBoundsSize(param1, param2, param3);
            this.streamingVideoElement.updateVideoLayout();
            return;
        }// end function

        override protected function set broadcast(param1:Broadcast) : void
        {
            var _loc_2:* = param1 as StreamBroadcast;
            if (com.tinychat.ui.components.broadcast.containers:AbstractBroadcastContainer::broadcast != _loc_2)
            {
                if (com.tinychat.ui.components.broadcast.containers:AbstractBroadcastContainer::broadcast)
                {
                    this.streamingVideoElement.detachNetStream();
                    com.tinychat.ui.components.broadcast.containers:AbstractBroadcastContainer::broadcast.started.remove(this.startedHandler);
                    com.tinychat.ui.components.broadcast.containers:AbstractBroadcastContainer::broadcast.stopped.remove(this.stoppedHandler);
                }
                super.broadcast = _loc_2;
                if (_loc_2)
                {
                    _loc_2.attachToVideo(this.streamingVideoElement);
                    _loc_2.started.add(this.startedHandler);
                    _loc_2.stopped.add(this.stoppedHandler);
                    setAudioOnly(false);
                    startVideoActivityPolling(com.tinychat.ui.components.broadcast.containers:AbstractBroadcastContainer::broadcast);
                }
            }
            return;
        }// end function

        override protected function videoActivityPollerHandler(param1:Number) : void
        {
            if (!audioOnly)
            {
            }
            if (param1 == 0)
            {
            }
            if (videoActivityMonitor.timePolling > 3000)
            {
                setAudioOnly(true);
            }
            else
            {
                super.videoActivityPollerHandler(param1);
            }
            return;
        }// end function

        private function startedHandler() : void
        {
            addVideo();
            invalidateSkinState();
            return;
        }// end function

        private function stoppedHandler() : void
        {
            removeVideo();
            invalidateSkinState();
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
