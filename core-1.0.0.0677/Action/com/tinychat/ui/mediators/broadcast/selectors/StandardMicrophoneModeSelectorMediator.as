package com.tinychat.ui.mediators.broadcast.selectors
{
    import com.tinychat.model.lists.*;

    public class StandardMicrophoneModeSelectorMediator extends MicrophoneModeSelectorMediatorBase
    {

        public function StandardMicrophoneModeSelectorMediator()
        {
            return;
        }// end function

        override protected function get openMicIconItem() : IconListItem
        {
            return IconListItem.OPEN_MIC_NO_ACC;
        }// end function

    }
}
