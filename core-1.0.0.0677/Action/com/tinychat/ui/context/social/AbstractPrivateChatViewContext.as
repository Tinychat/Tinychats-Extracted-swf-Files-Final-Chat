package com.tinychat.ui.context.social
{
    import com.tinychat.ui.components.popupmenu.*;
    import flash.display.*;
    import org.robotlegs.core.*;
    import org.robotlegs.utilities.modular.mvcs.*;

    public class AbstractPrivateChatViewContext extends ModuleContext
    {
        private var popupMenu:UserPopupMenu;
        private var popupMenuMediator:Class;

        public function AbstractPrivateChatViewContext(param1:DisplayObjectContainer, param2:IInjector, param3:UserPopupMenu, param4:Class)
        {
            this.popupMenu = param3;
            this.popupMenuMediator = param4;
            super(param1, true, param2);
            return;
        }// end function

        override protected function mapInjections() : void
        {
            mediatorMap.mapView(TinychatUserPopupMenu, this.popupMenuMediator, UserPopupMenu, false);
            mediatorMap.createMediator(this.popupMenu);
            super.mapInjections();
            return;
        }// end function

        override public function dispose() : void
        {
            mediatorMap.removeMediatorByView(this.popupMenu);
            super.dispose();
            return;
        }// end function

    }
}
