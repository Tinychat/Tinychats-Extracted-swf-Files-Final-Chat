package com.tinychat.ui.context.social.userslist
{
    import com.tinychat.ui.components.popupmenu.*;
    import com.tinychat.ui.mediators.popupmenu.*;
    import flash.display.*;
    import org.robotlegs.core.*;

    public class TinychatUsersListContext extends AbstractUsersListContext
    {

        public function TinychatUsersListContext(param1:DisplayObjectContainer, param2:IInjector)
        {
            super(param1, param2);
            return;
        }// end function

        override protected function mapInjections() : void
        {
            mediatorMap.mapView(TinychatUserPopupMenu, TinychatUserPopupMenuMediator, UserPopupMenu);
            super.mapInjections();
            return;
        }// end function

    }
}
