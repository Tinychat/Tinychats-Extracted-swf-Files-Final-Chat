package com.tinychat.model.social.network.mqtt
{
    import org.osflash.signals.*;

    public interface MqttUser extends SocialNetworkUser
    {

        public function MqttUser();

        function get subscribedChanged() : ISignal;

        function get blockedChanged() : ISignal;

        function get subscribed() : Boolean;

        function get blocked() : Boolean;

    }
}
