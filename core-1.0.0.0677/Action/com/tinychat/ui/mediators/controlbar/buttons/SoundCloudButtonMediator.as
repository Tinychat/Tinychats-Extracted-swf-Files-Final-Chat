package com.tinychat.ui.mediators.controlbar.buttons
{
    import com.tinychat.controller.state.*;
    import com.tinychat.ui.components.controlbar.buttons.*;

    public class SoundCloudButtonMediator extends MediaButtonMediator
    {

        public function SoundCloudButtonMediator(param1:SoundCloudButton)
        {
            super(param1, StateAction.SELECT_SOUNDCLOUD_TRACK);
            return;
        }// end function

    }
}
