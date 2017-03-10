package com.tinychat.services.social.network.facebook.share
{
    import com.tinychat.model.invite.facebook.*;
    import com.tinychat.services.*;
    import com.tinychat.services.social.network.facebook.*;

    public class FacebookApiPostInviteStatusService extends AbstractFacebookApiService implements FacebookPostInviteStatusService
    {
        private var templates:FacebookGeneralInviteTemplates;

        public function FacebookApiPostInviteStatusService(param1:FacebookGeneralInviteTemplates)
        {
            this.templates = param1;
            return;
        }// end function

        public function post(param1:String) : void
        {
            this.templates.generate();
            var _loc_2:Object = {message:param1, link:this.templates.roomUrl, picture:this.templates.pictureUrl, name:this.templates.description1, caption:this.templates.roomUrl, description:this.templates.description2};
            loadApi("/me/feed", _loc_2, HttpMethod.POST);
            return;
        }// end function

    }
}
