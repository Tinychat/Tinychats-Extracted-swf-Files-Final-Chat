package com.tinychat.ui.context.social.userslist
{
    import flash.display.*;
    import org.robotlegs.core.*;
    import org.robotlegs.utilities.modular.mvcs.*;

    public class AbstractUsersListContext extends ModuleContext
    {

        public function AbstractUsersListContext(param1:DisplayObjectContainer, param2:IInjector)
        {
            super(param1, true, param2);
            return;
        }// end function

        override public function dispose() : void
        {
            mediatorMap.removeMediatorByView(contextView);
            super.dispose();
            return;
        }// end function

    }
}
