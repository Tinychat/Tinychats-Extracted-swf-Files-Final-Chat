package com.tinychat.services.social.network.facebook.share
{
    import com.tinychat.model.javascript.*;
    import com.tinychat.model.snapshot.*;
    import com.tinychat.model.snapshot.facebook.*;

    public class FacebookSharerPostSnapshotService extends FacebookSharerService implements FacebookPromptSnapshotService
    {
        private var templates:FacebookSnapshotTemplates;

        public function FacebookSharerPostSnapshotService(param1:ApplicationJavascript, param2:FacebookSnapshotTemplates)
        {
            super(param1);
            this.templates = param2;
            return;
        }// end function

        public function post(param1:Snapshot) : void
        {
            title = escape(this.templates.description1);
            url = encodeURI(param1.pageUrl + "?time=" + new Date().time);
            images = [encodeURI("https://tinychat.com/public/images/snapshot.png")];
            summary = escape(this.templates.description2);
            postSharer();
            return;
        }// end function

    }
}
