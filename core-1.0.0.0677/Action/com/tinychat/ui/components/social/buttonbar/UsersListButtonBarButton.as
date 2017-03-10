package com.tinychat.ui.components.social.buttonbar
{
    import spark.components.*;

    public class UsersListButtonBarButton extends ButtonBarButton
    {
        private static var _skinParts:Object = {labelDisplay:false, iconDisplay:false};

        public function UsersListButtonBarButton()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
