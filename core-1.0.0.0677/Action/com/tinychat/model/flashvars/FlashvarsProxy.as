package com.tinychat.model.flashvars
{
    import by.blooddy.crypto.serialization.*;
    import com.tinychat.model.layout.*;
    import com.tinychat.model.media.*;
    import com.tinychat.model.room.*;
    import flash.display.*;

    public class FlashvarsProxy extends Object
    {
        private var parameters:Object;

        public function FlashvarsProxy(param1:Stage)
        {
            this.parameters = param1.loaderInfo.parameters;
            return;
        }// end function

        public function get account() : String
        {
            return this.getParameter("account");
        }// end function

        public function get autoop() : String
        {
            return this.getParameter("autoop");
        }// end function

        public function get nickChangeAllowed() : Boolean
        {
            return this.getParameter("change") != "none";
        }// end function

        public function get chatLinks() : Boolean
        {
            return this.getParameter("chatLinks") != "false";
        }// end function

        public function get chatSmileys() : Boolean
        {
            return this.getParameter("chatSmileys") != "false";
        }// end function

        public function get chatpos() : ApplicationLayoutState
        {
            switch(this.getParameter("chatpos"))
            {
                case "right":
                {
                    return ApplicationLayoutState.CHAT_RIGHT;
                }
                case "below":
                {
                    return ApplicationLayoutState.CHAT_BELOW;
                }
                default:
                {
                    return ApplicationLayoutState.UNDEFINED;
                    break;
                }
            }
        }// end function

        public function get fbauto() : Boolean
        {
            return this.getParameter("fbauto") == "auto";
        }// end function

        public function get greenroom() : Boolean
        {
            return this.getParameter("greenroom") == "true";
        }// end function

        public function get key() : String
        {
            return this.getParameter("key");
        }// end function

        public function get login() : RoomLoginRestriction
        {
            switch(this.getParameter("login"))
            {
                case "fb":
                {
                    return RoomLoginRestriction.FACEBOOK;
                }
                case "fbtw":
                {
                    return RoomLoginRestriction.FACEBOOK_AND_TWITTER;
                }
                case "tb":
                {
                    return RoomLoginRestriction.TUMBLR;
                }
                case "tw":
                {
                    return RoomLoginRestriction.TWITTER;
                }
                default:
                {
                    return RoomLoginRestriction.ANY;
                    break;
                }
            }
        }// end function

        public function get microphoneCodec() : String
        {
            return this.getParameter("microphoneCodec");
        }// end function

        public function get nick() : String
        {
            return this.getParameter("nick");
        }// end function

        public function get prohash() : String
        {
            return this.getParameter("prohash");
        }// end function

        public function get promoted() : Boolean
        {
            return this.getParameter("promoted") == "true";
        }// end function

        public function get push2talk() : Boolean
        {
            return this.getParameter("push2talk") == "true";
        }// end function

        public function get room() : String
        {
            return this.getParameter("room", false);
        }// end function

        public function get settingsOverride() : Object
        {
            var _loc_1:Object = {};
            try
            {
                _loc_1 = JSON.decode(this.getParameter("settingsOverride"));
            }
            catch (error:Error)
            {
            }
            return _loc_1;
        }// end function

        public function get target() : String
        {
            return this.getParameter("target", false);
        }// end function

        public function get twitterOwner() : String
        {
            return this.getParameter("twitterowner");
        }// end function

        public function get urlsuper() : String
        {
            return this.getParameter("urlsuper");
        }// end function

        public function get youtube() : MediaRestriction
        {
            switch(this.getParameter("youtube"))
            {
                case "all":
                {
                    return MediaRestriction.ALL;
                }
                case "none":
                {
                    return MediaRestriction.NONE;
                }
                default:
                {
                    return MediaRestriction.OPERATORS;
                    break;
                }
            }
        }// end function

        public function get youtubeAutoPlay() : Object
        {
            return JSON.decode(this.getParameter("youtubeAutoPlay"));
        }// end function

        private function replaceSpecialChars(param1:String) : String
        {
            var _loc_2:RegExp = null;
            _loc_2 = /&amp;/g;
            param1 = param1.replace(_loc_2, "&");
            _loc_2 = /&lt;/g;
            param1 = param1.replace(_loc_2, "<");
            _loc_2 = /&gt;/g;
            param1 = param1.replace(_loc_2, ">");
            _loc_2 = /&quot;/g;
            param1 = param1.replace(_loc_2, "\"");
            _loc_2 = /&apos;/g;
            param1 = param1.replace(_loc_2, "\'");
            return param1;
        }// end function

        protected function getParameter(param1:String, param2:Boolean = true) : String
        {
            if (!this.parameters.hasOwnProperty(param1))
            {
                if (!param2)
                {
                    throw new Error("Missing required flashvar: " + param1);
                }
                return "";
            }
            else
            {
                return this.parameters[param1];
            }
        }// end function

    }
}
