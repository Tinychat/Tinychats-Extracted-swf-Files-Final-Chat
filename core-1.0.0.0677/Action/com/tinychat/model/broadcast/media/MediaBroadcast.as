package com.tinychat.model.broadcast.media
{
    import com.tinychat.model.api.*;

    public interface MediaBroadcast extends Broadcast, MasterSoundControllable, Hideable, Timed
    {

        public function MediaBroadcast();

        function get mediaId() : String;

        function get isPaused() : Boolean;

        function get initiator() : UserIdentity;

        function play() : void;

    }
}
