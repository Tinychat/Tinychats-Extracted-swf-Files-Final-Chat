package com.tinychat.ui.mediators.password
{
    import com.tinychat.controller.commands.startup.signals.*;
    import com.tinychat.model.room.*;
    import com.tinychat.ui.components.password.*;
    import com.tinychat.ui.mediators.screen.*;

    public class RoomPasswordPromptMediator extends ScreenMediator
    {
        public var view:RoomPasswordPrompt;
        public var settings:RoomSettingsProxy;
        public var triggerStartupSequence:TriggerModeStartupSequence;

        public function RoomPasswordPromptMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.title = "The room \"" + this.settings.name + "\" is password protected.";
            this.view.passwordFieldPrompt = "Enter room password";
            this.view.incorrectPasswordMessage = "Sorry, the password you entered was incorrect.";
            this.view.confirmLabel = "Connect";
            if (this.settings.password != "")
            {
                this.view.incorrectPassword();
            }
            this.view.submitted.add(this.submittedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.view.submitted.remove(this.submittedHandler);
            return;
        }// end function

        private function submittedHandler(param1:String, param2:String) : void
        {
            this.settings.password = param2;
            complete();
            this.triggerStartupSequence.dispatch();
            return;
        }// end function

    }
}
