package com.tinychat.ui.components.social.userlist
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.ui.components.gifts.*;
    import com.tinychat.ui.components.popupmenu.*;
    import flash.errors.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.utils.*;
    import mx.collections.*;
    import mx.core.*;
    import mx.events.*;
    import org.osflash.signals.*;
    import org.robotlegs.core.*;
    import org.robotlegs.utilities.modular.core.*;
    import spark.events.*;

    public class UsersListBase extends SortedList implements IListDataproviderComponent
    {
        public var userPopupMenu:UserPopupMenu;
        protected var _dataProvider:IdItemList;
        private var context:IModuleContext;
        private var source:IList;
        private var singleClickTimer:Timer;
        private var singleClickPosition:Point;
        private var singleClickedUser:Object;
        private var _userDoubleClicked:Signal;
        private var _userSingleClicked:Signal;
        private var _buyGiftClicked:Signal;
        private var _itemDoubleClickEnabled:Boolean;
        private var doubleClickEnabledChanged:Boolean;
        private static var _skinParts:Object = {dataGroup:false, userPopupMenu:false};

        public function UsersListBase()
        {
            this._buyGiftClicked = new Signal(UserIdentity);
            this._userSingleClicked = new Signal(UserIdentity);
            this._userDoubleClicked = new Signal(UserIdentity);
            return;
        }// end function

        public function get buyGiftClicked() : ISignal
        {
            return this._buyGiftClicked;
        }// end function

        public function get userSingleClicked() : ISignal
        {
            return this._userSingleClicked;
        }// end function

        public function get userDoubleClicked() : ISignal
        {
            return this._userDoubleClicked;
        }// end function

        public function set itemDoubleClickEnabled(param1:Boolean) : void
        {
            if (this._itemDoubleClickEnabled != param1)
            {
                if (param1)
                {
                }
                if (!this.singleClickTimer)
                {
                    this.singleClickTimer = new Timer(200, 1);
                    this.singleClickTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.singleClickTimerCompleteHandler);
                }
                this._itemDoubleClickEnabled = param1;
                this.singleClickTimer.stop();
            }
            return;
        }// end function

        public function set parentInjector(param1:IInjector) : void
        {
            this.context = this.createContext(param1);
            return;
        }// end function

        public function dispose() : void
        {
            if (this.context)
            {
                this.context.dispose();
                this.context = null;
            }
            return;
        }// end function

        override public function get dataProvider() : IList
        {
            return this._dataProvider;
        }// end function

        override public function set dataProvider(param1:IList) : void
        {
            if (this.source != param1)
            {
                if (!this._dataProvider)
                {
                    this._dataProvider = new IdItemList();
                    super.dataProvider = this._dataProvider;
                }
                else
                {
                    this._dataProvider.removeAll();
                }
                if (this.source)
                {
                    this.source.removeEventListener(CollectionEvent.COLLECTION_CHANGE, this.collectionChangeHandler);
                }
                this.source = param1;
                if (this.source)
                {
                    this.recreateDataProviderFromSource();
                    this.source.addEventListener(CollectionEvent.COLLECTION_CHANGE, this.collectionChangeHandler);
                }
            }
            return;
        }// end function

        protected function createContext(param1:IInjector) : IModuleContext
        {
            throw new IllegalOperationError("Must be overridden in sub-class.");
        }// end function

        protected function rendererSingleClicked(param1:Object, param2:Point) : void
        {
            var _loc_3:* = RenameableUser(param1);
            if (this.userPopupMenu)
            {
                this.userPopupMenu.user = _loc_3;
                this.userPopupMenu.open(param2);
            }
            this._userSingleClicked.dispatch(_loc_3);
            return;
        }// end function

        protected function createUserListItem(param1:RenameableUser)
        {
            throw new IllegalOperationError("Must be overridden in sub-class.");
        }// end function

        override protected function rendererAddedHandler(event:RendererExistenceEvent) : void
        {
            super.rendererAddedHandler(event);
            var _loc_2:* = event.renderer as UIComponent;
            if (_loc_2)
            {
                _loc_2.doubleClickEnabled = true;
                _loc_2.mouseChildren = true;
                _loc_2.addEventListener(MouseEvent.CLICK, this.rendererClickedHandler);
                _loc_2.addEventListener(MouseEvent.DOUBLE_CLICK, this.rendererDoubleClicked);
            }
            return;
        }// end function

        override protected function rendererRemovedHandler(event:RendererExistenceEvent) : void
        {
            super.rendererRemovedHandler(event);
            var _loc_2:* = event.renderer;
            if (_loc_2)
            {
                _loc_2.removeEventListener(MouseEvent.CLICK, this.rendererClickedHandler);
                _loc_2.removeEventListener(MouseEvent.DOUBLE_CLICK, this.rendererDoubleClicked);
            }
            return;
        }// end function

        private function rendererClickedHandler(event:MouseEvent) : void
        {
            this.singleClickPosition = globalToLocal(new Point(event.stageX, event.stageY));
            this.singleClickedUser = event.currentTarget.data;
            if (event.target as BuyGiftButton)
            {
                this._buyGiftClicked.dispatch(RenameableUser(this.singleClickedUser));
                return;
            }
            if (this._itemDoubleClickEnabled)
            {
                this.singleClickTimer.reset();
                this.singleClickTimer.start();
            }
            else
            {
                this.rendererSingleClicked(this.singleClickedUser, this.singleClickPosition);
            }
            return;
        }// end function

        private function rendererDoubleClicked(event:MouseEvent) : void
        {
            if (this._itemDoubleClickEnabled)
            {
                this.singleClickTimer.stop();
                this._userDoubleClicked.dispatch(UserIdentity(event.currentTarget.data));
            }
            else
            {
                this.rendererClickedHandler(event);
            }
            return;
        }// end function

        private function singleClickTimerCompleteHandler(event:TimerEvent) : void
        {
            this.rendererSingleClicked(this.singleClickedUser, this.singleClickPosition);
            this.singleClickedUser = null;
            this.singleClickPosition = null;
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

        private function collectionAddHandler(event:CollectionEvent) : void
        {
            var _loc_2:* = event.items;
            var _loc_3:uint = 0;
            while (_loc_3 < _loc_2.length)
            {
                
                this._dataProvider.addItem(this.createUserListItem(_loc_2[_loc_3] as RenameableUser));
                _loc_3 = _loc_3 + 1;
            }
            return;
        }// end function

        private function collectionRemoveHandler(event:CollectionEvent) : void
        {
            var _loc_4:RenameableUser = null;
            var _loc_2:* = event.items;
            var _loc_3:uint = 0;
            while (_loc_3 < _loc_2.length)
            {
                
                _loc_4 = _loc_2[_loc_3] as RenameableUser;
                if (_loc_4 is Disposable)
                {
                    Disposable(_loc_4).com.tinychat.model.api:Disposable::dispose();
                }
                this._dataProvider.removeItemBy(_loc_4);
                _loc_3 = _loc_3 + 1;
            }
            return;
        }// end function

        private function collectionResetHandler(event:CollectionEvent) : void
        {
            this.recreateDataProviderFromSource();
            return;
        }// end function

        private function recreateDataProviderFromSource() : void
        {
            var _loc_2:* = undefined;
            this._dataProvider.removeAll();
            var _loc_1:uint = 0;
            while (_loc_1 < this.source.length)
            {
                
                _loc_2 = this.source.getItemAt(_loc_1);
                this._dataProvider.addItem(this.createUserListItem(_loc_2));
                _loc_1 = _loc_1 + 1;
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
