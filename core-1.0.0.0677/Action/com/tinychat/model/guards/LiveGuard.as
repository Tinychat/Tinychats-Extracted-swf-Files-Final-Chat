package com.tinychat.model.guards
{

    public interface LiveGuard extends IGuard
    {

        public function LiveGuard();

        function addChangeListener(param1:Function) : void;

        function removeChangeListener(param1:Function) : void;

    }
}
