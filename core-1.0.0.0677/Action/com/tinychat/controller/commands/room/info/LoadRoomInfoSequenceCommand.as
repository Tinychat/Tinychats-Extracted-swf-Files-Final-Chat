package com.tinychat.controller.commands.room.info
{
    import com.tinychat.controller.commands.pro.*;
    import com.tinychat.controller.commands.room.captcha.*;
    import com.tinychat.controller.commands.state.*;
    import com.tinychat.controller.state.*;
    import org.robotlegs.utilities.macrobot.*;

    public class LoadRoomInfoSequenceCommand extends SequenceCommand
    {

        public function LoadRoomInfoSequenceCommand()
        {
            atomic = false;
            addCompletionListener(this.completionHandler);
            addCommand(TriggerStateActionCommand, StateAction.LOAD_ROOM_INFO, StateAction);
            addCommand(LoadRoomCaptchaCommand);
            addCommand(LoadRoomInfoCommand);
            addCommand(LoadRoomInfoSuccessCommand);
            addCommand(ToggleProFeaturesCommand);
            return;
        }// end function

        private function completionHandler(param1:Boolean) : void
        {
            if (param1)
            {
                commandMap.execute(TriggerStateActionCommand, StateAction.SUCCESS, StateAction);
            }
            else
            {
                commandMap.execute(LoadRoomInfoFailureCommand);
            }
            return;
        }// end function

    }
}
