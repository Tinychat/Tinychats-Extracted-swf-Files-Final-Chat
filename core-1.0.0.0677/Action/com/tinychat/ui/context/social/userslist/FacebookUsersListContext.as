package com.tinychat.ui.context.social.userslist
{
    import com.tinychat.model.validation.facebook.*;
    import com.tinychat.model.validation.user.*;
    import com.tinychat.ui.components.popupmenu.*;
    import com.tinychat.ui.mediators.popupmenu.*;
    import flash.display.*;
    import org.robotlegs.core.*;

    public class FacebookUsersListContext extends AbstractUsersListContext
    {

        public function FacebookUsersListContext(param1:DisplayObjectContainer, param2:IInjector)
        {
            super(param1, param2);
            return;
        }// end function

        override protected function mapInjections() : void
        {
            injector.mapSingletonOf(IsntCurrentSocialNetworkUser, IsntCurrentFacebookUser);
            mediatorMap.mapView(UserPopupMenu, FacebookUserPopupMenuMediator, UserPopupMenu);
            super.mapInjections();
            return;
        }// end function

    }
}
