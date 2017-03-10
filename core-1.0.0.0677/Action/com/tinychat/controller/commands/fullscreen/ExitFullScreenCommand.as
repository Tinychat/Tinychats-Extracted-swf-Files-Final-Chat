package com.tinychat.controller.commands.fullscreen
{
    import com.tinychat.model.fullscreen.*;
    import org.robotlegs.mvcs.*;

    public class ExitFullScreenCommand extends Command
    {
        public var fullScreenMode:FullScreenMode;

        public function ExitFullScreenCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.fullScreenMode.toggled = false;
            return;
        }// end function

    }
}
