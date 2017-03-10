package com.tinychat.model.lists
{

    public class IconListItem extends Object implements Named
    {
        private var _name:String;
        private var _enabled:Boolean;
        public static const NO_CAMERA_DETECTED:IconListItem = new IconListItem(NO_CAMERA_DETECTED, "Camera Unavailable", false);
        public static const NO_MICROPHONE_DETECTED:IconListItem = new IconListItem(NO_MICROPHONE_DETECTED, "Microphone Unavailable", false);
        public static const CAMERA_ONLY:IconListItem = new IconListItem(CAMERA_ONLY, "Camera Only");
        public static const MICROPHONE_ONLY:IconListItem = new IconListItem(MICROPHONE_ONLY, "Microphone Only");
        public static const PUSH_TO_TALK:IconListItem = new IconListItem(PUSH_TO_TALK, "Push-To-Talk");
        public static const OPEN_MIC_ACC:IconListItem = new IconListItem(OPEN_MIC_ACC, "Open Microphone");
        public static const OPEN_MIC_NO_ACC:IconListItem = new IconListItem(OPEN_MIC_NO_ACC, "Open Microphone");

        public function IconListItem(param1:IconListItem, param2:String, param3:Boolean = true)
        {
            this._name = param2;
            this._enabled = param3;
            return;
        }// end function

        public function get name() : String
        {
            return this._name;
        }// end function

        public function get enabled() : Boolean
        {
            return this._enabled;
        }// end function

    }
}
