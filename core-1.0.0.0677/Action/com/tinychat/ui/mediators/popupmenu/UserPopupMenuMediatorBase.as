package com.tinychat.ui.mediators.popupmenu
{
    import com.tinychat.controller.commands.menuoption.signal.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.menuoption.*;
    import com.tinychat.ui.components.popupmenu.*;
    import com.tinychat.ui.context.popupmenu.*;
    import flash.errors.*;
    import mx.collections.*;
    import org.robotlegs.mvcs.*;

    public class UserPopupMenuMediatorBase extends Mediator
    {
        public var selected:MenuOptionSelected;
        public var contextFactory:PopupMenuContextFactory;
        protected var view:UserPopupMenu;

        public function UserPopupMenuMediatorBase(param1:UserPopupMenu)
        {
            this.view = param1;
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.contextFactory = this.contextFactory;
            this.view.dataProvider = new ArrayList(this.menuOptions);
            this.view.selected.add(this.selectedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.view.selected.remove(this.selectedHandler);
            return;
        }// end function

        protected function get menuOptions() : Array
        {
            throw new IllegalOperationError("Must be over-ridden in sub-class.");
        }// end function

        private function selectedHandler(param1:RenameableUser, param2:MenuOption) : void
        {
            this.selected.dispatch(param1, param2);
            return;
        }// end function

    }
}
