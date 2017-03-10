package org.bytearray.gif.events
{
    import flash.events.*;
    import org.bytearray.gif.frames.*;

    public class FrameEvent extends Event
    {
        public var frame:GIFFrame;
        public static const FRAME_RENDERED:String = "rendered";

        public function FrameEvent(pType:String, pFrame:GIFFrame)
        {
            super(pType, false, false);
            this.frame = pFrame;
            return;
        }// end function

    }
}
