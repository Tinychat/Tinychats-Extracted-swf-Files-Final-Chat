package com.tinychat.ui.components.controlbar.buttons
{
    import com.tinychat.model.settings.*;
    import flash.events.*;
    import mx.utils.*;
    import org.osflash.signals.*;
    import spark.components.*;
    import spark.components.supportClasses.*;

    public class OpenGraphToggleInfoScreen extends SkinnableComponent
    {
        public var infoDisplay:Label;
        public var activityDisplay:Label;
        private var _activityText:String;
        private var _infoText:String;
        private var _setting:OpenGraphShareApplicationSetting;
        private var infoTextChanged:Boolean;
        private var activityTextChanged:Boolean;
        private var settingChanged:Boolean;
        private var _activityClick:Signal;
        private static var _skinParts:Object = {infoDisplay:false, activityDisplay:false};

        public function OpenGraphToggleInfoScreen()
        {
            this._activityClick = new Signal();
            return;
        }// end function

        public function get activityClick() : ISignal
        {
            return this._activityClick;
        }// end function

        public function get setting() : OpenGraphShareApplicationSetting
        {
            return this._setting;
        }// end function

        public function set setting(param1:OpenGraphShareApplicationSetting) : void
        {
            if (this._setting != param1)
            {
                if (this._setting)
                {
                    this._setting.changed.remove(this.settingChangedHandler);
                }
                this._setting = param1;
                if (this._setting)
                {
                    this._setting.changed.add(this.settingChangedHandler);
                }
            }
            return;
        }// end function

        public function set infoText(param1:String) : void
        {
            if (this._infoText != param1)
            {
                this._infoText = param1;
                this.infoTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set activityText(param1:String) : void
        {
            if (this._activityText != param1)
            {
                this._activityText = param1;
                this.activityTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (!this.infoTextChanged)
            {
            }
            if (this.settingChanged)
            {
            }
            if (this.infoDisplay)
            {
                this.infoDisplay.text = StringUtil.substitute(this._infoText, this._setting.value ? ("ON") : ("OFF"));
                this.infoTextChanged = false;
                this.settingChanged = false;
            }
            if (this.activityTextChanged)
            {
            }
            if (this.activityDisplay)
            {
                this.activityDisplay.text = this._activityText;
                this.activityTextChanged = false;
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.activityDisplay)
            {
                this.activityDisplay.addEventListener(MouseEvent.CLICK, this.clickHandler);
                this.activityDisplay.useHandCursor = true;
                this.activityDisplay.buttonMode = true;
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == this.activityDisplay)
            {
                this.activityDisplay.removeEventListener(MouseEvent.CLICK, this.clickHandler);
            }
            return;
        }// end function

        private function settingChangedHandler(param1:Boolean) : void
        {
            this.settingChanged = true;
            invalidateProperties();
            return;
        }// end function

        private function clickHandler(event:MouseEvent) : void
        {
            this._activityClick.dispatch();
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
