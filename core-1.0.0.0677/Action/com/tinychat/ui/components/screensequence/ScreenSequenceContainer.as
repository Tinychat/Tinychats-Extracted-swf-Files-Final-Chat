package com.tinychat.ui.components.screensequence
{
    import mx.core.*;
    import mx.events.*;
    import spark.components.*;
    import spark.effects.*;

    public class ScreenSequenceContainer extends Group
    {
        private var currentElement:IVisualElement;
        private var fadeIn:Fade;
        private var fadeOut:Fade;
        private var resize:Resize;

        public function ScreenSequenceContainer()
        {
            clipAndEnableScrolling = true;
            this.fadeIn = new Fade();
            this.fadeIn.alphaFrom = 0;
            this.fadeIn.alphaTo = 1;
            this.fadeIn.duration = 150;
            this.fadeOut = new Fade();
            this.fadeOut.alphaFrom = 1;
            this.fadeOut.alphaTo = 0;
            this.resize = new Resize();
            this.resize.widthTo = 0;
            this.resize.heightTo = 0;
            this.resize.target = this;
            this.resize.duration = 400;
            return;
        }// end function

        override public function addElement(param1:IVisualElement) : IVisualElement
        {
            this.currentElement = param1;
            param1.visible = false;
            param1.addEventListener(FlexEvent.UPDATE_COMPLETE, this.elementUpdateCompleteHandler);
            return super.addElement(param1);
        }// end function

        override public function removeElement(param1:IVisualElement) : IVisualElement
        {
            param1.addEventListener(FlexEvent.UPDATE_COMPLETE, this.elementUpdateCompleteHandler);
            this.currentElement = null;
            return super.removeElement(param1);
        }// end function

        private function elementUpdateCompleteHandler(event:FlexEvent) : void
        {
            if (this.resize.widthTo == this.currentElement.width)
            {
            }
            if (this.resize.heightTo != this.currentElement.height)
            {
                this.resize.widthFrom = this.resize.widthTo;
                this.resize.heightFrom = this.resize.heightTo;
                this.resize.widthTo = this.currentElement.width;
                this.resize.heightTo = this.currentElement.height;
                this.resize.addEventListener(EffectEvent.EFFECT_END, this.resizeEndHandler);
                this.resize.end();
                this.resize.play();
            }
            return;
        }// end function

        private function resizeEndHandler(event:EffectEvent) : void
        {
            this.resize.removeEventListener(EffectEvent.EFFECT_END, this.resizeEndHandler);
            if (!this.currentElement.visible)
            {
                this.fadeIn.target = this.currentElement;
                this.fadeIn.play();
            }
            return;
        }// end function

    }
}
