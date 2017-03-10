package com.tinychat.ui.components.spark
{
    import spark.components.*;
    import spark.components.supportClasses.*;

    public class TitleDisplay extends SkinnableContainer
    {
        public var textDisplay:TextBase;
        private static var _skinParts:Object = {textDisplay:true, contentGroup:false};

        public function TitleDisplay()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
