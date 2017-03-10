package com.tinychat.ui.components.broadcast.containers
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.monitor.*;
    import com.tinychat.ui.context.broadcast.containers.*;

    public class CameraBroadcastContainer extends VideoBroadcastContainer
    {
        private var cameraVideo:CameraVideoElement;
        private static var _skinParts:Object = {volumeControl:false, nameDisplay:false, contentGroup:false, iconAchiev:false, proIndicator:false, audioActivityIndicator:false, videoControlsOverlay:false};

        public function CameraBroadcastContainer(param1:CameraBroadcast, param2:CameraVideoElement)
        {
            this.cameraVideo = param2;
            super(param1, param2, new BroadcastAudioActivityMonitor(param1), new BroadcastVideoActivityMonitor(param1));
            return;
        }// end function

        override public function dispose() : void
        {
            super.dispose();
            this.cameraVideo = null;
            return;
        }// end function

        override protected function set broadcast(param1:Broadcast) : void
        {
            var _loc_2:* = param1 as CameraBroadcast;
            if (com.tinychat.ui.components.broadcast.containers:AbstractBroadcastContainer::broadcast != _loc_2)
            {
                if (com.tinychat.ui.components.broadcast.containers:AbstractBroadcastContainer::broadcast)
                {
                    CameraBroadcast(com.tinychat.ui.components.broadcast.containers:AbstractBroadcastContainer::broadcast).broadcastingVideoChange.remove(this.broadcastingVideoChangeHandler);
                    this.broadcastingVideoChangeHandler(false);
                }
                super.broadcast = _loc_2;
                if (_loc_2)
                {
                }
                if (this.cameraVideo)
                {
                    _loc_2.broadcastingVideoChange.add(this.broadcastingVideoChangeHandler);
                    this.broadcastingVideoChangeHandler(_loc_2.isBroadcastingVideo);
                }
            }
            return;
        }// end function

        override protected function createContext() : void
        {
            context = new CameraBroadcastContainerContext(this, injector, broadcast as CameraBroadcast);
            return;
        }// end function

        private function broadcastingVideoChangeHandler(param1:Boolean) : void
        {
            if (param1)
            {
                (broadcast as CameraBroadcast).attachToVideo(this.cameraVideo);
                startVideoActivityPolling(broadcast);
            }
            else
            {
                this.cameraVideo.detachCamera();
                stopVideoActivityPolling();
            }
            setAudioOnly(!param1);
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
