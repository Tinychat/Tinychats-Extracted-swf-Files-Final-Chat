package com.tinychat.model.monitor
{

    public class CameraActivityMonitor extends AbstractActivityMonitor
    {
        private var _activity:Activity;

        public function CameraActivityMonitor(param1:Activity)
        {
            this._activity = param1;
            return;
        }// end function

        override public function get activityLevel() : Number
        {
            return this._activity.activityLevel;
        }// end function

    }
}
