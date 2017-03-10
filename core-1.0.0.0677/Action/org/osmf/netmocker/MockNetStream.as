package org.osmf.netmocker
{
    import __AS3__.vec.*;
    import flash.events.*;
    import flash.net.*;
    import flash.utils.*;
    import org.osmf.net.*;

    public class MockNetStream extends NetStream
    {
        private var _connection:NetConnection;
        private var eventInterceptor:NetStatusEventInterceptor;
        private var _expectedDuration:Number = 0;
        private var _expectedBytesTotal:uint = 0;
        private var _expectedSubclipDuration:Number = NaN;
        private var _expectedWidth:Number = 0;
        private var _expectedHeight:Number = 0;
        private var _expectedEvents:Array;
        private var _expectedCuePoints:Array;
        private var lastFiredCuePointTime:int = -1;
        private var bufferLengthSet:Boolean = false;
        private var _bufferLength:Number;
        private var playheadTimer:Timer;
        private var switchCompleteTimers:Vector.<Timer>;
        private var playing:Boolean = false;
        private var elapsedTime:Number = 0;
        private var absoluteTimeAtLastPlay:Number = 0;
        private var isProgressive:Boolean;
        private var _bytesLoaded:uint = 0;
        private static const TIMER_DELAY:int = 100;
        private static const EVENT_DELAY:int = 100;
        private static const LEVEL_STATUS:String = "status";
        private static const LEVEL_ERROR:String = "error";

        public function MockNetStream(connection:NetConnection)
        {
            this._expectedEvents = [];
            this._expectedCuePoints = [];
            this.switchCompleteTimers = new Vector.<Timer>;
            super(connection);
            this._connection = connection;
            this.eventInterceptor = new NetStatusEventInterceptor(this);
            this.playheadTimer = new Timer(TIMER_DELAY);
            this.playheadTimer.addEventListener(TimerEvent.TIMER, this.onPlayheadTimer);
            return;
        }// end function

        public function set expectedDuration(value:Number) : void
        {
            this._expectedDuration = value;
            return;
        }// end function

        public function get expectedDuration() : Number
        {
            return this._expectedDuration;
        }// end function

        public function set expectedBytesTotal(value:uint) : void
        {
            this._expectedBytesTotal = value;
            return;
        }// end function

        public function get expectedBytesTotal() : uint
        {
            return this._expectedBytesTotal;
        }// end function

        public function set expectedSubclipDuration(value:Number) : void
        {
            this._expectedSubclipDuration = value;
            return;
        }// end function

        public function get expectedSubclipDuration() : Number
        {
            return this._expectedSubclipDuration;
        }// end function

        public function set expectedWidth(value:Number) : void
        {
            this._expectedWidth = value;
            return;
        }// end function

        public function get expectedWidth() : Number
        {
            return this._expectedWidth;
        }// end function

        public function set expectedCuePoints(value:Array) : void
        {
            this._expectedCuePoints = value;
            return;
        }// end function

        public function get expectedCuePoints() : Array
        {
            return this._expectedCuePoints;
        }// end function

        public function set expectedHeight(value:Number) : void
        {
            this._expectedHeight = value;
            return;
        }// end function

        public function get expectedHeight() : Number
        {
            return this._expectedHeight;
        }// end function

        public function set expectedEvents(value:Array) : void
        {
            this._expectedEvents = value;
            return;
        }// end function

        public function get expectedEvents() : Array
        {
            return this._expectedEvents;
        }// end function

        override public function get bufferLength() : Number
        {
            return this.bufferLengthSet ? (this._bufferLength) : (super.bufferLength);
        }// end function

        public function set bufferLength(value:Number) : void
        {
            this.bufferLengthSet = true;
            this._bufferLength = value;
            return;
        }// end function

        override public function get bytesLoaded() : uint
        {
            return this._bytesLoaded;
        }// end function

        override public function get bytesTotal() : uint
        {
            if (!this.playing)
            {
            }
            return this.elapsedTime > 0 ? (this._expectedBytesTotal) : (0);
        }// end function

        override public function get time() : Number
        {
            return this.playing ? ((this.elapsedTime + (getTimer() - this.absoluteTimeAtLastPlay)) / 1000) : (this.elapsedTime);
        }// end function

        override public function close() : void
        {
            this.playing = false;
            this.elapsedTime = 0;
            this.playheadTimer.stop();
            return;
        }// end function

        override public function play(... args) : void
        {
            if (args != null)
            {
            }
            if (args.length > 0)
            {
            }
            if (args[0].toString().substr(0, 4) == "http")
            {
                this.isProgressive = true;
                bufferTime = bufferTime < 0.1 ? (0.1) : (bufferTime);
            }
            else
            {
                this.isProgressive = false;
                this._expectedBytesTotal = 0;
            }
            this.commonPlay();
            return;
        }// end function

        override public function play2(nso:NetStreamPlayOptions) : void
        {
            var _loc_2:Array = null;
            var _loc_3:Timer = null;
            if (nso.transition == NetStreamPlayTransitions.SWITCH)
            {
                _loc_2 = [{code:NetStreamCodes.NETSTREAM_PLAY_TRANSITION, details:nso.streamName, level:LEVEL_STATUS}];
                this.eventInterceptor.dispatchNetStatusEvents(_loc_2, EVENT_DELAY);
                _loc_3 = new Timer(350, 1);
                this.switchCompleteTimers.push(_loc_3);
                _loc_3.addEventListener(TimerEvent.TIMER_COMPLETE, this.sendSwitchCompleteMsg);
                _loc_3.start();
            }
            else
            {
                this.isProgressive = false;
                this._expectedBytesTotal = 0;
                this.commonPlay();
            }
            return;
        }// end function

        override public function pause() : void
        {
            if (this.playing)
            {
                this.elapsedTime = this.elapsedTime + (getTimer() - this.absoluteTimeAtLastPlay) / 1000;
            }
            this.playing = false;
            this.playheadTimer.stop();
            var _loc_1:Array = [{code:NetStreamCodes.NETSTREAM_PAUSE_NOTIFY, level:LEVEL_STATUS}, {code:NetStreamCodes.NETSTREAM_BUFFER_FLUSH, level:LEVEL_STATUS}];
            this.eventInterceptor.dispatchNetStatusEvents(_loc_1, EVENT_DELAY);
            return;
        }// end function

        override public function resume() : void
        {
            this.absoluteTimeAtLastPlay = getTimer();
            this.playing = true;
            this.playheadTimer.start();
            var _loc_1:Array = [{code:NetStreamCodes.NETSTREAM_UNPAUSE_NOTIFY, level:LEVEL_STATUS}, {code:NetStreamCodes.NETSTREAM_PLAY_START, level:LEVEL_STATUS}, {code:NetStreamCodes.NETSTREAM_BUFFER_FULL, level:LEVEL_STATUS}];
            this.eventInterceptor.dispatchNetStatusEvents(_loc_1, EVENT_DELAY);
            return;
        }// end function

        override public function seek(offset:Number) : void
        {
            var infos:Array;
            var timer:Timer;
            var onNetStreamSeekBugTimer:Function;
            var offset:* = offset;
            if (offset >= 0)
            {
            }
            if (offset <= this.normalizedExpectedDuration)
            {
                onNetStreamSeekBugTimer = function (event:TimerEvent) : void
            {
                timer.removeEventListener(TimerEvent.TIMER, onNetStreamSeekBugTimer);
                elapsedTime = offset;
                return;
            }// end function
            ;
                this.lastFiredCuePointTime = -1;
                if (this.playing)
                {
                    this.absoluteTimeAtLastPlay = getTimer();
                }
                infos;
                this.eventInterceptor.dispatchNetStatusEvents(infos, EVENT_DELAY);
                timer = new Timer(300, 1);
                timer.addEventListener(TimerEvent.TIMER, onNetStreamSeekBugTimer);
                timer.start();
            }
            return;
        }// end function

        private function onPlayheadTimer(event:TimerEvent) : void
        {
            var _loc_2:Array = null;
            var _loc_3:Object = null;
            if (this.time >= this.normalizedExpectedDuration)
            {
                this.elapsedTime = this.normalizedExpectedDuration;
                this.playing = false;
                this.playheadTimer.stop();
                _loc_2 = [{code:NetStreamCodes.NETSTREAM_PLAY_STOP, level:LEVEL_STATUS}, {code:NetStreamCodes.NETSTREAM_BUFFER_FLUSH, level:LEVEL_STATUS}, {code:NetStreamCodes.NETSTREAM_BUFFER_EMPTY, level:LEVEL_STATUS}];
                this.eventInterceptor.dispatchNetStatusEvents(_loc_2);
                if (this.isProgressive == false)
                {
                    this.client.onPlayStatus({code:NetStreamCodes.NETSTREAM_PLAY_COMPLETE});
                }
            }
            else
            {
                _loc_2 = this.getInfosForPosition(this.time);
                if (_loc_2.length > 0)
                {
                    this.eventInterceptor.dispatchNetStatusEvents(_loc_2);
                }
                if (this.expectedCuePoints.length > 0)
                {
                    for each (_loc_3 in this.expectedCuePoints)
                    {
                        
                        if (this.time >= _loc_3.time)
                        {
                        }
                        if (_loc_3.time > this.lastFiredCuePointTime)
                        {
                            this.client.onCuePoint(_loc_3);
                            this.lastFiredCuePointTime = _loc_3.time;
                            break;
                        }
                    }
                }
            }
            this._bytesLoaded = Math.min(this._expectedBytesTotal, this._bytesLoaded + this._expectedBytesTotal / 4);
            return;
        }// end function

        private function getInfosForPosition(position:Number) : Array
        {
            var _loc_4:EventInfo = null;
            var _loc_2:Array = [];
            var _loc_3:* = this._expectedEvents.length;
            while (_loc_3 > 0)
            {
                
                _loc_4 = this._expectedEvents[(_loc_3 - 1)];
                if (position >= _loc_4.position)
                {
                    _loc_2.push({code:_loc_4.code, level:_loc_4.level});
                    this._expectedEvents.splice((_loc_3 - 1), 1);
                }
                _loc_3 = _loc_3 - 1;
            }
            return _loc_2;
        }// end function

        private function get normalizedExpectedDuration() : Number
        {
            return isNaN(this.expectedSubclipDuration) ? (this.expectedDuration) : (this.expectedSubclipDuration);
        }// end function

        private function commonPlay() : void
        {
            var _loc_2:Object = null;
            if (this.expectedDuration != 0)
            {
                _loc_2 = {};
                _loc_2["duration"] = this.expectedDuration;
                if (this.expectedWidth > 0)
                {
                    _loc_2["width"] = this.expectedWidth;
                }
                if (this.expectedHeight > 0)
                {
                    _loc_2["height"] = this.expectedHeight;
                }
                if (this.expectedCuePoints != null)
                {
                }
                if (this.expectedCuePoints.length > 0)
                {
                    _loc_2["cuePoints"] = this.expectedCuePoints;
                }
                try
                {
                    client.onMetaData(_loc_2);
                }
                catch (e:ReferenceError)
                {
                }
            }
            this.absoluteTimeAtLastPlay = getTimer();
            this.playing = true;
            this.playheadTimer.start();
            var _loc_1:Array = [{code:NetStreamCodes.NETSTREAM_PLAY_RESET, level:LEVEL_STATUS}, {code:NetStreamCodes.NETSTREAM_PLAY_START, level:LEVEL_STATUS}, {code:NetStreamCodes.NETSTREAM_BUFFER_FULL, level:LEVEL_STATUS}];
            this.eventInterceptor.dispatchNetStatusEvents(_loc_1, EVENT_DELAY);
            return;
        }// end function

        private function sendSwitchCompleteMsg(event:TimerEvent) : void
        {
            var _loc_2:* = this.switchCompleteTimers.shift();
            _loc_2.removeEventListener(TimerEvent.TIMER, this.sendSwitchCompleteMsg);
            this.client.onPlayStatus({code:NetStreamCodes.NETSTREAM_PLAY_TRANSITION_COMPLETE});
            return;
        }// end function

    }
}
