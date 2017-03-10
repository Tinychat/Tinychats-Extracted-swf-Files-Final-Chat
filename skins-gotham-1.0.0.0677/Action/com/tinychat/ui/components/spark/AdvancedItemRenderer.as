package com.tinychat.ui.components.spark
{
    import flash.display.*;
    import flash.events.*;
    import mx.events.*;
    import spark.components.supportClasses.*;

    public class AdvancedItemRenderer extends ItemRenderer
    {
        private var _mouseDown:Boolean;

        public function AdvancedItemRenderer()
        {
            addEventListener(MouseEvent.MOUSE_DOWN, this.mouseDownHandler);
            return;
        }// end function

        protected function get mouseDown() : Boolean
        {
            return this._mouseDown;
        }// end function

        protected function set mouseDown(param1:Boolean) : void
        {
            if (param1 != this._mouseDown)
            {
                this._mouseDown = param1;
                setCurrentState(this.getCurrentRendererState(), playTransitions);
                if (autoDrawBackground)
                {
                    redrawRequested = true;
                    super.$invalidateDisplayList();
                }
            }
            return;
        }// end function

        override protected function getCurrentRendererState() : String
        {
            if (this.mouseDown)
            {
            }
            if (hasState("down"))
            {
                return "down";
            }
            return super.getCurrentRendererState();
        }// end function

        protected function mouseDownHandler(event:MouseEvent) : void
        {
            this.mouseDown = true;
            var _loc_2:* = systemManager.getSandboxRoot();
            _loc_2.addEventListener(MouseEvent.MOUSE_UP, this.mouseUpHandler, true);
            _loc_2.addEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, this.mouseUpHandler);
            return;
        }// end function

        protected function mouseUpHandler(event:Event) : void
        {
            this.mouseDown = false;
            var _loc_2:* = systemManager.getSandboxRoot();
            _loc_2.removeEventListener(MouseEvent.MOUSE_UP, this.mouseUpHandler, true);
            _loc_2.removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, this.mouseUpHandler);
            return;
        }// end function

    }
}
