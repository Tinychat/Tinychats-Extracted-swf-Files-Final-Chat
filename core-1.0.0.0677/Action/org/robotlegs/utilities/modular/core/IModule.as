package org.robotlegs.utilities.modular.core
{
    import org.robotlegs.core.*;

    public interface IModule
    {

        public function IModule();

        function set parentInjector(value:IInjector) : void;

        function dispose() : void;

    }
}
