package com.tinychat.ui.skins.gotham.components.social.buttonbar
{
    import com.tinychat.ui.components.social.buttonbar.*;
    import mx.core.*;
    import mx.events.*;
    import mx.styles.*;

    public class UserCountButtonBarButtonSkinInnerClass0 extends UserCountIndicator
    {
        private var _88844982outerDocument:UserCountButtonBarButtonSkin;
        private var __moduleFactoryInitialized:Boolean = false;
        private static var _skinParts:Object = {textDisplay:true};

        public function UserCountButtonBarButtonSkinInnerClass0()
        {
            this.height = 17;
            this.addEventListener("creationComplete", this.___UserCountButtonBarButtonSkinInnerClass0_UserCountIndicator1_creationComplete);
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
                this.skinClass = UserCountIndicatorSkin;
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

        public function ___UserCountButtonBarButtonSkinInnerClass0_UserCountIndicator1_creationComplete(event:FlexEvent) : void
        {
            this.outerDocument.registerOnlineIndicatorInstance(this);
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

        public function get outerDocument() : UserCountButtonBarButtonSkin
        {
            return this._88844982outerDocument;
        }// end function

        public function set outerDocument(param1:UserCountButtonBarButtonSkin) : void
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
