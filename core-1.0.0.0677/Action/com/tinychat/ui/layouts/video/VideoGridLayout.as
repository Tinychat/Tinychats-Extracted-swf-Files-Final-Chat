package com.tinychat.ui.layouts.video
{
    import mx.core.*;
    import spark.layouts.supportClasses.*;

    public class VideoGridLayout extends LayoutBase
    {
        private var _aspectRatio:Number;
        private var _maxColumnCount:uint;
        private var _maxRowCount:uint;
        private var _gap:Number;
        private var numberOfColumnsTable:Object;

        public function VideoGridLayout()
        {
            this._aspectRatio = 4 / 3;
            this._maxColumnCount = 3;
            this._maxRowCount = 3;
            this._gap = 0;
            this.numberOfColumnsTable = {};
            return;
        }// end function

        public function set aspectRatio(param1:Number) : void
        {
            this._aspectRatio = param1;
            return;
        }// end function

        public function set maxColumnCount(param1:uint) : void
        {
            this._maxColumnCount = param1;
            return;
        }// end function

        public function set maxRowCount(param1:uint) : void
        {
            this._maxRowCount = param1;
            return;
        }// end function

        public function set gap(param1:Number) : void
        {
            this._gap = param1;
            return;
        }// end function

        override public function updateDisplayList(param1:Number, param2:Number) : void
        {
            var _loc_3:IVisualElement = null;
            var _loc_4:Number = NaN;
            var _loc_5:Number = NaN;
            var _loc_6:Number = NaN;
            var _loc_7:Number = NaN;
            var _loc_12:uint = 0;
            var _loc_13:uint = 0;
            super.updateDisplayList(param1, param2);
            var _loc_8:* = this.getNumberOfColumns(param1 / param2);
            var _loc_9:* = Math.floor(this.numberOfElements / _loc_8);
            var _loc_10:* = param1 - (_loc_8 - 1) * this._gap;
            var _loc_11:int = 0;
            while (_loc_11 < target.numElements)
            {
                
                _loc_3 = target.getElementAt(_loc_11);
                if (this._aspectRatio > 1)
                {
                    _loc_4 = _loc_10 / _loc_8;
                    _loc_5 = _loc_4 / this._aspectRatio;
                }
                else
                {
                    _loc_4 = param1 / target.numElements * this._aspectRatio;
                    _loc_5 = param2 / target.numElements;
                }
                _loc_12 = _loc_11 % _loc_8;
                _loc_13 = Math.floor(_loc_11 / _loc_8);
                _loc_6 = _loc_4 * _loc_12 + uint(_loc_12 != 0) * this._gap * _loc_12;
                _loc_7 = _loc_5 * _loc_13 + uint(_loc_13 != 0) * this._gap * _loc_13;
                _loc_3.setLayoutBoundsSize(_loc_4, _loc_5);
                _loc_3.setLayoutBoundsPosition(_loc_6, _loc_7);
                _loc_11 = _loc_11 + 1;
            }
            return;
        }// end function

        private function getNumberOfColumns(param1:Number) : uint
        {
            if (this.numberOfColumnsTable.hasOwnProperty(param1))
            {
                if (this.numberOfColumnsTable[param1].hasOwnProperty(this.numberOfElements))
                {
                    return this.numberOfColumnsTable[param1][this.numberOfElements];
                }
            }
            else
            {
                this.numberOfColumnsTable[param1] = {};
            }
            var _loc_2:uint = 1;
            while (this.numberOfElements > _loc_2 * Math.floor(_loc_2 * param1))
            {
                
                _loc_2 = _loc_2 + 1;
            }
            this.numberOfColumnsTable[param1][this.numberOfElements] = _loc_2;
            return _loc_2;
        }// end function

        private function get numberOfElements() : uint
        {
            return target.numElements;
        }// end function

    }
}
