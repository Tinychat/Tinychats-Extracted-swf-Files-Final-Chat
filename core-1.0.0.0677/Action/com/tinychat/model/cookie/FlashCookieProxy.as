package com.tinychat.model.cookie
{
    import flash.net.*;
    import org.osflash.signals.*;

    public class FlashCookieProxy extends Object
    {
        private var _sharedObject:SharedObject;
        private var _writingDataFailed:Signal;
        private static const AEC_ENABLED:String = "aecEnabled";
        private static const APPLICATION_VOLUME:String = "applicationVolume";
        private static const AUTO_BAN_WORD_LIST:String = "autoBanWordList";
        private static const BROADCAST_PASSWORD:String = "broadcastPassword";
        private static const CONFIRM_BANS:String = "confirmBans";
        private static const DATA_STORE_NAME:String = "tinychat-spark-client";
        private static const OPEN_GRAPH_REMIND_ME:String = "openGraphRemindMe";
        private static const OPEN_GRAPH_SHARE_ENABLED:String = "openGraphShareEnabled";
        private static const PLAY_YOUTUBE_VIDEOS:String = "playYouTubeVideos";
        private static const PUSH_TO_TALK_TOGGLED:String = "pushToTalkToggled";
        private static const RECEIVE_PMS:String = "receivePms";
        private static const REMEMBER_APPLICATION_VOLUME:String = "rememberApplicationVolume";
        private static const SELECTED_CAMERA_NAME:String = "selectedCameraName";
        private static const SELECTED_MICROPHONE_NAME:String = "selectedMicrophoneName";
        private static const USERNAME:String = "username";

        public function FlashCookieProxy()
        {
            this._writingDataFailed = new Signal();
            return;
        }// end function

        public function get applicationVolume() : Number
        {
            return this.getData(APPLICATION_VOLUME, 1);
        }// end function

        public function set applicationVolume(param1:Number) : void
        {
            this.setData(APPLICATION_VOLUME, param1);
            return;
        }// end function

        public function get autoBanWordList() : Array
        {
            return this.getData(AUTO_BAN_WORD_LIST, []);
        }// end function

        public function set autoBanWordList(param1:Array) : void
        {
            this.setData(AUTO_BAN_WORD_LIST, param1);
            return;
        }// end function

        public function get openGraphShareEnabled() : Boolean
        {
            return this.getData(OPEN_GRAPH_SHARE_ENABLED, true);
        }// end function

        public function set openGraphShareEnabled(param1:Boolean) : void
        {
            this.setData(OPEN_GRAPH_SHARE_ENABLED, param1);
            return;
        }// end function

        public function get openGraphRemindMe() : Boolean
        {
            return this.getData(OPEN_GRAPH_REMIND_ME, true);
        }// end function

        public function set openGraphRemindMe(param1:Boolean) : void
        {
            this.setData(OPEN_GRAPH_REMIND_ME, param1);
            return;
        }// end function

        public function get pushToTalkToggled() : Boolean
        {
            return this.getData(PUSH_TO_TALK_TOGGLED, false);
        }// end function

        public function set pushToTalkToggled(param1:Boolean) : void
        {
            this.setData(PUSH_TO_TALK_TOGGLED, param1);
            return;
        }// end function

        public function get selectedCameraName() : String
        {
            return this.getData(SELECTED_CAMERA_NAME, "");
        }// end function

        public function set selectedCameraName(param1:String) : void
        {
            this.setData(SELECTED_CAMERA_NAME, param1);
            return;
        }// end function

        public function get selectedMicrophoneName() : String
        {
            return this.getData(SELECTED_MICROPHONE_NAME, "");
        }// end function

        public function set selectedMicrophoneName(param1:String) : void
        {
            this.setData(SELECTED_MICROPHONE_NAME, param1);
            return;
        }// end function

        public function get username() : String
        {
            return this.getData(USERNAME, "");
        }// end function

        public function set username(param1:String) : void
        {
            this.setData(USERNAME, param1);
            return;
        }// end function

        public function getRoomBroadcastPassword(param1:String) : String
        {
            var _loc_2:* = this.getData(BROADCAST_PASSWORD, {});
            if (_loc_2.hasOwnProperty(param1))
            {
                return _loc_2[param1];
            }
            return "";
        }// end function

        public function setRoomBroadcastPassword(param1:String, param2:String) : void
        {
            var _loc_3:* = this.getData(BROADCAST_PASSWORD, {});
            if (param2 == "")
            {
            }
            if (_loc_3.hasOwnProperty(param1))
            {
                delete _loc_3[param1];
            }
            else if (param2 != "")
            {
                _loc_3[param1] = param2;
            }
            this.setData(BROADCAST_PASSWORD, _loc_3);
            return;
        }// end function

        public function get aecEnabled() : Boolean
        {
            return this.getData(AEC_ENABLED, true);
        }// end function

        public function set aecEnabled(param1:Boolean) : void
        {
            this.setData(AEC_ENABLED, param1);
            return;
        }// end function

        public function get confirmBans() : Boolean
        {
            return this.getData(CONFIRM_BANS, true);
        }// end function

        public function set confirmBans(param1:Boolean) : void
        {
            this.setData(CONFIRM_BANS, param1);
            return;
        }// end function

        public function get playYouTubeVideos() : Boolean
        {
            return this.getData(PLAY_YOUTUBE_VIDEOS, true);
        }// end function

        public function set playYouTubeVideos(param1:Boolean) : void
        {
            this.setData(PLAY_YOUTUBE_VIDEOS, param1);
            return;
        }// end function

        public function get receivePms() : Boolean
        {
            return this.getData(RECEIVE_PMS, true);
        }// end function

        public function set receivePms(param1:Boolean) : void
        {
            this.setData(RECEIVE_PMS, param1);
            return;
        }// end function

        public function get rememberApplicationVolume() : Boolean
        {
            return this.getData(REMEMBER_APPLICATION_VOLUME, false);
        }// end function

        public function set rememberApplicationVolume(param1:Boolean) : void
        {
            this.setData(REMEMBER_APPLICATION_VOLUME, param1);
            return;
        }// end function

        public function get writingDataFailed() : ISignal
        {
            return this._writingDataFailed;
        }// end function

        public function getData(param1:String, param2)
        {
            var field:* = param1;
            var defaultValue:* = param2;
            try
            {
                if (this.sharedObject.data[field] != null)
                {
                    return this.sharedObject.data[field];
                }
                else
                {
                    return defaultValue;
                }
            }
            catch (error:Error)
            {
                return defaultValue;
            }
            return;
        }// end function

        public function setData(param1:String, param2) : void
        {
            var field:* = param1;
            var value:* = param2;
            try
            {
                this.sharedObject.data[field] = value;
            }
            catch (error:Error)
            {
                _writingDataFailed.dispatch();
            }
            return;
        }// end function

        private function get sharedObject() : SharedObject
        {
            if (!this._sharedObject)
            {
                this._sharedObject = SharedObject.getLocal(DATA_STORE_NAME, "/");
            }
            return this._sharedObject;
        }// end function

    }
}
