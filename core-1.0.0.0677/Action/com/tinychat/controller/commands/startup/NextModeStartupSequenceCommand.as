package com.tinychat.controller.commands.startup
{
    import com.tinychat.controller.commands.room.info.*;
    import org.robotlegs.utilities.macrobot.*;

    public class NextModeStartupSequenceCommand extends SequenceCommand implements ModeStartupSequenceCommand
    {

        public function NextModeStartupSequenceCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            atomic = false;
            addCommand(LoadRoomInfoSequenceCommand);
            super.execute();
            return;
        }// end function

    }
}
