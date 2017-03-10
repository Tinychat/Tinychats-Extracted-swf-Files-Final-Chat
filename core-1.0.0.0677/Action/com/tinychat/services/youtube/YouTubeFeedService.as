package com.tinychat.services.youtube
{

    public class YouTubeFeedService extends AbstractYouTubeFeedService
    {

        public function YouTubeFeedService(param1:String, param2:String)
        {
            super(param1, param2);
            return;
        }// end function

        public function load() : void
        {
            setUrlParameters({key:YouTubeServiceUrl.API_KEY, part:"snippet", chart:"mostPopular", maxResults:50, fields:"items(id,snippet(title,thumbnails(default,medium)))"});
            makeGetRequest();
            return;
        }// end function

    }
}
