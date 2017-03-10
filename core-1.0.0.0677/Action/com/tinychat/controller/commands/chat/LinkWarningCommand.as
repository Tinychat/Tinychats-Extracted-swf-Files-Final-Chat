package com.tinychat.controller.commands.chat
{
    import com.tinychat.controller.commands.state.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.model.utils.url.*;

    public class LinkWarningCommand extends TriggerStateActionCommand
    {
        public var url:Url;

        public function LinkWarningCommand()
        {
            super(StateAction.LINK_WARNING);
            return;
        }// end function

        override public function execute() : void
        {
            injector.mapValue(Url, this.url);
            super.execute();
            injector.unmap(Url);
            return;
        }// end function

    }
}
