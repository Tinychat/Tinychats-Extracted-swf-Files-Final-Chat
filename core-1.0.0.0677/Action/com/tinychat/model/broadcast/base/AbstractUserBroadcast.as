package com.tinychat.model.broadcast.base
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.monitor.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.utils.*;
    import com.tinychat.model.videoeffects.*;
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import org.osflash.signals.*;

    public class AbstractUserBroadcast extends Object implements UserBroadcast
    {
        protected var stream:NetStream;
        private var audioActivity:Activity;
        private var videoActivity:Activity;
        private var user:User;
        private var _isPlaying:Boolean;
        private var _isClosed:Boolean;
        private var _unpublished:Signal;
        private var _started:Signal;
        private var _stopped:Signal;
        private var _videoFilter:VideoFilter;
        private var _videoFilterChanged:Signal;

        public function AbstractUserBroadcast(param1:User, param2:NetStream, param3:Activity, param4:Activity)
        {
            this.user = param1;
            this.stream = param2;
            this.videoActivity = param3;
            this.audioActivity = param4;
            param2.client = new DynamicCallbackReceiver(this.streamCallbackHandler, NetStreamCallbackMethodNames.all);
            param2.addEventListener(NetStatusEvent.NET_STATUS, this.netStatusHandler);
            param2.addEventListener(AsyncErrorEvent.ASYNC_ERROR, this.asyncErrorHandler);
            this._unpublished = new Signal();
            this._started = new Signal();
            this._stopped = new Signal();
            this._videoFilterChanged = new Signal();
            return;
        }// end function

        public function get id() : String
        {
            return this.user.id;
        }// end function

        public function get name() : String
        {
            return this.user.name;
        }// end function

        public function get renamed() : ISignal
        {
            return this.user.renamed;
        }// end function

        public function get account() : String
        {
            return this.user.account;
        }// end function

        public function get ignored() : Boolean
        {
            return this.user.ignored;
        }// end function

        public function get ignoreChange() : ISignal
        {
            return this.user.ignoreChange;
        }// end function

        public function get operator() : Boolean
        {
            return this.user.operator;
        }// end function

        public function get operatorChange() : ISignal
        {
            return this.user.operatorChange;
        }// end function

        public function get pro() : uint
        {
            return this.user.pro;
        }// end function

        public function get proChange() : ISignal
        {
            return this.user.proChange;
        }// end function

        public function get points() : uint
        {
            return this.user.points;
        }// end function

        public function get pointsChange() : ISignal
        {
            return this.user.pointsChange;
        }// end function

        public function get achievement() : String
        {
            return this.user.achievement;
        }// end function

        public function get achievementChange() : ISignal
        {
            return this.user.achievementChange;
        }// end function

        public function get isLoggedIn() : Boolean
        {
            return this.user.isLoggedIn;
        }// end function

        public function get isPlaying() : Boolean
        {
            return this._isPlaying;
        }// end function

        public function get unpublished() : ISignal
        {
            return this._unpublished;
        }// end function

        public function get started() : ISignal
        {
            return this._started;
        }// end function

        public function get stopped() : ISignal
        {
            return this._stopped;
        }// end function

        public function get isClosed() : Boolean
        {
            return this._isClosed;
        }// end function

        public function get videoActivityLevel() : Number
        {
            return this.videoActivity.activityLevel;
        }// end function

        public function get audioActivityLevel() : Number
        {
            return this.audioActivity.activityLevel;
        }// end function

        public function get videoFilter() : VideoFilter
        {
            return this._videoFilter;
        }// end function

        public function set videoFilter(param1:VideoFilter) : void
        {
            if (this._videoFilter != param1)
            {
                this._videoFilter = param1;
                this._videoFilterChanged.dispatch();
            }
            return;
        }// end function

        public function get videoFilterChanged() : ISignal
        {
            return this._videoFilterChanged;
        }// end function

        public function applyVideoFiltersTo(param1:DisplayObject) : void
        {
            var _loc_3:AdvancedShaderFilter = null;
            var _loc_2:Array = [];
            if (this._videoFilter)
            {
                _loc_3 = this._videoFilter.createFilter();
                _loc_3.update(param1.width, param1.height);
                _loc_2.push(_loc_3);
            }
            param1.filters = _loc_2;
            return;
        }// end function

        public function start() : void
        {
            if (!this._isClosed)
            {
            }
            if (!this.isPlaying)
            {
                this._isPlaying = true;
                this._started.dispatch();
            }
            return;
        }// end function

        public function stop() : void
        {
            if (!this._isClosed)
            {
            }
            if (this.isPlaying)
            {
                this._isPlaying = false;
                this._stopped.dispatch();
            }
            return;
        }// end function

        public function close() : void
        {
            this.stop();
            if (this.stream.hasOwnProperty("dispose"))
            {
                this.stream["dispose"].call();
            }
            else
            {
                this.stream.close();
            }
            this._isClosed = true;
            this._unpublished.removeAll();
            return;
        }// end function

        public function dispose() : void
        {
            if (this.stream)
            {
                this.stream.removeEventListener(NetStatusEvent.NET_STATUS, this.netStatusHandler);
                this.stream.removeEventListener(AsyncErrorEvent.ASYNC_ERROR, this.asyncErrorHandler);
                this.stream = null;
            }
            this._unpublished.removeAll();
            return;
        }// end function

        private function netStatusHandler(event:NetStatusEvent) : void
        {
            switch(event.info.code)
            {
                case "NetStream.Play.UnpublishNotify":
                case "NetStream.Play.Failed":
                case "NetStream.Publish.BadName":
                {
                    this._unpublished.dispatch();
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        private function asyncErrorHandler(event:AsyncErrorEvent) : void
        {
            return;
        }// end function

        private function streamCallbackHandler(param1:String, param2:Array) : void
        {
            return;
        }// end function

    }
}
