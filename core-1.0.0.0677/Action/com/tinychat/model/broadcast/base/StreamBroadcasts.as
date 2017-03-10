package com.tinychat.model.broadcast.base
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.room.connection.callbacks.arguments.*;
    import com.tinychat.model.user.*;

    public class StreamBroadcasts extends UserBroadcastsBase
    {
        private var connection:ConnectionCallbackReceiver;
        private var users:Users;
        private var factory:StreamBroadcastFactory;
        private var applicationVolume:MasterSoundControl;

        public function StreamBroadcasts(param1:Users, param2:ConnectionCallbackReceiver, param3:StreamBroadcastFactory, param4:MasterSoundControl)
        {
            this.users = param1;
            this.connection = param2;
            this.factory = param3;
            this.applicationVolume = param4;
            this.connection.avon.add(this.avonHandler);
            this.connection.avons.add(this.avonsHandler);
            this.connection.avoff.add(this.avoffHandler);
            super(param1);
            return;
        }// end function

        protected function startStreamBroadcast(param1:Identity, param2:BroadcastPlatform) : void
        {
            var broadcast:StreamBroadcast;
            var identity:* = param1;
            var platform:* = param2;
            var user:* = this.users.userFromId(identity);
            if (!has(identity))
            {
            }
            if (user)
            {
                broadcast = this.factory.newInstance(user, this.connection.newStream(), platform);
                broadcast.unpublished.addOnce(function () : void
            {
                _stop(broadcast);
                return;
            }// end function
            );
                this.applicationVolume.addSoundControl(broadcast);
                _start(broadcast);
            }
            else if (!user)
            {
                ;
            }
            return;
        }// end function

        protected function stopStreamBroadcast(param1:Identity) : void
        {
            var _loc_2:StreamBroadcast = null;
            if (has(param1))
            {
                _loc_2 = get(param1) as StreamBroadcast;
                this.applicationVolume.removeSoundControl(_loc_2);
                _stop(get(param1));
            }
            return;
        }// end function

        private function avonHandler(param1:RoomCallbackAvonArguments) : void
        {
            this.startStreamBroadcast(param1.toUser(), param1.toPlatform());
            return;
        }// end function

        private function avonsHandler(param1:RoomCallbackAvonsArguments) : void
        {
            var _loc_2:RoomCallbackAvonArguments = null;
            for each (_loc_2 in param1.toAvonArguments())
            {
                
                this.avonHandler(_loc_2);
            }
            return;
        }// end function

        private function avoffHandler(param1:UserArgument) : void
        {
            this.stopStreamBroadcast(param1.toUser());
            return;
        }// end function

    }
}
