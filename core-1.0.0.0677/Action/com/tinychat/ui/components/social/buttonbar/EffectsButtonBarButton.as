package com.tinychat.ui.components.social.buttonbar
{
    import com.tinychat.ui.components.spark.*;

    public class EffectsButtonBarButton extends IconButtonBarButton
    {
        private static var _skinParts:Object = {labelDisplay:false, iconDisplay:false, iconDisplay2:false};

        public function EffectsButtonBarButton()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
