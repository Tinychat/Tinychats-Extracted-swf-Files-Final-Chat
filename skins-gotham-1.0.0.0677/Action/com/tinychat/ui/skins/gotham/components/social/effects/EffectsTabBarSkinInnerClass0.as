package com.tinychat.ui.skins.gotham.components.social.effects
{
    import mx.core.*;
    import mx.events.*;
    import mx.styles.*;
    import spark.components.*;

    public class EffectsTabBarSkinInnerClass0 extends ButtonBarButton
    {
        private var _88844982outerDocument:EffectsTabBarSkin;
        private var __moduleFactoryInitialized:Boolean = false;
        private static var _skinParts:Object = {labelDisplay:false, iconDisplay:false};

        public function EffectsTabBarSkinInnerClass0()
        {
            this.height = 28;
            return;
        }// end function

        override public function set moduleFactory(param1:IFlexModuleFactory) : void
        {
            var factory:* = param1;
            super.moduleFactory = factory;
            if (this.__moduleFactoryInitialized)
            {
                return;
            }
            this.__moduleFactoryInitialized = true;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration(null, styleManager);
            }
            this.styleDeclaration.defaultFactory = function () : void
            {
                this.skinClass = EffectsButtonBarButtonSkin;
                return;
            }// end function
            ;
            return;
        }// end function

        override public function initialize() : void
        {
            super.initialize();
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

        public function get outerDocument() : EffectsTabBarSkin
        {
            return this._88844982outerDocument;
        }// end function

        public function set outerDocument(param1:EffectsTabBarSkin) : void
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

    }
}
