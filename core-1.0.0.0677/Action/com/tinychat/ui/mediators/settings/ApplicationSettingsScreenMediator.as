package com.tinychat.ui.mediators.settings
{
    import com.tinychat.model.settings.*;
    import com.tinychat.ui.components.settings.*;
    import com.tinychat.ui.mediators.screen.*;

    public class ApplicationSettingsScreenMediator extends ScreenMediator
    {
        public var view:ApplicationSettingsScreen;
        public var settings:ApplicationSettings;

        public function ApplicationSettingsScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.title = "Application settings";
            this.view.confirmLabel = "Save";
            this.view.cancelLabel = "Cancel";
            this.view.dataProvider = this.settings;
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

        private function confirmedHandler() : void
        {
            complete();
            return;
        }// end function

        private function canceledHandler() : void
        {
            canceled();
            return;
        }// end function

    }
}
