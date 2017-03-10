package com.tinychat.model.lists
{
    import com.tinychat.model.social.network.mqtt.*;
    import com.tinychat.model.utils.*;
    import mx.events.*;
    import org.osflash.signals.*;

    public class MqttUserListItem extends SocialNetworkUserListItem implements MqttUser
    {
        private var user:MqttUser;

        public function MqttUserListItem(param1:MqttUser)
        {
            this.user = param1;
            this.subscribedChanged.add(this.subscribedChangedHandler);
            this.blockedChanged.add(this.blockedChangedHandler);
            super(param1, DirectImageUrlLoader);
            return;
        }// end function

        public function get subscribed() : Boolean
        {
            return this.user.subscribed;
        }// end function

        public function get subscribedChanged() : ISignal
        {
            return this.user.subscribedChanged;
        }// end function

        public function get blocked() : Boolean
        {
            return this.user.blocked;
        }// end function

        public function get blockedChanged() : ISignal
        {
            return this.user.blockedChanged;
        }// end function

        override protected function get pictureUrl() : String
        {
            return "https://upload.tinychat.com/pic/" + this.user.name;
        }// end function

        private function subscribedChangedHandler(param1:Boolean) : void
        {
            dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE, false, false, PropertyChangeEventKind.UPDATE, "subscribed", !param1, param1, this));
            return;
        }// end function

        private function blockedChangedHandler(param1:Boolean) : void
        {
            dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE, false, false, PropertyChangeEventKind.UPDATE, "blocked", !param1, param1, this));
            return;
        }// end function

    }
}
