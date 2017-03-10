package com.tinychat.services.social.network.facebook.share
{
    import com.tinychat.model.snapshot.*;
    import com.tinychat.model.snapshot.facebook.*;
    import com.tinychat.services.*;
    import com.tinychat.services.social.network.facebook.*;

    public class FacebookApiPostSnapshotService extends AbstractFacebookApiService implements FacebookPostSnapshotService
    {
        private var templates:FacebookSnapshotTemplates;

        public function FacebookApiPostSnapshotService(param1:FacebookSnapshotTemplates)
        {
            this.templates = param1;
            return;
        }// end function

        public function post(param1:Snapshot) : void
        {
            var _loc_2:Object = {link:param1.pageUrl, picture:param1.imageUrl, name:this.templates.description1, caption:this.templates.caption, description:this.templates.description2};
            loadApi("/me/feed", _loc_2, HttpMethod.POST);
            return;
        }// end function

    }
}
