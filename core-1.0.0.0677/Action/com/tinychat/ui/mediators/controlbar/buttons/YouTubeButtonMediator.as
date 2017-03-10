package com.tinychat.ui.mediators.controlbar.buttons
{
    import com.tinychat.controller.state.*;
    import com.tinychat.ui.components.controlbar.buttons.*;

    public class YouTubeButtonMediator extends MediaButtonMediator
    {

        public function YouTubeButtonMediator(param1:YouTubeButton)
        {
            super(param1, StateAction.SELECT_YOUTUBE_CLIP);
            return;
        }// end function

    }
}
