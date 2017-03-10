package com.tinychat.controller.commands.mappings
{
    import com.tinychat.model.broadcast.streamoptions.*;

    public class StandardBroadcastMappingCommand extends MappingCommand
    {

        public function StandardBroadcastMappingCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            injector.mapSingletonOf(StreamOptions, StandardStreamOptions);
            return;
        }// end function

    }
}
