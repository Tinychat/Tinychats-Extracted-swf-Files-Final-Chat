package com.tinychat.ui.mediators.general
{
    import flash.events.*;
    import mx.core.*;
    import org.robotlegs.mvcs.*;

    public class ButtonMediator extends Mediator
    {
        private var view:IUIComponent;

        public function ButtonMediator(param1:IUIComponent)
        {
            this.view = param1;
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            eventMap.mapListener(this.view, MouseEvent.CLICK, this.clickHandler, MouseEvent);
            return;
        }// end function

        protected function clickHandler(event:MouseEvent) : void
        {
            return;
        }// end function

    }
}
