package com.tinychat.ui.skins.gotham.components.youtube
{
    import com.tinychat.ui.skins.gotham.components.media.*;
    import flash.events.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.events.*;
    import spark.primitives.*;

    public class YouTubeSelectionScreenSkinInnerClass1 extends ItemRenderer implements IBindingClient, IStateClient2
    {
        public var _YouTubeSelectionScreenSkinInnerClass1_BitmapImage1:BitmapImage;
        private var _1433605736_YouTubeSelectionScreenSkinInnerClass1_SolidColor1:SolidColor;
        private var _1215755049nameLabel:Label;
        private var _88844982outerDocument:YouTubeSelectionScreenSkin;
        private var _1339123498removeButton:Button;
        private var __moduleFactoryInitialized:Boolean = false;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function YouTubeSelectionScreenSkinInnerClass1()
        {
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            var bindings:* = this._YouTubeSelectionScreenSkinInnerClass1_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_youtube_YouTubeSelectionScreenSkinInnerClass1WatcherSetupUtil");
                var _loc_2:* = watcherSetupUtilClass;
                _loc_2.watcherSetupUtilClass["init"](null);
            }
            _watcherSetupUtil.setup(this, function (param1:String)
            {
                return target[param1];
            }// end function
            , function (param1:String)
            {
                return YouTubeSelectionScreenSkinInnerClass1[param1];
            }// end function
            , bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 220;
            this.showsCaret = false;
            this.autoDrawBackground = false;
            this.buttonMode = true;
            this.mouseChildren = true;
            this.useHandCursor = true;
            this.mxmlContent = [this._YouTubeSelectionScreenSkinInnerClass1_Rect1_c(), this._YouTubeSelectionScreenSkinInnerClass1_BitmapImage1_i(), this._YouTubeSelectionScreenSkinInnerClass1_Label1_i(), this._YouTubeSelectionScreenSkinInnerClass1_Button1_i()];
            this.currentState = "downAndSelected";
            this.addEventListener("click", this.___YouTubeSelectionScreenSkinInnerClass1_ItemRenderer1_click);
            this.addEventListener("rollOut", this.___YouTubeSelectionScreenSkinInnerClass1_ItemRenderer1_rollOut);
            this.addEventListener("rollOver", this.___YouTubeSelectionScreenSkinInnerClass1_ItemRenderer1_rollOver);
            states = [new State({name:"downAndSelected", overrides:[]}), new State({name:"down", overrides:[]}), new State({name:"selected", overrides:[]}), new State({name:"hovered", overrides:[new SetProperty().initializeFromObject({target:"_YouTubeSelectionScreenSkinInnerClass1_SolidColor1", name:"color", value:5395026})]}), new State({name:"normal", overrides:[new SetProperty().initializeFromObject({target:"_YouTubeSelectionScreenSkinInnerClass1_SolidColor1", name:"alpha", value:0})]})];
            var i:uint;
            while (i < bindings.length)
            {
                
                Binding(bindings[i]).execute();
                i = (i + 1);
            }
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

        protected function itemrenderer_rollOutHandler(event:MouseEvent) : void
        {
            this.removeButton.visible = false;
            return;
        }// end function

        protected function itemrenderer_rollOverHandler(event:MouseEvent) : void
        {
            this.removeButton.visible = true;
            return;
        }// end function

        protected function itemrenderer_doubleClickHandler(event:MouseEvent) : void
        {
            event.stopImmediatePropagation();
            event.preventDefault();
            var _loc_2:* = new ListEvent("playItem");
            _loc_2.item = data;
            Object(owner).dispatchEvent(_loc_2);
            return;
        }// end function

        protected function removeButton_clickHandler(event:MouseEvent) : void
        {
            event.stopImmediatePropagation();
            event.preventDefault();
            var _loc_2:* = new ListEvent("deleteItem");
            _loc_2.item = data;
            Object(owner).dispatchEvent(_loc_2);
            return;
        }// end function

        private function _YouTubeSelectionScreenSkinInnerClass1_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._YouTubeSelectionScreenSkinInnerClass1_SolidColor1_i();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _YouTubeSelectionScreenSkinInnerClass1_SolidColor1_i() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 3815994;
            this._YouTubeSelectionScreenSkinInnerClass1_SolidColor1 = _loc_1;
            BindingManager.executeBindings(this, "_YouTubeSelectionScreenSkinInnerClass1_SolidColor1", this._YouTubeSelectionScreenSkinInnerClass1_SolidColor1);
            return _loc_1;
        }// end function

        private function _YouTubeSelectionScreenSkinInnerClass1_BitmapImage1_i() : BitmapImage
        {
            var _loc_1:* = new BitmapImage();
            _loc_1.width = 72;
            _loc_1.height = 54;
            _loc_1.left = 5;
            _loc_1.top = 5;
            _loc_1.bottom = 5;
            _loc_1.initialized(this, "_YouTubeSelectionScreenSkinInnerClass1_BitmapImage1");
            this._YouTubeSelectionScreenSkinInnerClass1_BitmapImage1 = _loc_1;
            BindingManager.executeBindings(this, "_YouTubeSelectionScreenSkinInnerClass1_BitmapImage1", this._YouTubeSelectionScreenSkinInnerClass1_BitmapImage1);
            return _loc_1;
        }// end function

        private function _YouTubeSelectionScreenSkinInnerClass1_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.top = 2;
            _loc_1.bottom = 2;
            _loc_1.left = 82;
            _loc_1.right = 5;
            _loc_1.maxDisplayedLines = 3;
            _loc_1.setStyle("color", 12698049);
            _loc_1.setStyle("fontSize", 10);
            _loc_1.setStyle("lineHeight", "120%");
            _loc_1.setStyle("verticalAlign", "middle");
            _loc_1.id = "nameLabel";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.nameLabel = _loc_1;
            BindingManager.executeBindings(this, "nameLabel", this.nameLabel);
            return _loc_1;
        }// end function

        private function _YouTubeSelectionScreenSkinInnerClass1_Button1_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.right = 4;
            _loc_1.top = 4;
            _loc_1.visible = false;
            _loc_1.setStyle("skinClass", MediaRemoveItemRendererSkin);
            _loc_1.addEventListener("click", this.__removeButton_click);
            _loc_1.id = "removeButton";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.removeButton = _loc_1;
            BindingManager.executeBindings(this, "removeButton", this.removeButton);
            return _loc_1;
        }// end function

        public function __removeButton_click(event:MouseEvent) : void
        {
            this.removeButton_clickHandler(event);
            return;
        }// end function

        public function ___YouTubeSelectionScreenSkinInnerClass1_ItemRenderer1_click(event:MouseEvent) : void
        {
            this.itemrenderer_doubleClickHandler(event);
            return;
        }// end function

        public function ___YouTubeSelectionScreenSkinInnerClass1_ItemRenderer1_rollOut(event:MouseEvent) : void
        {
            this.itemrenderer_rollOutHandler(event);
            return;
        }// end function

        public function ___YouTubeSelectionScreenSkinInnerClass1_ItemRenderer1_rollOver(event:MouseEvent) : void
        {
            this.itemrenderer_rollOverHandler(event);
            return;
        }// end function

        private function _YouTubeSelectionScreenSkinInnerClass1_bindingsSetup() : Array
        {
            var result:Array;
            result[0] = new Binding(this, function () : Object
            {
                return data.thumbnailUrl;
            }// end function
            , null, "_YouTubeSelectionScreenSkinInnerClass1_BitmapImage1.source");
            result[1] = new Binding(this, function () : String
            {
                var _loc_1:* = data.title;
                return _loc_1 == undefined ? (null) : (String(_loc_1));
            }// end function
            , null, "nameLabel.text");
            return result;
        }// end function

        public function get _YouTubeSelectionScreenSkinInnerClass1_SolidColor1() : SolidColor
        {
            return this._1433605736_YouTubeSelectionScreenSkinInnerClass1_SolidColor1;
        }// end function

        public function set _YouTubeSelectionScreenSkinInnerClass1_SolidColor1(param1:SolidColor) : void
        {
            var _loc_2:* = this._1433605736_YouTubeSelectionScreenSkinInnerClass1_SolidColor1;
            if (_loc_2 !== param1)
            {
                this._1433605736_YouTubeSelectionScreenSkinInnerClass1_SolidColor1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_YouTubeSelectionScreenSkinInnerClass1_SolidColor1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get nameLabel() : Label
        {
            return this._1215755049nameLabel;
        }// end function

        public function set nameLabel(param1:Label) : void
        {
            var _loc_2:* = this._1215755049nameLabel;
            if (_loc_2 !== param1)
            {
                this._1215755049nameLabel = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameLabel", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get outerDocument() : YouTubeSelectionScreenSkin
        {
            return this._88844982outerDocument;
        }// end function

        public function set outerDocument(param1:YouTubeSelectionScreenSkin) : void
        {
            var _loc_2:* = this._88844982outerDocument;
            if (_loc_2 !== param1)
            {
                this._88844982outerDocument = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "outerDocument", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get removeButton() : Button
        {
            return this._1339123498removeButton;
        }// end function

        public function set removeButton(param1:Button) : void
        {
            var _loc_2:* = this._1339123498removeButton;
            if (_loc_2 !== param1)
            {
                this._1339123498removeButton = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "removeButton", _loc_2, param1));
                }
            }
            return;
        }// end function

        public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
        {
            YouTubeSelectionScreenSkinInnerClass1._watcherSetupUtil = param1;
            return;
        }// end function

    }
}
