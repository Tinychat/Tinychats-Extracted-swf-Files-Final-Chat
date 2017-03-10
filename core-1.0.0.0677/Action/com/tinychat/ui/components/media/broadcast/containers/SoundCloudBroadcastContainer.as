package com.tinychat.ui.components.broadcast.containers
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.soundcloud.*;
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.context.broadcast.containers.*;

    public class SoundCloudBroadcastContainer extends AbstractBroadcastContainer
    {
        public var thumbnailDisplay:ImageSourceDisplay;
        private var thumbnailChanged:Boolean;
        private static var _skinParts:Object = {thumbnailDisplay:true, nameDisplay:false, videoControlsOverlay:false, contentGroup:false};

        public function SoundCloudBroadcastContainer(param1:SoundCloudBroadcast)
        {
            super(param1);
            return;
        }// end function

        override protected function set broadcast(param1:Broadcast) : void
        {
            if (com.tinychat.ui.components.broadcast.containers:AbstractBroadcastContainer::broadcast != param1)
            {
                if (this.soundCloudBroadcast)
                {
                    this.soundCloudBroadcast.trackLoaded.remove(this.trackLoadedHandler);
                }
                super.broadcast = param1;
                this.thumbnailChanged = true;
                if (this.soundCloudBroadcast)
                {
                    this.soundCloudBroadcast.trackLoaded.add(this.trackLoadedHandler);
                }
            }
            return;
        }// end function

        override protected function createContext() : void
        {
            context = new SoundCloudBroadcastContainerContext(this, injector, this.soundCloudBroadcast);
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.thumbnailChanged)
            {
            }
            if (this.thumbnailDisplay)
            {
                this.thumbnailDisplay.source = this.soundCloudBroadcast ? (this.soundCloudBroadcast.thumbnailUrl) : (null);
                this.thumbnailChanged = false;
            }
            return;
        }// end function

        private function get soundCloudBroadcast() : SoundCloudBroadcast
        {
            return broadcast as SoundCloudBroadcast;
        }// end function

        private function trackLoadedHandler() : void
        {
            this.thumbnailChanged = true;
            invalidateProperties();
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
