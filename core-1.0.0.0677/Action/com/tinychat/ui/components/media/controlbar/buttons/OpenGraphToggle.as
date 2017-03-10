package com.tinychat.ui.components.controlbar.buttons
{
    import com.adobe.popup.*;
    import com.tinychat.model.settings.*;
    import com.tinychat.model.youtube.*;
    import com.tinychat.ui.components.popup.*;
    import com.tinychat.ui.components.settings.*;
    import flash.events.*;
    import mx.events.*;
    import spark.components.supportClasses.*;

    public class OpenGraphToggle extends SkinnableComponent
    {
        public var checkbox:ApplicationSettingItemRendererBase;
        public var popupFactory:PopUpFactory;
        private var _setting:ApplicationSetting;
        private var settingChanged:Boolean;
        private var popup:Popup;
        private static var _skinParts:Object = {checkbox:true, popupFactory:true};

        public function OpenGraphToggle()
        {
            addEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
            addEventListener(Event.REMOVED_FROM_STAGE, this.removedFromStageHandler);
            addEventListener(FlexEvent.SHOW, this.addedToStageHandler);
            addEventListener(FlexEvent.HIDE, this.removedFromStageHandler);
            return;
        }// end function

        public function set setting(param1:ApplicationSetting) : void
        {
            if (this._setting != param1)
            {
                this._setting = param1;
                this.settingChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function showToolTip(param1:YouTubeBroadcast) : void
        {
            this.popup.open(new OpenGraphPostedScreen(param1));
            return;
        }// end function

        public function closeToolTip() : void
        {
            this.popup.close();
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.settingChanged)
            {
            }
            if (this.checkbox)
            {
                this.checkbox.data = this._setting;
                this.checkbox.autoSave = true;
                this.settingChanged = false;
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.popupFactory)
            {
                this.popup = new Popup(this.popupFactory);
            }
            else if (param2 == this.checkbox)
            {
                this.checkbox.addEventListener(MouseEvent.CLICK, this.checkboxClickHandler);
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == this.popupFactory)
            {
                this.popup = null;
            }
            else if (param2 == this.checkbox)
            {
                this.checkbox.removeEventListener(MouseEvent.CLICK, this.checkboxClickHandler);
            }
            return;
        }// end function

        private function checkboxClickHandler(event:MouseEvent) : void
        {
            if (!this.popup.isOpen)
            {
                this.popup.open(OpenGraphToggleInfoScreen);
            }
            return;
        }// end function

        private function addedToStageHandler(event:Event) : void
        {
            this.togglePopupVisibility(true);
            return;
        }// end function

        private function removedFromStageHandler(event:Event) : void
        {
            this.togglePopupVisibility(false);
            return;
        }// end function

        private function togglePopupVisibility(param1:Boolean) : void
        {
            if (this.popup)
            {
            }
            if (this.popup.popup)
            {
                this.popup.popup.visible = param1;
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
