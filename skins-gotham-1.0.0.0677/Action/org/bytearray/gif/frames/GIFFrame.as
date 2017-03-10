package org.bytearray.gif.frames
{
    import flash.display.*;

    public class GIFFrame extends Object
    {
        public var bitmapData:BitmapData;
        public var delay:int;

        public function GIFFrame(pImage:BitmapData, pDelay:int)
        {
            this.bitmapData = pImage;
            this.delay = pDelay;
            return;
        }// end function

    }
}
