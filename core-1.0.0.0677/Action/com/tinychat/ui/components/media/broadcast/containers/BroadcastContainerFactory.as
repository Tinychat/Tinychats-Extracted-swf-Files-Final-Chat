package com.tinychat.ui.components.broadcast.containers
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.greenroom.*;
    import com.tinychat.model.broadcast.soundcloud.*;
    import com.tinychat.model.monitor.*;
    import com.tinychat.model.youtube.*;
    import com.tinychat.ui.components.video.elements.*;

    public class BroadcastContainerFactory extends Object
    {
        private var cameraFactory:CameraVideoElementFactory;
        private var streamFactory:StreamingVideoElementFactory;

        public function BroadcastContainerFactory(param1:CameraVideoElementFactory, param2:StreamingVideoElementFactory)
        {
            this.cameraFactory = param1;
            this.streamFactory = param2;
            return;
        }// end function

        public function newInstance(param1:Broadcast)
        {
            if (param1 is CameraBroadcast)
            {
                if (param1 is GreenRoomCameraBroadcast)
                {
                    return new GreenRoomCameraBroadcastContainer(param1 as GreenRoomCameraBroadcast, this.cameraFactory.newInstance());
                }
                return new CameraBroadcastContainer(param1 as CameraBroadcast, this.cameraFactory.newInstance());
            }
            else
            {
                if (param1 is StreamBroadcast)
                {
                    return new StreamBroadcastContainer(param1 as StreamBroadcast, this.streamFactory.newInstance());
                }
                if (param1 is YouTubeBroadcast)
                {
                    return new YouTubeBroadcastContainer(param1 as YouTubeBroadcast);
                }
                if (param1 is SoundCloudBroadcast)
                {
                    return new SoundCloudBroadcastContainer(param1 as SoundCloudBroadcast);
                }
                return new AudioBroadcastContainer(param1 as UserBroadcast, new BroadcastAudioActivityMonitor(param1 as UserBroadcast));
            }
        }// end function

    }
}
