package com.tinychat.controller.commands.room.connection
{
    import com.tinychat.controller.commands.state.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.model.room.*;
    import com.tinychat.services.connection.*;

    public class AbstractConnectionFailureCommand extends TriggerStateActionCommand
    {
        public var service:ConnectionFailureLogService;
        public var settings:RoomSettings;

        public function AbstractConnectionFailureCommand(param1:StateAction)
        {
            super(param1);
            return;
        }// end function

        override public function execute() : void
        {
            super.execute();
            this.service.load(this.settings.name);
            return;
        }// end function

    }
}
