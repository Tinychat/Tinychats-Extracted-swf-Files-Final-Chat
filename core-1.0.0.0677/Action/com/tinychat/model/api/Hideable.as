package com.tinychat.model.api
{
    import org.osflash.signals.*;

    public interface Hideable
    {

        public function Hideable();

        function get hidden() : ISignal;

        function get isHidden() : Boolean;

        function hide() : void;

        function unhide() : void;

    }
}
