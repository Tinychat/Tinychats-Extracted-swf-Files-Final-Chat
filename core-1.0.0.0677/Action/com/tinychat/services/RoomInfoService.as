package com.tinychat.services
{
    import com.tinychat.model.room.*;
    import com.tinychat.model.room.info.*;
    import com.tinychat.services.vo.*;
    import org.osflash.signals.*;

    public class RoomInfoService extends AbstractXmlLoaderService
    {
        private var _loaded:Signal;

        public function RoomInfoService(param1:String)
        {
            super(param1);
            this._loaded = new Signal(RoomInfo);
            return;
        }// end function

        public function load(param1:String, param2:String, param3:String = "tinychat", param4:String = "") : void
        {
            setDynamicPaths(param1);
            setUrlParameters({url:param2, site:param3, password:param4});
            makeGetRequest();
            return;
        }// end function

        override public function get success() : ISignal
        {
            return this._loaded;
        }// end function

        override protected function parse(param1:XML)
        {
            var _loc_2:* = this.parseRoomAccess(param1.@result);
            var _loc_3:* = param1.@name;
            var _loc_4:* = _loc_3.slice((_loc_3.indexOf("^") + 1));
            var _loc_5:* = _loc_3.slice(0, _loc_3.indexOf("^"));
            var _loc_6:* = this.parseLoginFrom(param1.@login);
            var _loc_7:* = RoomType.fromString(param1.@roomtype);
            if (param1.@bpassword != "")
            {
            }
            var _loc_8:* = param1.@bpassword != undefined ? (RoomBroadcastMode.SINGLE) : (RoomBroadcastMode.MULTI);
            var _loc_9:* = param1.@bpassword == "1" ? ("") : (param1.@bpassword);
            var _loc_10:* = param1.userinfo.@id;
            var _loc_11:* = param1.userinfo.@username;
            var _loc_12:* = param1.@eblock;
            var _loc_13:* = param1.userinfo.@pro == "1";
            var _loc_14:* = param1.userinfo.@roomowner == "1";
            var _loc_15:* = param1.@greenroom == "1";
            return new RoomInfo(_loc_2, _loc_4, _loc_5, _loc_7, param1.@rtmp, _loc_6, _loc_8, _loc_9, _loc_10, _loc_11, _loc_12, _loc_13, _loc_14, _loc_15);
        }// end function

        override protected function finish(param1) : void
        {
            this._loaded.dispatch(param1);
            return;
        }// end function

        private function parseRoomAccess(param1:String) : RoomAccess
        {
            var _loc_2:RoomAccess = null;
            switch(param1.toLowerCase())
            {
                case "ok":
                case "res":
                {
                    _loc_2 = RoomAccess.OK;
                    break;
                }
                case "pw":
                {
                    _loc_2 = RoomAccess.PASSWORD_PROTECTED;
                    break;
                }
                case "eblock":
                {
                    _loc_2 = RoomAccess.DOMAIN_BLOCK;
                    break;
                }
                case "closed":
                {
                    _loc_2 = RoomAccess.CLOSED;
                    break;
                }
                default:
                {
                    _loc_2 = RoomAccess.BLOCKED;
                    break;
                }
            }
            return _loc_2;
        }// end function

        private function parseLoginFrom(param1:String) : RoomLoginRestriction
        {
            var _loc_2:RoomLoginRestriction = null;
            switch(param1)
            {
                case "REQ":
                {
                    _loc_2 = RoomLoginRestriction.NON_GUEST;
                    break;
                }
                case "REQTWFB":
                {
                    _loc_2 = RoomLoginRestriction.FACEBOOK_AND_TWITTER;
                    break;
                }
                case "REQFBTB":
                {
                    _loc_2 = RoomLoginRestriction.FACEBOOK_AND_TUMBLR;
                    break;
                }
                case "REQTBTW":
                {
                    _loc_2 = RoomLoginRestriction.TUMBLR_AND_TWITTER;
                    break;
                }
                case "REQFB":
                {
                    _loc_2 = RoomLoginRestriction.FACEBOOK;
                    break;
                }
                case "REQTB":
                {
                    _loc_2 = RoomLoginRestriction.TUMBLR;
                    break;
                }
                case "REQTW":
                {
                    _loc_2 = RoomLoginRestriction.TWITTER;
                    break;
                }
                default:
                {
                    _loc_2 = RoomLoginRestriction.ANY;
                    break;
                }
            }
            return _loc_2;
        }// end function

    }
}
