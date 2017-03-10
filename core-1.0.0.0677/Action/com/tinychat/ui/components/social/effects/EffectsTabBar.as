package com.tinychat.ui.components.social.effects
{
    import spark.components.*;

    public class EffectsTabBar extends TabBar
    {
        private static var _skinParts:Object = {dataGroup:false};

        public function EffectsTabBar()
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
