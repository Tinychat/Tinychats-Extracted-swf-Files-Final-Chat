package com.tinychat.controller.commands.settings
{
    import com.tinychat.controller.commands.popup.*;
    import com.tinychat.controller.guards.*;
    import com.tinychat.ui.components.moderator.*;
    import com.tinychat.ui.screensequence.*;

    public class ShowTopicSelectionCommand extends OpenScreenSequenceContainerCommand
    {

        public function ShowTopicSelectionCommand()
        {
            return;
        }// end function

        override protected function addScreens(param1:ScreenSequencer) : void
        {
            param1.addScreen(TopicSelectionScreen, IsOperatorGuard);
            return;
        }// end function

    }
}
