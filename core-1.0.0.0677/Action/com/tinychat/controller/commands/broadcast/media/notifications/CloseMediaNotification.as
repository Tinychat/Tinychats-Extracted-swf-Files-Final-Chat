package com.tinychat.controller.commands.broadcast.media.notifications
{
    import com.tinychat.model.media.*;

    public class CloseMediaNotification extends AbstractMediaNotification
    {

        public function CloseMediaNotification(param1:MediaType)
        {
            var _loc_2:String = "closed the {0}.";
            var _loc_3:Array = [this.getMediaPossesive(param1)];
            super(param1, _loc_2, _loc_3);
            return;
        }// end function

        private function getMediaPossesive(param1:MediaType) : String
        {
            var _loc_2:String = null;
            if (param1 == MediaType.YOUTUBE)
            {
                _loc_2 = "YouTube-video";
            }
            else if (param1 == MediaType.SOUNDCLOUD)
            {
                _loc_2 = "SoundCloud-track";
            }
            return _loc_2;
        }// end function

    }
}
