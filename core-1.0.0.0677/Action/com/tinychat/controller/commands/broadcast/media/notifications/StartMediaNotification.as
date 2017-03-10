package com.tinychat.controller.commands.broadcast.media.notifications
{
    import com.tinychat.model.media.*;

    public class StartMediaNotification extends AbstractMediaNotification
    {

        public function StartMediaNotification(param1:MediaType, param2:String)
        {
            var _loc_3:String = "started a {0}";
            var _loc_4:Array = [this.getMediaPossesive(param1)];
            if (param2)
            {
                _loc_3 = _loc_3 + ": {1}.";
                _loc_4 = _loc_4.concat(param2);
            }
            else
            {
                _loc_3 = _loc_3 + ".";
            }
            super(param1, _loc_3, _loc_4);
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
