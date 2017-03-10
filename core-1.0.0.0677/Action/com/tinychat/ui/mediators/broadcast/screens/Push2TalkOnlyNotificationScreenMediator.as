package com.tinychat.ui.mediators.broadcast.screens
{
    import com.tinychat.ui.components.broadcast.screens.*;
    import com.tinychat.ui.mediators.screensequence.*;
    import flash.events.*;

    public class Push2TalkOnlyNotificationScreenMediator extends SequencedScreenMediator
    {
        public var view:Push2TalkOnlyNotificationScreen;

        public function Push2TalkOnlyNotificationScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.title = "Push-To-Talk Only!";
            this.view.statusLabelText = "Roulette rooms are push-to-talk only! " + "Press the push-to-talk button to use your microphone.";
            this.view.confirmLabel = "Ok";
            eventMap.mapListener(this.view, MouseEvent.CLICK, this.clickHandler, MouseEvent);
            return;
        }// end function

        private function clickHandler(event:MouseEvent) : void
        {
            dispatchGoNext();
            return;
        }// end function

    }
}
