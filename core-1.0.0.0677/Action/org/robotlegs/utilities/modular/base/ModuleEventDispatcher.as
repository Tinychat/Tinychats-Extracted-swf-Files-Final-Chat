package org.robotlegs.utilities.modular.base
{
    import flash.events.*;

    public class ModuleEventDispatcher extends EventDispatcher implements IModuleEventDispatcher
    {

        public function ModuleEventDispatcher(target:IEventDispatcher = null)
        {
            super(target);
            return;
        }// end function

    }
}
