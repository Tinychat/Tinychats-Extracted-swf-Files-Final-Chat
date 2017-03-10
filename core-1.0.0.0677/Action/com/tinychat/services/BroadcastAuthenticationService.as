package com.tinychat.services
{
    import com.tinychat.model.authorization.*;
    import com.tinychat.services.vo.*;
    import org.osflash.signals.*;

    public class BroadcastAuthenticationService extends AbstractXmlLoaderService
    {
        private var _loaded:Signal;

        public function BroadcastAuthenticationService(param1:String)
        {
            super(param1);
            this._loaded = new Signal(BroadcastAuthenticationInfo);
            return;
        }// end function

        override public function get success() : ISignal
        {
            return this._loaded;
        }// end function

        public function load(param1:String, param2:String, param3:String, param4:String, param5:String) : void
        {
            setUrlParameters({id:param1, nick:param2, name:param3, site:param4, password:param5});
            makeGetRequest();
            return;
        }// end function

        override protected function parse(param1:XML)
        {
            var _loc_2:* = this.parseResult(param1.@result);
            var _loc_3:* = param1.@token;
            return new BroadcastAuthenticationInfo(_loc_2, _loc_3);
        }// end function

        override protected function finish(param1) : void
        {
            this._loaded.dispatch(param1);
            return;
        }// end function

        private function parseResult(param1:String) : BroadcastAuthorizationStatus
        {
            var _loc_2:BroadcastAuthorizationStatus = null;
            switch(param1)
            {
                case "PW":
                {
                    _loc_2 = BroadcastAuthorizationStatus.PASSWORD_PROTECTED;
                    break;
                }
                case "BL":
                {
                    _loc_2 = BroadcastAuthorizationStatus.BLOCKED;
                    break;
                }
                default:
                {
                    _loc_2 = BroadcastAuthorizationStatus.AUTHORIZED;
                    break;
                    break;
                }
            }
            return _loc_2;
        }// end function

    }
}
