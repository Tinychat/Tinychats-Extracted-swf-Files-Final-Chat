package com.tinychat.model.api
{
    import org.osflash.signals.*;

    public interface Renameable extends Named
    {

        public function Renameable();

        function get renamed() : ISignal;

    }
}
