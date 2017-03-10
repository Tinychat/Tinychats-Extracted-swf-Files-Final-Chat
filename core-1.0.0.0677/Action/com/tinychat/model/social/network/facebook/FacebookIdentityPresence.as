package com.tinychat.model.social.network.facebook
{
    import com.tinychat.model.social.network.presence.*;
    import org.osflash.signals.*;

    public class FacebookIdentityPresence extends Object implements Identity, Presence
    {
        private var _id:String;
        private var _presence:PresenceType;
        private static var dummy:Signal = new Signal();

        public function FacebookIdentityPresence(param1:String, param2:PresenceType)
        {
            this._id = param1;
            this._presence = param2;
            return;
        }// end function

        public function get id() : String
        {
            return this._id;
        }// end function

        public function get presence() : PresenceType
        {
            return this._presence;
        }// end function

        public function get presenceChanged() : ISignal
        {
            return dummy;
        }// end function

    }
}
