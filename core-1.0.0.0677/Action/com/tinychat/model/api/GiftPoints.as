package com.tinychat.model.api
{
    import org.osflash.signals.*;

    public interface GiftPoints
    {

        public function GiftPoints();

        function get points() : uint;

        function get pointsChange() : ISignal;

    }
}
