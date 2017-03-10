package com.tinychat.ui.components.broadcast.screens
{

    public class MicrophoneModeSelectionScreen extends SelectionScreenBase
    {
        private static var _skinParts:Object = {confirm:false, cancel:false, loadingIndicator:false, selector:true, titleDisplay:false, statusLabel:false, selectionInfoDisplay:true};

        public function MicrophoneModeSelectionScreen()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
