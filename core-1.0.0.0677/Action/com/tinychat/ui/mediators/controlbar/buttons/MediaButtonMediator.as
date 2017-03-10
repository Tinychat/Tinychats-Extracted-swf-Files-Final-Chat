package com.tinychat.ui.mediators.controlbar.buttons
{
    import com.tinychat.controller.commands.state.signals.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.model.guards.media.*;
    import com.tinychat.ui.mediators.general.*;
    import flash.events.*;
    import spark.components.*;

    public class MediaButtonMediator extends ButtonMediator
    {
        public var triggerStateAction:TriggerStateAction;
        public var isMediaModerator:IsMediaModeratorGuard;
        private var view:Button;
        private var trigger:StateAction;

        public function MediaButtonMediator(param1:Button, param2:StateAction)
        {
            this.view = param1;
            this.trigger = param2;
            super(param1);
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.isMediaModerator.addChangeListener(this.isMediaModeratorChangeHandler);
            this.isMediaModeratorChangeHandler(this.isMediaModerator.approve());
            return;
        }// end function

        override public function onRemove() : void
        {
            super.onRemove();
            this.isMediaModerator.removeChangeListener(this.isMediaModeratorChangeHandler);
            return;
        }// end function

        override protected function clickHandler(event:MouseEvent) : void
        {
            this.triggerStateAction.dispatch(this.trigger);
            return;
        }// end function

        private function isMediaModeratorChangeHandler(param1:Boolean) : void
        {
            this.view.visible = param1;
            this.view.includeInLayout = param1;
            return;
        }// end function

    }
}
