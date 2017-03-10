package com.tinychat.model.social.network.presence
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.utils.iterator.*;
    import mx.collections.*;
    import mx.events.*;
    import org.osflash.signals.*;

    public class PresenceCounter extends Object implements Disposable
    {
        private var source:IList;
        private var sourceIterator:IListIterator;
        private var count:Object;
        private var _countChanged:Signal;

        public function PresenceCounter(param1:IList)
        {
            this.source = param1;
            this.source.addEventListener(CollectionEvent.COLLECTION_CHANGE, this.collectionChangeHandler);
            this.sourceIterator = new IListIterator(param1);
            this._countChanged = new Signal();
            this.recalculate();
            return;
        }// end function

        public function get countChanged() : ISignal
        {
            return this._countChanged;
        }// end function

        public function getCountFor(param1:PresenceType) : uint
        {
            return this.count.hasOwnProperty(param1) ? (this.count[param1]) : (0);
        }// end function

        public function dispose() : void
        {
            var _loc_1:Presence = null;
            this.source.removeEventListener(CollectionEvent.COLLECTION_CHANGE, this.collectionChangeHandler);
            this.sourceIterator.reset();
            while (this.sourceIterator.hasNext())
            {
                
                _loc_1 = this.sourceIterator.next() as Presence;
                _loc_1.presenceChanged.remove(this.presenceChangedHandler);
            }
            return;
        }// end function

        private function collectionChangeHandler(event:CollectionEvent) : void
        {
            var _loc_2:Boolean = true;
            switch(event.kind)
            {
                case CollectionEventKind.ADD:
                {
                    this.collectionAddHandler(event);
                    break;
                }
                case CollectionEventKind.REMOVE:
                {
                    this.collectionRemoveHandler(event);
                    break;
                }
                case CollectionEventKind.REFRESH:
                {
                    this.collectionRefreshHandler(event);
                    break;
                }
                case CollectionEventKind.RESET:
                {
                    this.collectionResetHandler(event);
                    break;
                }
                default:
                {
                    _loc_2 = false;
                    break;
                }
            }
            if (_loc_2)
            {
                this._countChanged.dispatch();
            }
            return;
        }// end function

        private function collectionAddHandler(event:CollectionEvent) : void
        {
            this.addFrom(new ArrayIterator(event.items));
            return;
        }// end function

        private function collectionRemoveHandler(event:CollectionEvent) : void
        {
            this.removeFrom(new ArrayIterator(event.items));
            return;
        }// end function

        private function collectionRefreshHandler(event:CollectionEvent) : void
        {
            this.recalculate();
            return;
        }// end function

        private function collectionResetHandler(event:CollectionEvent) : void
        {
            this.recalculate();
            return;
        }// end function

        private function recalculate() : void
        {
            this.count = {};
            this.addFrom(this.sourceIterator);
            return;
        }// end function

        private function addFrom(param1:Iterator) : void
        {
            var _loc_2:Presence = null;
            var _loc_3:PresenceType = null;
            param1.reset();
            while (param1.hasNext())
            {
                
                _loc_2 = param1.next() as Presence;
                _loc_3 = _loc_2.presence;
                if (_loc_2)
                {
                    this.increaseTallyFor(_loc_3);
                    _loc_2.presenceChanged.add(this.presenceChangedHandler);
                }
            }
            return;
        }// end function

        private function removeFrom(param1:Iterator) : void
        {
            var _loc_2:Presence = null;
            var _loc_3:PresenceType = null;
            param1.reset();
            while (param1.hasNext())
            {
                
                _loc_2 = param1.next() as Presence;
                _loc_3 = _loc_2.presence;
                if (_loc_2)
                {
                    this.decreaseTallyFor(_loc_3);
                    _loc_2.presenceChanged.remove(this.presenceChangedHandler);
                }
            }
            return;
        }// end function

        private function presenceChangedHandler(param1:PresenceType, param2:PresenceType) : void
        {
            this.increaseTallyFor(param2);
            this.decreaseTallyFor(param1);
            this._countChanged.dispatch();
            return;
        }// end function

        private function increaseTallyFor(param1:PresenceType) : void
        {
            if (this.count.hasOwnProperty(param1))
            {
                var _loc_2:* = this.count;
                var _loc_3:* = param1;
                var _loc_4:* = this.count[param1] + 1;
                _loc_2[_loc_3] = _loc_4;
            }
            else
            {
                this.count[param1] = 1;
            }
            return;
        }// end function

        private function decreaseTallyFor(param1:PresenceType) : void
        {
            if (this.count.hasOwnProperty(param1))
            {
                var _loc_2:* = this.count;
                var _loc_3:* = param1;
                var _loc_4:* = this.count[param1] - 1;
                _loc_2[_loc_3] = _loc_4;
            }
            else
            {
                this.count[param1] = 0;
            }
            return;
        }// end function

    }
}
