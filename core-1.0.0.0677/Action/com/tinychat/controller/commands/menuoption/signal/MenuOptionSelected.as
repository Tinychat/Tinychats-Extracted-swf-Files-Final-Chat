package com.tinychat.controller.commands.menuoption.signal
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.menuoption.*;
    import com.tinychat.model.signals.*;

    public class MenuOptionSelected extends AbstractReadOnlySignal
    {

        public function MenuOptionSelected()
        {
            super(Identity, MenuOption);
            return;
        }// end function

        public function dispatch(param1:Identity, param2:MenuOption) : void
        {
            signal.dispatch(param1, param2);
            return;
        }// end function

    }
}
