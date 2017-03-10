package com.tinychat.services.youtube
{
    import __AS3__.vec.*;
    import com.tinychat.model.youtube.*;
    import com.tinychat.services.*;
    import org.osflash.signals.*;

    public class AbstractYouTubeService extends AbstractJsonLoaderService
    {
        private var _success:Signal;
        private static var atom:Namespace = new Namespace("http://www.w3.org/2005/Atom");
        private static var media:Namespace = new Namespace("http://search.yahoo.com/mrss/");
        private static var gd:Namespace = new Namespace("http://schemas.google.com/g/2005");
        private static var yt:Namespace = new Namespace("http://gdata.youtube.com/schemas/2007");

        public function AbstractYouTubeService(param1:String)
        {
            super(param1);
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
                _loc_2.push(new YouTubeClip(_loc_3.id, _loc_4.title, _loc_5, _loc_6));
            }
            return _loc_2;
        }// end function

    }
}
