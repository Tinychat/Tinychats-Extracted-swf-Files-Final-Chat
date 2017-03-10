package com.tinychat.controller.commands.mappings
{
    import org.robotlegs.core.*;
    import org.robotlegs.mvcs.*;

    public class MappingCommand extends Command
    {
        public var viewMap:IViewMap;
        public var signalCommandMap:IGuardedSignalCommandMap;

        public function MappingCommand()
        {
            return;
        }// end function

    }
}
