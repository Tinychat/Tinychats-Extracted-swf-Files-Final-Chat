package com.tinychat.controller.commands.popup
{
    import com.tinychat.controller.commands.popup.signals.*;
    import org.robotlegs.mvcs.*;

    public class OpenPopupCommand extends SignalCommand
    {
        public var openPopup:OpenPopup;
        protected var popup:Object;
        protected var closeable:Boolean;
        protected var modal:Boolean;

        public function OpenPopupCommand(param1:Object, param2:Boolean = true, param3:Boolean = true)
        {
            this.popup = param1;
            this.closeable = param2;
            this.modal = param3;
            return;
        }// end function

        override public function execute() : void
        {
            this.openPopup.dispatch(this.popup, this.closeable, this.modal);
            return;
        }// end function

    }
}
