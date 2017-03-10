package com.tinychat.ui.skins.gotham.components.social.userslist.greenroom
{
    import com.tinychat.ui.components.social.userlist.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;

    public class GreenRoomUsersListSkin extends Skin implements IStateClient2
    {
        private var _385593099dataGroup:DataGroup;
        private var _402164678scroller:Scroller;
        private var _1167261832tileLayout:TileLayout;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:UsersListBase;

        public function GreenRoomUsersListSkin()
        {
            mx_internal::_document = this;
            this.minWidth = 112;
            this.mxmlContent = [this._GreenRoomUsersListSkin_Scroller1_i()];
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

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            super.updateDisplayList(param1, param2);
            this.tileLayout.columnWidth = this.dataGroup.width / 2 - 10;
            this.tileLayout.rowHeight = this.tileLayout.columnWidth;
            return;
        }// end function

        private function _GreenRoomUsersListSkin_Scroller1_i() : Scroller
        {
            var _loc_1:* = new Scroller();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.minViewportInset = 5;
            _loc_1.hasFocusableChildren = false;
            _loc_1.viewport = this._GreenRoomUsersListSkin_DataGroup1_i();
            _loc_1.setStyle("horizontalScrollPolicy", "off");
            _loc_1.id = "scroller";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.scroller = _loc_1;
            BindingManager.executeBindings(this, "scroller", this.scroller);
            return _loc_1;
        }// end function

        private function _GreenRoomUsersListSkin_DataGroup1_i() : DataGroup
        {
            var _loc_1:* = new DataGroup();
            _loc_1.layout = this._GreenRoomUsersListSkin_TileLayout1_i();
            _loc_1.id = "dataGroup";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.dataGroup = _loc_1;
            BindingManager.executeBindings(this, "dataGroup", this.dataGroup);
            return _loc_1;
        }// end function

        private function _GreenRoomUsersListSkin_TileLayout1_i() : TileLayout
        {
            var _loc_1:* = new TileLayout();
            _loc_1.useVirtualLayout = true;
            _loc_1.horizontalGap = 10;
            _loc_1.requestedColumnCount = 2;
            _loc_1.columnWidth = 50;
            _loc_1.rowHeight = 50;
            _loc_1.orientation = "rows";
            _loc_1.columnAlign = "justifyUsingGap";
            this.tileLayout = _loc_1;
            BindingManager.executeBindings(this, "tileLayout", this.tileLayout);
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

        public function get scroller() : Scroller
        {
            return this._402164678scroller;
        }// end function

        public function set scroller(param1:Scroller) : void
        {
            var _loc_2:* = this._402164678scroller;
            if (_loc_2 !== param1)
            {
                this._402164678scroller = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scroller", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get tileLayout() : TileLayout
        {
            return this._1167261832tileLayout;
        }// end function

        public function set tileLayout(param1:TileLayout) : void
        {
            var _loc_2:* = this._1167261832tileLayout;
            if (_loc_2 !== param1)
            {
                this._1167261832tileLayout = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tileLayout", _loc_2, param1));
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
