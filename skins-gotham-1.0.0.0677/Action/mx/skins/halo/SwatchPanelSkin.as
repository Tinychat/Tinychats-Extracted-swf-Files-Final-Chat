package mx.skins.halo
{
    import mx.skins.*;

    public class SwatchPanelSkin extends Border
    {
        static const VERSION:String = "4.6.0.23201";

        public function SwatchPanelSkin()
        {
            return;
        }// end function

        override protected function updateDisplayList(w:Number, h:Number) : void
        {
            var _loc_3:uint = 0;
            var _loc_4:uint = 0;
            var _loc_5:uint = 0;
            var _loc_6:uint = 0;
            var _loc_7:Number = NaN;
            var _loc_8:Number = NaN;
            super.updateDisplayList(w, h);
            if (name == "swatchPanelBorder")
            {
                _loc_3 = getStyle("backgroundColor");
                _loc_4 = getStyle("borderColor");
                _loc_5 = getStyle("highlightColor");
                _loc_6 = getStyle("shadowColor");
                _loc_7 = 0;
                _loc_8 = 0;
                graphics.clear();
                drawRoundRect(_loc_7, _loc_8, w, h, 0, _loc_4, 1);
                drawRoundRect((_loc_7 + 1), (_loc_8 + 1), (w - 1), (h - 1), 0, _loc_6, 1);
                drawRoundRect((_loc_7 + 1), (_loc_8 + 1), w - 2, h - 2, 0, _loc_5, 1);
                drawRoundRect(_loc_7 + 2, _loc_8 + 2, w - 4, h - 4, 0, [_loc_3, _loc_5], 1, verticalGradientMatrix(_loc_7 + 2, _loc_8 + 2, w - 4, h - 4));
            }
            return;
        }// end function

    }
}
