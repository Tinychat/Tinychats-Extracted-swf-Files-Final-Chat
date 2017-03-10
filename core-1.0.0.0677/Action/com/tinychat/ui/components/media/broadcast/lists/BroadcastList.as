package com.tinychat.ui.components.broadcast.lists
{
    import __AS3__.vec.*;
    import com.tinychat.model.api.*;
    import com.tinychat.ui.components.broadcast.containers.*;
    import flash.utils.*;
    import mx.collections.*;
    import mx.events.*;
    import spark.components.*;

    public class BroadcastList extends Group
    {
        protected var _dataProvider:ListCollectionView;
        private var broadcastToContainerMap:Dictionary;
        private var dataProviderChanged:Boolean;
        private var _containerFactory:BroadcastContainerFactory;

        public function BroadcastList()
        {
            return;
        }// end function

        public function getContainersById(param1:Identity) : Vector.<BroadcastContainer>
        {
            var _loc_3:BroadcastContainer = null;
            var _loc_2:* = new Vector.<BroadcastContainer>;
            for each (_loc_3 in this.broadcastToContainerMap)
            {
                
                if (_loc_3.id == param1.id)
                {
                    _loc_2.push(_loc_3);
                }
            }
            return _loc_2;
        }// end function

        public function get containers() : Vector.<BroadcastContainer>
        {
            var _loc_1:* = new Vector.<BroadcastContainer>;
            var _loc_2:uint = 0;
            while (_loc_2 < numElements)
            {
                
                _loc_1.push(getElementAt(_loc_2));
                _loc_2 = _loc_2 + 1;
            }
            return _loc_1;
        }// end function

        public function set containerFactory(param1:BroadcastContainerFactory) : void
        {
            this._containerFactory = param1;
            return;
        }// end function

        public function set dataProvider(param1:IList) : void
        {
            if (this._dataProvider != param1)
            {
                if (this._dataProvider)
                {
                    this._dataProvider.removeEventListener(CollectionEvent.COLLECTION_CHANGE, this.collectionChangeHandler);
                }
                this._dataProvider = new ListCollectionView(param1);
                this.dataProviderChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            if (this.dataProviderChanged)
            {
            }
            if (this._dataProvider)
            {
                this.dataProviderChangedHandler(this._dataProvider);
                this.dataProviderChanged = false;
            }
            super.commitProperties();
            return;
        }// end function

        protected function dataProviderChangedHandler(param1:ListCollectionView) : void
        {
            this.recreateContainersFromDataProvider();
            param1.addEventListener(CollectionEvent.COLLECTION_CHANGE, this.collectionChangeHandler);
            return;
        }// end function

        protected function collectionAddHandler(event:CollectionEvent) : void
        {
            var event:* = event;
            event.items.forEach(function (param1, param2:int, param3:Array) : void
            {
                addBroadcastContainer(param1 as Broadcast, event.location + param2);
                return;
            }// end function
            );
            return;
        }// end function

        protected function collectionRemoveHandler(event:CollectionEvent) : void
        {
            var container:BroadcastContainer;
            var event:* = event;
            event.items.forEach(function (param1, param2:int, param3:Array) : void
            {
                removeBroadcastContainer(Broadcast(param1));
                return;
            }// end function
            );
            return;
        }// end function

        protected function collectionRefreshHandler(event:CollectionEvent) : void
        {
            return;
        }// end function

        protected function collectionResetHandler(event:CollectionEvent) : void
        {
            this.recreateContainersFromDataProvider();
            return;
        }// end function

        protected function broadcastContainerAddedHandler(param1:BroadcastContainer) : void
        {
            return;
        }// end function

        protected function broadcastContainerRemovedHandler(param1:BroadcastContainer) : void
        {
            param1.dispose();
            return;
        }// end function

        protected function updateSort() : void
        {
            var _loc_2:Broadcast = null;
            var _loc_3:BroadcastContainer = null;
            removeAllElements();
            var _loc_1:uint = 0;
            while (_loc_1 < this._dataProvider.length)
            {
                
                _loc_2 = Broadcast(this._dataProvider.getItemAt(_loc_1));
                _loc_3 = this.broadcastToContainerMap[_loc_2];
                addElement(_loc_3);
                _loc_1 = _loc_1 + 1;
            }
            return;
        }// end function

        private function collectionChangeHandler(event:CollectionEvent) : void
        {
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
                    break;
                }
            }
            return;
        }// end function

        private function recreateContainersFromDataProvider() : void
        {
            var key:Object;
            var index:uint;
            var broadcasts:* = new Vector.<Broadcast>;
            var _loc_2:int = 0;
            var _loc_3:* = this.broadcastToContainerMap;
            while (_loc_3 in _loc_2)
            {
                
                key = _loc_3[_loc_2];
                broadcasts.push(Broadcast(key));
            }
            broadcasts.forEach(function (param1:Broadcast, param2:int, param3:Vector.<Broadcast>) : void
            {
                removeBroadcastContainer(param1);
                return;
            }// end function
            );
            this.broadcastToContainerMap = new Dictionary(true);
            index;
            while (index < this._dataProvider.length)
            {
                
                this.addBroadcastContainer(Broadcast(this._dataProvider.getItemAt(index)), index);
                index = (index + 1);
            }
            return;
        }// end function

        private function addBroadcastContainer(param1:Broadcast, param2:int) : void
        {
            var _loc_3:* = this._containerFactory.newInstance(param1);
            this.broadcastToContainerMap[param1] = _loc_3;
            addElementAt(_loc_3, param2);
            this.broadcastContainerAddedHandler(_loc_3);
            return;
        }// end function

        private function removeBroadcastContainer(param1:Broadcast) : void
        {
            var _loc_2:* = this.broadcastToContainerMap[param1];
            delete this.broadcastToContainerMap[param1];
            this.broadcastContainerRemovedHandler(_loc_2);
            removeElement(_loc_2);
            return;
        }// end function

    }
}
