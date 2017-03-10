package com.tinychat.services.chat.links
{
    import com.tinychat.services.*;
    import org.osflash.signals.*;

    public class LinkValidationService extends AbstractXmlLoaderService
    {
        private var _success:Signal;

        public function LinkValidationService(param1:String)
        {
            super(param1);
            this._success = new Signal(Array, Array);
            return;
        }// end function

        public function load() : void
        {
            makeGetRequest();
            return;
        }// end function

        override public function get success() : ISignal
        {
            return this._success;
        }// end function

        override protected function parse(param1:XML)
        {
            var _loc_4:XML = null;
            var _loc_2:Array = [];
            var _loc_3:Array = [];
            for each (_loc_4 in param1.whitelist.children())
            {
                
                _loc_2.push(_loc_4.toString());
            }
            for each (_loc_4 in param1.blacklist.children())
            {
                
                _loc_3.push(_loc_4.toString());
            }
            return {whitelist:_loc_2, blacklist:_loc_3};
        }// end function

        override protected function finish(param1) : void
        {
            this._success.dispatch(param1.whitelist, param1.blacklist);
            return;
        }// end function

    }
}
