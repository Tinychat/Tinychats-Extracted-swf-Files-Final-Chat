package com.tinychat.ui.context.social
{
    import com.tinychat.model.validation.facebook.*;
    import com.tinychat.model.validation.user.*;
    import com.tinychat.ui.components.popupmenu.*;
    import com.tinychat.ui.mediators.popupmenu.*;
    import flash.display.*;
    import org.robotlegs.core.*;

    public class FacebookPrivateChatViewContext extends AbstractPrivateChatViewContext
    {

        public function FacebookPrivateChatViewContext(param1:DisplayObjectContainer, param2:IInjector, param3:UserPopupMenu)
        {
            super(param1, param2, param3, FacebookUserPopupMenuMediator);
            return;
        }// end function

        override protected function mapInjections() : void
        {
            injector.mapSingletonOf(IsntCurrentSocialNetworkUser, IsntCurrentFacebookUser);
            super.mapInjections();
            return;
        }// end function

    }
}
