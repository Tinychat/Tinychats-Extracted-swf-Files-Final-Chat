package com.tinychat.ui.components.broadcast.containers
{
    import com.tinychat.model.api.*;
    import com.tinychat.ui.context.broadcast.containers.*;

    public class StreamBroadcastContainer extends StreamBroadcastContainerBase
    {
        static const STATE_BLOCKED:String = "blocked";
        static const STATE_BLOCKED_AND_OVER:String = "blockedAndOver";
        private static var _skinParts:Object = {volumeControl:false, nameDisplay:false, contentGroup:false, iconAchiev:false, proIndicator:false, audioActivityIndicator:false, videoControlsOverlay:false};

        public function StreamBroadcastContainer(param1:StreamBroadcast, param2:StreamingVideoElement)
        {
            super(param1, param2);
            return;
        }// end function

        override protected function set broadcast(param1:Broadcast) : void
        {
            var _loc_2:* = param1 as StreamBroadcast;
            if (this.streamBroadcast != _loc_2)
            {
                if (this.streamBroadcast)
                {
                    this.streamBroadcast.hidden.remove(this.hiddenHandler);
                }
                super.broadcast = _loc_2;
                if (_loc_2)
                {
                    _loc_2.hidden.add(this.hiddenHandler);
                }
            }
            return;
        }// end function

        private function hiddenHandler(param1:Boolean) : void
        {
            invalidateSkinState();
            return;
        }// end function

        override protected function createContext() : void
        {
            context = new StreamBroadcastContainerContext(this, injector, broadcast as StreamBroadcast);
            return;
        }// end function

        override protected function getCurrentSkinState() : String
        {
            if (this.streamBroadcast)
            {
            }
            if (this.streamBroadcast.isHidden)
            {
                if (isOverState)
                {
                    return STATE_BLOCKED_AND_OVER;
                }
                return STATE_BLOCKED;
            }
            else
            {
                return super.getCurrentSkinState();
            }
        }// end function

        private function get streamBroadcast() : StreamBroadcast
        {
            return broadcast as StreamBroadcast;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
