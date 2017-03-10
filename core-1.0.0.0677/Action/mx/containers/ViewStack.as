package mx.containers
{
    import flash.display.*;
    import flash.events.*;
    import mx.automation.*;
    import mx.core.*;
    import mx.effects.*;
    import mx.events.*;
    import mx.geom.*;
    import mx.managers.*;

    public class ViewStack extends Container implements IHistoryManagerClient, ISelectableList
    {
        private var needToInstantiateSelectedChild:Boolean = false;
        private var bSaveState:Boolean = false;
        private var bInLoadState:Boolean = false;
        private var firstTime:Boolean = true;
        var vsMinWidth:Number;
        var vsMinHeight:Number;
        var vsPreferredWidth:Number;
        var vsPreferredHeight:Number;
        private var effectOverlayChild:UIComponent;
        private var effectOverlayTargetArea:RoundedRectangle;
        private var lastIndex:int = -1;
        private var dispatchChangeEventPending:Boolean = false;
        private var addingChildren:Boolean = false;
        var _historyManagementEnabled:Boolean = false;
        private var historyManagementEnabledChanged:Boolean = false;
        private var _resizeToContent:Boolean = false;
        private var _selectedIndex:int = -1;
        private var proposedSelectedIndex:int = -1;
        private var initialSelectedIndex:int = -1;
        static const VERSION:String = "4.6.0.23201";

        public function ViewStack()
        {
            return;
        }// end function

        override public function get autoLayout() : Boolean
        {
            return true;
        }// end function

        override public function set autoLayout(value:Boolean) : void
        {
            return;
        }// end function

        override public function get horizontalScrollPolicy() : String
        {
            return ScrollPolicy.OFF;
        }// end function

        override public function set horizontalScrollPolicy(value:String) : void
        {
            return;
        }// end function

        override public function get verticalScrollPolicy() : String
        {
            return ScrollPolicy.OFF;
        }// end function

        override public function set verticalScrollPolicy(value:String) : void
        {
            return;
        }// end function

        protected function get contentHeight() : Number
        {
            var _loc_1:* = viewMetricsAndPadding;
            return unscaledHeight - _loc_1.top - _loc_1.bottom;
        }// end function

        protected function get contentWidth() : Number
        {
            var _loc_1:* = viewMetricsAndPadding;
            return unscaledWidth - _loc_1.left - _loc_1.right;
        }// end function

        protected function get contentX() : Number
        {
            return getStyle("paddingLeft");
        }// end function

        protected function get contentY() : Number
        {
            return getStyle("paddingTop");
        }// end function

        public function get historyManagementEnabled() : Boolean
        {
            return this._historyManagementEnabled;
        }// end function

        public function set historyManagementEnabled(value:Boolean) : void
        {
            if (value != this._historyManagementEnabled)
            {
                this._historyManagementEnabled = value;
                this.historyManagementEnabledChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function get resizeToContent() : Boolean
        {
            return this._resizeToContent;
        }// end function

        public function set resizeToContent(value:Boolean) : void
        {
            if (value != this._resizeToContent)
            {
                this._resizeToContent = value;
                if (value)
                {
                    invalidateSize();
                }
            }
            return;
        }// end function

        public function get selectedChild() : INavigatorContent
        {
            if (this.selectedIndex == -1)
            {
                return null;
            }
            return INavigatorContent(getChildAt(this.selectedIndex));
        }// end function

        public function set selectedChild(value:INavigatorContent) : void
        {
            var _loc_2:* = getChildIndex(DisplayObject(value));
            if (_loc_2 >= 0)
            {
            }
            if (_loc_2 < numChildren)
            {
                this.selectedIndex = _loc_2;
            }
            return;
        }// end function

        public function get selectedIndex() : int
        {
            return this.proposedSelectedIndex == -1 ? (this._selectedIndex) : (this.proposedSelectedIndex);
        }// end function

        public function set selectedIndex(value:int) : void
        {
            if (value == this.selectedIndex)
            {
                return;
            }
            if (this.addingChildren)
            {
                return;
            }
            this.proposedSelectedIndex = value;
            invalidateProperties();
            if (this.historyManagementEnabled)
            {
            }
            if (this._selectedIndex != -1)
            {
            }
            if (!this.bInLoadState)
            {
                this.bSaveState = true;
            }
            dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.historyManagementEnabledChanged)
            {
                if (this.historyManagementEnabled)
                {
                    HistoryManager.register(this);
                }
                else
                {
                    HistoryManager.unregister(this);
                }
                this.historyManagementEnabledChanged = false;
            }
            if (this.proposedSelectedIndex != -1)
            {
                this.commitSelectedIndex(this.proposedSelectedIndex);
                this.proposedSelectedIndex = -1;
            }
            if (this.needToInstantiateSelectedChild)
            {
                this.instantiateSelectedChild();
                this.needToInstantiateSelectedChild = false;
            }
            if (this.dispatchChangeEventPending)
            {
                this.dispatchChangeEvent(this.lastIndex, this.selectedIndex);
                this.dispatchChangeEventPending = false;
            }
            if (this.firstTime)
            {
                this.firstTime = false;
                addEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler, false, 0, true);
                addEventListener(Event.REMOVED_FROM_STAGE, this.removedFromStageHandler, false, 0, true);
            }
            return;
        }// end function

        override protected function measure() : void
        {
            var _loc_2:Number = NaN;
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            var _loc_8:UIComponent = null;
            super.measure();
            var _loc_1:Number = 0;
            _loc_2 = 0;
            _loc_3 = 0;
            _loc_4 = 0;
            if (this.vsPreferredWidth)
            {
            }
            if (!this._resizeToContent)
            {
                measuredMinWidth = this.vsMinWidth;
                measuredMinHeight = this.vsMinHeight;
                measuredWidth = this.vsPreferredWidth;
                measuredHeight = this.vsPreferredHeight;
                return;
            }
            if (numChildren > 0)
            {
            }
            if (this.selectedIndex != -1)
            {
                _loc_8 = UIComponent(getChildAt(this.selectedIndex));
                _loc_1 = _loc_8.minWidth;
                _loc_3 = _loc_8.getExplicitOrMeasuredWidth();
                _loc_2 = _loc_8.minHeight;
                _loc_4 = _loc_8.getExplicitOrMeasuredHeight();
            }
            var _loc_5:* = viewMetricsAndPadding;
            var _loc_6:* = _loc_5.left + _loc_5.right;
            _loc_1 = _loc_1 + _loc_6;
            _loc_3 = _loc_3 + _loc_6;
            var _loc_7:* = _loc_5.top + _loc_5.bottom;
            _loc_2 = _loc_2 + _loc_7;
            _loc_4 = _loc_4 + _loc_7;
            measuredMinWidth = _loc_1;
            measuredMinHeight = _loc_2;
            measuredWidth = _loc_3;
            measuredHeight = _loc_4;
            if (this.selectedChild)
            {
            }
            if (INavigatorContent(this.selectedChild).deferredContentCreated == false)
            {
                return;
            }
            if (numChildren == 0)
            {
                return;
            }
            this.vsMinWidth = _loc_1;
            this.vsMinHeight = _loc_2;
            this.vsPreferredWidth = _loc_3;
            this.vsPreferredHeight = _loc_4;
            return;
        }// end function

        override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number) : void
        {
            var _loc_8:UIComponent = null;
            var _loc_9:Number = NaN;
            var _loc_10:Number = NaN;
            super.updateDisplayList(unscaledWidth, unscaledHeight);
            var _loc_3:* = numChildren;
            var _loc_4:* = this.contentWidth;
            var _loc_5:* = this.contentHeight;
            var _loc_6:* = this.contentX;
            var _loc_7:* = this.contentY;
            if (this.selectedIndex != -1)
            {
                _loc_8 = UIComponent(getChildAt(this.selectedIndex));
                _loc_9 = _loc_4;
                _loc_10 = _loc_5;
                if (!isNaN(_loc_8.percentWidth))
                {
                    if (_loc_9 > _loc_8.maxWidth)
                    {
                        _loc_9 = _loc_8.maxWidth;
                    }
                }
                else if (_loc_9 > _loc_8.explicitWidth)
                {
                    _loc_9 = _loc_8.explicitWidth;
                }
                if (!isNaN(_loc_8.percentHeight))
                {
                    if (_loc_10 > _loc_8.maxHeight)
                    {
                        _loc_10 = _loc_8.maxHeight;
                    }
                }
                else if (_loc_10 > _loc_8.explicitHeight)
                {
                    _loc_10 = _loc_8.explicitHeight;
                }
                if (_loc_8.width == _loc_9)
                {
                }
                if (_loc_8.height != _loc_10)
                {
                    _loc_8.setActualSize(_loc_9, _loc_10);
                }
                if (_loc_8.x == _loc_6)
                {
                }
                if (_loc_8.y != _loc_7)
                {
                    _loc_8.move(_loc_6, _loc_7);
                }
                _loc_8.visible = true;
            }
            return;
        }// end function

        override function addOverlay(color:uint, targetArea:RoundedRectangle = null) : void
        {
            if (this.effectOverlayChild)
            {
                this.removeOverlay();
            }
            this.effectOverlayChild = this.selectedChild as UIComponent;
            if (!this.effectOverlayChild)
            {
                return;
            }
            effectOverlayColor = color;
            this.effectOverlayTargetArea = targetArea;
            if (this.selectedChild)
            {
            }
            if (this.selectedChild.deferredContentCreated == false)
            {
                this.selectedChild.addEventListener(FlexEvent.INITIALIZE, this.initializeHandler);
            }
            else
            {
                this.initializeHandler(null);
            }
            return;
        }// end function

        override function removeOverlay() : void
        {
            if (this.effectOverlayChild)
            {
                UIComponent(this.effectOverlayChild).removeOverlay();
                this.effectOverlayChild = null;
            }
            return;
        }// end function

        override function setActualCreationPolicies(policy:String) : void
        {
            var _loc_2:int = 0;
            var _loc_3:INavigatorContent = null;
            super.setActualCreationPolicies(policy);
            if (policy == ContainerCreationPolicy.ALL)
            {
            }
            if (numChildren > 0)
            {
                _loc_2 = 0;
                while (_loc_2 < numChildren)
                {
                    
                    _loc_3 = getChildAt(_loc_2) as INavigatorContent;
                    if (_loc_3)
                    {
                    }
                    if (_loc_3.deferredContentCreated == false)
                    {
                        _loc_3.createDeferredContent();
                    }
                    _loc_2 = _loc_2 + 1;
                }
            }
            return;
        }// end function

        override public function createComponentsFromDescriptors(recurse:Boolean = true) : void
        {
            if (actualCreationPolicy == ContainerCreationPolicy.ALL)
            {
                super.createComponentsFromDescriptors();
                return;
            }
            var _loc_2:* = numChildren;
            var _loc_3:* = childDescriptors ? (childDescriptors.length) : (0);
            var _loc_4:int = 0;
            while (_loc_4 < _loc_3)
            {
                
                createComponentFromDescriptor(childDescriptors[_loc_4], false);
                _loc_4 = _loc_4 + 1;
            }
            numChildrenCreated = numChildren - _loc_2;
            processedDescriptors = true;
            dispatchEvent(new FlexEvent(FlexEvent.CONTENT_CREATION_COMPLETE));
            return;
        }// end function

        public function saveState() : Object
        {
            var _loc_1:* = this._selectedIndex == -1 ? (0) : (this._selectedIndex);
            return {selectedIndex:_loc_1};
        }// end function

        public function loadState(state:Object) : void
        {
            var _loc_2:* = state ? (int(state.selectedIndex)) : (0);
            if (_loc_2 == -1)
            {
                _loc_2 = this.initialSelectedIndex;
            }
            if (_loc_2 == -1)
            {
                _loc_2 = 0;
            }
            if (_loc_2 != this._selectedIndex)
            {
                this.bInLoadState = true;
                this.selectedIndex = _loc_2;
                this.bInLoadState = false;
            }
            return;
        }// end function

        protected function commitSelectedIndex(newIndex:int) : void
        {
            var _loc_3:UIComponent = null;
            var _loc_4:Effect = null;
            if (numChildren == 0)
            {
                this._selectedIndex = -1;
                return;
            }
            if (newIndex < 0)
            {
                newIndex = 0;
            }
            else if (newIndex > (numChildren - 1))
            {
                newIndex = numChildren - 1;
            }
            if (this.lastIndex != -1)
            {
            }
            if (this.lastIndex < numChildren)
            {
                UIComponent(getChildAt(this.lastIndex)).endEffectsStarted();
            }
            if (this._selectedIndex != -1)
            {
                (this.selectedChild as UIComponent).endEffectsStarted();
            }
            this.lastIndex = this._selectedIndex;
            if (newIndex == this.lastIndex)
            {
                return;
            }
            this._selectedIndex = newIndex;
            if (this.initialSelectedIndex == -1)
            {
                this.initialSelectedIndex = this._selectedIndex;
            }
            if (this.lastIndex != -1)
            {
            }
            if (newIndex != -1)
            {
                this.dispatchChangeEventPending = true;
            }
            var _loc_2:Boolean = false;
            if (this.lastIndex != -1)
            {
            }
            if (this.lastIndex < numChildren)
            {
                _loc_3 = UIComponent(getChildAt(this.lastIndex));
                _loc_3.setVisible(false);
                if (_loc_3.getStyle("hideEffect"))
                {
                    _loc_4 = EffectManager.lastEffectCreated;
                    if (_loc_4)
                    {
                        _loc_4.addEventListener(EffectEvent.EFFECT_END, this.hideEffectEndHandler);
                        _loc_2 = true;
                    }
                }
            }
            if (!_loc_2)
            {
                this.hideEffectEndHandler(null);
            }
            return;
        }// end function

        private function hideEffectEndHandler(event:EffectEvent) : void
        {
            if (event)
            {
                event.currentTarget.removeEventListener(EffectEvent.EFFECT_END, this.hideEffectEndHandler);
            }
            this.needToInstantiateSelectedChild = true;
            invalidateProperties();
            if (this.bSaveState)
            {
                HistoryManager.save();
                this.bSaveState = false;
            }
            return;
        }// end function

        private function instantiateSelectedChild() : void
        {
            if (!this.selectedChild)
            {
                return;
            }
            if (this.selectedChild)
            {
            }
            if (this.selectedChild.deferredContentCreated == false)
            {
                if (initialized)
                {
                    this.selectedChild.addEventListener(FlexEvent.CREATION_COMPLETE, this.childCreationCompleteHandler);
                }
                this.selectedChild.createDeferredContent();
            }
            if (this.selectedChild is IInvalidating)
            {
                IInvalidating(this.selectedChild).invalidateSize();
            }
            invalidateSize();
            invalidateDisplayList();
            return;
        }// end function

        private function dispatchChangeEvent(oldIndex:int, newIndex:int) : void
        {
            var _loc_3:* = new IndexChangedEvent(IndexChangedEvent.CHANGE);
            _loc_3.oldIndex = oldIndex;
            _loc_3.newIndex = newIndex;
            _loc_3.relatedObject = getChildAt(newIndex);
            dispatchEvent(_loc_3);
            return;
        }// end function

        private function addedToStageHandler(event:Event) : void
        {
            if (this.historyManagementEnabled)
            {
                HistoryManager.register(this);
            }
            return;
        }// end function

        private function removedFromStageHandler(event:Event) : void
        {
            HistoryManager.unregister(this);
            return;
        }// end function

        private function initializeHandler(event:FlexEvent) : void
        {
            this.effectOverlayChild.removeEventListener(FlexEvent.INITIALIZE, this.initializeHandler);
            UIComponent(this.effectOverlayChild).addOverlay(effectOverlayColor, this.effectOverlayTargetArea);
            return;
        }// end function

        private function childCreationCompleteHandler(event:FlexEvent) : void
        {
            event.target.removeEventListener(FlexEvent.CREATION_COMPLETE, this.childCreationCompleteHandler);
            event.target.dispatchEvent(new FlexEvent(FlexEvent.SHOW));
            return;
        }// end function

        private function childAddHandler(child:DisplayObject) : void
        {
            var _loc_3:IUIComponent = null;
            var _loc_2:* = getChildIndex(child);
            if (child is IUIComponent)
            {
                _loc_3 = IUIComponent(child);
                _loc_3.visible = false;
            }
            if (child is INavigatorContent)
            {
                child.addEventListener("labelChanged", this.navigatorChildChangedHandler);
                child.addEventListener("iconChanged", this.navigatorChildChangedHandler);
            }
            if (numChildren == 1)
            {
            }
            if (this.proposedSelectedIndex == -1)
            {
                this._selectedIndex = 0;
                dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
                this.needToInstantiateSelectedChild = true;
                invalidateProperties();
            }
            else
            {
                if (_loc_2 <= this.selectedIndex)
                {
                }
                if (numChildren > 1)
                {
                }
                if (this.proposedSelectedIndex == -1)
                {
                    var _loc_4:String = this;
                    var _loc_5:* = this._selectedIndex + 1;
                    _loc_4._selectedIndex = _loc_5;
                    dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
                }
            }
            if (child is IAutomationObject)
            {
                IAutomationObject(child).showInAutomationHierarchy = true;
            }
            return;
        }// end function

        private function childRemoveHandler(child:DisplayObject, index:int) : void
        {
            if (child is INavigatorContent)
            {
                child.removeEventListener("labelChanged", this.navigatorChildChangedHandler);
                child.removeEventListener("iconChanged", this.navigatorChildChangedHandler);
            }
            if (index > this.selectedIndex)
            {
                return;
            }
            var _loc_3:* = this.selectedIndex;
            if (index >= _loc_3)
            {
            }
            if (_loc_3 == numChildren)
            {
                if (_loc_3 == 0)
                {
                    this._selectedIndex = -1;
                    dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
                }
                else
                {
                    var _loc_4:String = this;
                    var _loc_5:* = this._selectedIndex - 1;
                    _loc_4._selectedIndex = _loc_5;
                    dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
                }
            }
            else if (index == _loc_3)
            {
                this.needToInstantiateSelectedChild = true;
                invalidateProperties();
            }
            return;
        }// end function

        override public function addChildAt(item:DisplayObject, index:int) : DisplayObject
        {
            this.addingChildren = true;
            var _loc_3:* = super.addChildAt(item, index);
            this.internalDispatchEvent(CollectionEventKind.ADD, _loc_3, index);
            this.childAddHandler(item);
            this.addingChildren = false;
            return _loc_3;
        }// end function

        override public function removeChild(item:DisplayObject) : DisplayObject
        {
            var _loc_2:* = getChildIndex(item);
            var _loc_3:* = super.removeChild(item);
            this.internalDispatchEvent(CollectionEventKind.REMOVE, _loc_3, _loc_2);
            this.childRemoveHandler(item, _loc_2);
            return _loc_3;
        }// end function

        override public function removeAllChildren() : void
        {
            super.removeAllChildren();
            this.internalDispatchEvent(CollectionEventKind.RESET);
            return;
        }// end function

        private function navigatorChildChangedHandler(event:Event) : void
        {
            var _loc_2:* = new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE);
            _loc_2.source = event.target;
            _loc_2.property = event.type == "labelChanged" ? ("label") : ("icon");
            this.internalDispatchEvent(CollectionEventKind.UPDATE, _loc_2, getChildIndex(event.target as DisplayObject));
            return;
        }// end function

        private function internalDispatchEvent(kind:String, item:Object = null, location:int = -1) : void
        {
            var _loc_4:CollectionEvent = null;
            var _loc_5:PropertyChangeEvent = null;
            if (hasEventListener(CollectionEvent.COLLECTION_CHANGE))
            {
                _loc_4 = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE);
                _loc_4.kind = kind;
                _loc_4.items.push(item);
                _loc_4.location = location;
                dispatchEvent(_loc_4);
            }
            if (hasEventListener(PropertyChangeEvent.PROPERTY_CHANGE))
            {
                hasEventListener(PropertyChangeEvent.PROPERTY_CHANGE);
                if (kind != CollectionEventKind.ADD)
                {
                }
            }
            if (kind == CollectionEventKind.REMOVE)
            {
                _loc_5 = new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE);
                _loc_5.property = location;
                if (kind == CollectionEventKind.ADD)
                {
                    _loc_5.newValue = item;
                }
                else
                {
                    _loc_5.oldValue = item;
                }
                dispatchEvent(_loc_5);
            }
            return;
        }// end function

        public function get length() : int
        {
            return numChildren;
        }// end function

        public function addItem(item:Object) : void
        {
            addChild(item as DisplayObject);
            return;
        }// end function

        public function addItemAt(item:Object, index:int) : void
        {
            this.addChildAt(item as DisplayObject, index);
            return;
        }// end function

        public function getItemAt(index:int, prefetch:int = 0) : Object
        {
            return getChildAt(index);
        }// end function

        public function getItemIndex(item:Object) : int
        {
            return getChildIndex(item as DisplayObject);
        }// end function

        public function itemUpdated(item:Object, property:Object = null, oldValue:Object = null, newValue:Object = null) : void
        {
            return;
        }// end function

        public function removeAll() : void
        {
            this.removeAllChildren();
            return;
        }// end function

        public function removeItemAt(index:int) : Object
        {
            return removeChildAt(index);
        }// end function

        public function setItemAt(item:Object, index:int) : Object
        {
            var _loc_3:* = removeChildAt(index);
            this.addChildAt(item as DisplayObject, index);
            return _loc_3;
        }// end function

        public function toArray() : Array
        {
            var _loc_1:Array = [];
            var _loc_2:int = 0;
            while (_loc_2 < numChildren)
            {
                
                _loc_1.push(getChildAt(_loc_2));
                _loc_2 = _loc_2 + 1;
            }
            return _loc_1;
        }// end function

    }
}
