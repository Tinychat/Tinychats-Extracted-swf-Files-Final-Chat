package com.tinychat.ui.components.social.effects.video
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.videoeffects.*;
    import flash.display.*;
    import flash.media.*;
    import org.osflash.signals.*;

    public class AbstractDecoratedCameraBroadcast extends Object implements CameraBroadcast
    {
        protected var decorated:CameraBroadcast;

        public function AbstractDecoratedCameraBroadcast(param1:CameraBroadcast)
        {
            this.decorated = param1;
            return;
        }// end function

        public function get id() : String
        {
            return this.decorated.id;
        }// end function

        public function get name() : String
        {
            return this.decorated.name;
        }// end function

        public function get account() : String
        {
            return this.decorated.account;
        }// end function

        public function get operator() : Boolean
        {
            return this.decorated.operator;
        }// end function

        public function get operatorChange() : ISignal
        {
            return this.decorated.operatorChange;
        }// end function

        public function get isLoggedIn() : Boolean
        {
            return this.decorated.isLoggedIn;
        }// end function

        public function get ignored() : Boolean
        {
            return this.decorated.ignored;
        }// end function

        public function get ignoreChange() : ISignal
        {
            return this.decorated.ignoreChange;
        }// end function

        public function get pro() : uint
        {
            return this.decorated.pro;
        }// end function

        public function get proChange() : ISignal
        {
            return this.decorated.proChange;
        }// end function

        public function get points() : uint
        {
            return this.decorated.points;
        }// end function

        public function get pointsChange() : ISignal
        {
            return this.decorated.pointsChange;
        }// end function

        public function get achievement() : String
        {
            return this.decorated.achievement;
        }// end function

        public function get achievementChange() : ISignal
        {
            return this.decorated.achievementChange;
        }// end function

        public function get videoFilter() : VideoFilter
        {
            return this.decorated.videoFilter;
        }// end function

        public function set videoFilter(param1:VideoFilter) : void
        {
            this.decorated.videoFilter = param1;
            return;
        }// end function

        public function get videoFilterChanged() : ISignal
        {
            return this.decorated.videoFilterChanged;
        }// end function

        public function applyVideoFiltersTo(param1:DisplayObject) : void
        {
            this.decorated.applyVideoFiltersTo(param1);
            return;
        }// end function

        public function get unpublished() : ISignal
        {
            return this.decorated.unpublished;
        }// end function

        public function get started() : ISignal
        {
            return this.decorated.started;
        }// end function

        public function get stopped() : ISignal
        {
            return this.decorated.stopped;
        }// end function

        public function get isPlaying() : Boolean
        {
            return this.decorated.isPlaying;
        }// end function

        public function get isClosed() : Boolean
        {
            return this.decorated.isClosed;
        }// end function

        public function start() : void
        {
            this.decorated.start();
            return;
        }// end function

        public function stop() : void
        {
            this.decorated.stop();
            return;
        }// end function

        public function close() : void
        {
            this.decorated.close();
            return;
        }// end function

        public function dispose() : void
        {
            return;
        }// end function

        public function get renamed() : ISignal
        {
            return this.decorated.renamed;
        }// end function

        public function get audioActivityLevel() : Number
        {
            return this.decorated.audioActivityLevel;
        }// end function

        public function get videoActivityLevel() : Number
        {
            return this.decorated.videoActivityLevel;
        }// end function

        public function attachToVideo(param1:CameraVideoElement) : void
        {
            this.decorated.attachToVideo(param1);
            return;
        }// end function

        public function get isBroadcastingVideo() : Boolean
        {
            return this.decorated.isBroadcastingVideo;
        }// end function

        public function get broadcastingVideoChange() : ISignal
        {
            return this.decorated.broadcastingVideoChange;
        }// end function

        public function get muted() : Boolean
        {
            return this.decorated.muted;
        }// end function

        public function mute() : void
        {
            this.decorated.mute();
            return;
        }// end function

        public function unmute() : void
        {
            this.decorated.unmute();
            return;
        }// end function

        public function switchCamera(param1:Camera) : void
        {
            this.decorated.switchCamera(param1);
            return;
        }// end function

        public function switchMicrophone(param1:Microphone) : void
        {
            this.decorated.switchMicrophone(param1);
            return;
        }// end function

    }
}
