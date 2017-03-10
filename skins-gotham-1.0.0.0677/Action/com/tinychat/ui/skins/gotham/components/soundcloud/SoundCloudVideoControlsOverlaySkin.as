package com.tinychat.ui.skins.gotham.components.soundcloud
{
    import com.tinychat.ui.components.popupmenu.*;
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.components.video.controls.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import spark.components.*;
    import spark.components.supportClasses.*;

    public class SoundCloudVideoControlsOverlaySkin extends Skin
    {
        private var _410956671container:VGroup;
        private var _3347807menu:UserPopupMenu;
        private var _1844466615nameDisplay:NameDisplay;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:VideoControlsOverlay;

        public function SoundCloudVideoControlsOverlaySkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._SoundCloudVideoControlsOverlaySkin_VGroup1_i()];
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

        override protected function measure() : void
        {
            super.measure();
            measuredMinWidth = 0;
            return;
        }// end function

        private function _SoundCloudVideoControlsOverlaySkin_VGroup1_i() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.percentWidth = 100;
            _loc_1.verticalCenter = 0;
            _loc_1.gap = 5;
            _loc_1.paddingLeft = 5;
            _loc_1.paddingRight = 5;
            _loc_1.horizontalAlign = "center";
            _loc_1.verticalAlign = "middle";
            _loc_1.mxmlContent = [this._SoundCloudVideoControlsOverlaySkin_NameDisplay1_i(), this._SoundCloudVideoControlsOverlaySkin_UserPopupMenu1_i()];
            _loc_1.id = "container";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.container = _loc_1;
            BindingManager.executeBindings(this, "container", this.container);
            return _loc_1;
        }// end function

        private function _SoundCloudVideoControlsOverlaySkin_NameDisplay1_i() : NameDisplay
        {
            var _loc_1:* = new NameDisplay();
            _loc_1.percentWidth = 100;
            _loc_1.maxDisplayedLines = 1;
            _loc_1.mouseEnabled = false;
            _loc_1.mouseChildren = false;
            _loc_1.setStyle("textAlign", "center");
            _loc_1.id = "nameDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.nameDisplay = _loc_1;
            BindingManager.executeBindings(this, "nameDisplay", this.nameDisplay);
            return _loc_1;
        }// end function

        private function _SoundCloudVideoControlsOverlaySkin_UserPopupMenu1_i() : UserPopupMenu
        {
            var _loc_1:* = new UserPopupMenu();
            _loc_1.percentWidth = 100;
            _loc_1.maxWidth = 120;
            _loc_1.id = "menu";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.menu = _loc_1;
            BindingManager.executeBindings(this, "menu", this.menu);
            return _loc_1;
        }// end function

        public function get container() : VGroup
        {
            return this._410956671container;
        }// end function

        public function set container(param1:VGroup) : void
        {
            var _loc_2:* = this._410956671container;
            if (_loc_2 !== param1)
            {
                this._410956671container = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "container", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get menu() : UserPopupMenu
        {
            return this._3347807menu;
        }// end function

        public function set menu(param1:UserPopupMenu) : void
        {
            var _loc_2:* = this._3347807menu;
            if (_loc_2 !== param1)
            {
                this._3347807menu = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "menu", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get nameDisplay() : NameDisplay
        {
            return this._1844466615nameDisplay;
        }// end function

        public function set nameDisplay(param1:NameDisplay) : void
        {
            var _loc_2:* = this._1844466615nameDisplay;
            if (_loc_2 !== param1)
            {
                this._1844466615nameDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : VideoControlsOverlay
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:VideoControlsOverlay) : void
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
