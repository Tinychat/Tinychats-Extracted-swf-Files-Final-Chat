package com.tinychat.model.room
{
    import __AS3__.vec.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.room.connection.callbacks.arguments.*;
    import com.tinychat.model.room.connection.calls.*;
    import mx.collections.*;
    import org.osflash.signals.*;

    public class BanListProxy extends Object
    {
        private var client:ConnectionCallbackReceiver;
        private var _list:IdItemList;
        private var _loaded:Signal;

        public function BanListProxy(param1:ConnectionCallbackReceiver)
        {
            this.client = param1;
            this._list = new IdItemList();
            this._loaded = new Signal();
            param1.banlist.add(this.banlistHandler);
            param1.startbanlist.add(this.startbanlistHandler);
            return;
        }// end function

        public function get list() : IList
        {
            return this._list;
        }// end function

        public function get loaded() : ISignal
        {
            return this._loaded;
        }// end function

        public function load() : void
        {
            this.client.call(new RoomCallBanlist());
            return;
        }// end function

        public function ban(param1:UserIdentity) : void
        {
            this.client.call(new RoomCallBan(param1));
            return;
        }// end function

        public function forgive(param1:Vector.<UserIdentity>) : void
        {
            var _loc_2:UserIdentity = null;
            for each (_loc_2 in param1)
            {
                
                this.client.call(new RoomCallForgive(_loc_2));
            }
            this.load();
            return;
        }// end function

        public function forgiveByName(param1:String) : Boolean
        {
            var _loc_2:UserIdentity = null;
            for each (_loc_2 in this._list.toArray())
            {
                
                if (_loc_2.name == param1)
                {
                    this.forgive(this.Vector.<UserIdentity>([_loc_2]));
                    return true;
                }
            }
            return false;
        }// end function

        private function banlistHandler(param1:RoomCallbackBanlistArguments) : void
        {
            var _loc_2:UserIdentity = null;
            for each (_loc_2 in param1.toUsers())
            {
                
                if (!this._list.hasItemWith(_loc_2))
                {
                    this._list.addItem(new SelectableUserListItem(_loc_2));
                }
            }
            this._loaded.dispatch();
            return;
        }// end function

        private function startbanlistHandler() : void
        {
            this._list.removeAll();
            return;
        }// end function

    }
}
