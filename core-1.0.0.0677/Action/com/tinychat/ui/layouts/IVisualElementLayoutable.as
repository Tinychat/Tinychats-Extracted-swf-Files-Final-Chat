package com.tinychat.ui.layouts
{
    import mx.core.*;

    public class IVisualElementLayoutable extends Object implements Layoutable
    {
        private var decorated:IVisualElement;

        public function IVisualElementLayoutable(param1:IVisualElement)
        {
            this.decorated = param1;
            return;
        }// end function

        public function position(param1:Number, param2:Number) : void
        {
            this.decorated.setLayoutBoundsPosition(param1, param2);
            return;
        }// end function

        public function size(param1:Number, param2:Number) : void
        {
            this.decorated.setLayoutBoundsSize(param1, param2);
            return;
        }// end function

    }
}
