package com.tinychat.ui.context.social.userslist
{
    import com.tinychat.model.validation.mqtt.*;
    import com.tinychat.model.validation.user.*;
    import com.tinychat.ui.components.popupmenu.*;
    import com.tinychat.ui.mediators.popupmenu.*;
    import flash.display.*;
    import org.robotlegs.core.*;

    public class MqttUsersListContext extends AbstractUsersListContext
    {

        public function MqttUsersListContext(param1:DisplayObjectContainer, param2:IInjector)
        {
            super(param1, param2);
            return;
        }// end function

        override protected function mapInjections() : void
        {
            injector.mapSingletonOf(IsntCurrentSocialNetworkUser, IsntCurrentMqttUser);
            mediatorMap.mapView(UserPopupMenu, MqttUserPopupMenuMediator, UserPopupMenu);
            super.mapInjections();
            return;
        }// end function

    }
}
