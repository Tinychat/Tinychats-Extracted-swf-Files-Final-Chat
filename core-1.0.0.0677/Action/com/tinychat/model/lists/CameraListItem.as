package com.tinychat.model.lists
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.monitor.*;
    import flash.events.*;
    import flash.media.*;
    import mx.events.*;
    import org.osflash.signals.*;

    public class CameraListItem extends EventDispatcher implements DeviceListItem, AllVideoAttachable
    {
        private var _camera:Camera;
        private var _inactivityMessage:String;
        private var cameraActivity:CameraActivity;
        private var activityMonitor:ActivityMonitor;
        private var _isActive:Boolean;
        private var _activityChange:Signal;

        public function CameraListItem(param1:Camera, param2:String)
        {
            this.device = param1;
            this._inactivityMessage = param2;
            this._activityChange = new Signal(Boolean);
            return;
        }// end function

        public function get name() : String
        {
            return this._camera.name;
        }// end function

        public function get inactivityMessage() : String
        {
            return this._inactivityMessage;
        }// end function

        public function get device() : Object
        {
            return this._camera;
        }// end function

        public function set device(param1:Object) : void
        {
            var _loc_2:Camera = null;
            if (this._camera != param1)
            {
                _loc_2 = this._camera;
                this._camera = Camera(param1);
                this._isActive = false;
                if (!this.cameraActivity)
                {
                    this.cameraActivity = new CameraActivity(this._camera);
                    this.activityMonitor = new CameraActivityMonitor(this.cameraActivity);
                }
                else
                {
                    this.cameraActivity.camera = this._camera;
                }
                dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE, false, false, PropertyChangeEventKind.UPDATE, "camera", _loc_2, this._camera, this));
            }
            return;
        }// end function

        public function get activityChange() : ISignal
        {
            if (!this.activityMonitor.polling)
            {
                this.activityMonitor.startActivityPolling(100, this.activityPollerHandler);
            }
            return this._activityChange;
        }// end function

        public function get isActive() : Boolean
        {
            return this._isActive;
        }// end function

        public function attachToVideo(param1:CameraVideoElement) : void
        {
            param1.attachCamera(this._camera);
            return;
        }// end function

        private function activityPollerHandler(param1:Number) : void
        {
            if (this._isActive != param1 > 0)
            {
                this._isActive = param1 > 0;
                this._activityChange.dispatch(this._isActive);
            }
            if (this._activityChange.numListeners == 0)
            {
                this.activityMonitor.stopActivityPolling();
            }
            return;
        }// end function

    }
}
