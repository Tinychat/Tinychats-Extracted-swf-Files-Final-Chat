package com.tinychat.controller.commands.fullscreen
{
    import com.tinychat.model.fullscreen.*;
    import org.robotlegs.mvcs.*;

    public class EnterFullScreenCommand extends Command
    {
        public var fullScreenMode:FullScreenMode;

        public function EnterFullScreenCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.fullScreenMode.toggled = true;
            return;
        }// end function

    }
}
