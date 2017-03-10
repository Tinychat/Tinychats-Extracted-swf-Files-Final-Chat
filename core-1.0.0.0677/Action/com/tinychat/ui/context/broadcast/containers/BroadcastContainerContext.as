package com.tinychat.ui.context.broadcast.containers
{
    import com.tinychat.model.api.*;
    import flash.display.*;
    import org.robotlegs.core.*;
    import org.robotlegs.utilities.modular.mvcs.*;

    public class BroadcastContainerContext extends ModuleContext
    {
        private var broadcast:Broadcast;

        public function BroadcastContainerContext(param1:DisplayObjectContainer, param2:IInjector, param3:Broadcast)
        {
            this.broadcast = param3;
            super(param1, true, param2);
            return;
        }// end function

        override public function dispose() : void
        {
            this.broadcast = null;
            mediatorMap.removeMediatorByView(contextView);
            super.dispose();
            return;
        }// end function

        override protected function mapInjections() : void
        {
            super.mapInjections();
            var _loc_1:* = injector.mapValue(UserBroadcast, this.broadcast);
            injector.mapRule(RenameableUser, _loc_1);
            injector.mapRule(UserIdentity, _loc_1);
            return;
        }// end function

    }
}
