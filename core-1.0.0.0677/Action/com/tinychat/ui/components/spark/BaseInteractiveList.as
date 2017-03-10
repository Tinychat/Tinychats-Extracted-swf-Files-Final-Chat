package com.tinychat.ui.components.spark
{
    import flash.events.*;
    import spark.components.*;
    import spark.events.*;

    public class BaseInteractiveList extends DataGroup
    {

        public function BaseInteractiveList()
        {
            addEventListener(RendererExistenceEvent.RENDERER_ADD, this.rendererAddHandler);
            addEventListener(RendererExistenceEvent.RENDERER_REMOVE, this.rendererRemoveHandler);
            return;
        }// end function

        private function rendererAddHandler(event:RendererExistenceEvent) : void
        {
            event.renderer.addEventListener(MouseEvent.CLICK, this.rendererClickHandler, false, 0, true);
            return;
        }// end function

        private function rendererRemoveHandler(event:RendererExistenceEvent) : void
        {
            if (event.renderer)
            {
                event.renderer.removeEventListener(MouseEvent.CLICK, this.rendererClickHandler);
            }
            return;
        }// end function

        protected function rendererClickHandler(event:MouseEvent) : void
        {
            return;
        }// end function

    }
}
