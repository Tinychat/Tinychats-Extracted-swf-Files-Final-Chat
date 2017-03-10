package com.tinychat.model.broadcast.base
{
    import com.tinychat.model.api.*;
    import org.osflash.signals.*;

    public interface Broadcasts
    {

        public function Broadcasts();

        function get started() : ISignal;

        function get stopped() : ISignal;

        function get(param1:Identity) : Broadcast;

        function has(param1:Identity) : Boolean;

        function get all() : Array;

    }
}
