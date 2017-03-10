package com.tinychat.ui.context.popupmenu
{
    import com.tinychat.model.api.*;
    import flash.display.*;
    import org.robotlegs.core.*;
    import org.robotlegs.utilities.modular.core.*;

    public interface PopupMenuContextFactory
    {

        public function PopupMenuContextFactory();

        function newInstance(param1:Identity, param2:DisplayObjectContainer, param3:IInjector) : IModuleContext;

    }
}
