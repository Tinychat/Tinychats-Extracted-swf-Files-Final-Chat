package com.tinychat.ui.components.invite
{
    import __AS3__.vec.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.model.social.network.presence.*;
    import com.tinychat.model.utils.*;
    import com.tinychat.ui.components.spark.*;
    import flash.display.*;
    import flash.errors.*;
    import flash.events.*;
    import flash.utils.*;
    import mx.collections.*;
    import mx.events.*;
    import mx.utils.*;
    import org.osflash.signals.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.primitives.*;

    public class InviteFriendsScreenBase extends TitleWindowElementBase
    {
        public var userPicture:BitmapImage;
        public var friendsFoundLabel:TextBase;
        public var searchFriendsField:AdvancedTextInput;
        public var friendsList:MultipleSelectionList;
        public var inviteMessageInput:InviteMessageInput;
        public var selectedFriendsCountLabel:Label;
        public var updateStatusCheckbox:CheckBox;
        public var batchSelect:IconToggleButton;
        private var selectedMap:IdentityMap;
        private var _dataProvider:IList;
        private var _currentUser:SocialNetworkUserListItem;
        private var _alwaysShowSelected:Boolean;
        private var sortedDataProvider:ListCollectionView;
        private var lastCollectionLength:uint;
        private var selectAllLimit:uint;
        private var _selectionChange:Signal;
        private var _waitingOnPresence:Boolean;
        private var showOnlineMode:Boolean;
        private var presenceTimeoutTimer:Timer;
        private var _searchFriendsFieldPromptText:String;
        private var _selectedFriendsCountLabelText:String;
        private var _allFriendsLabelText:String;
        private var _nameSearchLabelText:String;
        private var _updateStatusCheckboxLabelText:String;
        private var _noFriendsFoundLabelText:String;
        private var _selectAllLabelText:String;
        private var _deselectAllLabelText:String;
        private var _presenceSearchLabelText:String;
        private var dataProviderChanged:Boolean;
        private var currentUserChanged:Boolean;
        private var collectionLengthChanged:Boolean;
        private var selectedFriendsCountChanged:Boolean;
        private var searchFriendsFieldPromptTextChanged:Boolean;
        private var friendsFoundLabelChanged:Boolean;
        private var selectedFriendsCountLabelTextChanged:Boolean;
        private var updateStatusCheckboxLabelTextChanged:Boolean;
        private var collectionFilterChanged:Boolean;
        private var batchSelectionLabelTextChanged:Boolean;
        private static const STATE_LOADING:String = "loading";
        private static const LOADING_TIMEOUT:uint = 5000;
        private static var _skinParts:Object = {cancel:false, userPicture:true, inviteMessageInput:false, searchFriendsField:false, loadingIndicator:false, titleDisplay:false, friendsFoundLabel:true, statusLabel:false, confirm:false, selectedFriendsCountLabel:true, friendsList:true, batchSelect:false, updateStatusCheckbox:false};

        public function InviteFriendsScreenBase(param1:uint = 10000)
        {
            this.selectAllLimit = param1;
            this.selectedMap = new IdentityMap();
            this.lastCollectionLength = 0;
            this._selectionChange = new Signal(SocialNetworkUserListItem);
            this.presenceTimeoutTimer = new Timer(LOADING_TIMEOUT, 1);
            this.presenceTimeoutTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.presenceTimeoutCompleteHandler);
            this._waitingOnPresence = true;
            this.showOnlineMode = true;
            return;
        }// end function

        public function get selectionChange() : ISignal
        {
            return this._selectionChange;
        }// end function

        public function get selected() : Vector.<RenameableUser>
        {
            return this.Vector.<RenameableUser>(this.selectedMap.list);
        }// end function

        public function get updateStatus() : Boolean
        {
            if (this.updateStatusCheckbox)
            {
            }
            return this.updateStatusCheckbox.selected;
        }// end function

        public function get dataProvider() : IList
        {
            return this.sortedDataProvider;
        }// end function

        public function set dataProvider(param1:IList) : void
        {
            if (this._dataProvider != param1)
            {
                if (this._dataProvider)
                {
                    this._dataProvider.removeEventListener(CollectionEvent.COLLECTION_CHANGE, this.collectionChangeHandler);
                }
                this._dataProvider = param1;
                this.dataProviderChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set currentUser(param1:SocialNetworkUserListItem) : void
        {
            if (param1 != this._currentUser)
            {
                this._currentUser = param1;
                this.currentUserChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set alwaysShowSelected(param1:Boolean) : void
        {
            if (this._alwaysShowSelected != param1)
            {
                this._alwaysShowSelected = param1;
                this.invalidateCollectionFilter();
            }
            return;
        }// end function

        public function get inviteMessageInputText() : String
        {
            return this.inviteMessageInput ? (this.inviteMessageInput.text) : ("");
        }// end function

        public function set searchFriendsFieldPromptText(param1:String) : void
        {
            if (this._searchFriendsFieldPromptText != param1)
            {
                this._searchFriendsFieldPromptText = param1;
                this.searchFriendsFieldPromptTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set selectedFriendsCountLabelText(param1:String) : void
        {
            if (this._selectedFriendsCountLabelText != param1)
            {
                this._selectedFriendsCountLabelText = param1;
                this.selectedFriendsCountLabelTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set allFriendsLabelText(param1:String) : void
        {
            if (this._allFriendsLabelText != param1)
            {
                this._allFriendsLabelText = param1;
                this.invalidateFriendsFoundLabel();
            }
            return;
        }// end function

        public function set noFriendsFoundLabelText(param1:String) : void
        {
            if (this._noFriendsFoundLabelText != param1)
            {
                this._noFriendsFoundLabelText = param1;
                this.invalidateFriendsFoundLabel();
            }
            return;
        }// end function

        public function set nameSearchLabelText(param1:String) : void
        {
            if (this._nameSearchLabelText != param1)
            {
                this._nameSearchLabelText = param1;
                this.invalidateFriendsFoundLabel();
            }
            return;
        }// end function

        public function set updateStatusCheckboxLabelText(param1:String) : void
        {
            if (this._updateStatusCheckboxLabelText != param1)
            {
                this._updateStatusCheckboxLabelText = param1;
                this.updateStatusCheckboxLabelTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set presenceSearchLabelText(param1:String) : void
        {
            if (this._presenceSearchLabelText != param1)
            {
                this._presenceSearchLabelText = param1;
                this.invalidateFriendsFoundLabel();
            }
            return;
        }// end function

        public function setSelectBatchLabelText(param1:String, param2:String) : void
        {
            if (this._selectAllLabelText == param1)
            {
            }
            if (this._deselectAllLabelText != param2)
            {
                this._selectAllLabelText = param1;
                this._deselectAllLabelText = param2;
                this.batchSelectionLabelTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function get selectedFriendsCount() : uint
        {
            return this.selectedMap.length;
        }// end function

        override protected function commitProperties() : void
        {
            if (this.dataProviderChanged)
            {
                this.dataProviderChangedHandler();
            }
            if (this.collectionFilterChanged)
            {
            }
            if (this.sortedDataProvider)
            {
                this.sortedDataProvider.filterFunction = this.filterFunctions.apply();
                this.sortedDataProvider.refresh();
                this.collectionFilterChanged = false;
            }
            if (this.collectionLengthChanged)
            {
                this.collectionLengthChangedHandler();
            }
            if (this.selectedFriendsCountChanged)
            {
                this.selectedFriendsCountChangedHandler();
            }
            if (this.currentUserChanged)
            {
            }
            if (this.userPicture)
            {
                if (this._currentUser.isPictureLoaded)
                {
                    this.userPicture.source = this._currentUser.picture;
                }
                else
                {
                    this._currentUser.pictureLoaded.addOnce(this.pictureLoadedHandler);
                    this._currentUser.loadPicture();
                }
                this.currentUserChanged = false;
            }
            super.commitProperties();
            if (this.searchFriendsFieldPromptTextChanged)
            {
            }
            if (this.searchFriendsField)
            {
                this.searchFriendsField.promptMessage = this._searchFriendsFieldPromptText;
                this.searchFriendsFieldPromptTextChanged = false;
            }
            if (this.friendsFoundLabelChanged)
            {
            }
            if (this.friendsFoundLabel)
            {
                this.updateFriendsFoundLabel(this.resultCount);
                this.friendsFoundLabelChanged = false;
            }
            if (this.selectedFriendsCountLabelTextChanged)
            {
            }
            if (this.selectedFriendsCountLabel)
            {
                this.selectedFriendsCountLabel.text = StringUtil.substitute(this._selectedFriendsCountLabelText, this.selectedFriendsCount.toString());
                this.selectedFriendsCountLabelTextChanged = false;
            }
            if (this.updateStatusCheckboxLabelTextChanged)
            {
            }
            if (this.updateStatusCheckbox)
            {
                this.updateStatusCheckbox.label = this._updateStatusCheckboxLabelText;
                this.updateStatusCheckboxLabelTextChanged = false;
            }
            if (this.batchSelectionLabelTextChanged)
            {
            }
            if (this.batchSelect)
            {
                this.batchSelect.setLabels(this._selectAllLabelText, this._deselectAllLabelText);
                this.batchSelectionLabelTextChanged = false;
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.searchFriendsField)
            {
                this.searchFriendsField.addEventListener(Event.CHANGE, this.searchFriendsFieldChangeHandler);
            }
            else if (param2 == this.friendsList)
            {
                this.friendsList.dataProvider = this.sortedDataProvider;
                this.friendsList.selectionChange.add(this.friendsListSelectionChange);
                this.friendsList.invalidateSize();
            }
            else if (param2 == this.updateStatusCheckbox)
            {
                this.updateStatusCheckbox.selected = true;
            }
            else if (param2 == this.batchSelect)
            {
                this.updateSelectAllState();
                this.batchSelect.addEventListener(MouseEvent.CLICK, this.batchSelectClickHandler);
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == this.searchFriendsField)
            {
                this.searchFriendsField.removeEventListener(Event.CHANGE, this.searchFriendsFieldChangeHandler);
            }
            else if (param2 == this.friendsList)
            {
                this.friendsList.selectionChange.remove(this.friendsListSelectionChange);
            }
            else if (param2 == this.batchSelect)
            {
                this.batchSelect.removeEventListener(MouseEvent.CLICK, this.batchSelectClickHandler);
            }
            return;
        }// end function

        override protected function getCurrentSkinState() : String
        {
            if (this.waitingOnPresence)
            {
                return STATE_LOADING;
            }
            return super.getCurrentSkinState();
        }// end function

        protected function dataProviderChangedHandler() : void
        {
            var list:IList;
            if (this.sortedDataProvider)
            {
                this.sortedDataProvider.removeAll();
            }
            if (this._dataProvider)
            {
                list = new ArrayList(this._dataProvider.toArray().map(function (param1, param2:int, param3:Array) : SocialNetworkUserListItem
            {
                return createUserListItem(param1);
            }// end function
            ));
                this._dataProvider.addEventListener(CollectionEvent.COLLECTION_CHANGE, this.collectionChangeHandler);
                this.sortedDataProvider = new ListCollectionView(list);
                this.sortedDataProvider.sort = this.sort;
                if (this.friendsList)
                {
                    this.friendsList.dataProvider = this.sortedDataProvider;
                }
                this.presenceTimeoutTimer.reset();
                this.presenceTimeoutTimer.start();
            }
            this.dataProviderChanged = false;
            this.collectionFilterChanged = true;
            this.collectionLengthChanged = true;
            return;
        }// end function

        protected function createUserListItem(param1) : SocialNetworkUserListItem
        {
            throw new IllegalOperationError("Must be overridden in sub-class.");
        }// end function

        protected function collectionLengthChangedHandler() : void
        {
            this.friendsFoundLabelChanged = true;
            this.lastCollectionLength = this.sortedDataProvider.length;
            this.collectionLengthChanged = false;
            return;
        }// end function

        protected function selectedFriendsCountChangedHandler() : void
        {
            this.selectedFriendsCountLabelTextChanged = true;
            this.selectedFriendsCountChanged = false;
            if (this.batchSelect)
            {
                this.updateSelectAllState();
            }
            return;
        }// end function

        protected function get sort() : Sort
        {
            var _loc_1:* = new Sort();
            var _loc_2:* = new SortField("name", true);
            _loc_1.fields = [_loc_2];
            return _loc_1;
        }// end function

        protected function get filterFunctions() : FilterFunctions
        {
            var _loc_1:* = new FilterFunctions();
            if (this.isNameSearching)
            {
                _loc_1.add(this.nameFilterFunction);
            }
            if (this._alwaysShowSelected)
            {
                _loc_1.add(this.showSelectedFilterFunction);
            }
            if (this.showOnlineMode)
            {
            }
            if (!this.isNameSearching)
            {
                _loc_1.add(this.presenceFilter);
            }
            return _loc_1;
        }// end function

        protected function invalidateFriendsFoundLabel() : void
        {
            this.friendsFoundLabelChanged = true;
            invalidateProperties();
            return;
        }// end function

        protected function invalidateCollectionFilter() : void
        {
            this.collectionFilterChanged = true;
            invalidateProperties();
            return;
        }// end function

        protected function updateFriendsFoundLabel(param1:uint) : void
        {
            if (!this.isNameSearching)
            {
            }
            if (this.showOnlineMode)
            {
                this.friendsFoundLabel.text = StringUtil.substitute(this._presenceSearchLabelText, param1);
            }
            else if (this.isNameSearching)
            {
                this.friendsFoundLabel.text = StringUtil.substitute(this._nameSearchLabelText, param1, this.searchFriendsField.text);
            }
            else if (param1 == 0)
            {
                this.friendsFoundLabel.text = this._noFriendsFoundLabelText;
            }
            else
            {
                this.friendsFoundLabel.text = StringUtil.substitute(this._allFriendsLabelText, param1);
            }
            return;
        }// end function

        protected function get isNameSearching() : Boolean
        {
            return this.nameSearchValue != "";
        }// end function

        protected function toggleSelectionOf(param1:SocialNetworkUserListItem, param2:Boolean) : void
        {
            param1.selected = param2;
            this.updateSelectionOf(param1);
            return;
        }// end function

        private function updateSelectionOf(param1:SocialNetworkUserListItem) : void
        {
            if (param1.selected)
            {
                this.selectedMap.add(param1);
            }
            else
            {
                this.selectedMap.remove(param1);
            }
            this.selectedFriendsCountChanged = true;
            invalidateProperties();
            return;
        }// end function

        protected function selectAll() : void
        {
            var _loc_3:SocialNetworkUserListItem = null;
            var _loc_1:* = Math.min(this.dataProvider.length, this.selectAllLimit);
            var _loc_2:uint = 0;
            while (_loc_2 < _loc_1)
            {
                
                _loc_3 = this.dataProvider.getItemAt(_loc_2) as SocialNetworkUserListItem;
                this.toggleSelectionOf(_loc_3, true);
                _loc_2 = _loc_2 + 1;
            }
            return;
        }// end function

        protected function deselectAll() : void
        {
            var _loc_1:SocialNetworkUserListItem = null;
            for each (_loc_1 in this.selected)
            {
                
                this.toggleSelectionOf(_loc_1, false);
            }
            return;
        }// end function

        protected function get waitingOnPresence() : Boolean
        {
            return this._waitingOnPresence;
        }// end function

        protected function loadingComplete() : void
        {
            if (this.waitingOnPresence)
            {
                this.presenceTimeoutTimer.stop();
                this._waitingOnPresence = false;
                invalidateSkinState();
            }
            return;
        }// end function

        private function presenceTimeoutCompleteHandler(event:TimerEvent) : void
        {
            this.loadingComplete();
            this.showOnlineMode = false;
            this.invalidateCollectionFilter();
            invalidateSize();
            return;
        }// end function

        private function pictureLoadedHandler(param1:DisplayObject) : void
        {
            this.userPicture.source = param1;
            return;
        }// end function

        private function batchSelectClickHandler(event:MouseEvent) : void
        {
            if (this.batchSelect.selected)
            {
                this.selectAll();
            }
            else
            {
                this.deselectAll();
            }
            return;
        }// end function

        private function showSelectedFilterFunction(param1:Object) : Boolean
        {
            return param1.selected;
        }// end function

        private function nameFilterFunction(param1:Object) : Boolean
        {
            return param1.name.toLowerCase().indexOf(this.nameSearchValue.toLowerCase()) != -1;
        }// end function

        private function presenceFilter(param1:Object) : Boolean
        {
            if (param1.presence == PresenceType.ONLINE)
            {
                if (this.waitingOnPresence)
                {
                    this.loadingComplete();
                }
                if (this.showOnlineMode)
                {
                    this.invalidateFriendsFoundLabel();
                }
            }
            return param1.presence != PresenceType.OFFLINE;
        }// end function

        private function get resultCount() : uint
        {
            var filter:Function;
            var count:* = this.sortedDataProvider.length;
            if (this._alwaysShowSelected)
            {
            }
            if (this.sortedDataProvider.filterFunction != null)
            {
                filter = this.sortedDataProvider.filterFunction;
                this.selectedMap.forEach(function (param1:Object) : void
            {
                if (!filter(param1))
                {
                    var _loc_3:* = count - 1;
                    count = _loc_3;
                }
                return;
            }// end function
            );
            }
            return count;
        }// end function

        private function get nameSearchValue() : String
        {
            return this.searchFriendsField ? (this.searchFriendsField.text) : ("");
        }// end function

        private function updateSelectAllState() : void
        {
            if (this.selectedFriendsCount <= 0)
            {
                if (this.showOnlineMode)
                {
                }
            }
            this.batchSelect.enabled = !this.isNameSearching;
            this.batchSelect.selected = this.selectedFriendsCount > 0;
            return;
        }// end function

        private function searchFriendsFieldChangeHandler(event:Event) : void
        {
            this.invalidateCollectionFilter();
            this.invalidateFriendsFoundLabel();
            if (this.batchSelect)
            {
                this.updateSelectAllState();
            }
            return;
        }// end function

        private function collectionChangeHandler(event:CollectionEvent) : void
        {
            var _loc_2:* = undefined;
            if (event.kind == CollectionEventKind.ADD)
            {
                for each (_loc_2 in event.items)
                {
                    
                    this.sortedDataProvider.addItem(this.createUserListItem(_loc_2));
                }
            }
            if (this.sortedDataProvider.length != this.lastCollectionLength)
            {
                this.collectionLengthChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        private function friendsListSelectionChange(param1:SocialNetworkUserListItem) : void
        {
            this.updateSelectionOf(param1);
            this._selectionChange.dispatch(param1);
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
