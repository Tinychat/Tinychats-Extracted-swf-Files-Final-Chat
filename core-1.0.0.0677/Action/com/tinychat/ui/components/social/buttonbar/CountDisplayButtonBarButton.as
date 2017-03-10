package com.tinychat.ui.components.social.buttonbar
{

    public class CountDisplayButtonBarButton extends PopupOverlayButtonBarButton
    {
        private var _count:uint;
        private var countChanged:Boolean;
        private var visibleChanged:Boolean;
        private static var _skinParts:Object = {popupOverlayDisplay:false, labelDisplay:false, iconDisplay:false, iconDisplay2:false};

        public function CountDisplayButtonBarButton()
        {
            return;
        }// end function

        public function get count() : uint
        {
            return this._count;
        }// end function

        public function set count(param1:uint) : void
        {
            if (this._count != param1)
            {
                this._count = param1;
                this.countChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override public function set visible(param1:Boolean) : void
        {
            if (super.visible != param1)
            {
                super.visible = param1;
                this.visibleChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        protected function formatCountString() : String
        {
            return this.count.toString();
        }// end function

        override protected function get showPopopOverlayDisplay() : Boolean
        {
            if (this._count > 0)
            {
            }
            if (stage)
            {
            }
            return visible;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (!this.countChanged)
            {
            }
            if (this.visibleChanged)
            {
                if (this.showPopopOverlayDisplay)
                {
                    if (!popupOverlayDisplayInstance)
                    {
                        createPopupOverlayDisplay();
                    }
                    else
                    {
                        this.updateCount();
                    }
                }
                else if (popupOverlayDisplayInstance)
                {
                    removePopupOverlayDisplay();
                }
                this.countChanged = false;
                this.visibleChanged = false;
            }
            return;
        }// end function

        override protected function popupOverlayDisplayCreated() : void
        {
            this.updateCount();
            return;
        }// end function

        protected function updateCount() : void
        {
            Object(popupOverlayDisplayInstance).text = this.formatCountString();
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
