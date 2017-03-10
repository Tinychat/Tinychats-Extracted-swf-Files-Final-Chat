package com.tinychat.ui.mediators.broadcast.selectors
{
    import com.tinychat.model.broadcast.devicelist.*;
    import com.tinychat.model.guards.mode.*;
    import com.tinychat.model.proxies.*;
    import com.tinychat.ui.components.broadcast.selectors.*;
    import flash.media.*;
    import org.robotlegs.mvcs.*;

    public class CameraSelectorMediator extends Mediator
    {
        public var view:CameraSelector;
        public var devices:BroadcastDeviceProxy;
        public var cameraList:CameraList;
        public var nextMode:IsNextModeGuard;

        public function CameraSelectorMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.dataProvider = this.cameraList;
            this.view.preselectedItemName = this.devices.selectedCameraName;
            if (!this.devices.hasSelectedMicrophone)
            {
            }
            var _loc_1:* = Microphone.getMicrophone() != null;
            if (!this.nextMode.approve())
            {
            }
            this.view.canUserOtherDeviceOnly = _loc_1;
            return;
        }// end function

        override public function onRemove() : void
        {
            this.view.dataProvider = null;
            return;
        }// end function

    }
}
