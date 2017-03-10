package com.tinychat.services
{
    import com.tinychat.model.room.info.*;
    import org.osflash.signals.*;

    public class BroadcastModeService extends AbstractXmlLoaderService
    {
        private var _loaded:Signal;

        public function BroadcastModeService(param1:String)
        {
            super(param1);
            this._loaded = new Signal(String);
            return;
        }// end function

        override public function get success() : ISignal
        {
            return this._loaded;
        }// end function

        public function setMode(param1:String, param2:String, param3:RoomBroadcastMode, param4:String) : void
        {
            setUrlParameters({name:param1, site:param2, mode:param3, pass:param4});
            makeGetRequest();
            return;
        }// end function

        override protected function parse(param1:XML)
        {
            return param1.@PASS.toString();
        }// end function

        override protected function finish(param1) : void
        {
            this._loaded.dispatch(param1);
            return;
        }// end function

    }
}
