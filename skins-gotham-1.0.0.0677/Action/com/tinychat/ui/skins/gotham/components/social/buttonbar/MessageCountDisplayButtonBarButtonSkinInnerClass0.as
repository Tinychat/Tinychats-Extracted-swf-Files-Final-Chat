package com.tinychat.ui.skins.gotham.components.social.buttonbar
{
    import com.tinychat.ui.components.tooltip.*;
    import mx.core.*;
    import mx.events.*;
    import mx.styles.*;

    public class MessageCountDisplayButtonBarButtonSkinInnerClass0 extends TinychatToolTip
    {
        private var _88844982outerDocument:MessageCountDisplayButtonBarButtonSkin;
        private var __moduleFactoryInitialized:Boolean = false;
        private static var _skinParts:Object = {textDisplay:true};

        public function MessageCountDisplayButtonBarButtonSkinInnerClass0()
        {
            this.addEventListener("creationComplete", this.___MessageCountDisplayButtonBarButtonSkinInnerClass0_TinychatToolTip1_creationComplete);
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
                this.placement = "topCenter";
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

        public function ___MessageCountDisplayButtonBarButtonSkinInnerClass0_TinychatToolTip1_creationComplete(event:FlexEvent) : void
        {
            this.outerDocument.registerOnlineIndicatorInstance(this);
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

        public function get outerDocument() : MessageCountDisplayButtonBarButtonSkin
        {
            return this._88844982outerDocument;
        }// end function

        public function set outerDocument(param1:MessageCountDisplayButtonBarButtonSkin) : void
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
