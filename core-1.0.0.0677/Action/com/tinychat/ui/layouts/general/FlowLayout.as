package com.tinychat.ui.layouts.general
{
    import mx.core.*;
    import spark.layouts.supportClasses.*;

    public class FlowLayout extends LayoutBase
    {
        private var _borderX:Number = 0;
        private var _borderY:Number = 0;
        private var _gap:Number = 0;
        private var _horizontalAlign:String;

        public function FlowLayout()
        {
            return;
        }// end function

        public function set border(param1:Number) : void
        {
            this._borderX = param1;
            this._borderY = param1;
            this.invalidateTargetDisplayList();
            return;
        }// end function

        public function set borderX(param1:Number) : void
        {
            this._borderX = param1;
            this.invalidateTargetDisplayList();
            return;
        }// end function

        public function set borderY(param1:Number) : void
        {
            this._borderY = param1;
            this.invalidateTargetDisplayList();
            return;
        }// end function

        public function set gap(param1:Number) : void
        {
            this._gap = param1;
            this.invalidateTargetDisplayList();
            this.invalidateTargetSize();
            return;
        }// end function

        public function set horizontalAlign(param1:String) : void
        {
            this._horizontalAlign = param1;
            return;
        }// end function

        override public function updateDisplayList(param1:Number, param2:Number) : void
        {
            var _loc_8:ILayoutElement = null;
            var _loc_9:Number = NaN;
            var _loc_10:Number = NaN;
            var _loc_3:* = this._borderX;
            var _loc_4:* = this._borderY;
            var _loc_5:Number = 0;
            var _loc_6:Number = 0;
            var _loc_7:int = 0;
            while (_loc_7 < target.numElements)
            {
                
                _loc_8 = useVirtualLayout ? (target.getVirtualElementAt(_loc_7)) : (target.getElementAt(_loc_7));
                if (!_loc_8)
                {
                }
                else
                {
                    _loc_8.setLayoutBoundsSize(NaN, NaN);
                    _loc_9 = _loc_8.getLayoutBoundsWidth();
                    _loc_10 = _loc_8.getLayoutBoundsHeight();
                    if (_loc_3 + _loc_9 > param1)
                    {
                        _loc_3 = this._borderX;
                        if (_loc_7 > 0)
                        {
                            _loc_4 = _loc_4 + (_loc_10 + this._gap);
                        }
                    }
                    _loc_8.setLayoutBoundsPosition(_loc_3, _loc_4);
                    _loc_5 = Math.max(_loc_5, _loc_3 + _loc_9);
                    _loc_6 = Math.max(_loc_6, _loc_4 + _loc_10);
                    target.measuredMinWidth = _loc_5;
                    target.measuredMinHeight = _loc_6;
                    _loc_3 = _loc_3 + (_loc_9 + this._gap);
                }
                _loc_7 = _loc_7 + 1;
            }
            target.setContentSize(_loc_5 + this._borderX, _loc_6 + this._borderY);
            return;
        }// end function

        override public function measure() : void
        {
            var _loc_5:ILayoutElement = null;
            var _loc_6:Number = NaN;
            var _loc_7:Number = NaN;
            var _loc_1:Number = 0;
            var _loc_2:Number = 0;
            var _loc_3:* = target.numElements;
            var _loc_4:int = 0;
            while (_loc_4 < _loc_3)
            {
                
                _loc_5 = useVirtualLayout ? (target.getVirtualElementAt(_loc_4)) : (target.getElementAt(_loc_4));
                if (!_loc_5)
                {
                    _loc_5 = typicalLayoutElement;
                }
                _loc_6 = _loc_5.getPreferredBoundsWidth();
                _loc_7 = _loc_5.getPreferredBoundsHeight();
                _loc_1 = _loc_1 + _loc_6;
                _loc_2 = Math.max(_loc_2, _loc_7);
                _loc_4 = _loc_4 + 1;
            }
            if (_loc_3 > 0)
            {
                _loc_1 = _loc_1 + (_loc_3 - 1) * this._gap;
            }
            target.measuredWidth = _loc_1;
            target.measuredHeight = _loc_2;
            target.measuredMinWidth = _loc_1;
            target.measuredMinHeight = _loc_2;
            return;
        }// end function

        private function invalidateTargetDisplayList() : void
        {
            if (target)
            {
                target.invalidateDisplayList();
            }
            return;
        }// end function

        private function invalidateTargetSize() : void
        {
            if (target)
            {
                target.invalidateSize();
            }
            return;
        }// end function

    }
}
