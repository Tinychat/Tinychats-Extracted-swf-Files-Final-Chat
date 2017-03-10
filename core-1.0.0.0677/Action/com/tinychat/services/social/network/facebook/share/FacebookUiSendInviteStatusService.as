package com.tinychat.services.social.network.facebook.share
{
    import com.tinychat.model.invite.facebook.*;
    import com.tinychat.services.social.network.facebook.*;

    public class FacebookUiSendInviteStatusService extends AbstractFacebookApiService implements FacebookSendInviteStatusService
    {
        private var templates:FacebookGeneralInviteTemplates;

        public function FacebookUiSendInviteStatusService(param1:FacebookGeneralInviteTemplates)
        {
            this.templates = param1;
            return;
        }// end function

        public function post() : void
        {
            this.templates.generate();
            var _loc_1:Object = {link:this.templates.roomUrl};
            loadUi("send", _loc_1);
            return;
        }// end function

    }
}
