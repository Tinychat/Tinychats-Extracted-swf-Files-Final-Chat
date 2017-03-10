package com.tinychat.ui.skins.gotham.components.social.userslist.greenroom.renderer
{
    import com.tinychat.ui.components.social.userlist.greenroom.renderer.*;
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.components.video.controls.*;
    import com.tinychat.ui.skins.gotham.components.broadcast.containers.*;
    import com.tinychat.ui.skins.gotham.components.loadingindicators.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;
    import spark.primitives.*;

    public class GreenRoomStreamItemRendererSkin extends Skin implements IStateClient2
    {
        public var _GreenRoomStreamItemRendererSkin_AjaxLoader1:AjaxLoader;
        public var _GreenRoomStreamItemRendererSkin_AudioOnlyIndicator1:AudioOnlyIndicator;
        public var _GreenRoomStreamItemRendererSkin_HGroup1:HGroup;
        private var _92906313allow:GreenRoomAllowButton;
        private var _809612678contentGroup:Group;
        private var _3079692deny:BanButton;
        private var _1844466615nameDisplay:NameDisplay;
        private var _94162362videoContainer:Group;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:GreenRoomStreamItemRenderer;

        public function GreenRoomStreamItemRendererSkin()
        {
            mx_internal::_document = this;
            this.layout = this._GreenRoomStreamItemRendererSkin_VerticalLayout1_c();
            this.mxmlContent = [this._GreenRoomStreamItemRendererSkin_Group1_i(), this._GreenRoomStreamItemRendererSkin_NameDisplay1_i()];
            this.currentState = "normal";
            var _loc_1:* = new DeferredInstanceFromFunction(this._GreenRoomStreamItemRendererSkin_AjaxLoader1_i);
            var _loc_2:* = new DeferredInstanceFromFunction(this._GreenRoomStreamItemRendererSkin_AudioOnlyIndicator1_i);
            var _loc_3:* = new DeferredInstanceFromFunction(this._GreenRoomStreamItemRendererSkin_HGroup1_i);
            states = [new State({name:"normal", overrides:[]}), new State({name:"videoWaiting", overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:"videoContainer", propertyName:"mxmlContent", position:"after", relativeTo:["contentGroup"]})]}), new State({name:"over", stateGroups:["overStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_3, destination:"videoContainer", propertyName:"mxmlContent", position:"after", relativeTo:["contentGroup"]})]}), new State({name:"audioOnlyAndOver", stateGroups:["overStates", "audioOnlyStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_3, destination:"videoContainer", propertyName:"mxmlContent", position:"after", relativeTo:["contentGroup"]}), new AddItems().initializeFromObject({itemsFactory:_loc_2, destination:"videoContainer", propertyName:"mxmlContent", position:"after", relativeTo:["contentGroup"]})]}), new State({name:"audioOnly", stateGroups:["audioOnlyStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_2, destination:"videoContainer", propertyName:"mxmlContent", position:"after", relativeTo:["contentGroup"]})]}), new State({name:"disabled", overrides:[]})];
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
            this.videoContainer.height = param1 * 0.75;
            return;
        }// end function

        private function _GreenRoomStreamItemRendererSkin_VerticalLayout1_c() : VerticalLayout
        {
            var _loc_1:* = new VerticalLayout();
            _loc_1.gap = 0;
            _loc_1.horizontalAlign = "justify";
            return _loc_1;
        }// end function

        private function _GreenRoomStreamItemRendererSkin_Group1_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.mxmlContent = [this._GreenRoomStreamItemRendererSkin_Rect1_c(), this._GreenRoomStreamItemRendererSkin_Group2_i()];
            _loc_1.id = "videoContainer";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.videoContainer = _loc_1;
            BindingManager.executeBindings(this, "videoContainer", this.videoContainer);
            return _loc_1;
        }// end function

        private function _GreenRoomStreamItemRendererSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 2;
            _loc_1.stroke = this._GreenRoomStreamItemRendererSkin_SolidColorStroke1_c();
            _loc_1.fill = this._GreenRoomStreamItemRendererSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _GreenRoomStreamItemRendererSkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 13092807;
            _loc_1.weight = 1;
            return _loc_1;
        }// end function

        private function _GreenRoomStreamItemRendererSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 16777215;
            return _loc_1;
        }// end function

        private function _GreenRoomStreamItemRendererSkin_Group2_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 2;
            _loc_1.right = 2;
            _loc_1.top = 2;
            _loc_1.bottom = 2;
            _loc_1.id = "contentGroup";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.contentGroup = _loc_1;
            BindingManager.executeBindings(this, "contentGroup", this.contentGroup);
            return _loc_1;
        }// end function

        private function _GreenRoomStreamItemRendererSkin_AudioOnlyIndicator1_i() : AudioOnlyIndicator
        {
            var _loc_1:* = new AudioOnlyIndicator();
            _loc_1.left = 2;
            _loc_1.right = 2;
            _loc_1.top = 2;
            _loc_1.bottom = 2;
            _loc_1.id = "_GreenRoomStreamItemRendererSkin_AudioOnlyIndicator1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._GreenRoomStreamItemRendererSkin_AudioOnlyIndicator1 = _loc_1;
            BindingManager.executeBindings(this, "_GreenRoomStreamItemRendererSkin_AudioOnlyIndicator1", this._GreenRoomStreamItemRendererSkin_AudioOnlyIndicator1);
            return _loc_1;
        }// end function

        private function _GreenRoomStreamItemRendererSkin_AjaxLoader1_i() : AjaxLoader
        {
            var _loc_1:* = new AjaxLoader();
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 0;
            _loc_1.id = "_GreenRoomStreamItemRendererSkin_AjaxLoader1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._GreenRoomStreamItemRendererSkin_AjaxLoader1 = _loc_1;
            BindingManager.executeBindings(this, "_GreenRoomStreamItemRendererSkin_AjaxLoader1", this._GreenRoomStreamItemRendererSkin_AjaxLoader1);
            return _loc_1;
        }// end function

        private function _GreenRoomStreamItemRendererSkin_HGroup1_i() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.height = 20;
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 0;
            _loc_1.variableColumnWidth = false;
            _loc_1.columnWidth = 20;
            _loc_1.verticalAlign = "justify";
            _loc_1.gap = 5;
            _loc_1.mxmlContent = [this._GreenRoomStreamItemRendererSkin_GreenRoomAllowButton1_i(), this._GreenRoomStreamItemRendererSkin_BanButton1_i()];
            _loc_1.id = "_GreenRoomStreamItemRendererSkin_HGroup1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._GreenRoomStreamItemRendererSkin_HGroup1 = _loc_1;
            BindingManager.executeBindings(this, "_GreenRoomStreamItemRendererSkin_HGroup1", this._GreenRoomStreamItemRendererSkin_HGroup1);
            return _loc_1;
        }// end function

        private function _GreenRoomStreamItemRendererSkin_GreenRoomAllowButton1_i() : GreenRoomAllowButton
        {
            var _loc_1:* = new GreenRoomAllowButton();
            _loc_1.styleName = "greenRoomAllowButton";
            _loc_1.id = "allow";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.allow = _loc_1;
            BindingManager.executeBindings(this, "allow", this.allow);
            return _loc_1;
        }// end function

        private function _GreenRoomStreamItemRendererSkin_BanButton1_i() : BanButton
        {
            var _loc_1:* = new BanButton();
            _loc_1.styleName = "banButton";
            _loc_1.id = "deny";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.deny = _loc_1;
            BindingManager.executeBindings(this, "deny", this.deny);
            return _loc_1;
        }// end function

        private function _GreenRoomStreamItemRendererSkin_NameDisplay1_i() : NameDisplay
        {
            var _loc_1:* = new NameDisplay();
            _loc_1.maxDisplayedLines = 1;
            _loc_1.showTruncationTip = true;
            _loc_1.setStyle("textAlign", "center");
            _loc_1.setStyle("paddingTop", 5);
            _loc_1.setStyle("paddingBottom", 5);
            _loc_1.id = "nameDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.nameDisplay = _loc_1;
            BindingManager.executeBindings(this, "nameDisplay", this.nameDisplay);
            return _loc_1;
        }// end function

        public function get allow() : GreenRoomAllowButton
        {
            return this._92906313allow;
        }// end function

        public function set allow(param1:GreenRoomAllowButton) : void
        {
            var _loc_2:* = this._92906313allow;
            if (_loc_2 !== param1)
            {
                this._92906313allow = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "allow", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get contentGroup() : Group
        {
            return this._809612678contentGroup;
        }// end function

        public function set contentGroup(param1:Group) : void
        {
            var _loc_2:* = this._809612678contentGroup;
            if (_loc_2 !== param1)
            {
                this._809612678contentGroup = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "contentGroup", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get deny() : BanButton
        {
            return this._3079692deny;
        }// end function

        public function set deny(param1:BanButton) : void
        {
            var _loc_2:* = this._3079692deny;
            if (_loc_2 !== param1)
            {
                this._3079692deny = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "deny", _loc_2, param1));
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

        public function get videoContainer() : Group
        {
            return this._94162362videoContainer;
        }// end function

        public function set videoContainer(param1:Group) : void
        {
            var _loc_2:* = this._94162362videoContainer;
            if (_loc_2 !== param1)
            {
                this._94162362videoContainer = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "videoContainer", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : GreenRoomStreamItemRenderer
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:GreenRoomStreamItemRenderer) : void
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
