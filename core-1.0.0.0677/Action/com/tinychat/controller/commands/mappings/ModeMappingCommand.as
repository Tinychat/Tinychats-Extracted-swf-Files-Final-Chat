package com.tinychat.controller.commands.mappings
{
    import com.tinychat.model.flashvars.*;

    public class ModeMappingCommand extends MappingCommand
    {

        public function ModeMappingCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_2:Class = null;
            var _loc_1:* = injector.getInstance(FlashvarsProxy);
            if (_loc_1.room == "next")
            {
                _loc_2 = NextModeMappingCommand;
            }
            else
            {
                _loc_2 = NormalModeMappingCommand;
            }
            commandMap.execute(_loc_2);
            return;
        }// end function

    }
}
