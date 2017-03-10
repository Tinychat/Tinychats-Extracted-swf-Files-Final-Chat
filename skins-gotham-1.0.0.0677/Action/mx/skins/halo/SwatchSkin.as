package mx.skins.halo
{
    import flash.display.*;
    import mx.collections.*;
    import mx.core.*;

    public class SwatchSkin extends UIComponent
    {
        var color:uint = 0;
        var colorField:String = "color";
        static const VERSION:String = "4.6.0.23201";

        public function SwatchSkin()
        {
            return;
        }// end function

        override protected function updateDisplayList(w:Number, h:Number) : void
        {
            super.updateDisplayList(w, h);
            this.updateSkin(this.color);
            return;
        }// end function

        function updateGrid(dp:IList) : void
        {
            if (name == "swatchGrid")
            {
                graphics.clear();
                this.drawGrid(dp, this.colorField);
            }
            return;
        }// end function

        function updateSkin(c:Number) : void
        {
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            var _loc_5:Number = NaN;
            var _loc_6:Number = NaN;
            var _loc_7:Number = NaN;
            var _loc_8:Number = NaN;
            var _loc_9:uint = 0;
            var _loc_10:Number = NaN;
            var _loc_2:* = graphics;
            switch(name)
            {
                case "colorPickerSwatch":
                {
                    _loc_3 = UIComponent(parent).width;
                    _loc_4 = UIComponent(parent).height;
                    if (FlexVersion.compatibilityVersion < FlexVersion.VERSION_4_0)
                    {
                        _loc_3 = _loc_3 / Math.abs(UIComponent(parent).scaleX);
                        _loc_4 = _loc_4 / Math.abs(UIComponent(parent).scaleY);
                    }
                    _loc_2.clear();
                    this.drawSwatch(0, 0, _loc_3, _loc_4, c);
                    break;
                }
                case "swatchPreview":
                {
                    _loc_5 = getStyle("previewWidth");
                    _loc_6 = getStyle("previewHeight");
                    _loc_2.clear();
                    this.drawSwatch(0, 0, _loc_5, _loc_6, c);
                    this.drawBorder(0, 0, _loc_5, _loc_6, 10066329, 16777215, 1, 1);
                    break;
                }
                case "swatchHighlight":
                {
                    _loc_7 = getStyle("swatchWidth");
                    _loc_8 = getStyle("swatchHeight");
                    _loc_9 = getStyle("swatchHighlightColor");
                    _loc_10 = getStyle("swatchHighlightSize");
                    _loc_2.clear();
                    this.drawBorder(0, 0, _loc_7, _loc_8, _loc_9, _loc_9, _loc_10, 1);
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        private function drawGrid(dp:IList, cf:String) : void
        {
            var _loc_22:Number = NaN;
            var _loc_23:Number = NaN;
            var _loc_24:Number = NaN;
            var _loc_3:* = getStyle("columnCount");
            var _loc_4:* = getStyle("horizontalGap");
            var _loc_5:* = getStyle("previewWidth");
            var _loc_6:* = getStyle("swatchGridBackgroundColor");
            var _loc_7:* = getStyle("swatchGridBorderSize");
            var _loc_8:* = getStyle("swatchHeight");
            var _loc_9:* = getStyle("swatchWidth");
            var _loc_10:* = getStyle("textFieldWidth");
            var _loc_11:* = getStyle("verticalGap");
            var _loc_12:int = 1;
            var _loc_13:int = 3;
            var _loc_14:* = dp.length;
            if (_loc_3 > _loc_14)
            {
                _loc_3 = _loc_14;
            }
            var _loc_15:* = Math.ceil(_loc_14 / _loc_3);
            if (isNaN(_loc_15))
            {
                _loc_15 = 0;
            }
            var _loc_16:* = _loc_3 * (_loc_9 - _loc_12) + _loc_12 + (_loc_3 - 1) * _loc_4 + 2 * _loc_7;
            var _loc_17:* = _loc_15 * (_loc_8 - _loc_12) + _loc_12 + (_loc_15 - 1) * _loc_11 + 2 * _loc_7;
            var _loc_18:* = _loc_5 + _loc_10 + _loc_13;
            if (_loc_16 < _loc_18)
            {
                _loc_16 = _loc_18;
            }
            this.drawFill(0, 0, _loc_16, _loc_17, _loc_6, 100);
            setActualSize(_loc_16, _loc_17);
            var _loc_19:int = 0;
            var _loc_20:int = 0;
            var _loc_21:int = 0;
            while (_loc_21 < _loc_14)
            {
                
                _loc_22 = _loc_7 + _loc_19 * (_loc_9 + _loc_4 - _loc_12);
                _loc_23 = _loc_7 + _loc_20 * (_loc_8 + _loc_11 - _loc_12);
                _loc_24 = typeof(dp.getItemAt(_loc_21)) != "object" ? (Number(dp.getItemAt(_loc_21))) : (Number(dp.getItemAt(_loc_21)[this.colorField]));
                this.drawSwatch(_loc_22, _loc_23, _loc_9, _loc_8, _loc_24);
                if (_loc_19 < (_loc_3 - 1))
                {
                    _loc_19 = _loc_19 + 1;
                }
                else
                {
                    _loc_19 = 0;
                    _loc_20 = _loc_20 + 1;
                }
                _loc_21 = _loc_21 + 1;
            }
            return;
        }// end function

        private function drawSwatch(x:Number, y:Number, w:Number, h:Number, c:Number) : void
        {
            var _loc_6:* = getStyle("swatchBorderColor");
            var _loc_7:* = getStyle("swatchBorderSize");
            if (_loc_7 == 0)
            {
                this.drawFill(x, y, w, h, c, 1);
            }
            else
            {
                if (_loc_7 >= 0)
                {
                }
                if (isNaN(_loc_7))
                {
                    this.drawFill(x, y, w, h, _loc_6, 1);
                    this.drawFill((x + 1), (y + 1), w - 2, h - 2, c, 1);
                }
                else
                {
                    this.drawFill(x, y, w, h, _loc_6, 1);
                    this.drawFill(x + _loc_7, y + _loc_7, w - 2 * _loc_7, h - 2 * _loc_7, c, 1);
                }
            }
            return;
        }// end function

        private function drawBorder(x:Number, y:Number, w:Number, h:Number, c1:Number, c2:Number, s:Number, a:Number) : void
        {
            this.drawFill(x, y, s, h, c1, a);
            this.drawFill(x, y, w, s, c1, a);
            this.drawFill(x + (w - s), y, s, h, c2, a);
            this.drawFill(x, y + (h - s), w, s, c2, a);
            return;
        }// end function

        private function drawFill(x:Number, y:Number, w:Number, h:Number, c:Number, a:Number) : void
        {
            var _loc_7:* = graphics;
            _loc_7.moveTo(x, y);
            _loc_7.beginFill(c, a);
            _loc_7.lineTo(x + w, y);
            _loc_7.lineTo(x + w, h + y);
            _loc_7.lineTo(x, h + y);
            _loc_7.lineTo(x, y);
            _loc_7.endFill();
            return;
        }// end function

    }
}
