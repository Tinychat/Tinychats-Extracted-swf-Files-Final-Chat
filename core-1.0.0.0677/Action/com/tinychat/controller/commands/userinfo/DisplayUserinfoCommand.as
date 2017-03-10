package com.tinychat.controller.commands.userinfo
{
    import com.tinychat.controller.commands.popup.*;
    import com.tinychat.model.api.*;
    import com.tinychat.services.vo.*;
    import com.tinychat.ui.components.userinfo.*;

    public class DisplayUserinfoCommand extends OpenPopupCommand
    {
        public var info:TinychatUserinfo;
        public var user:UserIdentity;

        public function DisplayUserinfoCommand()
        {
            super(TinychatUserinfoScreen, true, false);
            return;
        }// end function

        override public function execute() : void
        {
            injector.mapValue(TinychatUserinfo, this.info);
            injector.mapValue(UserIdentity, this.user);
            super.execute();
            injector.unmap(TinychatUserinfo);
            injector.unmap(UserIdentity);
            return;
        }// end function

    }
}
