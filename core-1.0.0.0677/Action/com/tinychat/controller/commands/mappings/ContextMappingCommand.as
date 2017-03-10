package com.tinychat.controller.commands.mappings
{
    import com.tinychat.ui.components.broadcast.containers.*;
    import com.tinychat.ui.components.controlbar.buttons.*;
    import com.tinychat.ui.components.popupmenu.*;
    import com.tinychat.ui.components.social.chat.*;
    import com.tinychat.ui.components.social.userlist.*;

    public class ContextMappingCommand extends MappingCommand
    {

        public function ContextMappingCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            viewMap.mapType(ApplicationVolumeControl);
            viewMap.mapType(AbstractBroadcastContainer);
            viewMap.mapType(UserPopupMenu);
            viewMap.mapType(UsersListBase);
            viewMap.mapType(ChatViewBase);
            return;
        }// end function

    }
}
