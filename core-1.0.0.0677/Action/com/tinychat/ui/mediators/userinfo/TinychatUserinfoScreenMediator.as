package com.tinychat.ui.mediators.userinfo
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.social.network.mqtt.*;
    import com.tinychat.services.userinfo.*;
    import com.tinychat.services.vo.*;
    import com.tinychat.ui.components.userinfo.*;
    import org.robotlegs.mvcs.*;

    public class TinychatUserinfoScreenMediator extends Mediator
    {
        public var view:TinychatUserinfoScreen;
        public var service:TinychatUserinfoService;
        public var info:TinychatUserinfo;
        public var user:UserIdentity;
        public var mqttProxy:MqttProxy;

        public function TinychatUserinfoScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.notFoundMessage = "User is not signed in to Tinychat.com.";
            this.view.dataProvider = this.info;
            this.view.user = this.user;
            this.view.mqttProxy = this.mqttProxy;
            this.service.success.add(this.loadedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.service.success.remove(this.loadedHandler);
            return;
        }// end function

        private function loadedHandler(param1:TinychatUserinfo) : void
        {
            this.view.dataProvider = param1;
            return;
        }// end function

    }
}
