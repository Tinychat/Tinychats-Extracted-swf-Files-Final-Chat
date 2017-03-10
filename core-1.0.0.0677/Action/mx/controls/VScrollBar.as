package mx.controls
{
    import flash.ui.*;
    import mx.controls.scrollClasses.*;

    public class VScrollBar extends ScrollBar
    {
        static const VERSION:String = "4.6.0.23201";

        public function VScrollBar()
        {
            super.direction = ScrollBarDirection.VERTICAL;
            return;
        }// end function

        override public function set direction(value:String) : void
        {
            return;
        }// end function

        override public function get minWidth() : Number
        {
            return _minWidth;
        }// end function

        override public function get minHeight() : Number
        {
            return _minHeight;
        }// end function

        override protected function measure() : void
        {
            super.measure();
            measuredWidth = _minWidth;
            measuredHeight = _minHeight;
            return;
        }// end function

        override function isScrollBarKey(key:uint) : Boolean
        {
            if (key == Keyboard.UP)
            {
                lineScroll(-1);
                return true;
            }
            if (key == Keyboard.DOWN)
            {
                lineScroll(1);
                return true;
            }
            if (key == Keyboard.PAGE_UP)
            {
                pageScroll(-1);
                return true;
            }
            if (key == Keyboard.PAGE_DOWN)
            {
                pageScroll(1);
                return true;
            }
            return super.isScrollBarKey(key);
        }// end function

    }
}
