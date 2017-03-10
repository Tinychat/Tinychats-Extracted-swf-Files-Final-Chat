package com.tinychat.ui.skins.gotham.components.popupmenu
{
    import com.tinychat.model.menuoption.*;
    import com.tinychat.model.menuoption.media.*;
    import com.tinychat.model.menuoption.mqtt.*;
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.skins.gotham.icons.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.primitives.*;

    public class UserPopupMenuItemRenderer extends AdvancedItemRenderer implements IStateClient2
    {
        public var _UserPopupMenuItemRenderer_Line1:Line;
        private var _1287124693backgroundColor:SolidColor;
        private var _1427430450backgroundRect:Rect;
        private var _1919293257iconDisplay2:VectorImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private static var iconLookup:Object;
        private static var _initializeIconLookup:Boolean = initializeIconLookup();

        public function UserPopupMenuItemRenderer()
        {
            mx_internal::_document = this;
            this.autoDrawBackground = false;
            this.mxmlContent = [this._UserPopupMenuItemRenderer_Rect1_i(), this._UserPopupMenuItemRenderer_VectorImage1_i(), this._UserPopupMenuItemRenderer_Label1_i()];
            this.currentState = "normal";
            var _loc_1:* = new DeferredInstanceFromFunction(this._UserPopupMenuItemRenderer_Line1_i);
            states = [new State({name:"normal", overrides:[]}), new State({name:"hovered", overrides:[new SetProperty().initializeFromObject({target:"backgroundColor", name:"color", value:15858942})]}), new State({name:"down", overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["backgroundRect"]}), new SetProperty().initializeFromObject({target:"backgroundColor", name:"color", value:15858942})]})];
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

        override public function set data(param1:Object) : void
        {
            super.data = param1;
            this.iconDisplay2.width = iconLookup[getQualifiedClassName(param1)].width;
            this.iconDisplay2.source = iconLookup[getQualifiedClassName(param1)].icon;
            this.iconDisplay2.setStyle("tintColor", param1 is GiftUserMenuOption ? (8961569) : (11449270));
            return;
        }// end function

        override public function set label(param1:String) : void
        {
            super.label = param1;
            labelDisplay.text = param1;
            return;
        }// end function

        override public function set itemIndex(param1:int) : void
        {
            super.itemIndex = param1;
            var _loc_2:* = owner as PopupList;
            var _loc_3:Number = 0;
            if (_loc_2)
            {
            }
            if ((_loc_2.dataProvider.length - 1) == param1)
            {
                _loc_3 = 4;
            }
            else
            {
                _loc_3 = 0;
            }
            this.backgroundRect.bottomLeftRadiusX = _loc_3;
            this.backgroundRect.bottomRightRadiusX = _loc_3;
            return;
        }// end function

        private function _UserPopupMenuItemRenderer_Rect1_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._UserPopupMenuItemRenderer_SolidColor1_i();
            _loc_1.initialized(this, "backgroundRect");
            this.backgroundRect = _loc_1;
            BindingManager.executeBindings(this, "backgroundRect", this.backgroundRect);
            return _loc_1;
        }// end function

        private function _UserPopupMenuItemRenderer_SolidColor1_i() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 16777215;
            this.backgroundColor = _loc_1;
            BindingManager.executeBindings(this, "backgroundColor", this.backgroundColor);
            return _loc_1;
        }// end function

        private function _UserPopupMenuItemRenderer_Line1_i() : Line
        {
            var _loc_1:* = new Line();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 0;
            _loc_1.stroke = this._UserPopupMenuItemRenderer_SolidColorStroke1_c();
            _loc_1.initialized(this, "_UserPopupMenuItemRenderer_Line1");
            this._UserPopupMenuItemRenderer_Line1 = _loc_1;
            BindingManager.executeBindings(this, "_UserPopupMenuItemRenderer_Line1", this._UserPopupMenuItemRenderer_Line1);
            return _loc_1;
        }// end function

        private function _UserPopupMenuItemRenderer_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 13429231;
            _loc_1.weight = 1;
            _loc_1.caps = "square";
            return _loc_1;
        }// end function

        private function _UserPopupMenuItemRenderer_VectorImage1_i() : VectorImage
        {
            var _loc_1:* = new VectorImage();
            _loc_1.left = 6;
            _loc_1.verticalCenter = 0;
            _loc_1.setStyle("tintColor", 11449270);
            _loc_1.id = "iconDisplay2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.iconDisplay2 = _loc_1;
            BindingManager.executeBindings(this, "iconDisplay2", this.iconDisplay2);
            return _loc_1;
        }// end function

        private function _UserPopupMenuItemRenderer_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.percentWidth = 100;
            _loc_1.verticalCenter = 2;
            _loc_1.maxDisplayedLines = 1;
            _loc_1.setStyle("paddingLeft", 25);
            _loc_1.setStyle("paddingRight", 6);
            _loc_1.id = "labelDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            labelDisplay = _loc_1;
            BindingManager.executeBindings(this, "labelDisplay", labelDisplay);
            return _loc_1;
        }// end function

        public function get backgroundColor() : SolidColor
        {
            return this._1287124693backgroundColor;
        }// end function

        public function set backgroundColor(param1:SolidColor) : void
        {
            var _loc_2:* = this._1287124693backgroundColor;
            if (_loc_2 !== param1)
            {
                this._1287124693backgroundColor = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backgroundColor", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get backgroundRect() : Rect
        {
            return this._1427430450backgroundRect;
        }// end function

        public function set backgroundRect(param1:Rect) : void
        {
            var _loc_2:* = this._1427430450backgroundRect;
            if (_loc_2 !== param1)
            {
                this._1427430450backgroundRect = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backgroundRect", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get iconDisplay2() : VectorImage
        {
            return this._1919293257iconDisplay2;
        }// end function

        public function set iconDisplay2(param1:VectorImage) : void
        {
            var _loc_2:* = this._1919293257iconDisplay2;
            if (_loc_2 !== param1)
            {
                this._1919293257iconDisplay2 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconDisplay2", _loc_2, param1));
                }
            }
            return;
        }// end function

        private static function initializeIconLookup() : Boolean
        {
            iconLookup = {};
            iconLookup[getQualifiedClassName(BanUserMenuOption)] = {icon:BlockedIcon, width:12};
            iconLookup[getQualifiedClassName(CloseUserBroadcastMenuOption)] = {icon:XIcon, width:12};
            iconLookup[getQualifiedClassName(DemoteBroadcastMenuOption)] = {icon:MinimizeIcon, width:12};
            iconLookup[getQualifiedClassName(HideBroadcastMenuOption)] = {icon:WebcamHiddenIcon, width:12};
            iconLookup[getQualifiedClassName(IgnoreUserMenuOption)] = {icon:IgnoreIcon, width:12};
            iconLookup[getQualifiedClassName(TinychatMessageUserMenuOption)] = {icon:MessageIcon, width:12};
            iconLookup[getQualifiedClassName(ProfileUserMenuOption)] = {icon:ProfileIcon, width:12};
            iconLookup[getQualifiedClassName(FollowUserMenuOption)] = {icon:FollowIcon, width:12};
            iconLookup[getQualifiedClassName(PromoteBroadcastMenuOption)] = {icon:MaximizeIcon, width:12};
            iconLookup[getQualifiedClassName(ReportUserMenuOption)] = {icon:ReportIcon, width:12};
            iconLookup[getQualifiedClassName(GiftUserMenuOption)] = {icon:GiftIcon, width:12};
            iconLookup[getQualifiedClassName(ShowBroadcastMenuOption)] = {icon:WebcamIcon, width:12};
            iconLookup[getQualifiedClassName(UnignoreUserMenuOption)] = {icon:UnignoreIcon, width:12};
            iconLookup[getQualifiedClassName(UpgradeUserMenuOption)] = {icon:UpgradeIcon, width:12};
            iconLookup[getQualifiedClassName(SocialNetworkInviteUserMenuOption)] = {icon:InviteIcon, width:12};
            iconLookup[getQualifiedClassName(SocialNetworkMessageUserMenuOption)] = {icon:MessageIcon, width:12};
            iconLookup[getQualifiedClassName(MqttBlockUserMenuOption)] = {icon:IgnoreIcon, width:12};
            iconLookup[getQualifiedClassName(MqttUnblockUserMenuOption)] = {icon:UnignoreIcon, width:12};
            iconLookup[getQualifiedClassName(CloseMediaBroadcastMenuOption)] = {icon:XIcon, width:12};
            iconLookup[getQualifiedClassName(PauseMediaMenuOption)] = {icon:PauseIcon, width:12};
            iconLookup[getQualifiedClassName(PlayMediaMenuOption)] = {icon:PlayIcon, width:12};
            return true;
        }// end function

    }
}
