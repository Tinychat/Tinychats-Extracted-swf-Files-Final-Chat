package com.tinychat.ui.components.preloader
{
    import flash.display.*;
    import flash.events.*;
    import flash.system.*;
    import flash.utils.*;

    public class EmbeddedSwfLoader extends Loader
    {

        public function EmbeddedSwfLoader(param1:ByteArray)
        {
            var _loc_2:* = new LoaderContext();
            _loc_2.applicationDomain = new ApplicationDomain(ApplicationDomain.currentDomain);
            contentLoaderInfo.addEventListener(Event.COMPLETE, this.loaderCompleteHandler);
            loadBytes(param1, _loc_2);
            return;
        }// end function

        private function loaderCompleteHandler(event:Event) : void
        {
            contentLoaderInfo.removeEventListener(Event.COMPLETE, this.loaderCompleteHandler);
            dispatchEvent(new Event(Event.COMPLETE));
            return;
        }// end function

    }
}
