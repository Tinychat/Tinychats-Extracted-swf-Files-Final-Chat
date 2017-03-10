package com.tinychat.ui.skins.gotham.components.social.effects
{
    import com.tinychat.ui.components.social.effects.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;

    public class EffectsTabBarSkin extends Skin implements IStateClient2
    {
        private var _385593099dataGroup:DataGroup;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:EffectsTabBar;

        public function EffectsTabBarSkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._EffectsTabBarSkin_DataGroup1_i()];
            this.currentState = "normal";
            states = [new State({name:"normal", overrides:[]}), new State({name:"disabled", overrides:[new SetProperty().initializeFromObject({name:"alpha", value:0.5})]})];
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

        private function _EffectsTabBarSkin_DataGroup1_i() : DataGroup
        {
            var _loc_1:* = new DataGroup();
            _loc_1.percentWidth = 100;
            _loc_1.percentHeight = 100;
            _loc_1.layout = this._EffectsTabBarSkin_ButtonBarHorizontalLayout1_c();
            _loc_1.itemRenderer = this._EffectsTabBarSkin_ClassFactory1_c();
            _loc_1.id = "dataGroup";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.dataGroup = _loc_1;
            BindingManager.executeBindings(this, "dataGroup", this.dataGroup);
            return _loc_1;
        }// end function

        private function _EffectsTabBarSkin_ButtonBarHorizontalLayout1_c() : ButtonBarHorizontalLayout
        {
            var _loc_1:* = new ButtonBarHorizontalLayout();
            _loc_1.gap = -1;
            return _loc_1;
        }// end function

        private function _EffectsTabBarSkin_ClassFactory1_c() : ClassFactory
        {
            var _loc_1:* = new ClassFactory();
            _loc_1.generator = EffectsTabBarSkinInnerClass0;
            _loc_1.properties = {outerDocument:this};
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

        public function get hostComponent() : EffectsTabBar
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:EffectsTabBar) : void
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
