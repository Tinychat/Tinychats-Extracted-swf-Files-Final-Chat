package com.tinychat.ui.components.broadcast.containers
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.greenroom.*;
    import spark.components.supportClasses.*;

    public class GreenRoomCameraBroadcastContainer extends CameraBroadcastContainer
    {
        public var approvalMessageDisplay:TextBase;
        private var _approvalMessageDisplayText:String;
        private var approvalMessageDisplayTextChanged:Boolean;
        private static var _skinParts:Object = {volumeControl:false, approvalMessageDisplay:true, nameDisplay:false, contentGroup:false, iconAchiev:false, proIndicator:false, audioActivityIndicator:false, videoControlsOverlay:false};

        public function GreenRoomCameraBroadcastContainer(param1:GreenRoomCameraBroadcast, param2:CameraVideoElement)
        {
            super(param1, param2);
            return;
        }// end function

        public function set approvalMessageDisplayText(param1:String) : void
        {
            if (this._approvalMessageDisplayText != param1)
            {
                this._approvalMessageDisplayText = param1;
                this.approvalMessageDisplayTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.approvalMessageDisplayTextChanged)
            {
            }
            if (this.approvalMessageDisplay)
            {
                this.approvalMessageDisplay.text = this._approvalMessageDisplayText;
                this.approvalMessageDisplayTextChanged = false;
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
