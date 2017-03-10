package com.tinychat.ui.mediators.social.buttonbar.signals
{
    import com.tinychat.model.signals.*;

    public class SelectSocialButtonBarButton extends AbstractReadOnlySignal
    {

        public function SelectSocialButtonBarButton()
        {
            super(String);
            return;
        }// end function

        public function dispatch(param1:String) : void
        {
            signal.dispatch(param1);
            return;
        }// end function

    }
}
