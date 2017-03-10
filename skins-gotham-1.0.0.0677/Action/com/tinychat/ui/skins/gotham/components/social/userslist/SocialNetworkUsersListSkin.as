package com.tinychat.ui.skins.gotham.components.social.userslist
{
    import com.tinychat.ui.components.popupmenu.*;
    import com.tinychat.ui.components.social.userlist.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;

    public class SocialNetworkUsersListSkin extends Skin implements IStateClient2
    {
        private var _385593099dataGroup:DataGroup;
        private var _1347620000userPopupMenu:UserPopupMenu;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:UsersListBase;

        public function SocialNetworkUsersListSkin()
        {
            mx_internal::_document = this;
            this.minWidth = 112;
            this.mxmlContent = [this._SocialNetworkUsersListSkin_Scroller1_c(), this._SocialNetworkUsersListSkin_UserPopupMenu1_i()];
            this.currentState = "normal";
            states = [new State({name:"normal", overrides:[]}), new State({name:"disabled", overrides:[]})];
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

        private function _SocialNetworkUsersListSkin_Scroller1_c() : Scroller
        {
            var _loc_1:* = new Scroller();
            _loc_1.left = 0;
            _loc_1.top = 0;
            _loc_1.right = 0;
            _loc_1.bottom = 0;
            _loc_1.minViewportInset = 1;
            _loc_1.hasFocusableChildren = false;
            _loc_1.viewport = this._SocialNetworkUsersListSkin_DataGroup1_i();
            _loc_1.setStyle("horizontalScrollPolicy", "off");
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _SocialNetworkUsersListSkin_DataGroup1_i() : DataGroup
        {
            var _loc_1:* = new DataGroup();
            _loc_1.itemRenderer = this._SocialNetworkUsersListSkin_ClassFactory1_c();
            _loc_1.layout = this._SocialNetworkUsersListSkin_VerticalLayout1_c();
            _loc_1.id = "dataGroup";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.dataGroup = _loc_1;
            BindingManager.executeBindings(this, "dataGroup", this.dataGroup);
            return _loc_1;
        }// end function

        private function _SocialNetworkUsersListSkin_ClassFactory1_c() : ClassFactory
        {
            var _loc_1:* = new ClassFactory();
            _loc_1.generator = SocialNetworkUsersListItemRenderer;
            return _loc_1;
        }// end function

        private function _SocialNetworkUsersListSkin_VerticalLayout1_c() : VerticalLayout
        {
            var _loc_1:* = new VerticalLayout();
            _loc_1.useVirtualLayout = true;
            _loc_1.gap = 0;
            _loc_1.horizontalAlign = "justify";
            _loc_1.requestedMinRowCount = 5;
            return _loc_1;
        }// end function

        private function _SocialNetworkUsersListSkin_UserPopupMenu1_i() : UserPopupMenu
        {
            var _loc_1:* = new UserPopupMenu();
            _loc_1.id = "userPopupMenu";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.userPopupMenu = _loc_1;
            BindingManager.executeBindings(this, "userPopupMenu", this.userPopupMenu);
            return _loc_1;
        }// end function

        public function get dataGroup() : DataGroup
        {
            return this._385593099dataGroup;
        }// end function

        public function set dataGroup(param1:DataGroup) : void
        {
            var _loc_2:* = this._385593099dataGroup;
            if (_loc_2 !== param1)
            {
                this._385593099dataGroup = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dataGroup", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get userPopupMenu() : UserPopupMenu
        {
            return this._1347620000userPopupMenu;
        }// end function

        public function set userPopupMenu(param1:UserPopupMenu) : void
        {
            var _loc_2:* = this._1347620000userPopupMenu;
            if (_loc_2 !== param1)
            {
                this._1347620000userPopupMenu = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userPopupMenu", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : UsersListBase
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:UsersListBase) : void
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
