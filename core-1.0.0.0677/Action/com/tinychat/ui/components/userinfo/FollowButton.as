package com.tinychat.ui.components.userinfo
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.social.network.mqtt.*;
    import com.tinychat.ui.components.spark.*;

    public class FollowButton extends IconToggleButton
    {
        private var _user:UserIdentity;
        private var _mqttUser:MqttUser;
        private var mqttUserChanged:Boolean;
        private static var _skinParts:Object = {labelDisplay:false, iconDisplay:false, iconDisplay2:false};

        public function FollowButton()
        {
            return;
        }// end function

        public function get user() : UserIdentity
        {
            return this._user;
        }// end function

        public function set user(param1:UserIdentity) : void
        {
            this._user = param1;
            return;
        }// end function

        public function get mqttUser() : MqttUser
        {
            return this._mqttUser;
        }// end function

        public function set mqttUser(param1:MqttUser) : void
        {
            if (this._mqttUser != param1)
            {
                if (this._mqttUser)
                {
                    this._mqttUser.subscribedChanged.remove(this.subscribedChanged);
                }
                this._mqttUser = param1;
                if (this._mqttUser)
                {
                    this._mqttUser.subscribedChanged.add(this.subscribedChanged);
                }
                this.mqttUserChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.mqttUserChanged)
            {
                if (this._mqttUser)
                {
                }
                selected = this._mqttUser.subscribed;
                this.mqttUserChanged = false;
            }
            return;
        }// end function

        private function subscribedChanged(param1:Boolean) : void
        {
            if (this._mqttUser)
            {
            }
            selected = this._mqttUser.subscribed;
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
