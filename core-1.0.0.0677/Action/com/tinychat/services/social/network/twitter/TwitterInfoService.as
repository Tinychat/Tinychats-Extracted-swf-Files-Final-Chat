package com.tinychat.services.social.network.twitter
{
    import __AS3__.vec.*;
    import com.tinychat.model.social.network.twitter.*;
    import com.tinychat.services.*;
    import org.osflash.signals.*;

    public class TwitterInfoService extends AbstractXmlLoaderService
    {
        private var _loaded:Signal;

        public function TwitterInfoService(param1:String)
        {
            super(param1);
            this._loaded = new Signal(TwitterUser, Vector.<TwitterUser>);
            return;
        }// end function

        public function load() : void
        {
            makeGetRequest();
            return;
        }// end function

        override public function get success() : ISignal
        {
            return this._loaded;
        }// end function

        override protected function parse(param1:XML)
        {
            var _loc_3:XMLList = null;
            var _loc_6:XML = null;
            var _loc_2:Object = {};
            if (param1.connected.children().length() > 0)
            {
                _loc_2.id = param1.connected.@id;
                _loc_2.name = param1.connected.@name;
                _loc_2.pic = param1.connected.@pic;
                _loc_3 = param1.connected.friends.children();
            }
            else if (param1.userinfo.children().length() > 0)
            {
                _loc_2.id = param1.userinfo.@id;
                _loc_2.name = param1.userinfo.@username;
                _loc_2.pic = param1.userinfo.twitter.@pic;
                _loc_3 = param1.userinfo.friends.children();
            }
            if (!_loc_2.name)
            {
                throw new Error("User was not logged in.");
            }
            var _loc_4:* = new TwitterUser(_loc_2.id, _loc_2.name, "", this.unescape(_loc_2.pic));
            var _loc_5:* = new Vector.<TwitterUser>;
            for each (_loc_6 in _loc_3)
            {
                
                _loc_5.push(new TwitterUser(_loc_6.@id, _loc_6.@screen_name, _loc_6.@name, this.unescape(_loc_6.@pic)));
            }
            return {user:_loc_4, friends:_loc_5};
        }// end function

        override protected function finish(param1) : void
        {
            this._loaded.dispatch(param1.user, param1.friends);
            return;
        }// end function

        private function unescape(param1:String) : String
        {
            return param1.replace(/\\/g, "");
        }// end function

    }
}
