package com.tinychat.ui.layouts.video
{
    import __AS3__.vec.*;
    import com.tinychat.ui.layouts.*;
    import mx.core.*;
    import spark.layouts.supportClasses.*;

    public class PromotedVideoLayout extends LayoutBase
    {
        private var _aspectRatio:Number;
        private var _demotedElementGap:Number;
        private var _promotedElementGap:Number;
        private var _promotedElementSizeRatio:Number;
        private var algorithm:RowVideoLayoutAlgorithm;

        public function PromotedVideoLayout()
        {
            this._aspectRatio = 4 / 3;
            this._demotedElementGap = 0;
            this._promotedElementGap = 0;
            this._promotedElementSizeRatio = 0.3;
            return;
        }// end function

        public function set aspectRatio(param1:Number) : void
        {
            this._aspectRatio = param1;
            return;
        }// end function

        public function set promotedElementGap(param1:Number) : void
        {
            this._promotedElementGap = param1;
            return;
        }// end function

        public function set demotedElementGap(param1:Number) : void
        {
            this._demotedElementGap = param1;
            return;
        }// end function

        public function set promotedElementSizeRatio(param1:Number) : void
        {
            this._promotedElementSizeRatio = Math.min(param1, 1);
            return;
        }// end function

        override public function updateDisplayList(param1:Number, param2:Number) : void
        {
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            var _loc_5:Number = NaN;
            var _loc_6:Number = NaN;
            var _loc_7:Number = NaN;
            var _loc_8:Number = NaN;
            var _loc_9:Number = NaN;
            var _loc_10:Number = NaN;
            var _loc_11:IVisualElement = null;
            var _loc_12:Number = NaN;
            var _loc_13:Number = NaN;
            var _loc_14:Number = NaN;
            if (target.numElements == 0)
            {
                return;
            }
            if (this._aspectRatio > 1)
            {
                _loc_12 = this._aspectRatio;
            }
            else
            {
                _loc_12 = 1 / this._aspectRatio;
            }
            if (param1 / param2 < 1)
            {
                _loc_13 = (param2 - this._promotedElementGap) * this._promotedElementSizeRatio;
                _loc_3 = Math.min(param1, _loc_13 * _loc_12);
                _loc_4 = _loc_3 / _loc_12;
                _loc_5 = (param1 - _loc_3) / 2;
                _loc_6 = this._promotedElementGap;
                _loc_9 = 0;
                _loc_10 = _loc_6 + _loc_4 + this._promotedElementGap;
                _loc_7 = param1;
                _loc_8 = param2 - _loc_10 - this._promotedElementGap;
            }
            else
            {
                _loc_14 = (param1 - this._promotedElementGap) * this._promotedElementSizeRatio;
                _loc_4 = Math.min(param2, _loc_14 / _loc_12);
                _loc_3 = _loc_4 * _loc_12;
                _loc_5 = this._promotedElementGap;
                _loc_6 = (param2 - _loc_4) / 2;
                _loc_9 = _loc_5 + _loc_3 + this._promotedElementGap;
                _loc_10 = 0;
                _loc_7 = param1 - _loc_9 - this._promotedElementGap;
                _loc_8 = param2;
            }
            if (!this.algorithm)
            {
                this.algorithm = new RowVideoLayoutAlgorithm(_loc_7, _loc_8, _loc_9, _loc_10, this._demotedElementGap, this._aspectRatio);
            }
            else
            {
                this.algorithm.updateVariables(_loc_7, _loc_8, _loc_9, _loc_10, this._demotedElementGap, this._aspectRatio);
            }
            _loc_11 = target.getElementAt(0);
            _loc_11.setLayoutBoundsSize(Math.round(_loc_3), Math.round(_loc_4));
            _loc_11.setLayoutBoundsPosition(Math.round(_loc_5), Math.round(_loc_6));
            if (target.numElements > 1)
            {
                this.algorithm.layoutElements(this.demotedElements);
            }
            return;
        }// end function

        private function get demotedElements() : Vector.<Layoutable>
        {
            var _loc_1:* = new Vector.<Layoutable>;
            var _loc_2:uint = 1;
            while (_loc_2 < target.numElements)
            {
                
                _loc_1.push(new IVisualElementLayoutable(target.getElementAt(_loc_2)));
                _loc_2 = _loc_2 + 1;
            }
            return _loc_1;
        }// end function

    }
}
