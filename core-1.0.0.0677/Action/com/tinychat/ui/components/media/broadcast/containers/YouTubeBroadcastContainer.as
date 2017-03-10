package com.tinychat.ui.components.broadcast.containers
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.youtube.*;
    import com.tinychat.ui.components.youtube.*;
    import com.tinychat.ui.context.broadcast.containers.*;
    import flash.events.*;

    public class YouTubeBroadcastContainer extends AbstractBroadcastContainer
    {
        public var playerContainer:YouTubePlayerContainer;
        private var broadcastChanged:Boolean;
        private var mouseIsOverYouTube:Boolean;
        private var broadcastIsAttached:Boolean;
        private static const STATE_LOADING:String = "loading";
        private static const STATE_BLOCKED:String = "blocked";
        private static const STATE_BLOCKED_AND_OVER:String = "blockedAndOver";
        private static var _skinParts:Object = {playerContainer:true, nameDisplay:false, videoControlsOverlay:false, contentGroup:false};

        public function YouTubeBroadcastContainer(param1:YouTubeBroadcast)
        {
            super(param1);
            addEventListener(MouseEvent.ROLL_OVER, this.youTubeRollOverHandler, true);
            addEventListener(MouseEvent.ROLL_OUT, this.youtTubeRollOutHandler, true);
            return;
        }// end function

        override public function dispose() : void
        {
            this.detatchBroadcast();
            super.dispose();
            return;
        }// end function

        override protected function createContext() : void
        {
            context = new YouTubeBroadcastContainerContext(this, injector, this.youTubeBroadcast);
            return;
        }// end function

        override protected function set broadcast(param1:Broadcast) : void
        {
            if (broadcast != param1)
            {
                if (this.youTubeBroadcast)
                {
                    this.youTubeBroadcast.started.remove(this.startedHandler);
                    this.youTubeBroadcast.stopped.remove(this.stoppedHandler);
                    this.youTubeBroadcast.hidden.remove(this.hiddenHandler);
                    this.youTubeBroadcast.stateChanged.remove(this.stateChangedHandler);
                }
                super.broadcast = param1;
                if (this.youTubeBroadcast)
                {
                    this.youTubeBroadcast.started.add(this.startedHandler);
                    this.youTubeBroadcast.stopped.add(this.stoppedHandler);
                    this.youTubeBroadcast.hidden.add(this.hiddenHandler);
                    this.youTubeBroadcast.stateChanged.add(this.stateChangedHandler);
                }
            }
            return;
        }// end function

        override protected function getCurrentSkinState() : String
        {
            if (this.youTubeBroadcast)
            {
                if (this.youTubeBroadcast.isHidden)
                {
                    if (this.isOverState)
                    {
                        return STATE_BLOCKED_AND_OVER;
                    }
                    return STATE_BLOCKED;
                }
                else
                {
                    if (this.isOverState)
                    {
                        return STATE_OVER;
                    }
                    if (this.youTubeBroadcast.isLoading)
                    {
                    }
                    if (!menuIsOpen)
                    {
                        return STATE_LOADING;
                    }
                }
            }
            return super.getCurrentSkinState();
        }// end function

        override protected function get isOverState() : Boolean
        {
            if (!this.mouseIsOverYouTube)
            {
            }
            return super.isOverState;
        }// end function

        private function youTubeRollOverHandler(event:MouseEvent) : void
        {
            if (!this.mouseIsOverYouTube)
            {
                this.mouseIsOverYouTube = true;
                invalidateSkinState();
            }
            return;
        }// end function

        private function youtTubeRollOutHandler(event:MouseEvent) : void
        {
            if (this.mouseIsOverYouTube)
            {
                this.mouseIsOverYouTube = false;
                invalidateSkinState();
            }
            return;
        }// end function

        private function hiddenHandler(param1:Boolean) : void
        {
            if (param1)
            {
                this.detatchBroadcast();
            }
            else
            {
                this.attachBroadcast();
            }
            invalidateSkinState();
            return;
        }// end function

        private function startedHandler() : void
        {
            this.attachBroadcast();
            return;
        }// end function

        private function stoppedHandler() : void
        {
            this.detatchBroadcast();
            return;
        }// end function

        private function stateChangedHandler() : void
        {
            invalidateSkinState();
            return;
        }// end function

        private function attachBroadcast() : void
        {
            if (!this.broadcastIsAttached)
            {
            }
            if (this.playerContainer)
            {
                this.youTubeBroadcast.attachTo(this.playerContainer);
                this.broadcastIsAttached = true;
            }
            return;
        }// end function

        private function detatchBroadcast() : void
        {
            if (this.broadcastIsAttached)
            {
            }
            if (this.playerContainer)
            {
                this.playerContainer.player = null;
                this.broadcastIsAttached = false;
            }
            return;
        }// end function

        private function get youTubeBroadcast() : YouTubeBroadcast
        {
            return broadcast as YouTubeBroadcast;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
