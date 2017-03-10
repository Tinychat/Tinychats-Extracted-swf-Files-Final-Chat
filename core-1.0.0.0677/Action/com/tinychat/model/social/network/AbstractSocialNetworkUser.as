package com.tinychat.model.social.network
{
    import com.tinychat.model.social.network.presence.*;
    import org.osflash.signals.*;

    public class AbstractSocialNetworkUser extends Object implements SocialNetworkUser, MutablePresence
    {
        private var _id:String;
        private var _name:String;
        private var _account:String;
        private var _presence:PresenceType;
        private var _presenceChanged:PresenceChanged;
        private static const dummy:Signal = new Signal();

        public function AbstractSocialNetworkUser(param1:String, param2:String, param3:PresenceType, param4:String = "")
        {
            this._id = param1;
            this._name = param2;
            this._presence = param3;
            this._account = param4;
            this._presenceChanged = new PresenceChanged();
            return;
        }// end function

        public function get id() : String
        {
            return this._id;
        }// end function

        public function get name() : String
        {
            return this._name;
        }// end function

        public function get account() : String
        {
            return this._account;
        }// end function

        public function get renamed() : ISignal
        {
            return dummy;
        }// end function

        public function get presence() : PresenceType
        {
            return this._presence;
        }// end function

        public function set presence(param1:PresenceType) : void
        {
            var _loc_2:PresenceType = null;
            if (this._presence != param1)
            {
                _loc_2 = this._presence;
                this._presence = param1;
                this._presenceChanged.dispatch(_loc_2, this._presence);
            }
            return;
        }// end function

        public function get presenceChanged() : ISignal
        {
            return this._presenceChanged;
        }// end function

    }
}
