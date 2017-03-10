package org.bytearray.gif.events
{
    import flash.events.*;
    import flash.geom.*;

    public class GIFPlayerEvent extends Event
    {
        public var rect:Rectangle;
        public static const COMPLETE:String = "complete";

        public function GIFPlayerEvent(pType:String, pRect:Rectangle)
        {
            super(pType, false, false);
            this.rect = pRect;
            return;
        }// end function

    }
}
