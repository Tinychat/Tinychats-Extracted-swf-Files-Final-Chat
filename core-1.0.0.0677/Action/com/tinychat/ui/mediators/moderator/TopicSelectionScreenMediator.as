package com.tinychat.ui.mediators.moderator
{
    import com.tinychat.model.room.*;
    import com.tinychat.ui.components.moderator.*;
    import com.tinychat.ui.mediators.screensequence.*;

    public class TopicSelectionScreenMediator extends SequencedScreenMediator
    {
        public var view:TopicSelectionScreen;
        public var roomSettingsProxy:RoomSettingsProxy;

        public function TopicSelectionScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.title = "Set room topic";
            this.view.topicInputPromptText = "Enter a topic for your room...";
            this.view.cancelLabel = "Cancel";
            this.view.confirmLabel = hasNext ? ("Continue") : ("Finish");
            this.view.topicInputText = this.roomSettingsProxy.topic;
            this.view.confirmed.add(this.confirmedHandler);
            this.view.canceled.add(this.canceledHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.view.confirmed.remove(this.confirmedHandler);
            this.view.canceled.remove(this.canceledHandler);
            return;
        }// end function

        protected function confirmedHandler() : void
        {
            if (this.topicChanged)
            {
                this.roomSettingsProxy.topic = this.view.topicInputText;
            }
            dispatchGoNext();
            return;
        }// end function

        protected function canceledHandler() : void
        {
            dispatchGoNext();
            return;
        }// end function

        private function get topicChanged() : Boolean
        {
            return this.view.topicInputText != this.roomSettingsProxy.topic;
        }// end function

    }
}
