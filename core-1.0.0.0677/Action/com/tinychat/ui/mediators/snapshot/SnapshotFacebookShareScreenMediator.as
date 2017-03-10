package com.tinychat.ui.mediators.snapshot
{
    import com.tinychat.controller.commands.snapshot.signals.*;
    import com.tinychat.model.login.*;
    import com.tinychat.ui.components.snapshot.*;

    public class SnapshotFacebookShareScreenMediator extends SnapshotShareScreenBaseMediator
    {
        public var promptShareSnapshot:PromptShareSnapshot;
        private var view:SnapshotFacebookShareScreen;

        public function SnapshotFacebookShareScreenMediator(param1:SnapshotFacebookShareScreen)
        {
            super(param1);
            this.view = param1;
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.confirmLabel = "Ok";
            this.view.updateStatusLabel = "Update status";
            this.view.confirmed.add(this.confirmedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            super.onRemove();
            this.view.confirmed.add(this.confirmedHandler);
            return;
        }// end function

        private function confirmedHandler() : void
        {
            if (this.view.updateStatus)
            {
                directShareSnapshot.dispatch(snapshot, LoginType.FACEBOOK);
            }
            else if (this.view.promptStatus)
            {
                this.promptShareSnapshot.dispatch(snapshot, LoginType.FACEBOOK);
            }
            dispatchComplete();
            return;
        }// end function

    }
}
