package mx.controls.scrollClasses
{
    import flash.events.*;
    import flash.geom.*;
    import mx.controls.*;
    import mx.events.*;

    public class ScrollThumb extends Button
    {
        private var ymin:Number;
        private var ymax:Number;
        private var datamin:Number;
        private var datamax:Number;
        private var lastY:Number;
        static const VERSION:String = "4.6.0.23201";

        public function ScrollThumb()
        {
            explicitMinHeight = 10;
            stickyHighlighting = true;
            return;
        }// end function

        override function buttonReleased() : void
        {
            super.buttonReleased();
            this.stopDragThumb();
            return;
        }// end function

        function setRange(ymin:Number, ymax:Number, datamin:Number, datamax:Number) : void
        {
            this.ymin = ymin;
            this.ymax = ymax;
            this.datamin = datamin;
            this.datamax = datamax;
            return;
        }// end function

        private function stopDragThumb() : void
        {
            var _loc_1:* = ScrollBar(parent);
            _loc_1.isScrolling = false;
            _loc_1.dispatchScrollEvent(_loc_1.oldPosition, ScrollEventDetail.THUMB_POSITION);
            _loc_1.oldPosition = NaN;
            systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_MOVE, this.mouseMoveHandler, true);
            return;
        }// end function

        override protected function mouseDownHandler(event:MouseEvent) : void
        {
            super.mouseDownHandler(event);
            var _loc_2:* = ScrollBar(parent);
            _loc_2.oldPosition = _loc_2.scrollPosition;
            this.lastY = event.localY;
            systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_MOVE, this.mouseMoveHandler, true);
            return;
        }// end function

        private function mouseMoveHandler(event:MouseEvent) : void
        {
            if (this.ymin == this.ymax)
            {
                return;
            }
            var _loc_2:* = new Point(event.stageX, event.stageY);
            _loc_2 = globalToLocal(_loc_2);
            var _loc_3:* = _loc_2.y - this.lastY;
            _loc_3 = _loc_3 + y;
            if (_loc_3 < this.ymin)
            {
                _loc_3 = this.ymin;
            }
            else if (_loc_3 > this.ymax)
            {
                _loc_3 = this.ymax;
            }
            var _loc_4:* = ScrollBar(parent);
            _loc_4.isScrolling = true;
            $y = _loc_3;
            var _loc_5:* = _loc_4.scrollPosition;
            var _loc_6:* = Math.round((this.datamax - this.datamin) * (y - this.ymin) / (this.ymax - this.ymin)) + this.datamin;
            _loc_4.scrollPosition = _loc_6;
            _loc_4.dispatchScrollEvent(_loc_5, ScrollEventDetail.THUMB_TRACK);
            event.updateAfterEvent();
            return;
        }// end function

    }
}
