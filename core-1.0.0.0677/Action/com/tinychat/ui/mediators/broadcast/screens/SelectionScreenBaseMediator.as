package com.tinychat.ui.mediators.broadcast.screens
{
    import com.tinychat.ui.components.broadcast.screens.*;
    import com.tinychat.ui.mediators.screensequence.*;

    public class SelectionScreenBaseMediator extends SequencedScreenMediator
    {
        private var view:SelectionScreenBase;

        public function SelectionScreenBaseMediator(param1:SelectionScreenBase)
        {
            this.view = param1;
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.selectionMade.addOnce(this.selectionMadeHandler);
            this.updateConfirmedLabel();
            this.updateCancelLabel();
            return;
        }// end function

        override public function onRemove() : void
        {
            this.view.selectionMade.remove(this.selectionMadeHandler);
            this.view.canceled.remove(this.canceledHandler);
            return;
        }// end function

        protected function updateConfirmedLabel() : void
        {
            if (hasNext)
            {
                this.view.confirmLabel = "Continue";
            }
            else
            {
                this.view.confirmLabel = "Finish";
            }
            return;
        }// end function

        protected function updateCancelLabel() : void
        {
            if (hasPrevious)
            {
                this.view.cancelLabel = "Back";
                this.view.canceled.addOnce(this.canceledHandler);
            }
            else if (this.view.cancel)
            {
                this.view.cancel.includeInLayout = false;
                this.view.cancel.visible = false;
            }
            return;
        }// end function

        protected function selectionMadeHandler(param1:Object) : void
        {
            dispatchGoNext();
            return;
        }// end function

        protected function canceledHandler() : void
        {
            dispatchGoPrevious();
            return;
        }// end function

    }
}
