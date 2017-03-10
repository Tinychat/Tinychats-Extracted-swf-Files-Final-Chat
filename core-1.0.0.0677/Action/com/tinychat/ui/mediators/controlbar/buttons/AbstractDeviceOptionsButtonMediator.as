package com.tinychat.ui.mediators.controlbar.buttons
{
    import com.tinychat.controller.commands.state.signals.*;
    import com.tinychat.controller.guards.*;
    import com.tinychat.controller.state.*;
    import flash.events.*;
    import org.robotlegs.mvcs.*;
    import spark.components.*;

    public class AbstractDeviceOptionsButtonMediator extends Mediator
    {
        public var triggerStateAction:TriggerStateAction;
        public var isBroadcasting:IsBroadcastingGuard;
        private var view:Button;
        private var triggers:StateAction;
        private var toolTip:String;

        public function AbstractDeviceOptionsButtonMediator(param1:Button, param2:StateAction, param3:String)
        {
            this.view = param1;
            this.triggers = param2;
            this.toolTip = param3;
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.toolTip = this.toolTip;
            this.updateVisibilty(this.isBroadcasting.approve());
            this.isBroadcasting.addChangeListener(this.broadcastingChangeHandler);
            eventMap.mapListener(this.view, MouseEvent.CLICK, this.clickHandler, MouseEvent);
            return;
        }// end function

        override public function onRemove() : void
        {
            super.onRemove();
            this.isBroadcasting.removeChangeListener(this.broadcastingChangeHandler);
            return;
        }// end function

        private function clickHandler(event:MouseEvent) : void
        {
            this.triggerStateAction.dispatch(this.triggers);
            return;
        }// end function

        private function broadcastingChangeHandler(param1:Boolean) : void
        {
            this.updateVisibilty(param1);
            return;
        }// end function

        private function updateVisibilty(param1:Boolean) : void
        {
            this.view.visible = param1;
            this.view.includeInLayout = param1;
            return;
        }// end function

    }
}
