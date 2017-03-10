package com.tinychat.model.securitypanel
{
    import flash.system.*;

    public class SecurityPanelNames extends Object
    {
        private var value:String;
        public static const CAMERA:SecurityPanelNames = new SecurityPanelNames(CAMERA, SecurityPanel.CAMERA);
        public static const DEVICE_ACCESS:SecurityPanelNames = new SecurityPanelNames(DEVICE_ACCESS, "deviceAccessPanel");
        public static const DISPLAY:SecurityPanelNames = new SecurityPanelNames(DISPLAY, SecurityPanel.DISPLAY);
        public static const LOCAL_STORAGE:SecurityPanelNames = new SecurityPanelNames(LOCAL_STORAGE, SecurityPanel.LOCAL_STORAGE);
        public static const MICROPHONE:SecurityPanelNames = new SecurityPanelNames(MICROPHONE, SecurityPanel.MICROPHONE);
        public static const PRIVACY:SecurityPanelNames = new SecurityPanelNames(PRIVACY, SecurityPanel.PRIVACY);

        public function SecurityPanelNames(param1:SecurityPanelNames, param2:String)
        {
            this.value = param2;
            return;
        }// end function

        public function toString() : String
        {
            return this.value;
        }// end function

    }
}
