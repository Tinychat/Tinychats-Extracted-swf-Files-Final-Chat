package com.tinychat.ui.skins.gotham.components.broadcast.selectors
{
    import com.tinychat.ui.components.broadcast.selectors.*;
    import mx.core.*;
    import mx.events.*;

    public class MicrophoneSelectorSkinInnerClass1 extends MicrophoneItemRenderer
    {
        private var _88844982outerDocument:MicrophoneSelectorSkin;
        private var __moduleFactoryInitialized:Boolean = false;
        private static var _skinParts:Object = {audioActivityIndicator:true, labelDisplay:false, iconDisplay:false};

        public function MicrophoneSelectorSkinInnerClass1()
        {
            this.styleName = "microphoneItemRenderer";
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

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

        public function get outerDocument() : MicrophoneSelectorSkin
        {
            return this._88844982outerDocument;
        }// end function

        public function set outerDocument(param1:MicrophoneSelectorSkin) : void
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
