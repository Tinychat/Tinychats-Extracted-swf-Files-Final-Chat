package com.tinychat.ui.skins.gotham.components.social.chat
{
    import flash.events.*;
    import mx.core.*;
    import mx.events.*;
    import mx.styles.*;
    import spark.components.*;

    public class PrivateChatUserItemRendererSkinInnerClass0 extends Label
    {
        private var _88844982outerDocument:PrivateChatUserItemRendererSkin;
        private var __moduleFactoryInitialized:Boolean = false;

        public function PrivateChatUserItemRendererSkinInnerClass0()
        {
            this.addEventListener("addedToStage", this.___PrivateChatUserItemRendererSkinInnerClass0_Label1_addedToStage);
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
                this.fontSize = 11;
                this.fontWeight = "bold";
                this.trackingLeft = -0.5;
                this.trackingRight = -0.5;
                this.paddingBottom = 1;
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

        public function ___PrivateChatUserItemRendererSkinInnerClass0_Label1_addedToStage(event:Event) : void
        {
            this.outerDocument.messageCountDisplayAddedToStageHandler(this);
            return;
        }// end function

        public function get outerDocument() : PrivateChatUserItemRendererSkin
        {
            return this._88844982outerDocument;
        }// end function

        public function set outerDocument(param1:PrivateChatUserItemRendererSkin) : void
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
