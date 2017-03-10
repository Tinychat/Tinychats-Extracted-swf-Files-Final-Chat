package com.tinychat.ui.skins.gotham.components.moderator
{
    import com.tinychat.ui.components.moderator.*;
    import com.tinychat.ui.components.spark.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;
    import spark.primitives.*;

    public class BanListScreenSkin extends Skin implements IStateClient2
    {
        public var _BanListScreenSkin_Group1:Group;
        private var _1367724422cancel:Button;
        private var _951117504confirm:Button;
        private var _1577094473emptyListDisplay:Label;
        private var _3322014list:MultipleSelectionList;
        private var _1893287094titleDisplay:TitleDisplay;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:BanListScreen;

        public function BanListScreenSkin()
        {
            mx_internal::_document = this;
            this.width = 300;
            this.maxHeight = 400;
            this.mxmlContent = [this._BanListScreenSkin_TitleDisplay1_i(), this._BanListScreenSkin_Group2_c()];
            this.currentState = "normal";
            this.addEventListener("creationComplete", this.___BanListScreenSkin_Skin1_creationComplete);
            var _loc_1:* = new DeferredInstanceFromFunction(this._BanListScreenSkin_Group1_i);
            var _loc_2:* = new DeferredInstanceFromFunction(this._BanListScreenSkin_Label1_i);
            states = [new State({name:"normal", overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["titleDisplay"]})]}), new State({name:"empty", overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_2, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["titleDisplay"]})]})];
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

        override protected function stateChanged(param1:String, param2:String, param3:Boolean) : void
        {
            if (param1 == "empty")
            {
            }
            if (param2 == "normal")
            {
                this.list.selectionChange.add(this.selectionChangeHandler);
            }
            return;
        }// end function

        private function selectionChangeHandler(param1:Object) : void
        {
            if (this.list.selectedItems.length > 0)
            {
                this.toggleVisibility(this.confirm, true);
                this.toggleVisibility(this.cancel, false);
            }
            else
            {
                this.toggleVisibility(this.confirm, false);
                this.toggleVisibility(this.cancel, true);
            }
            return;
        }// end function

        private function creationCompleteHandler() : void
        {
            this.toggleVisibility(this.confirm, false);
            return;
        }// end function

        private function toggleVisibility(param1:IVisualElement, param2:Boolean) : void
        {
            param1.visible = param2;
            return;
        }// end function

        private function _BanListScreenSkin_TitleDisplay1_i() : TitleDisplay
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

        private function _BanListScreenSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.left = 15;
            _loc_1.right = 15;
            _loc_1.top = 65;
            _loc_1.bottom = 65;
            _loc_1.setStyle("textAlign", "center");
            _loc_1.id = "emptyListDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.emptyListDisplay = _loc_1;
            BindingManager.executeBindings(this, "emptyListDisplay", this.emptyListDisplay);
            return _loc_1;
        }// end function

        private function _BanListScreenSkin_Group1_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 65;
            _loc_1.bottom = 65;
            _loc_1.mxmlContent = [this._BanListScreenSkin_Rect1_c(), this._BanListScreenSkin_Scroller1_c()];
            _loc_1.id = "_BanListScreenSkin_Group1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._BanListScreenSkin_Group1 = _loc_1;
            BindingManager.executeBindings(this, "_BanListScreenSkin_Group1", this._BanListScreenSkin_Group1);
            return _loc_1;
        }// end function

        private function _BanListScreenSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 5;
            _loc_1.right = 5;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.stroke = this._BanListScreenSkin_SolidColorStroke1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _BanListScreenSkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 11712182;
            _loc_1.weight = 1;
            return _loc_1;
        }// end function

        private function _BanListScreenSkin_Scroller1_c() : Scroller
        {
            var _loc_1:* = new Scroller();
            _loc_1.left = 6;
            _loc_1.right = 6;
            _loc_1.top = 1;
            _loc_1.bottom = 1;
            _loc_1.viewport = this._BanListScreenSkin_MultipleSelectionList1_i();
            _loc_1.setStyle("horizontalScrollPolicy", "off");
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _BanListScreenSkin_MultipleSelectionList1_i() : MultipleSelectionList
        {
            var _loc_1:* = new MultipleSelectionList();
            _loc_1.clipAndEnableScrolling = true;
            _loc_1.itemRenderer = this._BanListScreenSkin_ClassFactory1_c();
            _loc_1.layout = this._BanListScreenSkin_VerticalLayout1_c();
            _loc_1.id = "list";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.list = _loc_1;
            BindingManager.executeBindings(this, "list", this.list);
            return _loc_1;
        }// end function

        private function _BanListScreenSkin_ClassFactory1_c() : ClassFactory
        {
            var _loc_1:* = new ClassFactory();
            _loc_1.generator = MultipleSelectionListItemRenderer;
            return _loc_1;
        }// end function

        private function _BanListScreenSkin_VerticalLayout1_c() : VerticalLayout
        {
            var _loc_1:* = new VerticalLayout();
            _loc_1.useVirtualLayout = true;
            _loc_1.gap = 8;
            _loc_1.horizontalAlign = "justify";
            return _loc_1;
        }// end function

        private function _BanListScreenSkin_Group2_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.bottom = 15;
            _loc_1.horizontalCenter = 0;
            _loc_1.mxmlContent = [this._BanListScreenSkin_Button1_i(), this._BanListScreenSkin_Button2_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _BanListScreenSkin_Button1_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.width = 120;
            _loc_1.id = "confirm";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.confirm = _loc_1;
            BindingManager.executeBindings(this, "confirm", this.confirm);
            return _loc_1;
        }// end function

        private function _BanListScreenSkin_Button2_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.width = 120;
            _loc_1.id = "cancel";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.cancel = _loc_1;
            BindingManager.executeBindings(this, "cancel", this.cancel);
            return _loc_1;
        }// end function

        public function ___BanListScreenSkin_Skin1_creationComplete(event:FlexEvent) : void
        {
            this.creationCompleteHandler();
            return;
        }// end function

        public function get cancel() : Button
        {
            return this._1367724422cancel;
        }// end function

        public function set cancel(param1:Button) : void
        {
            var _loc_2:* = this._1367724422cancel;
            if (_loc_2 !== param1)
            {
                this._1367724422cancel = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cancel", _loc_2, param1));
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

        public function get emptyListDisplay() : Label
        {
            return this._1577094473emptyListDisplay;
        }// end function

        public function set emptyListDisplay(param1:Label) : void
        {
            var _loc_2:* = this._1577094473emptyListDisplay;
            if (_loc_2 !== param1)
            {
                this._1577094473emptyListDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "emptyListDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get list() : MultipleSelectionList
        {
            return this._3322014list;
        }// end function

        public function set list(param1:MultipleSelectionList) : void
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

        public function get hostComponent() : BanListScreen
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:BanListScreen) : void
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
