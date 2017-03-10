package com.tinychat.model.api
{
    import org.osflash.signals.*;

    public interface Achievement
    {

        public function Achievement();

        function get achievement() : String;

        function get achievementChange() : ISignal;

    }
}
