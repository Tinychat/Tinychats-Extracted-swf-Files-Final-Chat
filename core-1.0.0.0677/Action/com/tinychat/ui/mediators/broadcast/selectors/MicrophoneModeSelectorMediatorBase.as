package com.tinychat.ui.mediators.broadcast.selectors
{
    import com.tinychat.model.lists.*;
    import com.tinychat.model.sounds.*;
    import com.tinychat.ui.components.broadcast.selectors.*;
    import flash.errors.*;
    import org.robotlegs.mvcs.*;

    public class MicrophoneModeSelectorMediatorBase extends Mediator
    {
        public var view:MicrophoneModeSelector;
        public var microphoneMode:MicrophoneMode;

        public function MicrophoneModeSelectorMediatorBase()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.preselectedItemName = this.microphoneMode.pushToTalk ? (IconListItem.PUSH_TO_TALK.name) : (this.openMicIconItem.name);
            this.view.pushToTalkItem = IconListItem.PUSH_TO_TALK;
            this.view.openMicItem = this.openMicIconItem;
            return;
        }// end function

        protected function get openMicIconItem() : IconListItem
        {
            throw new IllegalOperationError("Must be overridden in sub-class.");
        }// end function

    }
}
