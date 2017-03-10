package com.tinychat.model.broadcast.devicelist
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.lists.*;
    import flash.media.*;

    public class MicrophoneList extends DeviceList
    {

        public function MicrophoneList()
        {
            super(function () : Array
            {
                return Microphone.names;
            }// end function
            , Microphone.getMicrophone);
            return;
        }// end function

        override protected function getNewListDeviceItemFrom(param1:Object) : DeviceListItem
        {
            return new MicrophoneListItem(Microphone(param1));
        }// end function

    }
}
