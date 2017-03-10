package com.tinychat.model.broadcast.cameraquality
{
    import flash.media.*;

    public class GreenRoomCameraQuality extends Object implements CameraQuality
    {

        public function GreenRoomCameraQuality()
        {
            return;
        }// end function

        public function setQuality(param1:Camera) : void
        {
            var _loc_2:uint = 160;
            var _loc_3:uint = 120;
            var _loc_4:uint = 16000;
            var _loc_5:uint = 0;
            var _loc_6:uint = 2;
            var _loc_7:uint = 48;
            var _loc_8:Boolean = false;
            param1.setMode(_loc_2, _loc_3, _loc_6, _loc_8);
            param1.setQuality(_loc_4, _loc_5);
            param1.setKeyFrameInterval(_loc_7);
            return;
        }// end function

    }
}
