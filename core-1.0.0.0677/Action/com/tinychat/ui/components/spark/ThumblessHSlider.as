package com.tinychat.ui.components.spark
{
    import flash.events.*;
    import flash.geom.*;
    import mx.events.*;
    import spark.components.*;

    public class ThumblessHSlider extends HSlider
    {
        private static var _skinParts:Object = {dataTip:false, track:false, thumb:false};

        public function ThumblessHSlider()
        {
            return;
        }// end function

        override protected function pointToValue(param1:Number, param2:Number) : Number
        {
            if (!track)
            {
                return 0;
            }
            var _loc_3:* = maximum - minimum;
            return minimum + param1 / track.getLayoutBoundsWidth() * _loc_3;
        }// end function

        override protected function track_mouseDownHandler(event:MouseEvent) : void
        {
            super.track_mouseDownHandler(event);
            systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_MOVE, this.system_mouseMoveHandler, true);
            systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_UP, system_mouseUpHandler, true);
            systemManager.getSandboxRoot().addEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, system_mouseUpHandler);
            return;
        }// end function

        override protected function system_mouseMoveHandler(event:MouseEvent) : void
        {
            if (!track)
            {
                return;
            }
            var _loc_2:* = track.globalToLocal(new Point(event.stageX, event.stageY));
            var _loc_3:* = this.pointToValue(_loc_2.x, _loc_2.y);
            _loc_3 = nearestValidValue(_loc_3, snapInterval);
            if (getStyle("liveDragging") === true)
            {
                setValue(_loc_3);
                dispatchEvent(new Event(Event.CHANGE));
            }
            else
            {
                pendingValue = _loc_3;
            }
            return;
        }// end function

        override protected function measure() : void
        {
            super.measure();
            measuredWidth = 10000;
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
