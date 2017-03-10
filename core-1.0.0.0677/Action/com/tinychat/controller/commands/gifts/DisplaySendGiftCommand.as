package com.tinychat.controller.commands.gifts
{
    import com.tinychat.controller.commands.popup.*;
    import com.tinychat.model.api.*;
    import com.tinychat.ui.components.gifts.*;

    public class DisplaySendGiftCommand extends OpenPopupCommand
    {
        public var user:UserIdentity;

        public function DisplaySendGiftCommand()
        {
            super(TinychatGiftScreen, true, false);
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
