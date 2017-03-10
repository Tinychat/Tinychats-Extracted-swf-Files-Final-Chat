package com.tinychat.ui.mediators.broadcast.screens
{
    import com.tinychat.model.lists.*;
    import com.tinychat.model.sounds.*;
    import com.tinychat.ui.components.broadcast.screens.*;

    public class MicrophoneModeSelectionScreenMediatorBase extends SelectionScreenBaseMediator
    {
        public var microphoneMode:MicrophoneMode;
        protected var view:MicrophoneModeSelectionScreen;

        public function MicrophoneModeSelectionScreenMediatorBase(param1:MicrophoneModeSelectionScreen)
        {
            super(param1);
            this.view = param1;
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.title = "Select Microphone Mode";
            return;
        }// end function

        override protected function selectionMadeHandler(param1:Object) : void
        {
            this.microphoneMode.pushToTalk = param1 == IconListItem.PUSH_TO_TALK;
            super.selectionMadeHandler(param1);
            return;
        }// end function

    }
}
