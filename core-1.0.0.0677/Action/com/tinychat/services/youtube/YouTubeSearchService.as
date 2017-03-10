package com.tinychat.services.youtube
{
    import __AS3__.vec.*;
    import com.tinychat.model.youtube.*;
    import mx.utils.*;

    public class YouTubeSearchService extends AbstractYouTubeFeedService
    {
        private var query:String;

        public function YouTubeSearchService(param1:String, param2:String)
        {
            super(param1, param2);
            return;
        }// end function

        public function load(param1:String) : void
        {
            this.query = param1;
            setUrlParameters({key:YouTubeServiceUrl.API_KEY, part:"snippet", q:this.query, type:"video", maxResults:50, fields:"items(id,snippet(title,thumbnails(default,medium)))"});
            makeGetRequest();
            return;
        }// end function

        override protected function parse(param1:Object)
        {
            var _loc_3:* = undefined;
            var _loc_4:* = undefined;
            var _loc_5:String = null;
            var _loc_6:String = null;
            var _loc_2:* = new Vector.<YouTubeClip>;
            for each (_loc_3 in param1.items)
            {
                
                _loc_4 = _loc_3["snippet"];
                _loc_5 = _loc_4.thumbnails["medium"].url;
                _loc_6 = _loc_4.thumbnails["default"].url;
                _loc_5 = _loc_5.replace(/^https:\/\//i, "http://");
                _loc_6 = _loc_6.replace(/^https:\/\//i, "http://");
                _loc_2.push(new YouTubeClip(_loc_3.id.videoId, _loc_4.title, _loc_5, _loc_6));
            }
            return _loc_2;
        }// end function

        override protected function createFeed(param1:String, param2:Vector.<YouTubeClip>) : YouTubeFeed
        {
            param1 = StringUtil.substitute(param1, this.query);
            return new YouTubeFeed(param1, param2);
        }// end function

    }
}
