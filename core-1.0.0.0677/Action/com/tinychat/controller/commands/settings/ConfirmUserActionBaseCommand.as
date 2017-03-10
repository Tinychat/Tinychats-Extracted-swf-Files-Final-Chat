package com.tinychat.controller.commands.settings
{
    import com.tinychat.controller.commands.state.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.model.api.*;

    public class ConfirmUserActionBaseCommand extends TriggerStateActionCommand
    {
        private var user:UserIdentity;

        public function ConfirmUserActionBaseCommand(param1:StateAction, param2:UserIdentity)
        {
            super(param1);
            this.user = param2;
            return;
        }// end function

        override public function execute() : void
        {
            injector.mapValue(UserIdentity, this.user);
            super.execute();
            injector.unmap(UserIdentity);
            return;
        }// end function

    }
}
