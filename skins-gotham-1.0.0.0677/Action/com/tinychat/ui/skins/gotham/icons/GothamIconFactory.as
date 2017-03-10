package com.tinychat.ui.skins.gotham.icons
{
    import com.tinychat.model.lists.*;
    import flash.display.*;
    import flash.utils.*;

    public class GothamIconFactory extends Object implements IconFactory
    {
        private static var lookup:Dictionary;
        private static var OpenMicrophoneAccIcon:Class = GothamIconFactory_OpenMicrophoneAccIcon;
        private static var OpenMicrophoneNoAccIcon:Class = GothamIconFactory_OpenMicrophoneNoAccIcon;
        public static var PushToTalkIcon:Class = GothamIconFactory_PushToTalkIcon;
        private static var initializeLookup:Boolean = populateLookup();

        public function GothamIconFactory()
        {
            return;
        }// end function

        public function newInstance(param1:IconListItem) : DisplayObject
        {
            return new lookup[param1];
        }// end function

        private static function populateLookup() : Boolean
        {
            lookup = new Dictionary();
            lookup[IconListItem.CAMERA_ONLY] = WebcamIcon;
            lookup[IconListItem.MICROPHONE_ONLY] = MicrophoneIcon;
            lookup[IconListItem.NO_CAMERA_DETECTED] = WebcamHiddenIcon;
            lookup[IconListItem.NO_MICROPHONE_DETECTED] = WebcamHiddenIcon;
            lookup[IconListItem.OPEN_MIC_ACC] = OpenMicrophoneAccIcon;
            lookup[IconListItem.OPEN_MIC_NO_ACC] = OpenMicrophoneNoAccIcon;
            lookup[IconListItem.PUSH_TO_TALK] = PushToTalkIcon;
            return true;
        }// end function

    }
}
