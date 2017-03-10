package com.tinychat.ui.skins.gotham.components.controlbar.buttons
{
    import com.tinychat.ui.skins.gotham.components.settings.*;
    import com.tinychat.ui.skins.gotham.components.social.chat.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import spark.components.*;
    import spark.components.supportClasses.*;

    public class OpenGraphPostedScreenSkin extends Skin
    {
        private var _1168743617broadcastDisplay:Label;
        private var _299873228infoDisplay:Label;
        private var _518603395remindMe:BooleanApplicationSettingItemRenderer;
        private var _934610812remove:Button;
        private var _818098231vgroup:VGroup;
        private var __moduleFactoryInitialized:Boolean = false;

        public function OpenGraphPostedScreenSkin()
        {
            mx_internal::_document = this;
            this.width = 300;
            this.mxmlContent = [this._OpenGraphPostedScreenSkin_VGroup1_i()];
            return;
        }// end function

        override public function set moduleFactory(param1:IFlexModuleFactory) : void
        {
            super.moduleFactory = param1;
            if (this.__moduleFactoryInitialized)
            {
                return;
            }
            this.__moduleFactoryInitialized = true;
            return;
        }// end function

        override public function initialize() : void
        {
            super.initialize();
            return;
        }// end function

        private function _OpenGraphPostedScreenSkin_VGroup1_i() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.horizontalAlign = "justify";
            _loc_1.mxmlContent = [this._OpenGraphPostedScreenSkin_Label1_i(), this._OpenGraphPostedScreenSkin_HGroup1_c(), this._OpenGraphPostedScreenSkin_BooleanApplicationSettingItemRenderer1_i()];
            _loc_1.id = "vgroup";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.vgroup = _loc_1;
            BindingManager.executeBindings(this, "vgroup", this.vgroup);
            return _loc_1;
        }// end function

        private function _OpenGraphPostedScreenSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.maxDisplayedLines = -1;
            _loc_1.percentWidth = 100;
            _loc_1.id = "infoDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.infoDisplay = _loc_1;
            BindingManager.executeBindings(this, "infoDisplay", this.infoDisplay);
            return _loc_1;
        }// end function

        private function _OpenGraphPostedScreenSkin_HGroup1_c() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.gap = 6;
            _loc_1.verticalAlign = "middle";
            _loc_1.mxmlContent = [this._OpenGraphPostedScreenSkin_Label2_i(), this._OpenGraphPostedScreenSkin_Button1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _OpenGraphPostedScreenSkin_Label2_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.maxDisplayedLines = 1;
            _loc_1.percentWidth = 100;
            _loc_1.setStyle("color", 2540016);
            _loc_1.setStyle("verticalAlign", "middle");
            _loc_1.id = "broadcastDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.broadcastDisplay = _loc_1;
            BindingManager.executeBindings(this, "broadcastDisplay", this.broadcastDisplay);
            return _loc_1;
        }// end function

        private function _OpenGraphPostedScreenSkin_Button1_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.setStyle("skinClass", PrivateChatCloseButtonSkin);
            _loc_1.id = "remove";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.remove = _loc_1;
            BindingManager.executeBindings(this, "remove", this.remove);
            return _loc_1;
        }// end function

        private function _OpenGraphPostedScreenSkin_BooleanApplicationSettingItemRenderer1_i() : BooleanApplicationSettingItemRenderer
        {
            var _loc_1:* = new BooleanApplicationSettingItemRenderer();
            _loc_1.setStyle("fontSize", 10);
            _loc_1.id = "remindMe";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.remindMe = _loc_1;
            BindingManager.executeBindings(this, "remindMe", this.remindMe);
            return _loc_1;
        }// end function

        public function get broadcastDisplay() : Label
        {
            return this._1168743617broadcastDisplay;
        }// end function

        public function set broadcastDisplay(param1:Label) : void
        {
            var _loc_2:* = this._1168743617broadcastDisplay;
            if (_loc_2 !== param1)
            {
                this._1168743617broadcastDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "broadcastDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get infoDisplay() : Label
        {
            return this._299873228infoDisplay;
        }// end function

        public function set infoDisplay(param1:Label) : void
        {
            var _loc_2:* = this._299873228infoDisplay;
            if (_loc_2 !== param1)
            {
                this._299873228infoDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get remindMe() : BooleanApplicationSettingItemRenderer
        {
            return this._518603395remindMe;
        }// end function

        public function set remindMe(param1:BooleanApplicationSettingItemRenderer) : void
        {
            var _loc_2:* = this._518603395remindMe;
            if (_loc_2 !== param1)
            {
                this._518603395remindMe = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "remindMe", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get remove() : Button
        {
            return this._934610812remove;
        }// end function

        public function set remove(param1:Button) : void
        {
            var _loc_2:* = this._934610812remove;
            if (_loc_2 !== param1)
            {
                this._934610812remove = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "remove", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get vgroup() : VGroup
        {
            return this._818098231vgroup;
        }// end function

        public function set vgroup(param1:VGroup) : void
        {
            var _loc_2:* = this._818098231vgroup;
            if (_loc_2 !== param1)
            {
                this._818098231vgroup = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "vgroup", _loc_2, param1));
                }
            }
            return;
        }// end function

    }
}
