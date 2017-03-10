package com.tinychat.model.social.chat.links
{
    import com.tinychat.model.utils.url.*;

    public class LinkBlacklist extends LinkValidationList
    {

        public function LinkBlacklist()
        {
            return;
        }// end function

        override public function approve(param1:Url) : Boolean
        {
            return !super.approve(param1);
        }// end function

    }
}
