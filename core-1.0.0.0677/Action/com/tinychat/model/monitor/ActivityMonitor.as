package com.tinychat.model.monitor
{

    public interface ActivityMonitor extends Activity
    {

        public function ActivityMonitor();

        function get polling() : Boolean;

        function get timePolling() : uint;

        function startActivityPolling(param1:uint, param2:Function = null) : void;

        function stopActivityPolling() : void;

    }
}
