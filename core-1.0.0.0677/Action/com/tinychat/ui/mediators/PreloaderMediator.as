package com.tinychat.ui.mediators
{
    import com.tinychat.controller.commands.startup.signals.*;
    import com.tinychat.ui.components.preloader.*;
    import org.robotlegs.mvcs.*;

    public class PreloaderMediator extends Mediator
    {
        public var view:PupilPreloader;
        public var startupComplete:StartupComplete;

        public function PreloaderMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.startupComplete.addOnce(this.startupCompleteHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.startupComplete.remove(this.startupCompleteHandler);
            return;
        }// end function

        private function startupCompleteHandler() : void
        {
            this.view.complete();
            return;
        }// end function

    }
}
