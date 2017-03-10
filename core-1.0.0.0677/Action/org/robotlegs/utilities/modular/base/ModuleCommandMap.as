package org.robotlegs.utilities.modular.base
{
    import org.robotlegs.base.*;
    import org.robotlegs.core.*;
    import org.robotlegs.utilities.modular.core.*;

    public class ModuleCommandMap extends CommandMap implements IModuleCommandMap
    {

        public function ModuleCommandMap(eventDispatcher:IModuleEventDispatcher, injector:IInjector, reflector:IReflector)
        {
            super(eventDispatcher, injector, reflector);
            return;
        }// end function

    }
}
