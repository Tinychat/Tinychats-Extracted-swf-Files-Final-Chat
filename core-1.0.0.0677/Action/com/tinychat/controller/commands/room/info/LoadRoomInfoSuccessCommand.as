package com.tinychat.controller.commands.room.info
{
    import com.tinychat.model.room.*;
    import com.tinychat.services.vo.*;
    import org.robotlegs.utilities.macrobot.*;

    public class LoadRoomInfoSuccessCommand extends AsyncCommand
    {
        public var settings:RoomSettingsProxy;

        public function LoadRoomInfoSuccessCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            dispatchComplete(this.settings.access == RoomAccess.OK);
            return;
        }// end function

    }
}
