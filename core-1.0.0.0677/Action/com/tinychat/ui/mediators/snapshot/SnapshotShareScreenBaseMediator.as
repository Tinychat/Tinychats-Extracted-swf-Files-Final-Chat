package com.tinychat.ui.mediators.snapshot
{
    import com.tinychat.controller.commands.snapshot.signals.*;
    import com.tinychat.model.snapshot.*;
    import com.tinychat.ui.components.snapshot.*;
    import com.tinychat.ui.mediators.screensequence.*;

    public class SnapshotShareScreenBaseMediator extends SequencedScreenMediator
    {
        public var snapshot:Snapshot;
        public var directShareSnapshot:DirectShareSnapshot;
        private var view:SnapshotShareScreenBase;

        public function SnapshotShareScreenBaseMediator(param1:SnapshotShareScreenBase)
        {
            this.view = param1;
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.title = "Snapshot saved!";
            this.view.snapshotSource = this.snapshot.source;
            this.view.urlFieldText = this.snapshot.pageUrl;
            this.view.urlFieldLabelText = "Snapshot URL:";
            this.view.openUrlButtonLabelText = "Open";
            this.view.copyUrlButtonLabelText = "Copy";
            return;
        }// end function

    }
}
