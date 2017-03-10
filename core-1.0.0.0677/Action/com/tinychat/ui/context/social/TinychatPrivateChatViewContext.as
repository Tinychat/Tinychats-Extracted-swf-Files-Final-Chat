package com.tinychat.ui.context.social
{
    import com.tinychat.ui.components.popupmenu.*;
    import com.tinychat.ui.mediators.popupmenu.*;
    import flash.display.*;
    import org.robotlegs.core.*;

    public class TinychatPrivateChatViewContext extends AbstractPrivateChatViewContext
    {

        public function TinychatPrivateChatViewContext(param1:DisplayObjectContainer, param2:IInjector, param3:UserPopupMenu)
        {
            super(param1, param2, param3, TinychatUserPopupMenuMediator);
            return;
        }// end function

    }
}
