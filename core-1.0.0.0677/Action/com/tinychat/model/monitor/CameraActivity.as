package com.tinychat.model.monitor
{
    import flash.events.*;
    import flash.media.*;

    public class CameraActivity extends Object implements Activity
    {
        private var _camera:Camera;

        public function CameraActivity(param1:Camera)
        {
            this.camera = param1;
            return;
        }// end function

        public function set camera(param1:Camera) : void
        {
            if (this._camera != param1)
            {
                if (this._camera)
                {
                    this._camera.removeEventListener(ActivityEvent.ACTIVITY, this.activityHandler);
                }
                this._camera = param1;
                if (this._camera)
                {
                    this._camera.addEventListener(ActivityEvent.ACTIVITY, this.activityHandler);
                }
            }
            return;
        }// end function

        public function get activityLevel() : Number
        {
            if (this._camera)
            {
            }
            return this._camera.activityLevel != -1 ? (this._camera.currentFPS) : (0);
        }// end function

        private function activityHandler(event:ActivityEvent) : void
        {
            return;
        }// end function

    }
}
