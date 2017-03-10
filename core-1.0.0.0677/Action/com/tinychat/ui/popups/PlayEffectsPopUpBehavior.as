package com.tinychat.ui.popups
{
    import com.adobe.popup.*;
    import flash.display.*;
    import mx.effects.*;
    import mx.events.*;

    public class PlayEffectsPopUpBehavior extends Object implements IPopUpBehavior
    {
        public var openEffect:Effect;
        public var closeEffect:Effect;
        private var popupEvent:PopUpEvent;

        public function PlayEffectsPopUpBehavior()
        {
            return;
        }// end function

        public function apply(param1:PopUpBase) : void
        {
            param1.addEventListener(PopUpEvent.OPENED, this.onOpening);
            param1.addEventListener(PopUpEvent.CLOSING, this.onClosing);
            return;
        }// end function

        private function onOpening(event:PopUpEvent) : void
        {
            this.playEffect(this.openEffect, event);
            return;
        }// end function

        private function onClosing(event:PopUpEvent) : void
        {
            this.playEffect(this.closeEffect, event, true);
            return;
        }// end function

        private function playEffect(param1:Effect, param2:PopUpEvent, param3:Boolean = false) : void
        {
            if (param1)
            {
                if (param3)
                {
                    this.popupEvent = param2;
                    this.popupEvent.suspendClosure();
                    param1.addEventListener(EffectEvent.EFFECT_END, this.effectEndHandler);
                }
                param1.play([param2.popup]);
            }
            return;
        }// end function

        private function effectEndHandler(event:EffectEvent) : void
        {
            var _loc_2:* = event.effectInstance;
            _loc_2.effect.removeEventListener(EffectEvent.EFFECT_END, this.effectEndHandler);
            if (DisplayObject(_loc_2.target).stage)
            {
                this.popupEvent.resumeClosure();
                this.popupEvent = null;
            }
            return;
        }// end function

    }
}
