package com.tinychat.model.media
{
    import __AS3__.vec.*;
    import com.tinychat.controller.commands.broadcast.media.signals.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.room.connection.calls.*;
    import com.tinychat.model.youtube.*;
    import flash.utils.*;
    import org.osflash.signals.*;

    public class PlaylistProxy extends Object
    {
        private var client:ConnectionCallbackReceiver;
        private var _list:IdItemList;
        private var _loaded:Signal;
        private var _selected:Signal;
        private var _startMediaBroadcast:StartMediaBroadcast;
        private var _selectedClip:YouTubeClip;
        private var _isPlaylist:Boolean = false;
        private var _isLoopPlay:Boolean = false;
        private var _isShufflePlay:Boolean = false;
        private var _lastIndex:int = 0;

        public function PlaylistProxy(param1:ConnectionCallbackReceiver, param2:YouTubeBroadcasts, param3:StartMediaBroadcast)
        {
            this._loaded = new Signal();
            this._selected = new Signal();
            this.client = param1;
            this._list = new IdItemList();
            this._startMediaBroadcast = param3;
            param2.stopped.add(this.stoppedChangedHandler);
            return;
        }// end function

        public function get loaded() : ISignal
        {
            return this._loaded;
        }// end function

        public function get selected() : ISignal
        {
            return this._selected;
        }// end function

        private function stoppedChangedHandler(param1:Broadcast) : void
        {
            var _loc_2:* = this._list.getItemIndex(this._selectedClip);
            if (this._isPlaylist)
            {
            }
            if (_loc_2 != -1)
            {
                if (!this._isLoopPlay)
                {
                }
            }
            if (_loc_2 < (this._list.length - 1))
            {
                _loc_2 = _loc_2 < (this._list.length - 1) ? ((_loc_2 + 1)) : (0);
                setTimeout(this.startPlayList, 1500, this._list.getItemAt(_loc_2) as YouTubeClip);
                return;
            }
            this.stop();
            return;
        }// end function

        public function startPlayList(param1:YouTubeClip) : void
        {
            this._isPlaylist = true;
            this.selectedClip = param1;
            this._startMediaBroadcast.dispatch(this.selectedClip);
            return;
        }// end function

        public function set selectedClip(param1:YouTubeClip) : void
        {
            this._selectedClip = param1;
            this._selected.dispatch();
            return;
        }// end function

        public function get selectedClip() : YouTubeClip
        {
            return this._selectedClip;
        }// end function

        public function get list() : IdItemList
        {
            return this._list;
        }// end function

        public function load() : void
        {
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

        public function stop() : void
        {
            this._isPlaylist = false;
            this.selectedClip = null;
            return;
        }// end function

        public function get shuffle() : Boolean
        {
            return this._isShufflePlay;
        }// end function

        public function set shuffle(param1:Boolean) : void
        {
            var _loc_2:IdItemList = null;
            var _loc_3:int = 0;
            var _loc_4:Array = null;
            if (param1 != this._isShufflePlay)
            {
                this._isShufflePlay = param1;
                _loc_2 = new IdItemList();
                if (this._isShufflePlay)
                {
                    _loc_3 = this._list.getItemIndex(this._selectedClip);
                    if (_loc_3 != -1)
                    {
                        _loc_2.addItem(this._list.removeItemAt(_loc_3));
                    }
                    do
                    {
                        
                        _loc_2.addItem(this._list.removeItemAt(Math.round(Math.random() * (this._list.length - 1))));
                        if (this._list)
                        {
                        }
                    }while (this._list.length > 0)
                }
                else
                {
                    _loc_4 = this._list.toArray();
                    _loc_4.sortOn("index", Array.NUMERIC);
                    _loc_2 = new IdItemList(_loc_4);
                }
                this._list.removeAll();
                this._list.addAll(_loc_2);
                this._selected.dispatch();
            }
            return;
        }// end function

        public function set loop(param1:Boolean) : void
        {
            if (param1 != this._isLoopPlay)
            {
                this._isLoopPlay = param1;
            }
            return;
        }// end function

        public function get loop() : Boolean
        {
            return this._isLoopPlay;
        }// end function

        public function addClipItem(param1:YouTubeClip) : void
        {
            if (this.list)
            {
                var _loc_2:String = this;
                var _loc_3:* = this._lastIndex + 1;
                _loc_2._lastIndex = _loc_3;
                param1.index = this._lastIndex;
                this.list.addItemAt(param1, this.list.length);
            }
            return;
        }// end function

        public function removeClipItem(param1:YouTubeClip) : void
        {
            if (this.list)
            {
                this.list.removeItemBy(param1);
            }
            return;
        }// end function

    }
}
