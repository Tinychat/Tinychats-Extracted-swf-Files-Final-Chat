package com.tinychat.ui.mediators.social.chat
{
    import com.tinychat.model.sounds.*;
    import com.tinychat.ui.components.social.chat.*;
    import flash.events.*;
    import org.robotlegs.mvcs.*;

    public class PlaySoundsCheckboxMediator extends Mediator
    {
        public var view:PlaySoundsCheckbox;
        public var chatSoundEffect:ChatSoundEffect;

        public function PlaySoundsCheckboxMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.selected = this.chatSoundEffect.enabled;
            this.view.label = "Sounds";
            this.chatSoundEffect.enabledChanged.add(this.chatSoundEffectEnabledChangedHandler);
            eventMap.mapListener(this.view, MouseEvent.CLICK, this.clickHandler, MouseEvent);
            return;
        }// end function

        private function clickHandler(event:MouseEvent) : void
        {
            this.chatSoundEffect.enabled = this.view.selected;
            return;
        }// end function

        private function chatSoundEffectEnabledChangedHandler(param1:Boolean) : void
        {
            this.view.selected = param1;
            return;
        }// end function

    }
}
