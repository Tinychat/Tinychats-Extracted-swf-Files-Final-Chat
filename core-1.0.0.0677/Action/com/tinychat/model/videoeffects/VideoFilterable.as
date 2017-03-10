package com.tinychat.model.videoeffects
{
    import flash.display.*;
    import org.osflash.signals.*;

    public interface VideoFilterable
    {

        public function VideoFilterable();

        function get videoFilter() : VideoFilter;

        function set videoFilter(param1:VideoFilter) : void;

        function get videoFilterChanged() : ISignal;

        function applyVideoFiltersTo(param1:DisplayObject) : void;

    }
}
