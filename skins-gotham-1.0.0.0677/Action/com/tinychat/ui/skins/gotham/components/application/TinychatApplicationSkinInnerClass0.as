package com.tinychat.ui.skins.gotham.components.application
{
    import com.adobe.popup.*;
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.popups.*;
    import mx.core.*;
    import mx.effects.*;
    import mx.events.*;
    import spark.effects.*;

    public class TinychatApplicationSkinInnerClass0 extends PopUpFactory
    {
        private var _88844982outerDocument:TinychatApplicationSkin;

        public function TinychatApplicationSkinInnerClass0()
        {
            this.popup = this._TinychatApplicationSkinInnerClass0_ClassFactory1_c();
            this.center = false;
            this.behaviors = [this._TinychatApplicationSkinInnerClass0_InitialPositioningPopUpBehavior1_c(), this._TinychatApplicationSkinInnerClass0_PlayEffectsPopUpBehavior1_c()];
            return;
        }// end function

        private function _TinychatApplicationSkinInnerClass0_ClassFactory1_c() : ClassFactory
        {
            var _loc_1:* = new ClassFactory();
            _loc_1.generator = AdvancedTitleWindow;
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkinInnerClass0_InitialPositioningPopUpBehavior1_c() : InitialPositioningPopUpBehavior
        {
            var _loc_1:* = new InitialPositioningPopUpBehavior();
            _loc_1.x = 100;
            _loc_1.y = 100;
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkinInnerClass0_PlayEffectsPopUpBehavior1_c() : PlayEffectsPopUpBehavior
        {
            var _loc_1:* = new PlayEffectsPopUpBehavior();
            _loc_1.openEffect = this._TinychatApplicationSkinInnerClass0_Parallel1_c();
            _loc_1.closeEffect = this._TinychatApplicationSkinInnerClass0_Fade2_c();
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkinInnerClass0_Parallel1_c() : Parallel
        {
            var _loc_1:* = new Parallel();
            _loc_1.duration = 300;
            _loc_1.children = [this._TinychatApplicationSkinInnerClass0_Fade1_c()];
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkinInnerClass0_Fade1_c() : Fade
        {
            var _loc_1:* = new Fade();
            _loc_1.alphaFrom = 0;
            _loc_1.alphaTo = 1;
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkinInnerClass0_Fade2_c() : Fade
        {
            var _loc_1:* = new Fade();
            _loc_1.alphaFrom = 1;
            _loc_1.alphaTo = 0;
            _loc_1.duration = 300;
            return _loc_1;
        }// end function

        public function get outerDocument() : TinychatApplicationSkin
        {
            return this._88844982outerDocument;
        }// end function

        public function set outerDocument(param1:TinychatApplicationSkin) : void
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
