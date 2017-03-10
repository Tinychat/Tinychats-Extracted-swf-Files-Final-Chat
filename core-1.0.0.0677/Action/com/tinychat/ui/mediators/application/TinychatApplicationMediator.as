package com.tinychat.ui.mediators.application
{
    import com.tinychat.controller.commands.popup.signals.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.model.javascript.*;
    import com.tinychat.model.room.*;
    import com.tinychat.ui.components.application.*;
    import flash.display.*;
    import flash.events.*;
    import mx.events.*;
    import org.osflash.statemachine.core.*;
    import org.robotlegs.mvcs.*;

    public class TinychatApplicationMediator extends Mediator
    {
        public var view:TinychatApplication;
        public var stage:Stage;
        public var javascript:ApplicationJavascript;
        public var fsmController:IFSMController;
        public var settings:RoomSettingsProxy;
        public var openPopup:OpenPopup;
        public var closePopup:ClosePopup;
        public var closeableModalPopup:CloseableModalPopup;

        public function TinychatApplicationMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            eventMap.mapListener(this.view, FlexEvent.APPLICATION_COMPLETE, this.applicationCompleteHandler, FlexEvent);
            eventMap.mapListener(this.stage, Event.RESIZE, this.resizeHandler, Event);
            this.fsmController.addChangedListener(this.fsmChangedHandler);
            this.settings.roomInfoChanged.add(this.roomInfoChangedHandler);
            this.openPopup.add(this.openPopupHandler);
            this.closePopup.add(this.closePopupHandler);
            this.closeableModalPopup.add(this.closeableModalPopupHandler);
            this.view.applicationState = State.CONNECTING;
            return;
        }// end function

        override public function onRemove() : void
        {
            this.fsmController.removeChangedListener(this.fsmChangedHandler);
            this.settings.roomInfoChanged.remove(this.roomInfoChangedHandler);
            this.openPopup.remove(this.openPopupHandler);
            this.closePopup.remove(this.closePopupHandler);
            this.closeableModalPopup.remove(this.closeableModalPopupHandler);
            return;
        }// end function

        private function applicationCompleteHandler(event:FlexEvent) : void
        {
            this.javascript.applicationLoaded();
            eventMap.unmapListener(this.view, FlexEvent.APPLICATION_COMPLETE, this.applicationCompleteHandler, FlexEvent);
            return;
        }// end function

        private function resizeHandler(event:Event) : void
        {
            this.view.setLayoutBoundsSize(this.stage.stageWidth, this.stage.stageHeight);
            return;
        }// end function

        private function fsmChangedHandler(param1:String) : void
        {
            this.view.applicationState = State.from(param1);
            return;
        }// end function

        private function roomInfoChangedHandler() : void
        {
            this.view.applicationMode = this.settings.type;
            return;
        }// end function

        private function openPopupHandler(param1:Object, param2:Boolean, param3:Boolean) : void
        {
            if (param3)
            {
                this.view.openModalPopup(param1, param2);
            }
            else
            {
                this.view.openModelessPopup(param1);
            }
            return;
        }// end function

        private function closePopupHandler(param1:Object) : void
        {
            this.view.closeModelessPopup(param1);
            return;
        }// end function

        private function closeableModalPopupHandler(param1:Boolean) : void
        {
            this.view.modalPopupCloseable = param1;
            return;
        }// end function

    }
}
