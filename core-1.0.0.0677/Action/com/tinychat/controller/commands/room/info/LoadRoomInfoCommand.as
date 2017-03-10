package com.tinychat.controller.commands.room.info
{
    import com.tinychat.model.room.*;
    import org.robotlegs.utilities.macrobot.*;

    public class LoadRoomInfoCommand extends AsyncCommand
    {
        public var settings:RoomSettingsProxy;

        public function LoadRoomInfoCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.addListeners();
            this.settings.refresh();
            return;
        }// end function

        private function loadedHandler() : void
        {
            dispatchComplete(true);
            this.removeListeners();
            return;
        }// end function

        private function failedHandler(param1:String) : void
        {
            dispatchComplete(false);
            this.removeListeners();
            return;
        }// end function

        private function addListeners() : void
        {
            this.settings.roomInfoChanged.addOnce(this.loadedHandler);
            this.settings.roomInfoFailed.addOnce(this.failedHandler);
            return;
        }// end function

        private function removeListeners() : void
        {
            this.settings.roomInfoChanged.remove(this.loadedHandler);
            this.settings.roomInfoFailed.remove(this.failedHandler);
            return;
        }// end function

    }
}
