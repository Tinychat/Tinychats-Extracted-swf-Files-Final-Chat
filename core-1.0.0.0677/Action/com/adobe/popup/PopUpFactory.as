package com.adobe.popup
{
    import mx.core.*;

    public class PopUpFactory extends PopUpBase
    {
        private var view:IFlexDisplayObject;
        public var popup:IFactory;
        public var reuse:Boolean = false;

        public function PopUpFactory()
        {
            return;
        }// end function

        override protected function getPopUp() : IFlexDisplayObject
        {
            if (!this.popup)
            {
                throw new Error("The popup property must be set.", -50);
            }
            if (this.view)
            {
            }
            if (!this.reuse)
            {
                this.view = this.popup.newInstance() as IFlexDisplayObject;
            }
            return this.view;
        }// end function

        override protected function popUpClosed() : void
        {
            if (!this.reuse)
            {
                this.view = null;
            }
            return;
        }// end function

    }
}
