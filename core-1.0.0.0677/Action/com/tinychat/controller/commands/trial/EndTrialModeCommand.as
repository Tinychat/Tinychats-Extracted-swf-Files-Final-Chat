package com.tinychat.controller.commands.trial
{
    import com.tinychat.controller.commands.fullscreen.*;
    import com.tinychat.ui.components.broadcast.lists.*;
    import org.robotlegs.mvcs.*;

    public class EndTrialModeCommand extends Command
    {
        public var view:RoomBroadcastCanvas;

        public function EndTrialModeCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            commandMap.execute(ExitFullScreenCommand);
            this.view.selectedItem = null;
            return;
        }// end function

    }
}
