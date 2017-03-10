package com.tinychat.model.social.network.mqtt
{
    import com.tinychat.model.social.network.*;
    import com.tinychat.model.social.network.presence.*;
    import org.osflash.signals.*;

    public class MutableMqttUser extends AbstractSocialNetworkUser implements MqttUser
    {
        private var _subscribed:Boolean;
        private var _blocked:Boolean;
        private var _subscribedChanged:Signal;
        private var _blockedChanged:Signal;

        public function MutableMqttUser(param1:String, param2:PresenceType, param3:Boolean, param4:Boolean)
        {
            super(param1, param1, param2);
            this._subscribed = param3;
            this._blocked = param4;
            this._subscribedChanged = new Signal(Boolean);
            this._blockedChanged = new Signal(Boolean);
            return;
        }// end function

        public function get subscribedChanged() : ISignal
        {
            return this._subscribedChanged;
        }// end function

        public function get blockedChanged() : ISignal
        {
            return this._blockedChanged;
        }// end function

        public function get subscribed() : Boolean
        {
            return this._subscribed;
        }// end function

        public function set subscribed(param1:Boolean) : void
        {
            if (this._subscribed != param1)
            {
                this._subscribed = param1;
                this._subscribedChanged.dispatch(this._subscribed);
            }
            return;
        }// end function

        public function get blocked() : Boolean
        {
            return this._blocked;
        }// end function

        public function set blocked(param1:Boolean) : void
        {
            if (this._blocked != param1)
            {
                this._blocked = param1;
                this._blockedChanged.dispatch(this._blocked);
            }
            return;
        }// end function

    }
}
