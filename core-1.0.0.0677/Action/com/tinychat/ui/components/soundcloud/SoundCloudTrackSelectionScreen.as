package com.tinychat.ui.components.soundcloud
{
    import com.tinychat.model.soundcloud.*;
    import com.tinychat.ui.components.media.*;

    public class SoundCloudTrackSelectionScreen extends AbstractMediaSelectionScreen
    {
        private static var _skinParts:Object = {play:false, confirm:false, cancel:false, searchButton:true, searchField:true, loadingIndicator:false, headerDisplay:true, clipDisplayHeader:true, titleDisplay:false, clipDisplay:true, statusLabel:false};

        public function SoundCloudTrackSelectionScreen()
        {
            return;
        }// end function

        override protected function parseDataProvider(param1:Object) : Array
        {
            var _loc_3:SoundCloudTrack = null;
            var _loc_2:Array = [];
            for each (_loc_3 in param1.tracks)
            {
                
                _loc_2.push(_loc_3);
            }
            return _loc_2;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
