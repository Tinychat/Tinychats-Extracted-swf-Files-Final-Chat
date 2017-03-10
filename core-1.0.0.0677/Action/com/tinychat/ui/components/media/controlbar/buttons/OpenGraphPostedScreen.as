package com.tinychat.ui.components.controlbar.buttons
{
    import com.tinychat.model.settings.*;
    import com.tinychat.model.youtube.*;
    import com.tinychat.ui.components.settings.*;
    import flash.events.*;
    import org.osflash.signals.*;
    import spark.components.*;
    import spark.components.supportClasses.*;

    public class OpenGraphPostedScreen extends SkinnableComponent
    {
        public var broadcastDisplay:Label;
        public var infoDisplay:Label;
        public var remindMe:ApplicationSettingItemRendererBase;
        public var remove:Button;
        private var _infoText:String;
        private var _remindMeSetting:ApplicationSetting;
        private var infoTextChanged:Boolean;
        private var remindMeSettingChanged:Boolean;
        private var broadcast:YouTubeBroadcast;
        private var _removed:Signal;
        private static var _skinParts:Object = {broadcastDisplay:false, remindMe:false, infoDisplay:false, remove:false};

        public function OpenGraphPostedScreen(param1:YouTubeBroadcast = null)
        {
            this.broadcast = param1;
            this._removed = new Signal(YouTubeBroadcast);
            return;
        }// end function

        public function get removed() : ISignal
        {
            return this._removed;
        }// end function

        public function get remindMeSetting() : ApplicationSetting
        {
            return this._remindMeSetting;
        }// end function

        public function set remindMeSetting(param1:ApplicationSetting) : void
        {
            if (this._remindMeSetting != param1)
            {
                this._remindMeSetting = param1;
                this.remindMeSettingChanged = true;
                invalidateProperties();
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

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.infoTextChanged)
            {
            }
            if (this.infoDisplay)
            {
                this.infoDisplay.text = this._infoText;
                this.infoTextChanged = false;
            }
            if (this.remindMeSettingChanged)
            {
            }
            if (this.remindMe)
            {
                this.remindMe.data = this._remindMeSetting;
                this.remindMe.autoSave = true;
                this.remindMeSettingChanged = false;
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.broadcastDisplay)
            {
                this.broadcastDisplay.text = this.broadcast.clip.title;
            }
            else if (param2 == this.remove)
            {
                this.remove.addEventListener(MouseEvent.CLICK, this.removeClickHandler);
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == this.remove)
            {
                this.remove.removeEventListener(MouseEvent.CLICK, this.removeClickHandler);
            }
            return;
        }// end function

        private function removeClickHandler(event:MouseEvent) : void
        {
            var _loc_2:Boolean = false;
            this.broadcastDisplay.enabled = false;
            this.remove.enabled = _loc_2;
            this.broadcastDisplay.setStyle("lineThrough", true);
            this._removed.dispatch(this.broadcast);
            dispatchEvent(new Event(Event.CLOSE, true));
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
