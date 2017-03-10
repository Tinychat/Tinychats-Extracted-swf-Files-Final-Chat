package com.tinychat.ui.components.social.effects.video
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.videoeffects.*;
    import flash.display.*;
    import org.osflash.signals.*;

    public class CameraBroadcastVideoFilter extends AbstractDecoratedCameraBroadcast
    {
        private var _filter:VideoFilter;
        private var dummy:Signal;

        public function CameraBroadcastVideoFilter(param1:CameraBroadcast, param2:VideoFilter)
        {
            super(param1);
            this._filter = param2;
            this.dummy = new Signal();
            return;
        }// end function

        override public function get name() : String
        {
            return this._filter.name;
        }// end function

        override public function get videoFilter() : VideoFilter
        {
            return this._filter;
        }// end function

        override public function set videoFilter(param1:VideoFilter) : void
        {
            return;
        }// end function

        override public function get videoFilterChanged() : ISignal
        {
            return this.dummy;
        }// end function

        override public function applyVideoFiltersTo(param1:DisplayObject) : void
        {
            var _loc_2:Array = null;
            var _loc_3:AdvancedShaderFilter = null;
            if (this._filter)
            {
                _loc_2 = [];
                _loc_3 = this._filter.createFilter();
                _loc_3.update(param1.width, param1.height);
                _loc_2.push(_loc_3);
                param1.filters = _loc_2;
            }
            return;
        }// end function

    }
}
