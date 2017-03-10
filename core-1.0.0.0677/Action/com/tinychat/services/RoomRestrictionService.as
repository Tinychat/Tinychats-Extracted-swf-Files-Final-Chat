package com.tinychat.services
{
    import com.tinychat.model.room.*;

    public class RoomRestrictionService extends AbstractUrlLoaderService
    {

        public function RoomRestrictionService(param1:String)
        {
            super(param1);
            return;
        }// end function

        public function setRestriction(param1:String, param2:String, param3:RoomLoginRestriction) : void
        {
            var _loc_4:String = null;
            switch(param3)
            {
                case RoomLoginRestriction.FACEBOOK:
                {
                    _loc_4 = "fb";
                    break;
                }
                case RoomLoginRestriction.TWITTER:
                {
                    _loc_4 = "tw";
                    break;
                }
                case RoomLoginRestriction.FACEBOOK_AND_TWITTER:
                {
                    _loc_4 = "on";
                    break;
                }
                case RoomLoginRestriction.ANY:
                {
                    _loc_4 = "off";
                    break;
                }
                default:
                {
                    break;
                }
            }
            setUrlParameters({name:param1, site:param2, forceLogin:_loc_4});
            makeGetRequest();
            return;
        }// end function

    }
}
