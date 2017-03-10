package com.tinychat.ui.components.social.buttonbar
{

    public class FacebookButtonBarButton extends CountDisplayButtonBarButton
    {
        private static var _skinParts:Object = {popupOverlayDisplay:false, labelDisplay:false, iconDisplay:false, iconDisplay2:false};

        public function FacebookButtonBarButton()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
