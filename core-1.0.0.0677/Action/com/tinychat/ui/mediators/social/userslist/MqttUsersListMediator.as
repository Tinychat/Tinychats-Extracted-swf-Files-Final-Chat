package com.tinychat.ui.mediators.social.userslist
{
    import com.tinychat.model.social.network.mqtt.*;
    import com.tinychat.ui.components.social.userlist.*;

    public class MqttUsersListMediator extends UsersListBaseMediator
    {
        public var proxy:MqttProxy;
        private var view:MqttUsersList;

        public function MqttUsersListMediator(param1:MqttUsersList)
        {
            super(param1);
            this.view = param1;
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.dataProvider = this.proxy.friends;
            return;
        }// end function

    }
}
