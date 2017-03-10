package mx.controls
{
    import flash.geom.*;
    import flash.ui.*;
    import mx.controls.scrollClasses.*;
    import mx.core.*;

    public class HScrollBar extends ScrollBar
    {
        static const VERSION:String = "4.6.0.23201";

        public function HScrollBar()
        {
            super.direction = ScrollBarDirection.HORIZONTAL;
            scaleX = -1;
            rotation = -90;
            return;
        }// end function

        override public function set direction(value:String) : void
        {
            return;
        }// end function

        override public function get minWidth() : Number
        {
            return _minHeight;
        }// end function

        override public function get minHeight() : Number
        {
            return _minWidth;
        }// end function

        override function get virtualHeight() : Number
        {
            return unscaledWidth;
        }// end function

        override function get virtualWidth() : Number
        {
            return unscaledHeight;
        }// end function

        override protected function measure() : void
        {
            super.measure();
            measuredWidth = _minHeight;
            measuredHeight = _minWidth;
            return;
        }// end function

        override protected function nonDeltaLayoutMatrix() : Matrix
        {
            var _loc_1:* = new Matrix(0, 1, 1, 0);
            var _loc_2:* = super.nonDeltaLayoutMatrix();
            if (_loc_2)
            {
                _loc_1.concat(_loc_2);
            }
            return _loc_1;
        }// end function

        override function isScrollBarKey(key:uint) : Boolean
        {
            var _loc_2:int = 0;
            if (key == Keyboard.LEFT)
            {
                _loc_2 = LayoutDirection.LTR ? (-1) : (1);
                lineScroll(_loc_2);
                return true;
            }
            else if (key == Keyboard.RIGHT)
            {
                _loc_2 = LayoutDirection.LTR ? (1) : (-1);
                lineScroll(_loc_2);
                return true;
            }
            return super.isScrollBarKey(key);
        }// end function

    }
}
