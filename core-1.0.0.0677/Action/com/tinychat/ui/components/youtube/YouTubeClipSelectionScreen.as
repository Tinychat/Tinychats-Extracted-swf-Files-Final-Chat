package com.tinychat.ui.components.youtube
{
    import com.tinychat.model.youtube.*;
    import com.tinychat.ui.components.media.*;
    import flash.events.*;
    import mx.collections.*;
    import mx.core.*;
    import mx.events.*;
    import mx.managers.*;
    import org.osflash.signals.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.events.*;

    public class YouTubeClipSelectionScreen extends AbstractMediaSelectionScreen
    {
        public var listDisplay:List;
        public var loop:ToggleButtonBase;
        public var shuffle:ToggleButtonBase;
        public var infoLabel:Label;
        private var _listProvider:IList;
        private var _addToPlaylist:Signal;
        private var _delToPlaylist:Signal;
        private var _playSelectionMade:Signal;
        private var infoChanged:Boolean;
        private var listProviderChanged:Boolean;
        private var listSelectedChanged:Boolean;
        private var _textInfo:String;
        private static var _skinParts:Object = {play:false, cancel:false, searchButton:true, searchField:true, loadingIndicator:false, titleDisplay:false, clipDisplay:true, statusLabel:false, confirm:false, infoLabel:false, loop:true, headerDisplay:true, clipDisplayHeader:true, listDisplay:true, shuffle:true};

        public function YouTubeClipSelectionScreen()
        {
            this._addToPlaylist = new Signal(Object);
            this._delToPlaylist = new Signal(Object);
            this._playSelectionMade = new Signal(Object);
            return;
        }// end function

        public function set info(param1:String) : void
        {
            if (this._textInfo != param1)
            {
                this._textInfo = param1;
                this.infoChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function get addToPlaylist() : ISignal
        {
            return this._addToPlaylist;
        }// end function

        public function get deleteToPlaylist() : ISignal
        {
            return this._delToPlaylist;
        }// end function

        public function get playToPlaylist() : ISignal
        {
            return this._playSelectionMade;
        }// end function

        public function set selectedItemPlaylist(param1:Object) : void
        {
            if (this.listDisplay)
            {
                this.listDisplay.selectedItem = param1;
                this.listSelectedChanged = true;
                if (this._listProvider)
                {
                }
                if (initialized)
                {
                    this.listDisplay.ensureIndexIsVisible(this._listProvider.getItemIndex(param1));
                }
            }
            return;
        }// end function

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            super.updateDisplayList(param1, param2);
            if (this.listSelectedChanged)
            {
            }
            if (!this.listProviderChanged)
            {
            }
            if (this.listDisplay)
            {
                this.listDisplay.ensureIndexIsVisible(this._listProvider.getItemIndex(this.listDisplay.selectedItem));
                this.listSelectedChanged = false;
            }
            return;
        }// end function

        public function set listProvider(param1:Object) : void
        {
            if (this._listProvider != param1)
            {
                this._listProvider = param1 as IList;
                this.listProviderChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        private function deleteClickHandler(event:ListEvent) : void
        {
            var _loc_3:YouTubeClip = null;
            var _loc_4:int = 0;
            var _loc_2:* = event.item as YouTubeClip;
            this._delToPlaylist.dispatch(_loc_2);
            if (clipDisplay)
            {
            }
            if (clipDisplay.dataProvider)
            {
                _loc_4 = 0;
                while (_loc_4 < clipDisplay.dataProvider.length)
                {
                    
                    _loc_3 = clipDisplay.dataProvider.getItemAt(_loc_4) as YouTubeClip;
                    if (_loc_2.id == _loc_3.id)
                    {
                        _loc_3.index = -1;
                        break;
                    }
                    _loc_4 = _loc_4 + 1;
                }
            }
            return;
        }// end function

        private function playItemClickHandler(event:ListEvent) : void
        {
            this._playSelectionMade.dispatch(event.item);
            return;
        }// end function

        override protected function parseDataProvider(param1:Object) : Array
        {
            var _loc_3:YouTubeClip = null;
            var _loc_4:YouTubeClip = null;
            var _loc_5:int = 0;
            var _loc_2:Array = [];
            for each (_loc_4 in param1.clips)
            {
                
                _loc_5 = 0;
                while (_loc_5 < this._listProvider.length)
                {
                    
                    _loc_3 = this._listProvider.getItemAt(_loc_5) as YouTubeClip;
                    if (_loc_4.id == _loc_3.id)
                    {
                        _loc_4.index = _loc_3.index;
                        break;
                    }
                    _loc_5 = _loc_5 + 1;
                }
                _loc_2.push(_loc_4);
            }
            return _loc_2;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.listProviderChanged)
            {
            }
            if (this.listDisplay)
            {
                this.listDisplay.dataProvider = this._listProvider;
                this.listProviderChanged = false;
            }
            if (this.infoChanged)
            {
            }
            if (this.infoLabel)
            {
                this.infoLabel.text = this._textInfo;
                this.infoChanged = false;
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == clipDisplay)
            {
                clipDisplay.addEventListener(MouseEvent.CLICK, this.clickItemDisplayHandler);
            }
            else if (param2 == this.listDisplay)
            {
                this.listDisplay.addEventListener("playItem", this.playItemClickHandler);
                this.listDisplay.addEventListener("deleteItem", this.deleteClickHandler);
                this.listDisplay.addEventListener(DragEvent.DRAG_ENTER, this.dragEnterHandler);
                this.listDisplay.addEventListener(DragEvent.DRAG_DROP, this.dragDropHandler);
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == clipDisplay)
            {
                clipDisplay.removeEventListener(MouseEvent.CLICK, this.clickItemDisplayHandler);
            }
            else if (param2 == this.listDisplay)
            {
                this.listDisplay.removeEventListener("playItem", this.playItemClickHandler);
                this.listDisplay.removeEventListener("deleteItem", this.deleteClickHandler);
                this.listDisplay.removeEventListener(DragEvent.DRAG_ENTER, this.dragEnterHandler);
                this.listDisplay.removeEventListener(DragEvent.DRAG_DROP, this.dragDropHandler);
            }
            return;
        }// end function

        private function clickItemDisplayHandler(event:MouseEvent) : void
        {
            if (selectedItem != null)
            {
            }
            if (event.currentTarget.className == "AdvancedButtonBarBase")
            {
                switch(event.target.id)
                {
                    case "thumbnailDisplayContainer":
                    case "thumbnailGroup":
                    case "addButton":
                    case "labelDisplay":
                    {
                        if (event.ctrlKey != true)
                        {
                        }
                        if (event.target.id == "addButton")
                        {
                            this._addToPlaylist.dispatch(selectedItem);
                        }
                        else
                        {
                            _selectionMade.dispatch(selectedItem);
                        }
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }
            }
            return;
        }// end function

        private function dragEnterHandler(event:DragEvent) : void
        {
            if (this.listDisplay)
            {
            }
            if (event.dragSource.hasFormat("itemsByIndex"))
            {
                DragManager.acceptDragDrop(UIComponent(this.listDisplay));
                DragManager.showFeedback(DragManager.COPY);
                return;
            }
            DragManager.showFeedback(DragManager.NONE);
            return;
        }// end function

        private function dragDropHandler(event:DragEvent) : void
        {
            if (selectedItem != null)
            {
            }
            if (event.dragSource.hasFormat("itemsByIndex"))
            {
                this._addToPlaylist.dispatch(event.dragSource.dataForFormat("itemsByIndex"));
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
