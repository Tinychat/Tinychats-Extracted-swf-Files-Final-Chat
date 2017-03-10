package com.tinychat.ui.layouts.video
{
    import __AS3__.vec.*;
    import com.tinychat.ui.layouts.*;

    public class RowVideoLayoutAlgorithm extends Object
    {
        private var width:Number;
        private var height:Number;
        private var x:Number;
        private var y:Number;
        private var gap:Number;
        private var aspectRatio:Number;
        private var numberOfRows:uint;
        private var elementsPerRow:uint;
        private var elementWidth:Number;
        private var elementHeight:Number;

        public function RowVideoLayoutAlgorithm(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number)
        {
            this.updateVariables(param1, param2, param3, param4, param5, param6);
            return;
        }// end function

        public function updateVariables(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
        {
            this.width = param1;
            this.height = param2;
            this.x = param3;
            this.y = param4;
            this.gap = param5;
            this.aspectRatio = param6;
            return;
        }// end function

        public function layoutElements(param1:Vector.<Layoutable>) : void
        {
            var _loc_2:Layoutable = null;
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            var _loc_5:uint = 0;
            this.calculateElementSize(param1.length);
            var _loc_6:uint = 0;
            var _loc_7:* = this.x + (this.width - this.elementWidth * this.elementsPerRow - (this.elementsPerRow - 1) * this.gap) / 2;
            var _loc_8:* = this.y + (this.height - this.numberOfRows * this.elementHeight - (this.numberOfRows - 1) * this.gap) / 2;
            var _loc_9:* = param1.length % this.elementsPerRow == 0 ? (this.elementsPerRow) : (param1.length % this.elementsPerRow);
            var _loc_10:uint = 0;
            while (_loc_10 < param1.length)
            {
                
                _loc_2 = param1[_loc_10];
                if (Math.floor(_loc_10 / this.elementsPerRow) > _loc_6)
                {
                    _loc_6 = _loc_6 + 1;
                    if (_loc_6 == (this.numberOfRows - 1))
                    {
                        _loc_7 = this.x + (this.width - this.elementWidth * _loc_9 - (_loc_9 - 1) * this.gap) / 2;
                    }
                }
                _loc_5 = _loc_10 % this.elementsPerRow;
                _loc_3 = Math.round(_loc_7 + _loc_5 * this.elementWidth + _loc_5 * this.gap);
                _loc_4 = Math.round(_loc_8 + _loc_6 * this.elementHeight + _loc_6 * this.gap);
                _loc_2.size(this.elementWidth, this.elementHeight);
                _loc_2.position(_loc_3, _loc_4);
                _loc_10 = _loc_10 + 1;
            }
            return;
        }// end function

        private function calculateElementSize(param1:Number) : void
        {
            var _loc_2:Number = NaN;
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            if (this.aspectRatio > 1)
            {
                _loc_2 = this.aspectRatio;
            }
            else
            {
                _loc_2 = 1 / this.aspectRatio;
            }
            this.elementsPerRow = param1;
            this.numberOfRows = 0;
            do
            {
                
                var _loc_5:String = this;
                var _loc_6:* = this.numberOfRows + 1;
                _loc_5.numberOfRows = _loc_6;
                this.elementsPerRow = Math.ceil(param1 / this.numberOfRows);
                _loc_3 = this.width - (this.elementsPerRow - 1) * this.gap;
                _loc_4 = (this.height - (this.numberOfRows - 1) * this.gap) / this.numberOfRows;
                this.elementWidth = Math.round(Math.min(_loc_3 / this.elementsPerRow, _loc_4 * _loc_2));
                this.elementHeight = Math.round(this.elementWidth / _loc_2);
                if (this.height - this.elementHeight * this.numberOfRows > this.elementHeight)
                {
                }
            }while (this.elementHeight > 0)
            return;
        }// end function

    }
}
