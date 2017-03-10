package com.tinychat.model.lists
{
    import com.tinychat.model.monitor.*;
    import flash.events.*;
    import flash.media.*;
    import mx.events.*;

    public class MicrophoneListItem extends EventDispatcher implements DeviceListItem, ActivityMonitor
    {
        private var _microphone:Microphone;
        private var microphoneActivity:MicrophoneActivity;
        private var activityMonitor:ActivityMonitor;

        public function MicrophoneListItem(param1:Microphone)
        {
            this.device = param1;
            return;
        }// end function

        public function get name() : String
        {
            return this._microphone.name;
        }// end function

        public function get microphone() : Microphone
        {
            return this._microphone;
        }// end function

        public function get device() : Object
        {
            return this._microphone;
        }// end function

        public function set device(param1:Object) : void
        {
            var _loc_2:Microphone = null;
            if (this._microphone != param1)
            {
                _loc_2 = this._microphone;
                this._microphone = Microphone(param1);
                if (!this.microphoneActivity)
                {
                    this.microphoneActivity = new MicrophoneActivity(this._microphone);
                    this.activityMonitor = new CameraActivityMonitor(this.microphoneActivity);
                }
                else
                {
                    this.microphoneActivity.microphone = this._microphone;
                }
                dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE, false, false, PropertyChangeEventKind.UPDATE, "microphone", _loc_2, this._microphone, this));
            }
            return;
        }// end function

        public function get polling() : Boolean
        {
            return this.activityMonitor.polling;
        }// end function

        public function get activityLevel() : Number
        {
            return this.activityMonitor.activityLevel;
        }// end function

        public function get timePolling() : uint
        {
            return this.activityMonitor.timePolling;
        }// end function

        public function startActivityPolling(param1:uint, param2:Function = null) : void
        {
            this.activityMonitor.startActivityPolling(param1, param2);
            return;
        }// end function

        public function stopActivityPolling() : void
        {
            this.activityMonitor.stopActivityPolling();
            return;
        }// end function

    }
}
