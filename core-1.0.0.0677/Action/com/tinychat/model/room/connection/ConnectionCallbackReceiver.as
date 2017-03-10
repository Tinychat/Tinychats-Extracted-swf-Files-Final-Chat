package com.tinychat.model.room.connection
{
    import org.osflash.signals.*;

    public interface ConnectionCallbackReceiver extends MutableConnection
    {

        public function ConnectionCallbackReceiver();

        function get avon() : ISignal;

        function get avons() : ISignal;

        function get avoff() : ISignal;

        function get banlist() : ISignal;

        function get banned() : ISignal;

        function get deop() : ISignal;

        function get from_owner() : ISignal;

        function get join() : ISignal;

        function get joins() : ISignal;

        function get joinsdone() : ISignal;

        function get kick() : ISignal;

        function get nick() : ISignal;

        function get gift() : ISignal;

        function get notice() : ISignal;

        function get oper() : ISignal;

        function get opers() : ISignal;

        function get point() : ISignal;

        function get points() : ISignal;

        function get privmsg() : ISignal;

        function get pro() : ISignal;

        function get pros() : ISignal;

        function get quit() : ISignal;

        function get registered() : ISignal;

        function get startbanlist() : ISignal;

        function get topic() : ISignal;

        function get viewcount() : ISignal;

    }
}
