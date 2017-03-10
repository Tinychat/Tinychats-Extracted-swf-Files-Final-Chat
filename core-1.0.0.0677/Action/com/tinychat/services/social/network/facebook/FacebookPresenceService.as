package com.tinychat.services.social.network.facebook
{
    import com.tinychat.model.lists.*;
    import com.tinychat.model.social.network.facebook.*;
    import com.tinychat.model.social.network.presence.*;
    import org.osflash.signals.*;

    public class FacebookPresenceService extends Object
    {
        private var socket:FacebookXmppSocket;
        private var _userPresences:IdentityMap;
        private var _presenceChange:Signal;

        public function FacebookPresenceService(param1:FacebookXmppSocket)
        {
            this.socket = param1;
            param1.presence.add(this.presenceHandler);
            this._userPresences = new IdentityMap();
            this._presenceChange = new Signal(FacebookIdentityPresence);
            return;
        }// end function

        public function get userPresences() : Array
        {
            return this._userPresences.list;
        }// end function

        public function get presenceChange() : ISignal
        {
            return this._presenceChange;
        }// end function

        private function presenceHandler(param1:XML) : void
        {
            var presence:PresenceType;
            var node:* = param1;
            var parseIdFrom:* = function (param1:XML) : String
            {
                var _loc_2:* = param1.@from;
                return _loc_2.substr(1, (_loc_2.indexOf("@") - 1));
            }// end function
            ;
            var id:* = this.parseIdFrom(node);
            if (node.@type == "unavailable")
            {
                presence = PresenceType.OFFLINE;
            }
            else if (node.show == "away")
            {
                presence = PresenceType.AWAY;
            }
            else
            {
                presence = PresenceType.ONLINE;
            }
            var userPresence:* = new FacebookIdentityPresence(id, presence);
            if (this._userPresences.has(userPresence))
            {
                this._userPresences.remove(userPresence);
            }
            this._userPresences.add(userPresence);
            this._presenceChange.dispatch(userPresence);
            return;
        }// end function

    }
}
