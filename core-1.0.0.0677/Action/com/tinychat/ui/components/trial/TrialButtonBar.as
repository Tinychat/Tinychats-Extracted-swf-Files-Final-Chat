package com.tinychat.ui.components.trial
{
    import spark.components.*;

    public class TrialButtonBar extends SkinnableContainer
    {
        private static var _skinParts:Object = {contentGroup:false};

        public function TrialButtonBar()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
