package com.tinychat.ui.mediators.snapshot
{
    import com.tinychat.controller.commands.snapshot.signals.*;
    import com.tinychat.model.login.*;
    import com.tinychat.ui.components.snapshot.*;

    public class SnapshotShareSelectionScreenMediator extends SnapshotShareScreenBaseMediator
    {
        public var promptShareSnapshot:PromptShareSnapshot;
        private var view:SnapshotShareSelectionScreen;

        public function SnapshotShareSelectionScreenMediator(param1:SnapshotShareSelectionScreen)
        {
            super(param1);
            this.view = param1;
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.facebookShareButtonLabelText = "Share on Facebook";
            this.view.twitterShareButtonLabelText = "Share on Twitter";
            this.view.facebookShareClicked.add(this.facebookShareClickedHandler);
            this.view.twitterShareClicked.add(this.twitterShareClickedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            super.onRemove();
            this.view.facebookShareClicked.remove(this.facebookShareClickedHandler);
            this.view.twitterShareClicked.remove(this.twitterShareClickedHandler);
            return;
        }// end function

        private function facebookShareClickedHandler() : void
        {
            this.promptShareSnapshot.dispatch(snapshot, LoginType.FACEBOOK);
            return;
        }// end function

        private function twitterShareClickedHandler() : void
        {
            directShareSnapshot.dispatch(snapshot, LoginType.TWITTER);
            return;
        }// end function

    }
}
