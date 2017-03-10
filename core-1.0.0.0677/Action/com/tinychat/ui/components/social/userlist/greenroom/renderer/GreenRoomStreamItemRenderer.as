package com.tinychat.ui.components.social.userlist.greenroom.renderer
{
    import com.tinychat.controller.context.*;
    import com.tinychat.model.api.*;
    import com.tinychat.ui.components.broadcast.containers.*;
    import com.tinychat.ui.components.video.controls.*;
    import flash.events.*;

    public class GreenRoomStreamItemRenderer extends StreamBroadcastContainerBase implements IDataRenderer
    {
        public var allow:GreenRoomAllowButton;
        public var deny:BanButton;
        private static var _skinParts:Object = {allow:true, deny:true, volumeControl:false, nameDisplay:false, contentGroup:false, iconAchiev:false, proIndicator:false, audioActivityIndicator:false, videoControlsOverlay:false};

        public function GreenRoomStreamItemRenderer(param1:StreamingVideoElement)
        {
            super(null, param1);
            return;
        }// end function

        public function get data() : Object
        {
            return broadcast;
        }// end function

        public function set data(param1:Object) : void
        {
            if (broadcast != param1)
            {
                if (context)
                {
                    context.dispose();
                    context = null;
                }
                com.tinychat.ui.components.broadcast.containers:StreamBroadcastContainerBase::broadcast = param1 as StreamBroadcast;
                if (broadcast)
                {
                    this.createContext();
                    broadcast.start();
                }
                nameDisplay.user = broadcast as UserBroadcast;
            }
            return;
        }// end function

        override protected function createContext() : void
        {
            if (broadcast)
            {
            }
            if (injector)
            {
                context = new GreenRoomStreamItemRendererContext(this, injector, broadcast as StreamBroadcast);
            }
            return;
        }// end function

        override protected function addedToStageHandler(event:Event) : void
        {
            super.addedToStageHandler(event);
            if (broadcast)
            {
                broadcast.start();
            }
            return;
        }// end function

        override protected function removedFromStageHandler(event:Event) : void
        {
            super.removedFromStageHandler(event);
            if (broadcast)
            {
                broadcast.stop();
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
