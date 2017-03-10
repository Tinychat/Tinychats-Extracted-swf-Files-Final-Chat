package com.tinychat.ui.skins.gotham.components.invite
{
    import com.tinychat.ui.components.controlbar.buttons.*;
    import com.tinychat.ui.components.invite.*;
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.components.url.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.primitives.*;

    public class NewRoomCreatedScreenSkin extends Skin
    {
        private var _951117504confirm:Button;
        private var _773729594roomUrlField:UrlDisplay;
        private var _1837623873roomUrlHeader:Label;
        private var _1973218689startBroadcast:BroadcastButton;
        private var _265040821startBroadcastLabel:Label;
        private var _1893287094titleDisplay:TitleDisplay;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:NewRoomCreatedScreen;

        public function NewRoomCreatedScreenSkin()
        {
            mx_internal::_document = this;
            this.width = 500;
            this.mxmlContent = [this._NewRoomCreatedScreenSkin_TitleDisplay1_i(), this._NewRoomCreatedScreenSkin_VGroup1_c()];
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

        private function _NewRoomCreatedScreenSkin_TitleDisplay1_i() : TitleDisplay
        {
            var _loc_1:* = new TitleDisplay();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.height = 50;
            _loc_1.id = "titleDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.titleDisplay = _loc_1;
            BindingManager.executeBindings(this, "titleDisplay", this.titleDisplay);
            return _loc_1;
        }// end function

        private function _NewRoomCreatedScreenSkin_VGroup1_c() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.left = 15;
            _loc_1.right = 15;
            _loc_1.top = 65;
            _loc_1.bottom = 15;
            _loc_1.gap = 15;
            _loc_1.horizontalAlign = "center";
            _loc_1.mxmlContent = [this._NewRoomCreatedScreenSkin_Label1_i(), this._NewRoomCreatedScreenSkin_UrlDisplay1_i(), this._NewRoomCreatedScreenSkin_Group1_c(), this._NewRoomCreatedScreenSkin_Button1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _NewRoomCreatedScreenSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.id = "roomUrlHeader";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.roomUrlHeader = _loc_1;
            BindingManager.executeBindings(this, "roomUrlHeader", this.roomUrlHeader);
            return _loc_1;
        }// end function

        private function _NewRoomCreatedScreenSkin_UrlDisplay1_i() : UrlDisplay
        {
            var _loc_1:* = new UrlDisplay();
            _loc_1.percentWidth = 90;
            _loc_1.height = 40;
            _loc_1.setStyle("skinClass", InviteUrlDisplaySkin);
            _loc_1.id = "roomUrlField";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.roomUrlField = _loc_1;
            BindingManager.executeBindings(this, "roomUrlField", this.roomUrlField);
            return _loc_1;
        }// end function

        private function _NewRoomCreatedScreenSkin_Group1_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.percentWidth = 100;
            _loc_1.mxmlContent = [this._NewRoomCreatedScreenSkin_Rect1_c(), this._NewRoomCreatedScreenSkin_HGroup1_c()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _NewRoomCreatedScreenSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.stroke = this._NewRoomCreatedScreenSkin_SolidColorStroke1_c();
            _loc_1.fill = this._NewRoomCreatedScreenSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _NewRoomCreatedScreenSkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 13553358;
            _loc_1.weight = 1;
            return _loc_1;
        }// end function

        private function _NewRoomCreatedScreenSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 16777195;
            return _loc_1;
        }// end function

        private function _NewRoomCreatedScreenSkin_HGroup1_c() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.left = 10;
            _loc_1.right = 10;
            _loc_1.top = 10;
            _loc_1.bottom = 10;
            _loc_1.gap = 5;
            _loc_1.horizontalAlign = "center";
            _loc_1.verticalAlign = "middle";
            _loc_1.mxmlContent = [this._NewRoomCreatedScreenSkin_Label2_i(), this._NewRoomCreatedScreenSkin_BroadcastButton1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _NewRoomCreatedScreenSkin_Label2_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.id = "startBroadcastLabel";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.startBroadcastLabel = _loc_1;
            BindingManager.executeBindings(this, "startBroadcastLabel", this.startBroadcastLabel);
            return _loc_1;
        }// end function

        private function _NewRoomCreatedScreenSkin_BroadcastButton1_i() : BroadcastButton
        {
            var _loc_1:* = new BroadcastButton();
            _loc_1.width = 145;
            _loc_1.height = 33;
            _loc_1.styleName = "broadcastButton";
            _loc_1.id = "startBroadcast";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.startBroadcast = _loc_1;
            BindingManager.executeBindings(this, "startBroadcast", this.startBroadcast);
            return _loc_1;
        }// end function

        private function _NewRoomCreatedScreenSkin_Button1_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.id = "confirm";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.confirm = _loc_1;
            BindingManager.executeBindings(this, "confirm", this.confirm);
            return _loc_1;
        }// end function

        public function get confirm() : Button
        {
            return this._951117504confirm;
        }// end function

        public function set confirm(param1:Button) : void
        {
            var _loc_2:* = this._951117504confirm;
            if (_loc_2 !== param1)
            {
                this._951117504confirm = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confirm", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get roomUrlField() : UrlDisplay
        {
            return this._773729594roomUrlField;
        }// end function

        public function set roomUrlField(param1:UrlDisplay) : void
        {
            var _loc_2:* = this._773729594roomUrlField;
            if (_loc_2 !== param1)
            {
                this._773729594roomUrlField = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "roomUrlField", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get roomUrlHeader() : Label
        {
            return this._1837623873roomUrlHeader;
        }// end function

        public function set roomUrlHeader(param1:Label) : void
        {
            var _loc_2:* = this._1837623873roomUrlHeader;
            if (_loc_2 !== param1)
            {
                this._1837623873roomUrlHeader = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "roomUrlHeader", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get startBroadcast() : BroadcastButton
        {
            return this._1973218689startBroadcast;
        }// end function

        public function set startBroadcast(param1:BroadcastButton) : void
        {
            var _loc_2:* = this._1973218689startBroadcast;
            if (_loc_2 !== param1)
            {
                this._1973218689startBroadcast = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "startBroadcast", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get startBroadcastLabel() : Label
        {
            return this._265040821startBroadcastLabel;
        }// end function

        public function set startBroadcastLabel(param1:Label) : void
        {
            var _loc_2:* = this._265040821startBroadcastLabel;
            if (_loc_2 !== param1)
            {
                this._265040821startBroadcastLabel = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "startBroadcastLabel", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get titleDisplay() : TitleDisplay
        {
            return this._1893287094titleDisplay;
        }// end function

        public function set titleDisplay(param1:TitleDisplay) : void
        {
            var _loc_2:* = this._1893287094titleDisplay;
            if (_loc_2 !== param1)
            {
                this._1893287094titleDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : NewRoomCreatedScreen
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:NewRoomCreatedScreen) : void
        {
            var _loc_2:* = this._213507019hostComponent;
            if (_loc_2 !== param1)
            {
                this._213507019hostComponent = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hostComponent", _loc_2, param1));
                }
            }
            return;
        }// end function

    }
}
