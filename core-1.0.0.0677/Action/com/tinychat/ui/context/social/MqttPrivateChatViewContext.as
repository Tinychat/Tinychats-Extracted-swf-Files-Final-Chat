package com.tinychat.ui.context.social
{
    import com.tinychat.model.validation.mqtt.*;
    import com.tinychat.model.validation.user.*;
    import com.tinychat.ui.components.popupmenu.*;
    import com.tinychat.ui.mediators.popupmenu.*;
    import flash.display.*;
    import org.robotlegs.core.*;

    public class MqttPrivateChatViewContext extends AbstractPrivateChatViewContext
    {

        public function MqttPrivateChatViewContext(param1:DisplayObjectContainer, param2:IInjector, param3:UserPopupMenu)
        {
            super(param1, param2, param3, MqttUserPopupMenuMediator);
            return;
        }// end function

        override protected function mapInjections() : void
        {
            injector.mapSingletonOf(IsntCurrentSocialNetworkUser, IsntCurrentMqttUser);
            super.mapInjections();
            return;
        }// end function

    }
}
