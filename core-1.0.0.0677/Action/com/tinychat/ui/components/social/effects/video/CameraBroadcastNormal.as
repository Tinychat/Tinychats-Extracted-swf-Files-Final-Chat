package com.tinychat.ui.components.social.effects.video
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.videoeffects.*;
    import flash.display.*;
    import org.osflash.signals.*;

    public class CameraBroadcastNormal extends AbstractDecoratedCameraBroadcast
    {
        private var dummy:Signal;

        public function CameraBroadcastNormal(param1:CameraBroadcast)
        {
            super(param1);
            this.dummy = new Signal();
            return;
        }// end function

        override public function get name() : String
        {
            return "Normal";
        }// end function

        override public function get videoFilter() : VideoFilter
        {
            return null;
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
            param1.filters = [];
            return;
        }// end function

    }
}
