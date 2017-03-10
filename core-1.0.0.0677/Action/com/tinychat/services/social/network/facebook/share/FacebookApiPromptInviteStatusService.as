package com.tinychat.services.social.network.facebook.share
{
    import com.tinychat.model.invite.facebook.*;
    import com.tinychat.services.social.network.facebook.*;

    public class FacebookApiPromptInviteStatusService extends AbstractFacebookApiService implements FacebookPromptInviteStatusService
    {
        private var templates:FacebookGeneralInviteTemplates;

        public function FacebookApiPromptInviteStatusService(param1:FacebookGeneralInviteTemplates)
        {
            this.templates = param1;
            return;
        }// end function

        public function post() : void
        {
            this.templates.generate();
            var _loc_1:Object = {link:this.templates.roomUrl, picture:this.templates.pictureUrl, name:this.templates.description1, caption:this.templates.roomUrl, description:this.templates.description2};
            loadUi("feed", _loc_1);
            return;
        }// end function

    }
}
