package com.tinychat.ui.components.spark
{
    import spark.components.*;

    public class AutoSizingLabel extends Label
    {
        private var desiredFontSize:Number;
        private var truncatedAtLength:Number;

        public function AutoSizingLabel()
        {
            this.maxDisplayedLines = 1;
            return;
        }// end function

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            super.updateDisplayList(param1, param2);
            var _loc_3:* = getStyle("fontSize");
            if (isTruncated)
            {
                if (isNaN(this.desiredFontSize))
                {
                    this.desiredFontSize = _loc_3;
                }
                this.truncatedAtLength = text.length;
                setStyle("fontSize", (_loc_3 - 1));
            }
            else
            {
                if (!isNaN(this.desiredFontSize))
                {
                }
                if (this.truncatedAtLength != text.length)
                {
                }
                if (_loc_3 != this.desiredFontSize)
                {
                    setStyle("fontSize", (_loc_3 + 1));
                }
            }
            return;
        }// end function

        override public function set maxDisplayedLines(param1:int) : void
        {
            super.maxDisplayedLines = 1;
            return;
        }// end function

    }
}
