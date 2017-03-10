package com.tinychat.ui.components.broadcast.containers
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.monitor.*;
    import com.tinychat.ui.components.pro.*;
    import com.tinychat.ui.components.spark.*;

    public class AudioBroadcastContainer extends AbstractBroadcastContainer
    {
        public var audioActivityIndicator:AudioActivityIndicator;
        public var proIndicator:ProIndicator;
        public var iconAchiev:AchievementDisplay;
        public var volumeControl:ThumblessHSlider;
        private var audioActivityMonitor:BroadcastActivityMonitor;
        private var broadcastChanged:Boolean;
        private static const STATE_NORMAL:String = "normal";
        private static const STATE_OVER:String = "over";
        private static var _skinParts:Object = {volumeControl:false, nameDisplay:false, contentGroup:false, iconAchiev:false, proIndicator:false, audioActivityIndicator:false, videoControlsOverlay:false};

        public function AudioBroadcastContainer(param1:Broadcast, param2:BroadcastActivityMonitor = null) : void
        {
            this.audioActivityMonitor = param2;
            super(param1);
            return;
        }// end function

        override protected function set broadcast(param1:Broadcast) : void
        {
            if (com.tinychat.ui.components.broadcast.containers:AbstractBroadcastContainer::broadcast != param1)
            {
                if (com.tinychat.ui.components.broadcast.containers:AbstractBroadcastContainer::broadcast)
                {
                }
                if (this.audioActivityMonitor)
                {
                    this.audioActivityMonitor.stopActivityPolling();
                    this.audioActivityMonitor.com.tinychat.model.monitor:BroadcastActivityMonitor::broadcast = null;
                }
                super.broadcast = param1;
                if (this.proIndicator)
                {
                    this.proIndicator.user = com.tinychat.ui.components.broadcast.containers:AbstractBroadcastContainer::broadcast as ProableUser;
                }
                if (this.iconAchiev)
                {
                    this.iconAchiev.achiev = com.tinychat.ui.components.broadcast.containers:AbstractBroadcastContainer::broadcast as Achievement;
                }
                if (com.tinychat.ui.components.broadcast.containers:AbstractBroadcastContainer::broadcast)
                {
                }
                if (this.audioActivityMonitor)
                {
                    this.audioActivityMonitor.com.tinychat.model.monitor:BroadcastActivityMonitor::broadcast = com.tinychat.ui.components.broadcast.containers:AbstractBroadcastContainer::broadcast as UserBroadcast;
                    this.audioActivityMonitor.startActivityPolling(100, this.audioActivityHandler);
                }
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.proIndicator)
            {
                this.proIndicator.user = com.tinychat.ui.components.broadcast.containers:AbstractBroadcastContainer::broadcast as ProableUser;
            }
            if (param2 == this.iconAchiev)
            {
                this.iconAchiev.achiev = com.tinychat.ui.components.broadcast.containers:AbstractBroadcastContainer::broadcast as Achievement;
            }
            return;
        }// end function

        private function audioActivityHandler(param1:Number) : void
        {
            if (this.audioActivityIndicator)
            {
                if (param1 > 0)
                {
                    this.audioActivityIndicator.visible = true;
                    this.audioActivityIndicator.level = param1;
                }
                else
                {
                    this.audioActivityIndicator.visible = false;
                }
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
