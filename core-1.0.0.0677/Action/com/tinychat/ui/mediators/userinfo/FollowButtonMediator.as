package com.tinychat.ui.mediators.userinfo
{
    import com.tinychat.controller.commands.social.network.mqtt.signals.*;
    import com.tinychat.ui.components.userinfo.*;
    import flash.events.*;
    import org.robotlegs.mvcs.*;

    public class FollowButtonMediator extends Mediator
    {
        public var view:FollowButton;
        public var follow:MqttFollow;
        public var unfollow:MqttUnfollow;

        public function FollowButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.setLabels("Follow", "Unfollow");
            this.view.clickTimeout = 3000;
            eventMap.mapListener(this.view, Event.CHANGE, this.changeHandler, Event);
            return;
        }// end function

        private function changeHandler(event:Event) : void
        {
            if (!this.view.selected)
            {
                this.follow.dispatch(this.view.mqttUser, this.view.user);
            }
            else
            {
                this.unfollow.dispatch(this.view.mqttUser, this.view.user);
            }
            return;
        }// end function

    }
}
