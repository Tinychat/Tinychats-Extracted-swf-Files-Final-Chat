package com.tinychat.ui.mediators.social.buttonbar
{
    import com.tinychat.ui.components.social.buttonbar.*;
    import com.tinychat.ui.mediators.social.buttonbar.signals.*;
    import org.robotlegs.mvcs.*;

    public class SocialButtonBarMediator extends Mediator
    {
        public var view:SocialButtonBar;
        public var selectSocialButtonBarButton:SelectSocialButtonBarButton;

        public function SocialButtonBarMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.allowDeselection = false;
            this.selectSocialButtonBarButton.add(this.selectSocialButtonBarButtonHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            super.onRemove();
            this.selectSocialButtonBarButton.remove(this.selectSocialButtonBarButtonHandler);
            return;
        }// end function

        private function selectSocialButtonBarButtonHandler(param1:String) : void
        {
            this.view.selectedContainer = param1;
            return;
        }// end function

    }
}
