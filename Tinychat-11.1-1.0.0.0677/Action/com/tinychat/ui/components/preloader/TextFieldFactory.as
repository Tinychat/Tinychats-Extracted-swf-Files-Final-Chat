package com.tinychat.ui.components.preloader
{
    import flash.text.*;

    public class TextFieldFactory extends Object
    {

        public function TextFieldFactory()
        {
            return;
        }// end function

        public static function newInstance() : TextField
        {
            var _loc_1:* = new TextFormat();
            _loc_1.color = 16777215;
            _loc_1.font = "Helvetica";
            _loc_1.size = 12;
            _loc_1.align = TextFormatAlign.CENTER;
            var _loc_2:* = new TextField();
            _loc_2.defaultTextFormat = _loc_1;
            _loc_2.autoSize = TextFieldAutoSize.CENTER;
            _loc_2.multiline = true;
            _loc_2.wordWrap = true;
            _loc_2.selectable = false;
            _loc_2.width = 300;
            return _loc_2;
        }// end function

    }
}
