package com.tinychat.controller.commands.user.actions
{
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.model.social.chat.*;
    import org.robotlegs.mvcs.*;

    public class ColorActionCommand extends Command
    {
        private var postNotice:PostActionNotice;
        private var color:ChatColors;

        public function ColorActionCommand(param1:PostActionNotice, param2:ChatColors)
        {
            this.postNotice = param1;
            this.color = param2;
            return;
        }// end function

        override public function execute() : void
        {
            this.color.next();
            this.postNotice.dispatch("*This is your new chat color.*", this.color.current);
            return;
        }// end function

    }
}
