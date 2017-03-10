package com.tinychat.ui.components.popupmenu
{

    public class BroadcastUserPopupMenu extends TinychatUserPopupMenu
    {
        private static var _skinParts:Object = {dropDown:false, dataGroup:false, dropIndicator:false, headerDisplay:false, proIndicator:false, scroller:false, openButton:true};

        public function BroadcastUserPopupMenu()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
