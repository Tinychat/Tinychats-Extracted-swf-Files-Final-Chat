package com.tinychat.ui.components.popupmenu
{
    import com.tinychat.model.api.*;
    import com.tinychat.ui.components.pro.*;

    public class TinychatUserPopupMenu extends UserPopupMenu
    {
        public var proIndicator:ProIndicator;
        private static var _skinParts:Object = {dropDown:false, dataGroup:false, dropIndicator:false, headerDisplay:false, proIndicator:false, scroller:false, openButton:true};

        public function TinychatUserPopupMenu()
        {
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.proIndicator)
            {
                this.proIndicator.user = super.user as ProableUser;
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
