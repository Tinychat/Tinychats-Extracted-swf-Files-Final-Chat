package com.tinychat.controller.commands.broadcast.media.notifications
{
    import com.tinychat.model.media.*;

    public class SeekMediaNotification extends AbstractMediaNotification
    {

        public function SeekMediaNotification(param1:MediaType)
        {
            var _loc_2:String = "changed the {0} current time.";
            var _loc_3:Array = [this.getMediaPossesive(param1)];
            super(param1, _loc_2, _loc_3);
            return;
        }// end function

        private function getMediaPossesive(param1:MediaType) : String
        {
            var _loc_2:String = null;
            if (param1 == MediaType.YOUTUBE)
            {
                _loc_2 = "YouTube-video\'s";
            }
            else if (param1 == MediaType.SOUNDCLOUD)
            {
                _loc_2 = "SoundCloud-track\'s";
            }
            return _loc_2;
        }// end function

    }
}
