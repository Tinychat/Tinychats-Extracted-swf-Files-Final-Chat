package com.tinychat.ui.mediators.broadcast.selectors
{
    import com.tinychat.model.broadcast.devicelist.*;
    import com.tinychat.model.guards.mode.*;
    import com.tinychat.model.proxies.*;
    import com.tinychat.ui.components.broadcast.selectors.*;
    import org.robotlegs.mvcs.*;

    public class MicrophoneSelectorMediator extends Mediator
    {
        public var view:MicrophoneSelector;
        public var deviceProxy:BroadcastDeviceProxy;
        public var microphoneList:MicrophoneList;
        public var nextMode:IsNextModeGuard;
        private var preselectedItemName:String;

        public function MicrophoneSelectorMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.dataProvider = this.microphoneList;
            this.view.preselectedItemName = this.deviceProxy.selectedMicrophoneName;
            if (!this.nextMode.approve())
            {
            }
            this.view.canUserOtherDeviceOnly = this.deviceProxy.selectedCamera != null;
            this.preselectedItemName = this.view.preselectedItemName;
            this.deviceProxy.clearMicrophoneSelection();
            return;
        }// end function

        override public function onRemove() : void
        {
            super.onRemove();
            if (!this.deviceProxy.hasSelectedMicrophone)
            {
                this.deviceProxy.selectedMicrophoneName = this.preselectedItemName;
            }
            this.view.dataProvider = null;
            return;
        }// end function

    }
}
