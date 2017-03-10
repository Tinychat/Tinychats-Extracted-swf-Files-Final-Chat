package com.tinychat.ui.mediators.controlbar.buttons
{
    import com.tinychat.controller.commands.broadcast.signals.*;
    import com.tinychat.controller.guards.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.*;
    import com.tinychat.model.broadcast.greenroom.*;
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.room.*;
    import com.tinychat.model.room.info.*;
    import com.tinychat.model.user.*;
    import com.tinychat.ui.components.controlbar.buttons.*;
    import flash.events.*;
    import org.robotlegs.mvcs.*;

    public class BroadcastButtonMediator extends Mediator
    {
        public var view:BroadcastButton;
        public var allBroadcasts:AllBroadcasts;
        public var roomCameraBroadcasts:RoomCameraBroadcasts;
        public var greenRoomCameraBroadcasts:GreenRoomCameraBroadcasts;
        public var roomUsers:RoomUsers;
        public var roomInfo:RoomSettingsProxy;
        public var startBroadcastingRequest:StartBroadcastingRequest;
        public var stopBroadcastingRequest:StopBroadcastingRequest;
        public var broadcastSlotAvailable:BroadcastSlotAvailableGuard;

        public function BroadcastButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.setLabels("Start Broadcasting", "Stop Broadcasting");
            this.view.clickTimeout = 3000;
            this.addBroadcastListeners();
            this.updateState();
            eventMap.mapListener(this.view, Event.CHANGE, this.changeHandler, Event);
            this.roomUsers.currentUserChanged.add(this.currentUserChangedHandler);
            this.roomInfo.roomInfoChanged.add(this.roomInfoChangedHandler);
            this.roomInfo.lurkerChanged.add(this.lurkerHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.roomUsers.currentUserChanged.remove(this.currentUserChangedHandler);
            this.roomInfo.roomInfoChanged.remove(this.roomInfoChangedHandler);
            this.roomInfo.lurkerChanged.remove(this.lurkerHandler);
            return;
        }// end function

        private function addBroadcastListeners() : void
        {
            this.allBroadcasts.started.add(this.broadcastStartedHandler);
            this.allBroadcasts.stopped.add(this.broadcastStoppedHandler);
            this.roomCameraBroadcasts.disabledChanged.add(this.disabledChangedHandler);
            this.greenRoomCameraBroadcasts.disabledChanged.add(this.disabledChangedHandler);
            return;
        }// end function

        private function removeBroadcastListeners() : void
        {
            this.allBroadcasts.started.remove(this.broadcastStartedHandler);
            this.allBroadcasts.stopped.remove(this.broadcastStoppedHandler);
            this.roomCameraBroadcasts.disabledChanged.remove(this.disabledChangedHandler);
            this.greenRoomCameraBroadcasts.disabledChanged.remove(this.disabledChangedHandler);
            return;
        }// end function

        private function changeHandler(event:Event) : void
        {
            if (!this.view.selected)
            {
                this.startBroadcastingRequest.dispatch();
            }
            else
            {
                this.stopBroadcastingRequest.dispatch();
            }
            return;
        }// end function

        private function currentUserChangedHandler(param1:UserIdentity, param2:UserIdentity) : void
        {
            this.updateState();
            return;
        }// end function

        private function lurkerHandler(param1:Boolean) : void
        {
            this.updateState();
            return;
        }// end function

        private function roomInfoChangedHandler() : void
        {
            this.updateState();
            return;
        }// end function

        private function disabledChangedHandler(param1:Boolean) : void
        {
            this.updateState();
            return;
        }// end function

        private function broadcastStartedHandler(param1:Broadcast) : void
        {
            this.updateState();
            return;
        }// end function

        private function broadcastStoppedHandler(param1:Broadcast) : void
        {
            this.updateState();
            return;
        }// end function

        private function updateState() : void
        {
            var _loc_1:Boolean = false;
            var _loc_2:String = null;
            if (this.roomInfo.lurker)
            {
                _loc_1 = true;
                _loc_2 = "ToolTipBundle.broadcastButtonLurkerRestricted";
            }
            else if (this.roomInfo.type == RoomType.READONLY)
            {
                _loc_1 = true;
                _loc_2 = "ToolTipBundle.broadcastButtonReadonlyRestricted";
            }
            else
            {
                if (!this.roomCameraBroadcasts.disabled)
                {
                }
                if (this.greenRoomCameraBroadcasts.disabled)
                {
                    _loc_1 = true;
                    _loc_2 = "ToolTipBundle.broadcastButtonTemporarilyRestricted";
                }
                else
                {
                    if (!this.view.selected)
                    {
                    }
                    if (!this.broadcastSlotAvailable.approve())
                    {
                        _loc_1 = true;
                        _loc_2 = "ToolTipBundle.broadcastButtonCapRestricted";
                    }
                    else
                    {
                        _loc_1 = false;
                        _loc_2 = "";
                    }
                }
            }
            if (!this.roomCameraBroadcasts.isBroadcasting)
            {
            }
            this.view.selected = this.greenRoomCameraBroadcasts.isBroadcasting;
            this.view.deactivated = _loc_1;
            this.view.toolTip = _loc_2;
            return;
        }// end function

    }
}
