package com.tinychat.ui.components.gifts
{
    import spark.components.*;

    public class BuyGiftButton extends Button
    {
        private static var _skinParts:Object = {labelDisplay:false, iconDisplay:false};

        public function BuyGiftButton()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
