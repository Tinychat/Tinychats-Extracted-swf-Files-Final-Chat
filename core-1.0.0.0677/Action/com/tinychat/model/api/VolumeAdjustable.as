package com.tinychat.model.api
{
    import org.osflash.signals.*;

    public interface VolumeAdjustable
    {

        public function VolumeAdjustable();

        function get volume() : Number;

        function set volume(param1:Number) : void;

        function get volumeChanged() : ISignal;

    }
}
