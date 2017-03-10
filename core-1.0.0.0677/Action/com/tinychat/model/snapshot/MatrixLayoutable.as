package com.tinychat.model.snapshot
{
    import flash.display.*;
    import flash.geom.*;

    public class MatrixLayoutable extends Object implements Layoutable
    {
        private var source:DisplayObject;
        private var matrix:Matrix;

        public function MatrixLayoutable(param1:DisplayObject)
        {
            this.source = param1;
            this.matrix = new Matrix();
            return;
        }// end function

        public function size(param1:Number, param2:Number) : void
        {
            this.matrix.scale(param1 / this.source.width, param2 / this.source.height);
            return;
        }// end function

        public function position(param1:Number, param2:Number) : void
        {
            this.matrix.translate(param1, param2);
            return;
        }// end function

        public function drawTo(param1:BitmapData) : void
        {
            param1.draw(this.source, this.matrix, null, null, null, true);
            return;
        }// end function

    }
}
