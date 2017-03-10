package com.tinychat.services.social.network.mqtt
{
    import by.blooddy.crypto.serialization.*;
    import com.tinychat.services.*;
    import org.osflash.signals.*;

    public class MqttHashService extends AbstractUrlLoaderService
    {
        private var _success:Signal;

        public function MqttHashService(param1:String)
        {
            super(param1);
            this._success = new Signal(String);
            return;
        }// end function

        override public function get success() : ISignal
        {
            return this._success;
        }// end function

        public function load() : void
        {
            makeGetRequest(false, false);
            return;
        }// end function

        override protected function successHandler(param1:Object) : void
        {
            var _loc_2:Object = null;
            try
            {
                _loc_2 = JSON.decode(param1.toString());
            }
            catch (error:Error)
            {
            }
            if (_loc_2)
            {
            }
            if (_loc_2.hasOwnProperty("hash"))
            {
                this._success.dispatch(_loc_2.hash);
            }
            else
            {
                dispatchFailure("Unable to decode hash property from result.");
            }
            return;
        }// end function

    }
}
