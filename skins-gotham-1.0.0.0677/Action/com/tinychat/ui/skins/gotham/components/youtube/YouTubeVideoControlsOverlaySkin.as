package com.tinychat.ui.skins.gotham.components.youtube
{
    import com.tinychat.ui.components.popupmenu.*;
    import com.tinychat.ui.components.video.controls.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import spark.components.supportClasses.*;

    public class YouTubeVideoControlsOverlaySkin extends Skin
    {
        private var _3347807menu:UserPopupMenu;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:VideoControlsOverlay;

        public function YouTubeVideoControlsOverlaySkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._YouTubeVideoControlsOverlaySkin_UserPopupMenu1_i()];
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

        private function _YouTubeVideoControlsOverlaySkin_UserPopupMenu1_i() : UserPopupMenu
        {
            var _loc_1:* = new UserPopupMenu();
            _loc_1.percentWidth = 100;
            _loc_1.maxWidth = 120;
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 0;
            _loc_1.id = "menu";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.menu = _loc_1;
            BindingManager.executeBindings(this, "menu", this.menu);
            return _loc_1;
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
