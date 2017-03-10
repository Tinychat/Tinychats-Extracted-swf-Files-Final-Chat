package com.tinychat.controller.commands.startup
{
    import org.robotlegs.mvcs.*;

    public class TriggerModeStartupSequenceCommand extends Command
    {

        public function TriggerModeStartupSequenceCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            Command(injector.getInstance(ModeStartupSequenceCommand)).execute();
            return;
        }// end function

    }
}
