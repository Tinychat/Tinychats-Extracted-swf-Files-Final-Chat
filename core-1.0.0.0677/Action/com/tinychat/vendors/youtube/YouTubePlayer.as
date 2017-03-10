package com.tinychat.vendors.youtube
{
    import com.tinychat.model.utils.error.*;
    import com.tinychat.model.utils.url.*;
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.system.*;

    public class YouTubePlayer extends Sprite
    {
        private var loader:Loader;
        private var player:Object;
        private var playerSprite:Sprite;
        private var uncaughtErrorWrapper:UncaughtErrorWrapper;
        private var _loading:Boolean;

        public function YouTubePlayer()
        {
            Security.allowDomain("www.youtube.com");
            Security.allowDomain("youtube.com");
            Security.allowDomain("s.ytimg.com");
            Security.allowDomain("i.ytimg.com");
            Security.loadPolicyFile("https://i.ytimg.com/crossdomain.xml");
            Security.loadPolicyFile("https://www.youtube.com/crossdomain.xml");
            Security.loadPolicyFile("https://s.ytimg.com/crossdomain.xml");
            return;
        }// end function

        public function get loaded() : Boolean
        {
            return this.player != null;
        }// end function

        public function get volume() : Number
        {
            return this.player ? (this.player.getVolume() / 100) : (0);
        }// end function

        public function set volume(param1:Number) : void
        {
            if (this.player)
            {
                this.player.setVolume(Math.round(param1 * 100));
            }
            return;
        }// end function

        public function get muted() : Boolean
        {
            return this.player ? (this.player.isMuted()) : (false);
        }// end function

        public function get state() : YouTubePlayerState
        {
            return this.player ? (YouTubePlayerState.fromCode(this.player.getPlayerState())) : (YouTubePlayerState.UNSTARTED);
        }// end function

        public function get currentTime() : Number
        {
            return this.player ? (this.player.getCurrentTime() * 1000) : (0);
        }// end function

        public function get duration() : Number
        {
            return this.player ? (this.player.getDuration() * 1000) : (0);
        }// end function

        public function load() : void
        {
            if (!this._loading)
            {
            }
            if (!this.player)
            {
                this.loadPlayer();
            }
            return;
        }// end function

        public function mute() : void
        {
            if (this.player)
            {
                this.player.mute();
            }
            return;
        }// end function

        public function unmute() : void
        {
            if (this.player)
            {
                this.player.unMute();
            }
            return;
        }// end function

        public function playVideo() : void
        {
            if (this.player)
            {
                this.player.playVideo();
            }
            return;
        }// end function

        public function pauseVideo() : void
        {
            if (this.player)
            {
                this.player.pauseVideo();
            }
            return;
        }// end function

        public function stopVideo() : void
        {
            if (this.player)
            {
                this.player.stopVideo();
            }
            return;
        }// end function

        public function seekTo(param1:Number, param2:Boolean) : void
        {
            if (this.player)
            {
                this.player.seekTo(param1 / 1000, param2);
            }
            return;
        }// end function

        public function destroy() : void
        {
            if (this.loader)
            {
                this.removeLoaderListeners();
                this.loader.unloadAndStop(true);
                this.loader = null;
            }
            if (this.player)
            {
                this.player.destroy();
                this.player = null;
            }
            if (contains(this.playerSprite))
            {
                removeChild(this.playerSprite);
            }
            this.playerSprite = null;
            return;
        }// end function

        public function loadVideoById(param1:String, param2:Number = 0, param3:String = "default") : void
        {
            if (this.player)
            {
                this.player.loadVideoById(param1, param2, param3);
            }
            return;
        }// end function

        public function setSize(param1:Number, param2:Number) : void
        {
            if (this.player)
            {
                this.player.setSize(param1, param2);
            }
            return;
        }// end function

        private function loadPlayer() : void
        {
            this._loading = true;
            var _loc_1:* = new Url("https://www.youtube.com/apiplayer");
            _loc_1.parameters.concat({version:"3", modestbranding:"1", iv_load_policy:"3", showinfo:"0", rel:"0"});
            this.loader = new Loader();
            this.loader.contentLoaderInfo.addEventListener(Event.INIT, this.loaderInitHandler);
            this.loader.load(new URLRequest(_loc_1.toString()));
            this.uncaughtErrorWrapper = new UncaughtErrorWrapper(this.loader);
            this.uncaughtErrorWrapper.addErrorHandler(this.uncaughtErrorHandler);
            return;
        }// end function

        private function loaderInitHandler(event:Event) : void
        {
            this.loader.contentLoaderInfo.removeEventListener(Event.INIT, this.loaderInitHandler);
            this.addLoaderListeners();
            return;
        }// end function

        private function playerReadyHandler(event:Event) : void
        {
            this._loading = false;
            this.player = this.loader.content;
            this.playerSprite = Sprite(this.player);
            this.playerSprite.addEventListener(MouseEvent.CLICK, this.redispatchEvent, false, 0, true);
            this.playerSprite.addEventListener(MouseEvent.ROLL_OVER, this.redispatchEvent, false, 0, true);
            this.playerSprite.addEventListener(MouseEvent.ROLL_OUT, this.redispatchEvent, false, 0, true);
            dispatchEvent(event);
            return;
        }// end function

        private function playerErrorHandler(event:Event) : void
        {
            this._loading = false;
            this.redispatchEvent(event);
            return;
        }// end function

        private function uncaughtErrorHandler(param1) : void
        {
            if (param1 is Error)
            {
            }
            else if (param1 is ErrorEvent)
            {
            }
            return;
        }// end function

        private function addLoaderListeners() : void
        {
            this.loader.content.addEventListener(YouTubePlayerEvent.READY, this.playerReadyHandler);
            this.loader.content.addEventListener(YouTubePlayerEvent.ERROR, this.playerErrorHandler);
            this.loader.content.addEventListener(YouTubePlayerEvent.STATE_CHANGE, this.stateChangeHandler);
            return;
        }// end function

        private function removeLoaderListeners() : void
        {
            this.loader.content.removeEventListener(YouTubePlayerEvent.READY, this.playerReadyHandler);
            this.loader.content.removeEventListener(YouTubePlayerEvent.ERROR, this.playerErrorHandler);
            this.loader.content.removeEventListener(YouTubePlayerEvent.STATE_CHANGE, this.stateChangeHandler);
            return;
        }// end function

        private function stateChangeHandler(event:Event) : void
        {
            if (!contains(this.playerSprite))
            {
                addChild(this.playerSprite);
            }
            this.redispatchEvent(event);
            return;
        }// end function

        private function redispatchEvent(event:Event) : void
        {
            dispatchEvent(event);
            return;
        }// end function

    }
}
