package com.tinychat.services.userinfo
{
    import com.tinychat.services.*;
    import com.tinychat.services.vo.*;
    import flash.xml.*;
    import org.osflash.signals.*;

    public class TinychatUserinfoService extends AbstractXmlLoaderService
    {
        private var _loaded:Signal;

        public function TinychatUserinfoService(param1:String)
        {
            super(param1);
            this._loaded = new Signal(TinychatUserinfo);
            return;
        }// end function

        override public function get success() : ISignal
        {
            return this._loaded;
        }// end function

        public function load(param1:String) : void
        {
            setUrlParameters({username:param1, format:"xml"});
            makeGetRequest();
            return;
        }// end function

        override protected function parse(param1:XML)
        {
            var _loc_2:* = param1.@username;
            var _loc_3:* = this.parseBio(param1.@biography);
            var _loc_4:* = param1.@location;
            var _loc_5:* = param1.@smalllogo;
            var _loc_6:* = param1.@website;
            var _loc_7:* = param1.friends.@followers ? (parseInt(param1.friends.@followers)) : (0);
            var _loc_8:* = param1.friends.@following ? (parseInt(param1.friends.@following)) : (0);
            if (param1.friends.@is_following)
            {
            }
            var _loc_9:* = param1.friends.@is_following == "true";
            var _loc_10:* = param1.@views ? (parseInt(param1.@views)) : (0);
            return new TinychatUserinfo(_loc_2, _loc_3, _loc_4, _loc_5, _loc_6, _loc_7, _loc_8, _loc_9, _loc_10);
        }// end function

        override protected function finish(param1) : void
        {
            this._loaded.dispatch(param1);
            return;
        }// end function

        private function parseBio(param1:String) : String
        {
            var _loc_2:* = new XMLDocument(param1);
            if (_loc_2.firstChild)
            {
                return _loc_2.firstChild.nodeValue.split("\n").join(" ");
            }
            return "";
        }// end function

    }
}
