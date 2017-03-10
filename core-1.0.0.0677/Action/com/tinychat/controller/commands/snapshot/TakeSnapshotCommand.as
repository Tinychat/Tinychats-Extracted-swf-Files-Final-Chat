package com.tinychat.controller.commands.snapshot
{
    import com.tinychat.controller.commands.popup.*;
    import com.tinychat.model.snapshot.*;
    import com.tinychat.model.social.network.facebook.*;
    import com.tinychat.ui.components.snapshot.*;
    import com.tinychat.ui.screensequence.*;

    public class TakeSnapshotCommand extends OpenScreenSequenceContainerCommand
    {
        public var facebookLogin:FacebookLoginProxy;

        public function TakeSnapshotCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            if (injector.hasMapping(Snapshot))
            {
                injector.unmap(Snapshot);
            }
            super.execute();
            return;
        }// end function

        override protected function addScreens(param1:ScreenSequencer) : void
        {
            param1.addScreen(SnapshotLoadingScreen);
            if (this.facebookLogin.isLoggedIn)
            {
                param1.addScreen(SnapshotFacebookShareScreen);
            }
            else
            {
                param1.addScreen(SnapshotShareSelectionScreen);
            }
            return;
        }// end function

    }
}
