package com.tinychat.model.broadcast.devicelist
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.lists.*;
    import flash.media.*;

    public class CameraList extends DeviceList
    {

        public function CameraList()
        {
            super(function () : Array
            {
                return Camera.names;
            }// end function
            , Camera.getCamera);
            return;
        }// end function

        override protected function getNewListDeviceItemFrom(param1:Object) : DeviceListItem
        {
            return new CameraListItem(Camera(param1), "This camera is in use by another application.");
        }// end function

    }
}
