package com.tinychat.controller.commands.mappings
{
    import com.tinychat.model.greenroom.*;

    public class GreenRoomMappingCommand extends MappingCommand
    {

        public function GreenRoomMappingCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            injector.mapSingleton(GreenRoomConnection);
            injector.mapSingleton(GreenRoomUsers);
            injector.mapSingleton(GreenRoomConnectionController);
            injector.mapSingleton(GreenRoomSettings);
            return;
        }// end function

    }
}
