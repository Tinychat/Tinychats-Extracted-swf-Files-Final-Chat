package com.tinychat.ui.components.social.chat.list
{
    import __AS3__.vec.*;
    import com.tinychat.model.social.chat.encoding.*;
    import flash.desktop.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import mx.collections.*;
    import mx.core.*;
    import mx.events.*;
    import mx.styles.*;
    import org.osflash.signals.*;
    import spark.components.*;
    import spark.core.*;
    import spark.layouts.*;

    public class ChatList extends SkinnableDataContainer implements IFocusManagerComponent
    {
        public var textSelectionCanvas:SpriteVisualElement;
        public var verticalScrollBar:VScrollBar;
        private var _enableSmileys:Boolean;
        private var _enableLinks:Boolean;
        private var enableLinksChanged:Boolean;
        private var enableSmileysChanged:Boolean;
        private var dataGroupLayout:VerticalLayout;
        private var wasScrolledToBottom:Boolean;
        private var textSelection:ChatMessageSelection;
        private var selectingText:Boolean;
        private var dragScrollPoller:Timer;
        private var dragScrollingDownwards:Boolean;
        private var sandboxRoot:DisplayObject;
        private var _dataProvider:IList;
        private var newDataProvider:IList;
        private var urlEncoder:UrlEncoder;
        private var emailEncoder:EmailEncoder;
        private var urlRenderer:UrlRenderer;
        private var dataProviderChanged:Boolean;
        private static var classConstructed:Boolean = classConstruct();
        private static var _skinParts:Object = {dataGroup:false, textSelectionCanvas:true, verticalScrollBar:true};

        public function ChatList()
        {
            focusEnabled = true;
            addEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
            return;
        }// end function

        public function set enableLinks(param1:Boolean) : void
        {
            if (this._enableLinks != param1)
            {
                this._enableLinks = param1;
                this.enableLinksChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set enableSmileys(param1:Boolean) : void
        {
            if (this._enableSmileys != param1)
            {
                this._enableSmileys = param1;
                this.enableSmileysChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function get linkClicked() : ISignal
        {
            return this.urlRenderer.clicked;
        }// end function

        public function get verticalScrollPosition() : Number
        {
            return this.dataGroupLayout ? (this.dataGroupLayout.verticalScrollPosition) : (0);
        }// end function

        public function set verticalScrollPosition(param1:Number) : void
        {
            if (this.dataGroupLayout)
            {
                this.dataGroupLayout.verticalScrollPosition = param1;
            }
            return;
        }// end function

        public function get isScrolledToBottom() : Boolean
        {
            return this.dataGroupLayout.getVerticalScrollPositionDelta(NavigationUnit.END) == 0;
        }// end function

        public function scrollToBottom() : void
        {
            var _loc_1:Number = 0;
            var _loc_2:int = 0;
            do
            {
                
                dataGroup.validateNow();
                _loc_1 = this.dataGroupLayout.getVerticalScrollPositionDelta(NavigationUnit.END);
                this.dataGroupLayout.verticalScrollPosition = this.dataGroupLayout.verticalScrollPosition + _loc_1;
                if (_loc_2++ < 10)
                {
                }
            }while (_loc_1 != 0)
            return;
        }// end function

        override public function set dataProvider(param1:IList) : void
        {
            if (this._dataProvider != param1)
            {
                this.newDataProvider = param1;
                this.dataProviderChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override public function initialize() : void
        {
            this.initializeStyles();
            this.sandboxRoot = systemManager.getSandboxRoot();
            contextMenu = new ContextMenu();
            contextMenu.clipboardMenu = true;
            contextMenu.addEventListener(ContextMenuEvent.MENU_SELECT, this.contextMenuSelectHandler);
            addEventListener(Event.COPY, this.contextMenuCopyHandler);
            addEventListener(Event.SELECT_ALL, this.contextMenuSelectAllHandler);
            contextMenu.clipboardItems.selectAll = false;
            this.urlEncoder = new UrlEncoder();
            this.emailEncoder = new EmailEncoder();
            this.urlRenderer = new UrlRenderer(this.Vector.<InteractiveElementEncoder>([this.urlEncoder, this.emailEncoder]));
            super.initialize();
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.dataProviderChanged)
            {
                if (this._dataProvider)
                {
                    this._dataProvider.removeEventListener(CollectionEvent.COLLECTION_CHANGE, this.dataProviderChangeHandler);
                }
                this._dataProvider = this.newDataProvider;
                super.dataProvider = this._dataProvider;
                if (this._dataProvider)
                {
                    this._dataProvider.addEventListener(CollectionEvent.COLLECTION_CHANGE, this.dataProviderChangeHandler);
                }
                this.textSelection.clear();
                this.dataProviderChanged = false;
            }
            if (!this.enableSmileysChanged)
            {
            }
            if (this.enableLinksChanged)
            {
                dataGroup.itemRenderer = this.createItemRendererFactory();
                this.enableSmileysChanged = false;
                this.enableLinksChanged = false;
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == dataGroup)
            {
                dataGroup.focusEnabled = false;
                dataGroup.itemRenderer = this.createItemRendererFactory();
                if (this.verticalScrollBar)
                {
                    this.verticalScrollBar.viewport = dataGroup;
                }
                this.dataGroupLayout = new VerticalLayout();
                this.dataGroupLayout.useVirtualLayout = true;
                this.dataGroupLayout.gap = getStyle("messageSpacing");
                this.dataGroupLayout.horizontalAlign = HorizontalAlign.JUSTIFY;
                dataGroup.layout = this.dataGroupLayout;
                dataGroup.addEventListener(MouseEvent.MOUSE_DOWN, this.dataGroupMouseDownHandler);
                dataGroup.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, this.dataGroupPropertyChangeHandler);
            }
            else if (param2 == this.verticalScrollBar)
            {
                if (dataGroup)
                {
                    this.verticalScrollBar.viewport = dataGroup;
                }
            }
            else if (param2 == this.textSelectionCanvas)
            {
                this.textSelection = new ChatMessageSelection(this.textSelectionCanvas);
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == dataGroup)
            {
                dataGroup.removeEventListener(MouseEvent.MOUSE_DOWN, this.dataGroupMouseDownHandler);
                dataGroup.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE, this.dataGroupPropertyChangeHandler);
            }
            return;
        }// end function

        private function createItemRendererFactory() : IFactory
        {
            var _loc_5:Class = null;
            var _loc_1:* = new Vector.<ElementEncoder>;
            _loc_1.push(new BoldEncoder(MouseCursor.IBEAM));
            if (this._enableSmileys)
            {
                _loc_5 = getStyle("smileySet");
                _loc_1.push(new SmileyEncoder(new _loc_5, MouseCursor.IBEAM));
            }
            if (this._enableLinks)
            {
                _loc_1.push(this.urlEncoder, this.emailEncoder);
            }
            _loc_1.push(new RegularEncoder(MouseCursor.IBEAM));
            var _loc_2:* = new TextEncoder(this.Vector.<ElementEncoder>([new RegularEncoder(MouseCursor.BUTTON)]));
            _loc_2.family = getStyle("fontFamily");
            _loc_2.size = getStyle("fontSize");
            _loc_2.color = getStyle("color");
            var _loc_3:* = new TextEncoder(_loc_1);
            _loc_3.family = getStyle("fontFamily");
            _loc_3.size = getStyle("fontSize");
            _loc_3.color = getStyle("color");
            var _loc_4:* = new TextEncoder(this.Vector.<ElementEncoder>([new RegularEncoder(MouseCursor.IBEAM)]));
            _loc_4.family = getStyle("fontFamily");
            _loc_4.size = getStyle("timestampFontSize");
            _loc_4.color = getStyle("timestampColor");
            return new ChatListItemRendererFactory(_loc_2, _loc_3, _loc_4);
        }// end function

        private function addedToStageHandler(event:Event) : void
        {
            removeEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
            addEventListener(Event.REMOVED_FROM_STAGE, this.removedFromStageHandler);
            if (this.wasScrolledToBottom)
            {
                callLater(this.scrollToBottom);
            }
            return;
        }// end function

        private function removedFromStageHandler(event:Event) : void
        {
            removeEventListener(Event.REMOVED_FROM_STAGE, this.removedFromStageHandler);
            addEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
            this.wasScrolledToBottom = this.isScrolledToBottom;
            return;
        }// end function

        private function dataProviderChangeHandler(event:CollectionEvent) : void
        {
            if (stage)
            {
            }
            if (event.kind == CollectionEventKind.ADD)
            {
            }
            if (this.isScrolledToBottom)
            {
                callLater(this.scrollToBottom);
            }
            return;
        }// end function

        private function dataGroupMouseDownHandler(event:MouseEvent) : void
        {
            this.textSelection.clear();
            this.sandboxRoot.addEventListener(MouseEvent.MOUSE_MOVE, this.systemMouseMoveHandler, true);
            this.sandboxRoot.addEventListener(MouseEvent.MOUSE_UP, this.systemMouseUpHandler, true);
            this.sandboxRoot.addEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, this.systemMouseUpHandler);
            return;
        }// end function

        private function systemMouseMoveHandler(event:MouseEvent) : void
        {
            var _loc_3:TextLine = null;
            var _loc_4:ChatListItemRenderer = null;
            var _loc_2:* = dataGroup.getBounds(stage);
            _loc_2.y = _loc_2.y + dataGroup.scrollRect.y;
            if (!_loc_2.contains(event.stageX, event.stageY))
            {
                if (event.stageY <= _loc_2.bottom)
                {
                }
            }
            if (event.stageY < _loc_2.top)
            {
                if (event.stageY > _loc_2.bottom)
                {
                    this.dragScrollingDownwards = true;
                }
                else
                {
                    this.dragScrollingDownwards = false;
                }
                this.beginDragScrollPolling();
            }
            else
            {
                this.endDragScrollPolling();
            }
            if (event.target is TextLine)
            {
                _loc_3 = TextLine(event.target);
                _loc_4 = ChatListItemRenderer(_loc_3.parent.parent);
                if (this.selectingText)
                {
                    this.textSelection.toPoint(_loc_3, new Point(event.stageX, event.stageY), _loc_4.itemIndex);
                }
                else
                {
                    this.selectingText = true;
                    this.textSelection.fromPoint(_loc_3, new Point(event.stageX, event.stageY), _loc_4.itemIndex);
                }
            }
            return;
        }// end function

        private function systemMouseUpHandler(event:Event) : void
        {
            this.selectingText = false;
            this.endDragScrollPolling();
            this.sandboxRoot.removeEventListener(MouseEvent.MOUSE_MOVE, this.systemMouseMoveHandler, true);
            this.sandboxRoot.removeEventListener(MouseEvent.MOUSE_UP, this.systemMouseUpHandler, true);
            this.sandboxRoot.removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, this.systemMouseUpHandler);
            return;
        }// end function

        private function dataGroupPropertyChangeHandler(event:PropertyChangeEvent) : void
        {
            if (event.property == "verticalScrollPosition")
            {
                this.textSelectionCanvas.scrollRect = dataGroup.scrollRect;
            }
            return;
        }// end function

        private function beginDragScrollPolling() : void
        {
            if (!this.dragScrollPoller)
            {
                this.dragScrollPoller = new Timer(50);
            }
            if (!this.dragScrollPoller.running)
            {
                this.dragScrollPoller.reset();
                this.dragScrollPoller.addEventListener(TimerEvent.TIMER, this.dragScrollPollerHandler);
                this.dragScrollPoller.start();
            }
            return;
        }// end function

        private function endDragScrollPolling() : void
        {
            if (this.dragScrollPoller)
            {
            }
            if (this.dragScrollPoller.running)
            {
                this.dragScrollPoller.removeEventListener(TimerEvent.TIMER, this.dragScrollPollerHandler);
                this.dragScrollPoller.stop();
            }
            return;
        }// end function

        private function dragScrollPollerHandler(event:TimerEvent) : void
        {
            var _loc_2:ChatListItemRenderer = null;
            var _loc_3:TextLine = null;
            if (this.dataGroupLayout.firstIndexInView != -1)
            {
                if (this.selectingText)
                {
                    if (this.dragScrollingDownwards)
                    {
                        _loc_2 = ChatListItemRenderer(dataGroup.getElementAt(this.dataGroupLayout.lastIndexInView));
                        _loc_3 = _loc_2.lastLine;
                        this.textSelection.toEndOf(_loc_3, _loc_2.itemIndex);
                    }
                    else
                    {
                        _loc_2 = ChatListItemRenderer(dataGroup.getElementAt(this.dataGroupLayout.firstIndexInView));
                        _loc_3 = _loc_2.firstLine;
                        this.textSelection.toBeginningOf(_loc_3, _loc_2.itemIndex);
                    }
                }
                this.verticalScrollBar.changeValueByStep(this.dragScrollingDownwards);
            }
            return;
        }// end function

        private function contextMenuSelectHandler(event:ContextMenuEvent) : void
        {
            if (this.textSelection.hasSelection)
            {
                contextMenu.clipboardItems.copy = true;
            }
            else
            {
                contextMenu.clipboardItems.copy = false;
            }
            return;
        }// end function

        private function contextMenuCopyHandler(event:Event) : void
        {
            Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT, this.textSelection.copyUsing(this._dataProvider));
            return;
        }// end function

        private function contextMenuSelectAllHandler(event:Event) : void
        {
            return;
        }// end function

        private function initializeStyles() : void
        {
            var _loc_3:Number = NaN;
            var _loc_1:* = getStyle("fontSize");
            var _loc_2:* = getStyle("lineHeight").toString();
            if (_loc_2.charAt((_loc_2.length - 1)) == "%")
            {
                _loc_3 = parseFloat(_loc_2) * _loc_1 / 100;
            }
            else
            {
                _loc_3 = parseFloat(_loc_2);
            }
            ChatListItemRenderer.lineHeight = _loc_3;
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

        private static function classConstruct() : Boolean
        {
            var styleDeclaration:CSSStyleDeclaration;
            var styleManager:* = Application(FlexGlobals.topLevelApplication).styleManager;
            if (!styleManager.getStyleDeclaration("com.tinychat.ui.components.social.chat.ChatList"))
            {
                styleDeclaration = new CSSStyleDeclaration();
                styleDeclaration.defaultFactory = function () : void
            {
                this.timestampColor = 0;
                this.timestampFontSize = 10;
                this.smileySet = StringSmileySet;
                return;
            }// end function
            ;
                styleManager.setStyleDeclaration("com.tinychat.ui.components.social.chat.ChatList", styleDeclaration, true);
            }
            return true;
        }// end function

    }
}
