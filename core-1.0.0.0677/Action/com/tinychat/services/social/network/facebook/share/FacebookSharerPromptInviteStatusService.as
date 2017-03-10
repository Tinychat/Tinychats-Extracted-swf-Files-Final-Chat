package com.tinychat.services.social.network.facebook.share
{
    import com.tinychat.model.invite.facebook.*;
    import com.tinychat.model.javascript.*;

    public class FacebookSharerPromptInviteStatusService extends FacebookSharerService implements FacebookPromptInviteStatusService
    {
        private var templates:FacebookGeneralInviteTemplates;

        public function FacebookSharerPromptInviteStatusService(param1:ApplicationJavascript, param2:FacebookGeneralInviteTemplates)
        {
            super(param1);
            this.templates = param2;
            return;
        }// end function

        public function post() : void
        {
            this.templates.generate();
            url = this.templates.roomUrl + "?time=" + new Date().time;
            images = [this.templates.pictureUrl];
            title = this.templates.description1;
            summary = this.templates.description2;
            postSharer();
            return;
        }// end function

    }
}
