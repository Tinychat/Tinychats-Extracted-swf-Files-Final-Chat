package com.tinychat.ui.components.spark
{
    import flash.events.*;
    import flash.net.*;

    public class LinkToggleButton extends IconToggleButton
    {
        private var _url:String;
        private static var _skinParts:Object = {labelDisplay:false, iconDisplay:false, iconDisplay2:false};

        public function LinkToggleButton()
        {
            return;
        }// end function

        public function set url(param1:String) : void
        {
            this._url = param1;
            return;
        }// end function

        override protected function clickHandler(event:MouseEvent) : void
        {
            super.clickHandler(event);
            if (this._url)
            {
            }
            if (this._url != "")
            {
                navigateToURL(new URLRequest(this._url), "_blank");
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
