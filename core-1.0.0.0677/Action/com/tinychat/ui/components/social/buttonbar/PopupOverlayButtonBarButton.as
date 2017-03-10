package com.tinychat.ui.components.social.buttonbar
{
    import com.tinychat.ui.components.spark.*;
    import flash.events.*;
    import mx.core.*;
    import mx.events.*;
    import mx.managers.*;

    public class PopupOverlayButtonBarButton extends IconButtonBarButton
    {
        public var popupOverlayDisplay:IFactory;
        protected var popupOverlayDisplayInstance:UIComponent;
        private static const POPUP_OVERLAY_DISPLAY_PART_NAME:String = "popupOverlayDisplay";
        private static var _skinParts:Object = {popupOverlayDisplay:false, labelDisplay:false, iconDisplay:false, iconDisplay2:false};

        public function PopupOverlayButtonBarButton()
        {
            addEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
            addEventListener(Event.REMOVED_FROM_STAGE, this.removedFromStageHandler);
            addEventListener(FlexEvent.SHOW, this.addedToStageHandler);
            addEventListener(FlexEvent.HIDE, this.removedFromStageHandler);
            return;
        }// end function

        protected function get showPopopOverlayDisplay() : Boolean
        {
            return false;
        }// end function

        protected function popupOverlayDisplayCreated() : void
        {
            return;
        }// end function

        protected function popupOverlayDisplayRemoved() : void
        {
            return;
        }// end function

        protected function addPopupOverlayToLayout() : void
        {
            PopUpManager.addPopUp(this.popupOverlayDisplayInstance, this);
            return;
        }// end function

        protected function removePopupOverlayFromLayout() : void
        {
            PopUpManager.removePopUp(this.popupOverlayDisplayInstance);
            return;
        }// end function

        protected function createPopupOverlayDisplay() : void
        {
            if (this.popupOverlayDisplay)
            {
                this.popupOverlayDisplayInstance = UIComponent(createDynamicPartInstance(POPUP_OVERLAY_DISPLAY_PART_NAME));
                this.addPopupOverlayToLayout();
                this.popupOverlayDisplayCreated();
            }
            return;
        }// end function

        protected function removePopupOverlayDisplay() : void
        {
            removeDynamicPartInstance(POPUP_OVERLAY_DISPLAY_PART_NAME, this.popupOverlayDisplayInstance);
            this.removePopupOverlayFromLayout();
            this.popupOverlayDisplayInstance = null;
            this.popupOverlayDisplayRemoved();
            return;
        }// end function

        private function addedToStageHandler(event:Event) : void
        {
            if (!this.popupOverlayDisplayInstance)
            {
            }
            if (this.showPopopOverlayDisplay)
            {
                this.createPopupOverlayDisplay();
            }
            return;
        }// end function

        private function removedFromStageHandler(event:Event) : void
        {
            if (this.popupOverlayDisplayInstance)
            {
                this.removePopupOverlayDisplay();
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
