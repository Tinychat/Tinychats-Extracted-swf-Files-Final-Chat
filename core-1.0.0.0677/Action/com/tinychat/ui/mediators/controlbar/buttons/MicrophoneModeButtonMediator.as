package com.tinychat.ui.mediators.controlbar.buttons
{
    import com.tinychat.controller.guards.*;
    import com.tinychat.controller.guards.composite.*;
    import com.tinychat.model.guards.mode.*;
    import com.tinychat.model.sounds.*;
    import com.tinychat.ui.components.controlbar.buttons.*;
    import flash.events.*;
    import org.robotlegs.mvcs.*;

    public class MicrophoneModeButtonMediator extends Mediator
    {
        public var view:MicrophoneModeButton;
        public var microphoneVolume:MicrophoneVolume;
        public var microphoneMode:MicrophoneMode;
        public var isntCameraOnlyMode:IsntCameraOnlyMode;
        public var isBroadcasting:IsBroadcastingGuard;
        public var hasSelectedMicrophone:HasSelectedMicrophone;
        public var isNextMode:IsNextModeGuard;
        private var visibleGuard:AllOfGuards;

        public function MicrophoneModeButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            if (this.isNextMode.approve())
            {
                this.view.setLabels("Mute", "Muted");
                this.view.pushToTalkLabel = "Push To Talk";
            }
            else
            {
                this.view.setLabels("Mute", "Muted");
                this.view.pushToTalkLabel = "Talk";
            }
            this.togglePushToTalk(this.microphoneMode.pushToTalk);
            this.forceMutedHandler(this.microphoneVolume.forceMuted);
            this.visibleGuard = new AllOfGuards(this.isBroadcasting, this.isntCameraOnlyMode, this.hasSelectedMicrophone);
            this.visibleGuard.addChangeListener(this.visibleGuardChangeHandler);
            this.visibleGuardChangeHandler(this.visibleGuard.approve());
            this.microphoneMode.pushToTalkChanged.add(this.pushToTalkSettingChangedHandler);
            this.microphoneVolume.mutedChanged.add(this.mutedChangedHandler);
            this.microphoneVolume.forceMutedChanged.add(this.forceMutedHandler);
            eventMap.mapListener(this.view, Event.CHANGE, this.buttonStateChangeHandler, Event);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.visibleGuard.removeChangeListener(this.visibleGuardChangeHandler);
            this.microphoneMode.pushToTalkChanged.remove(this.pushToTalkSettingChangedHandler);
            this.microphoneVolume.mutedChanged.remove(this.mutedChangedHandler);
            this.microphoneVolume.forceMutedChanged.remove(this.forceMutedHandler);
            return;
        }// end function

        private function visibleGuardChangeHandler(param1:Boolean) : void
        {
            this.view.visible = param1;
            this.view.includeInLayout = param1;
            return;
        }// end function

        private function forceMutedHandler(param1:Boolean) : void
        {
            var _loc_2:String = null;
            if (param1)
            {
                _loc_2 = "ToolTipBundle.microphoneModeButtonTemporarilyRestricted";
            }
            else
            {
                _loc_2 = "";
            }
            this.view.toolTip = _loc_2;
            this.view.deactivated = param1;
            return;
        }// end function

        private function buttonStateChangeHandler(event:Event) : void
        {
            this.updateBroadcastVolume();
            return;
        }// end function

        private function pushToTalkSettingChangedHandler(param1:Boolean) : void
        {
            this.togglePushToTalk(param1);
            return;
        }// end function

        private function togglePushToTalk(param1:Boolean) : void
        {
            this.view.pushToTalk = param1;
            this.updateBroadcastVolume();
            return;
        }// end function

        private function updateBroadcastVolume() : void
        {
            if (this.view.selected)
            {
            }
            if (this.microphoneMode.pushToTalk)
            {
                if (!this.view.pressed)
                {
                }
            }
            var _loc_1:* = this.microphoneMode.pushToTalk;
            if (_loc_1)
            {
                this.microphoneVolume.mute();
            }
            else
            {
                this.microphoneVolume.unmute();
            }
            return;
        }// end function

        private function mutedChangedHandler(param1:Boolean) : void
        {
            if (param1)
            {
            }
            this.view.selected = !this.microphoneMode.pushToTalk;
            return;
        }// end function

    }
}
