package com.tinychat.ui.skins.gotham.components.moderator
{
    import com.tinychat.ui.components.moderator.*;
    import com.tinychat.ui.components.spark.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;
    import spark.primitives.*;

    public class AutoBanWordListScreenSkin extends Skin
    {
        private var _96417add:Button;
        private var _951117504confirm:Button;
        private var _100358090input:TextInput;
        private var _3322014list:RemoveableItemList;
        private var _1893287094titleDisplay:TitleDisplay;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:AutoBanWordListScreen;

        public function AutoBanWordListScreenSkin()
        {
            mx_internal::_document = this;
            this.width = 300;
            this.height = 400;
            this.mxmlContent = [this._AutoBanWordListScreenSkin_TitleDisplay1_i(), this._AutoBanWordListScreenSkin_Group1_c(), this._AutoBanWordListScreenSkin_HGroup1_c(), this._AutoBanWordListScreenSkin_Button2_i()];
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

        private function _AutoBanWordListScreenSkin_TitleDisplay1_i() : TitleDisplay
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

        private function _AutoBanWordListScreenSkin_Group1_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 65;
            _loc_1.bottom = 115;
            _loc_1.mxmlContent = [this._AutoBanWordListScreenSkin_Rect1_c(), this._AutoBanWordListScreenSkin_Scroller1_c()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _AutoBanWordListScreenSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 5;
            _loc_1.right = 5;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.stroke = this._AutoBanWordListScreenSkin_SolidColorStroke1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _AutoBanWordListScreenSkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 11712182;
            _loc_1.weight = 1;
            return _loc_1;
        }// end function

        private function _AutoBanWordListScreenSkin_Scroller1_c() : Scroller
        {
            var _loc_1:* = new Scroller();
            _loc_1.left = 6;
            _loc_1.right = 6;
            _loc_1.top = 1;
            _loc_1.bottom = 1;
            _loc_1.viewport = this._AutoBanWordListScreenSkin_RemoveableItemList1_i();
            _loc_1.setStyle("horizontalScrollPolicy", "off");
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _AutoBanWordListScreenSkin_RemoveableItemList1_i() : RemoveableItemList
        {
            var _loc_1:* = new RemoveableItemList();
            _loc_1.clipAndEnableScrolling = true;
            _loc_1.itemRenderer = this._AutoBanWordListScreenSkin_ClassFactory1_c();
            _loc_1.layout = this._AutoBanWordListScreenSkin_VerticalLayout1_c();
            _loc_1.id = "list";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.list = _loc_1;
            BindingManager.executeBindings(this, "list", this.list);
            return _loc_1;
        }// end function

        private function _AutoBanWordListScreenSkin_ClassFactory1_c() : ClassFactory
        {
            var _loc_1:* = new ClassFactory();
            _loc_1.generator = RemoveableItemListItemRenderer;
            return _loc_1;
        }// end function

        private function _AutoBanWordListScreenSkin_VerticalLayout1_c() : VerticalLayout
        {
            var _loc_1:* = new VerticalLayout();
            _loc_1.useVirtualLayout = true;
            _loc_1.gap = 8;
            _loc_1.horizontalAlign = "justify";
            return _loc_1;
        }// end function

        private function _AutoBanWordListScreenSkin_HGroup1_c() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.left = 6;
            _loc_1.right = 6;
            _loc_1.bottom = 65;
            _loc_1.gap = 20;
            _loc_1.verticalAlign = "justify";
            _loc_1.mxmlContent = [this._AutoBanWordListScreenSkin_TextInput1_i(), this._AutoBanWordListScreenSkin_Button1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _AutoBanWordListScreenSkin_TextInput1_i() : TextInput
        {
            var _loc_1:* = new TextInput();
            _loc_1.percentWidth = 100;
            _loc_1.id = "input";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.input = _loc_1;
            BindingManager.executeBindings(this, "input", this.input);
            return _loc_1;
        }// end function

        private function _AutoBanWordListScreenSkin_Button1_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.width = 60;
            _loc_1.id = "add";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.add = _loc_1;
            BindingManager.executeBindings(this, "add", this.add);
            return _loc_1;
        }// end function

        private function _AutoBanWordListScreenSkin_Button2_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.width = 120;
            _loc_1.horizontalCenter = 0;
            _loc_1.bottom = 15;
            _loc_1.id = "confirm";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.confirm = _loc_1;
            BindingManager.executeBindings(this, "confirm", this.confirm);
            return _loc_1;
        }// end function

        public function get add() : Button
        {
            return this._96417add;
        }// end function

        public function set add(param1:Button) : void
        {
            var _loc_2:* = this._96417add;
            if (_loc_2 !== param1)
            {
                this._96417add = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "add", _loc_2, param1));
                }
            }
            return;
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

        public function get input() : TextInput
        {
            return this._100358090input;
        }// end function

        public function set input(param1:TextInput) : void
        {
            var _loc_2:* = this._100358090input;
            if (_loc_2 !== param1)
            {
                this._100358090input = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "input", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get list() : RemoveableItemList
        {
            return this._3322014list;
        }// end function

        public function set list(param1:RemoveableItemList) : void
        {
            var _loc_2:* = this._3322014list;
            if (_loc_2 !== param1)
            {
                this._3322014list = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "list", _loc_2, param1));
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

        public function get hostComponent() : AutoBanWordListScreen
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:AutoBanWordListScreen) : void
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
