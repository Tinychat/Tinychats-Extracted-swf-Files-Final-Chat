package com.tinychat.services.social.network.facebook
{
    import com.tinychat.services.*;
    import com.tinychat.services.vo.*;
    import org.osflash.signals.*;

    public class FacebookInfoService extends AbstractXmlLoaderService
    {
        private var _loaded:Signal;

        public function FacebookInfoService(param1:String)
        {
            super(param1);
            this._loaded = new Signal(FacebookInfo);
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
            var _loc_3:FacebookInfo = null;
            var _loc_2:* = param1.connected.fb;
            if (_loc_2.length() > 0)
            {
                _loc_3 = new FacebookInfo(ServiceResponse.SUCCESS, _loc_2.@name, _loc_2.@access_token, _loc_2.@id, _loc_2.@pic, _loc_2.@session);
            }
            else
            {
                _loc_3 = new FacebookInfo(ServiceResponse.FAILURE, "", "", "", "", "");
            }
            return _loc_3;
        }// end function

        override protected function finish(param1) : void
        {
            this._loaded.dispatch(param1);
            return;
        }// end function

    }
}
