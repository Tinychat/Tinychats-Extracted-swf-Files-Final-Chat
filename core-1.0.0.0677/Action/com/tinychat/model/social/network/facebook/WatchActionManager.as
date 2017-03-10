package com.tinychat.model.social.network.facebook
{
    import by.blooddy.crypto.serialization.*;
    import com.codecatalyst.promise.*;
    import com.tinychat.model.broadcast.media.*;
    import com.tinychat.model.cookie.*;
    import com.tinychat.model.room.*;
    import com.tinychat.model.youtube.*;
    import com.tinychat.services.social.network.facebook.og.*;
    import org.osflash.signals.*;

    public class WatchActionManager extends Object
    {
        private var facebookLogin:FacebookLoginProxy;
        private var postService:OpenGraphActionService;
        private var updateService:OpenGraphUpdateService;
        private var deleteService:OpenGraphDeleteService;
        private var roomInfo:RoomSettings;
        private var broadcastIdLookup:Object;
        private var mediaIdLookup:Object;
        private var settings:FlashCookieProxy;
        private var _posted:Signal;
        private static const RESTRICTED_CHARACTERS:RegExp = new RegExp("[\'<>&`\"]", "g");

        public function WatchActionManager(param1:FacebookLoginProxy, param2:OpenGraphActionService, param3:OpenGraphUpdateService, param4:OpenGraphDeleteService, param5:RoomSettings, param6:FlashCookieProxy)
        {
            this.facebookLogin = param1;
            this.postService = param2;
            this.updateService = param3;
            this.deleteService = param4;
            this.roomInfo = param5;
            this.settings = param6;
            this.broadcastIdLookup = {};
            this.mediaIdLookup = {};
            this._posted = new Signal(YouTubeBroadcast);
            return;
        }// end function

        public function get posted() : ISignal
        {
            return this._posted;
        }// end function

        public function post(param1:YouTubeBroadcast) : void
        {
            var promise:Promise;
            var url:String;
            var broadcast:* = param1;
            if (this.settings.openGraphShareEnabled)
            {
            }
            if (!this.hasPostedClip(broadcast))
            {
            }
            if (this.isLoggedIn)
            {
                url = this.roomInfo.name + "?yt=" + broadcast.mediaId + "&title=" + broadcast.clip.title.replace(RESTRICTED_CHARACTERS, "") + "&image=" + broadcast.clip.thumbnailUrl;
                promise = this.postService.send(OpenGraphAction.WATCH, OpenGraphObject.VIDEO, encodeURI(url)).then(function (param1:Object) : String
            {
                _posted.dispatch(broadcast);
                return JSON.decode(param1.toString()).id;
            }// end function
            , function (param1:String) : void
            {
                removeBroadcast(broadcast);
                return;
            }// end function
            );
                this.broadcastIdLookup[broadcast.id] = promise;
                this.mediaIdLookup[broadcast.mediaId] = promise;
            }
            return;
        }// end function

        public function update(param1:YouTubeBroadcast) : void
        {
            var promise:Promise;
            var broadcast:* = param1;
            if (this.hasPostedBroadcast(broadcast))
            {
                this.hasPostedBroadcast(broadcast);
            }
            if (this.isLoggedIn)
            {
                promise = this.getBroadcastPromise(broadcast);
                promise.then(function (param1:String) : void
            {
                updateService.send(param1, {expires_in:broadcast.currentTime});
                return;
            }// end function
            );
            }
            return;
        }// end function

        public function withdraw(param1:YouTubeBroadcast) : void
        {
            var promise:Promise;
            var broadcast:* = param1;
            if (this.hasPostedBroadcast(broadcast))
            {
                this.hasPostedBroadcast(broadcast);
            }
            if (this.isLoggedIn)
            {
                promise = this.getBroadcastPromise(broadcast);
                promise.then(function (param1:String) : void
            {
                deleteService.send(param1);
                return;
            }// end function
            ).then(function () : void
            {
                removeBroadcast(broadcast);
                return;
            }// end function
            );
            }
            return;
        }// end function

        private function get isLoggedIn() : Boolean
        {
            return this.facebookLogin.isLoggedIn;
        }// end function

        private function hasPostedBroadcast(param1:YouTubeBroadcast) : Boolean
        {
            return this.broadcastIdLookup.hasOwnProperty(param1.id);
        }// end function

        private function hasPostedClip(param1:YouTubeBroadcast) : Boolean
        {
            return this.mediaIdLookup.hasOwnProperty(param1.mediaId);
        }// end function

        private function getBroadcastPromise(param1:YouTubeBroadcast) : Promise
        {
            return this.broadcastIdLookup[param1.id];
        }// end function

        private function removeBroadcast(param1:MediaBroadcast) : void
        {
            delete this.broadcastIdLookup[param1.id];
            delete this.mediaIdLookup[param1.mediaId];
            return;
        }// end function

    }
}
