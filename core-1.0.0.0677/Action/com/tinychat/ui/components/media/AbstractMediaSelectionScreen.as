package com.tinychat.ui.components.media
{
    import com.tinychat.ui.components.spark.*;
    import flash.errors.*;
    import flash.events.*;
    import mx.collections.*;
    import mx.events.*;
    import mx.utils.*;
    import org.osflash.signals.*;
    import spark.components.*;
    import spark.components.supportClasses.*;

    public class AbstractMediaSelectionScreen extends TitleWindowElementBase
    {
        public var headerDisplay:TextBase;
        public var searchField:AdvancedTextInput;
        public var searchButton:Button;
        public var clipDisplayHeader:TextBase;
        public var clipDisplay:AdvancedButtonBarBase;
        public var play:Button;
        private var _dataProvider:Object;
        private var query:String;
        private var _headerDisplayText:String;
        private var _searchingText:String;
        private var _playButtonLabelText:String;
        private var _loading:Boolean;
        private var _searching:Boolean;
        private var dataProviderChanged:Boolean;
        private var headerDisplayTextChanged:Boolean;
        private var searchingTextChanged:Boolean;
        private var playButtonLabelTextChanged:Boolean;
        private var loadingChanged:Boolean;
        private var searchingChanged:Boolean;
        private var _searchRequest:Signal;
        protected var _selectionMade:Signal;
        private static const STATE_LOADING:String = "loading";
        private static var _skinParts:Object = {play:false, confirm:false, cancel:false, searchButton:true, searchField:true, loadingIndicator:false, headerDisplay:true, clipDisplayHeader:true, titleDisplay:false, clipDisplay:true, statusLabel:false};

        public function AbstractMediaSelectionScreen()
        {
            this.loading = true;
            this._selectionMade = new Signal(Object);
            this._searchRequest = new Signal(String);
            return;
        }// end function

        public function get searchRequest() : ISignal
        {
            return this._searchRequest;
        }// end function

        public function get selectionMade() : ISignal
        {
            return this._selectionMade;
        }// end function

        public function set dataProvider(param1:Object) : void
        {
            if (this._dataProvider != param1)
            {
                this._dataProvider = param1;
                this.dataProviderChanged = true;
                this.loading = false;
                this._searching = false;
                invalidateProperties();
            }
            return;
        }// end function

        public function set headerDisplayText(param1:String) : void
        {
            if (this._headerDisplayText != param1)
            {
                this._headerDisplayText = param1;
                this.headerDisplayTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set searchingText(param1:String) : void
        {
            if (this._searchingText != param1)
            {
                this._searchingText = param1;
                this.searchingTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set playButtonLabelText(param1:String) : void
        {
            if (this._playButtonLabelText != param1)
            {
                this._playButtonLabelText = param1;
                this.playButtonLabelTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        protected function parseDataProvider(param1:Object) : Array
        {
            throw new IllegalOperationError("Must be overridden in sub-class.");
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.dataProviderChanged)
            {
            }
            if (this.clipDisplay)
            {
                this.clipDisplay.dataProvider = new ArrayList(this.parseDataProvider(this._dataProvider));
                this.dataProviderChanged = false;
            }
            if (this.headerDisplayTextChanged)
            {
            }
            if (this.headerDisplay)
            {
                this.headerDisplay.text = this._headerDisplayText;
                this.headerDisplayTextChanged = false;
            }
            if (this.playButtonLabelTextChanged)
            {
            }
            if (this.play)
            {
                this.play.label = this._playButtonLabelText;
                this.playButtonLabelTextChanged = false;
            }
            if (this.clipDisplayHeader)
            {
                if (!this.loadingChanged)
                {
                }
                if (!this.searchingChanged)
                {
                }
            }
            if (this.searchingTextChanged)
            {
                this.updateClipDisplayHeaderText();
                this.loadingChanged = false;
                this.searchingChanged = false;
                this.searchingTextChanged = false;
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.searchButton)
            {
                this.updateSearchButtonState();
                this.searchButton.addEventListener(MouseEvent.CLICK, this.searchButtonClickHandler);
            }
            else if (param2 == this.searchField)
            {
                this.searchField.addEventListener(FlexEvent.ENTER, this.searchFieldEnterHandler);
                this.searchField.addEventListener(Event.CHANGE, this.searchFieldChangeHandler);
            }
            else if (param2 == this.clipDisplay)
            {
                this.clipDisplay.addEventListener(Event.CHANGE, this.clipDisplayChangeHandler);
                this.clipDisplay.allowDeselection = false;
                this.updatePlayButtonState();
            }
            else if (param2 == this.play)
            {
                this.play.addEventListener(MouseEvent.CLICK, this.playClickHandler);
                this.updatePlayButtonState();
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == this.searchButton)
            {
                this.searchButton.removeEventListener(MouseEvent.CLICK, this.searchButtonClickHandler);
            }
            else if (param2 == this.searchField)
            {
                this.searchField.removeEventListener(FlexEvent.ENTER, this.searchFieldEnterHandler);
                this.searchField.removeEventListener(Event.CHANGE, this.searchFieldChangeHandler);
            }
            else if (param2 == this.clipDisplay)
            {
                this.clipDisplay.removeEventListener(Event.CHANGE, this.clipDisplayChangeHandler);
            }
            else if (param2 == this.play)
            {
                this.play.removeEventListener(MouseEvent.CLICK, this.playClickHandler);
            }
            return;
        }// end function

        override protected function getCurrentSkinState() : String
        {
            if (this._loading)
            {
                return STATE_LOADING;
            }
            return super.getCurrentSkinState();
        }// end function

        protected function get selectedItem()
        {
            if (this.clipDisplay)
            {
                return this.clipDisplay.selectedItem;
            }
            return null;
        }// end function

        protected function updateClipDisplayHeaderText() : void
        {
            if (this._searching)
            {
                this.clipDisplayHeader.text = StringUtil.substitute(this._searchingText, this.query);
            }
            else
            {
                if (this._dataProvider)
                {
                }
                if (this._dataProvider.hasOwnProperty("title"))
                {
                    this.clipDisplayHeader.text = this._dataProvider.title;
                }
            }
            return;
        }// end function

        private function search() : void
        {
            if (this.searchField)
            {
            }
            if (this.searchField.text != "")
            {
                this.query = this.searchField.text;
                this._searchRequest.dispatch(this.query);
                this.loading = true;
                this._searching = true;
            }
            return;
        }// end function

        private function searchButtonClickHandler(event:MouseEvent) : void
        {
            this.search();
            return;
        }// end function

        private function searchFieldEnterHandler(event:FlexEvent) : void
        {
            this.search();
            return;
        }// end function

        private function searchFieldChangeHandler(event:Event) : void
        {
            this.updateSearchButtonState();
            return;
        }// end function

        private function clipDisplayChangeHandler(event:Event) : void
        {
            this.updatePlayButtonState();
            return;
        }// end function

        private function playClickHandler(event:MouseEvent) : void
        {
            this._selectionMade.dispatch(this.selectedItem);
            return;
        }// end function

        private function updateSearchButtonState() : void
        {
            if (this.searchButton)
            {
                if (this.searchField)
                {
                }
                this.searchButton.enabled = this.searchField.text != "";
            }
            return;
        }// end function

        private function updatePlayButtonState() : void
        {
            if (this.play)
            {
                this.play.enabled = this.selectedItem != null;
            }
            return;
        }// end function

        private function set loading(param1:Boolean) : void
        {
            if (this._loading != param1)
            {
                this._loading = param1;
                this.loadingChanged = true;
                invalidateSkinState();
            }
            return;
        }// end function

        private function set searching(param1:Boolean) : void
        {
            if (this._searching != param1)
            {
                this._searching = param1;
                this.searchingChanged = true;
                invalidateSkinState();
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
