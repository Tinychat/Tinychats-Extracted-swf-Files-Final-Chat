package com.tinychat.ui.mediators.broadcast.lists
{
    import com.tinychat.controller.commands.state.signals.*;
    import com.tinychat.controller.commands.utils.*;
    import com.tinychat.controller.guards.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.model.report.*;
    import com.tinychat.model.trial.*;
    import com.tinychat.model.youtube.*;
    import com.tinychat.ui.components.broadcast.containers.*;
    import com.tinychat.ui.components.broadcast.lists.*;
    import org.robotlegs.core.*;
    import org.robotlegs.mvcs.*;

    public class RoomBroadcastCanvasMediator extends Mediator
    {
        public var view:RoomBroadcastCanvas;
        public var injector:IInjector;
        public var broadcasts:RoomBroadcastCanvasBroadcasts;
        public var containerFactory:BroadcastContainerFactory;
        public var triggerStateAction:TriggerStateAction;
        public var isPaidUser:IsPaidUserGuard;
        public var trialMode:TrialMode;
        public var dispatchSignal:DispatchSignal;
        private var broadcastList:IdItemList;

        public function RoomBroadcastCanvasMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            var _loc_1:Broadcast = null;
            this.injector.mapValue(RoomBroadcastCanvas, this.view);
            this.injector.getInstance(CameraCaptureProxy);
            this.broadcastList = new IdItemList();
            for each (_loc_1 in this.broadcasts.all)
            {
                
                this.startedHandler(_loc_1);
            }
            this.broadcasts.started.add(this.startedHandler);
            this.broadcasts.stopped.add(this.stoppedHandler);
            this.view.containerFactory = this.containerFactory;
            this.view.dataProvider = this.broadcastList;
            return;
        }// end function

        override public function onRemove() : void
        {
            this.injector.unmap(RoomBroadcastCanvas);
            this.broadcasts.started.remove(this.startedHandler);
            this.broadcasts.stopped.remove(this.stoppedHandler);
            this.view.containerFactory = null;
            this.view.dataProvider = null;
            return;
        }// end function

        private function startedHandler(param1:Broadcast) : void
        {
            this.broadcastList.addItem(param1);
            if (param1 is YouTubeBroadcast)
            {
                this.view.selectedItem = param1;
            }
            return;
        }// end function

        private function stoppedHandler(param1:Broadcast) : void
        {
            this.broadcastList.removeItemBy(param1);
            return;
        }// end function

    }
}
