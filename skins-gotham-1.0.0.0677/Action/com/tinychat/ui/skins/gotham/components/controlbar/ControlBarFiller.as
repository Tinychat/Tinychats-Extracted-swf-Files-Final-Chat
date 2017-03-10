package com.tinychat.ui.skins.gotham.components.controlbar
{
    import mx.graphics.*;
    import spark.primitives.*;

    public class ControlBarFiller extends Rect
    {

        public function ControlBarFiller()
        {
            this.fill = this._ControlBarFiller_LinearGradient1_c();
            return;
        }// end function

        private function _ControlBarFiller_LinearGradient1_c() : LinearGradient
        {
            var _loc_1:* = new LinearGradient();
            _loc_1.rotation = 90;
            _loc_1.entries = [this._ControlBarFiller_GradientEntry1_c(), this._ControlBarFiller_GradientEntry2_c()];
            return _loc_1;
        }// end function

        private function _ControlBarFiller_GradientEntry1_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16777215;
            return _loc_1;
        }// end function

        private function _ControlBarFiller_GradientEntry2_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 14474460;
            return _loc_1;
        }// end function

    }
}
