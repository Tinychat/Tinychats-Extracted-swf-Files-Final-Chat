package mx.controls
{
    import flash.display.*;
    import flash.events.*;
    import mx.collections.*;
    import mx.core.*;
    import mx.events.*;
    import mx.managers.*;
    import mx.styles.*;
    import mx.utils.*;

    public class ComboBase extends UIComponent implements IIMESupport, IFocusManagerComponent
    {
        protected var collection:ICollectionView;
        protected var iterator:IViewCursor;
        var collectionIterator:IViewCursor;
        var border:IFlexDisplayObject;
        var downArrowButton:Button;
        var wrapDownArrowButton:Boolean = true;
        var useFullDropdownSkin:Boolean = false;
        private var selectedUID:String;
        var selectionChanged:Boolean = false;
        var selectedIndexChanged:Boolean = false;
        var selectedItemChanged:Boolean = false;
        var oldBorderStyle:String;
        private var _enabled:Boolean = false;
        private var enabledChanged:Boolean = false;
        private var _editable:Boolean = false;
        var editableChanged:Boolean = true;
        private var _imeMode:String = null;
        private var _restrict:String;
        private var _selectedIndex:int = -1;
        private var _selectedItem:Object;
        private var _text:String = "";
        var textChanged:Boolean;
        protected var textInput:ITextInput;
        static const VERSION:String = "4.6.0.23201";
        static var createAccessibilityImplementation:Function;
        private static var _textInputStyleFilters:Object = {backgroundAlpha:"backgroundAlpha", backgroundColor:"backgroundColor", backgroundImage:"backgroundImage", backgroundDisabledColor:"backgroundDisabledColor", backgroundSize:"backgroundSize", borderAlpha:"borderAlpha", borderColor:"borderColor", borderSides:"borderSides", borderStyle:"borderStyle", borderThickness:"borderThickness", dropShadowColor:"dropShadowColor", dropShadowEnabled:"dropShadowEnabled", embedFonts:"embedFonts", focusAlpha:"focusAlpha", focusBlendMode:"focusBlendMode", focusRoundedCorners:"focusRoundedCorners", focusThickness:"focusThickness", leading:"leading", paddingLeft:"paddingLeft", paddingRight:"paddingRight", shadowDirection:"shadowDirection", shadowDistance:"shadowDistance", textDecoration:"textDecoration"};

        public function ComboBase()
        {
            tabEnabled = true;
            tabFocusEnabled = true;
            return;
        }// end function

        override public function get baselinePosition() : Number
        {
            if (!validateBaselinePosition())
            {
                return NaN;
            }
            return this.textInput.y + this.textInput.baselinePosition;
        }// end function

        override public function set enabled(value:Boolean) : void
        {
            super.enabled = value;
            this._enabled = value;
            this.enabledChanged = true;
            invalidateProperties();
            return;
        }// end function

        protected function get arrowButtonStyleFilters() : Object
        {
            return null;
        }// end function

        protected function get borderMetrics() : EdgeMetrics
        {
            if (this.border)
            {
            }
            if (this.border is IRectangularBorder)
            {
                return IRectangularBorder(this.border).mx.core:IBorder::borderMetrics;
            }
            return EdgeMetrics.EMPTY;
        }// end function

        public function get dataProvider() : Object
        {
            return this.collection;
        }// end function

        public function set dataProvider(value:Object) : void
        {
            var _loc_3:Array = null;
            if (value is Array)
            {
                this.collection = new ArrayCollection(value as Array);
            }
            else if (value is ICollectionView)
            {
                this.collection = ICollectionView(value);
            }
            else if (value is IList)
            {
                this.collection = new ListCollectionView(IList(value));
            }
            else if (value is XMLList)
            {
                this.collection = new XMLListCollection(value as XMLList);
            }
            else
            {
                _loc_3 = [value];
                this.collection = new ArrayCollection(_loc_3);
            }
            this.iterator = this.collection.createCursor();
            this.collectionIterator = this.collection.createCursor();
            this.collection.addEventListener(CollectionEvent.COLLECTION_CHANGE, this.collectionChangeHandler, false, 0, true);
            var _loc_2:* = new CollectionEvent(CollectionEvent.COLLECTION_CHANGE);
            _loc_2.kind = CollectionEventKind.RESET;
            this.collectionChangeHandler(_loc_2);
            dispatchEvent(_loc_2);
            invalidateSize();
            invalidateDisplayList();
            return;
        }// end function

        public function get editable() : Boolean
        {
            return this._editable;
        }// end function

        public function set editable(value:Boolean) : void
        {
            this._editable = value;
            this.editableChanged = true;
            invalidateProperties();
            dispatchEvent(new Event("editableChanged"));
            return;
        }// end function

        public function get enableIME() : Boolean
        {
            return this.editable;
        }// end function

        public function get imeMode() : String
        {
            return this._imeMode;
        }// end function

        public function set imeMode(value:String) : void
        {
            this._imeMode = value;
            if (this.textInput)
            {
                this.textInput.imeMode = this._imeMode;
            }
            return;
        }// end function

        public function get restrict() : String
        {
            return this._restrict;
        }// end function

        public function set restrict(value:String) : void
        {
            this._restrict = value;
            invalidateProperties();
            dispatchEvent(new Event("restrictChanged"));
            return;
        }// end function

        public function get selectedIndex() : int
        {
            return this._selectedIndex;
        }// end function

        public function set selectedIndex(value:int) : void
        {
            var _loc_2:CursorBookmark = null;
            var _loc_3:int = 0;
            var _loc_4:Object = null;
            var _loc_5:String = null;
            this._selectedIndex = value;
            if (value == -1)
            {
                this._selectedItem = null;
                this.selectedUID = null;
            }
            if (this.collection)
            {
            }
            if (this.collection.length == 0)
            {
                this.selectedIndexChanged = true;
            }
            else if (value != -1)
            {
                value = Math.min(value, (this.collection.length - 1));
                _loc_2 = this.iterator.bookmark;
                _loc_3 = value;
                this.iterator.seek(CursorBookmark.FIRST, _loc_3);
                _loc_4 = this.iterator.current;
                _loc_5 = this.itemToUID(_loc_4);
                this.iterator.seek(_loc_2, 0);
                this._selectedIndex = value;
                this._selectedItem = _loc_4;
                this.selectedUID = _loc_5;
            }
            this.selectionChanged = true;
            invalidateDisplayList();
            dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
            return;
        }// end function

        public function get selectedItem() : Object
        {
            return this._selectedItem;
        }// end function

        public function set selectedItem(data:Object) : void
        {
            this.setSelectedItem(data);
            return;
        }// end function

        private function setSelectedItem(data:Object, clearFirst:Boolean = true) : void
        {
            if (this.collection)
            {
            }
            if (this.collection.length == 0)
            {
                this._selectedItem = data;
                this.selectedItemChanged = true;
                invalidateDisplayList();
                return;
            }
            var _loc_3:Boolean = false;
            var _loc_4:* = this.collection.createCursor();
            var _loc_5:int = 0;
            do
            {
                
                if (data == _loc_4.current)
                {
                    this._selectedIndex = _loc_5;
                    this._selectedItem = data;
                    this.selectedUID = this.itemToUID(data);
                    this.selectionChanged = true;
                    _loc_3 = true;
                    break;
                }
                _loc_5 = _loc_5 + 1;
            }while (_loc_4.moveNext())
            if (!_loc_3)
            {
                this.selectedIndex = -1;
                this._selectedItem = null;
                this.selectedUID = null;
            }
            invalidateDisplayList();
            return;
        }// end function

        public function get text() : String
        {
            return this._text;
        }// end function

        public function set text(value:String) : void
        {
            this._text = value;
            this.textChanged = true;
            invalidateProperties();
            dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
            return;
        }// end function

        protected function get textInputStyleFilters() : Object
        {
            return _textInputStyleFilters;
        }// end function

        public function get value() : Object
        {
            if (this._editable)
            {
                return this.text;
            }
            var _loc_1:* = this.selectedItem;
            if (_loc_1 != null)
            {
            }
            if (typeof(_loc_1) != "object")
            {
                return _loc_1;
            }
            return _loc_1.data != null ? (_loc_1.data) : (_loc_1.label);
        }// end function

        override protected function initializeAccessibility() : void
        {
            if (ComboBase.createAccessibilityImplementation != null)
            {
                ComboBase.createAccessibilityImplementation(this);
            }
            return;
        }// end function

        override protected function createChildren() : void
        {
            var _loc_1:Class = null;
            var _loc_2:Object = null;
            var _loc_3:Class = null;
            super.createChildren();
            if (!this.border)
            {
                _loc_1 = getStyle("borderSkin");
                if (_loc_1)
                {
                    this.border = new _loc_1;
                    if (this.border is IFocusManagerComponent)
                    {
                        IFocusManagerComponent(this.border).focusEnabled = false;
                    }
                    if (this.border is ISimpleStyleClient)
                    {
                        ISimpleStyleClient(this.border).styleName = this;
                    }
                    addChild(DisplayObject(this.border));
                    if (FlexVersion.compatibilityVersion >= FlexVersion.VERSION_4_0)
                    {
                        this.border.visible = false;
                    }
                }
            }
            if (!this.downArrowButton)
            {
                this.downArrowButton = new Button();
                this.downArrowButton.styleName = new StyleProxy(this, this.arrowButtonStyleFilters);
                this.downArrowButton.focusEnabled = false;
                this.downArrowButton.tabEnabled = false;
                addChild(this.downArrowButton);
                this.downArrowButton.addEventListener(FlexEvent.BUTTON_DOWN, this.downArrowButton_buttonDownHandler);
            }
            if (!this.textInput)
            {
                _loc_2 = getStyle("textInputStyleName");
                if (!_loc_2)
                {
                    _loc_2 = new StyleProxy(this, this.textInputStyleFilters);
                }
                _loc_3 = getStyle("textInputClass");
                if (_loc_3)
                {
                }
                if (FlexVersion.compatibilityVersion < FlexVersion.VERSION_4_0)
                {
                    this.textInput = new TextInput();
                }
                else
                {
                    this.textInput = new _loc_3;
                }
                this.textInput.editable = this._editable;
                this.editableChanged = true;
                this.textInput.restrict = "^\x1b";
                this.textInput.focusEnabled = false;
                var _loc_4:* = this._editable;
                this.textInput.mouseChildren = this._editable;
                this.textInput.mouseEnabled = _loc_4;
                this.textInput.imeMode = this._imeMode;
                this.textInput.styleName = _loc_2;
                this.textInput.addEventListener(Event.CHANGE, this.textInput_changeHandler);
                this.textInput.addEventListener(FlexEvent.ENTER, this.textInput_enterHandler);
                this.textInput.addEventListener(FocusEvent.FOCUS_IN, this.focusInHandler);
                this.textInput.addEventListener(FocusEvent.FOCUS_OUT, this.focusOutHandler);
                this.textInput.addEventListener(FlexEvent.VALUE_COMMIT, this.textInput_valueCommitHandler);
                addChild(DisplayObject(this.textInput));
                this.textInput.move(0, 0);
                this.textInput.parentDrawsFocus = true;
            }
            return;
        }// end function

        override public function styleChanged(styleProp:String) : void
        {
            if (this.downArrowButton)
            {
                this.downArrowButton.styleChanged(styleProp);
            }
            if (this.textInput)
            {
                this.textInput.styleChanged(styleProp);
            }
            if (this.border)
            {
            }
            if (this.border is ISimpleStyleClient)
            {
                ISimpleStyleClient(this.border).styleChanged(styleProp);
            }
            super.styleChanged(styleProp);
            return;
        }// end function

        override protected function commitProperties() : void
        {
            var _loc_1:Boolean = false;
            super.commitProperties();
            this.textInput.restrict = this._restrict;
            if (this.textChanged)
            {
                this.textInput.text = this._text;
                this.textChanged = false;
            }
            if (this.enabledChanged)
            {
                this.textInput.enabled = this._enabled;
                this.editableChanged = true;
                this.downArrowButton.enabled = this._enabled;
                this.enabledChanged = false;
            }
            if (this.editableChanged)
            {
                this.editableChanged = false;
                _loc_1 = this._editable;
                if (this.wrapDownArrowButton == false)
                {
                    if (_loc_1)
                    {
                        if (this.oldBorderStyle)
                        {
                            setStyle("borderStyle", this.oldBorderStyle);
                        }
                    }
                    else
                    {
                        this.oldBorderStyle = getStyle("borderStyle");
                        setStyle("borderStyle", "comboNonEdit");
                    }
                }
                if (this.useFullDropdownSkin)
                {
                    if (_loc_1)
                    {
                    }
                    if (getStyle("editableSkin") != null)
                    {
                        this.downArrowButton.skinName = "editableSkin";
                    }
                    else
                    {
                        this.downArrowButton.skinName = "skin";
                    }
                    this.downArrowButton.upSkinName = _loc_1 ? ("editableUpSkin") : ("upSkin");
                    this.downArrowButton.overSkinName = _loc_1 ? ("editableOverSkin") : ("overSkin");
                    this.downArrowButton.downSkinName = _loc_1 ? ("editableDownSkin") : ("downSkin");
                    this.downArrowButton.disabledSkinName = _loc_1 ? ("editableDisabledSkin") : ("disabledSkin");
                    this.downArrowButton.changeSkins();
                    this.downArrowButton.invalidateDisplayList();
                }
                if (this.textInput)
                {
                    this.textInput.editable = _loc_1;
                    this.textInput.selectable = _loc_1;
                    if (_loc_1)
                    {
                        this.textInput.removeEventListener(MouseEvent.MOUSE_DOWN, this.textInput_mouseEventHandler);
                        this.textInput.removeEventListener(MouseEvent.MOUSE_UP, this.textInput_mouseEventHandler);
                        this.textInput.removeEventListener(MouseEvent.ROLL_OVER, this.textInput_mouseEventHandler);
                        this.textInput.removeEventListener(MouseEvent.ROLL_OUT, this.textInput_mouseEventHandler);
                        this.textInput.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
                    }
                    else
                    {
                        this.textInput.addEventListener(MouseEvent.MOUSE_DOWN, this.textInput_mouseEventHandler);
                        this.textInput.addEventListener(MouseEvent.MOUSE_UP, this.textInput_mouseEventHandler);
                        this.textInput.addEventListener(MouseEvent.ROLL_OVER, this.textInput_mouseEventHandler);
                        this.textInput.addEventListener(MouseEvent.ROLL_OUT, this.textInput_mouseEventHandler);
                        this.textInput.removeEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
                    }
                }
            }
            return;
        }// end function

        override protected function measure() : void
        {
            var _loc_4:Object = null;
            var _loc_5:EdgeMetrics = null;
            var _loc_6:Number = NaN;
            var _loc_7:Number = NaN;
            super.measure();
            var _loc_1:* = getStyle("arrowButtonWidth");
            var _loc_2:* = this.downArrowButton.getExplicitOrMeasuredHeight();
            if (this.collection)
            {
            }
            if (this.collection.length > 0)
            {
                _loc_4 = this.calculatePreferredSizeFromData(this.collection.length);
                _loc_5 = this.borderMetrics;
                _loc_6 = _loc_4.width + _loc_5.left + _loc_5.right + 8;
                _loc_7 = _loc_4.height + _loc_5.top + _loc_5.bottom + UITextField.TEXT_HEIGHT_PADDING;
                var _loc_8:* = _loc_6 + _loc_1;
                measuredWidth = _loc_6 + _loc_1;
                measuredMinWidth = _loc_8;
                var _loc_8:* = Math.max(_loc_7, _loc_2);
                measuredHeight = Math.max(_loc_7, _loc_2);
                measuredMinHeight = _loc_8;
            }
            else
            {
                measuredMinWidth = DEFAULT_MEASURED_MIN_WIDTH;
                measuredWidth = DEFAULT_MEASURED_WIDTH;
                measuredMinHeight = DEFAULT_MEASURED_MIN_HEIGHT;
                measuredHeight = DEFAULT_MEASURED_HEIGHT;
            }
            var _loc_3:* = getStyle("paddingTop") + getStyle("paddingBottom");
            measuredMinHeight = measuredMinHeight + _loc_3;
            measuredHeight = measuredHeight + _loc_3;
            return;
        }// end function

        override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number) : void
        {
            var _loc_7:EdgeMetrics = null;
            var _loc_8:Number = NaN;
            var _loc_9:Number = NaN;
            var _loc_10:Number = NaN;
            super.updateDisplayList(unscaledWidth, unscaledHeight);
            var _loc_3:* = unscaledWidth;
            var _loc_4:* = unscaledHeight;
            var _loc_5:* = getStyle("arrowButtonWidth");
            var _loc_6:* = this.textInput.getExplicitOrMeasuredHeight();
            if (isNaN(_loc_5))
            {
                _loc_5 = 0;
            }
            if (this.wrapDownArrowButton)
            {
                _loc_7 = this.borderMetrics;
                _loc_8 = _loc_4 - _loc_7.top - _loc_7.bottom;
                this.downArrowButton.setActualSize(_loc_8, _loc_8);
                this.downArrowButton.move(_loc_3 - _loc_5 - _loc_7.right, _loc_7.top);
                if (this.border)
                {
                    this.border.setActualSize(_loc_3, _loc_4);
                }
                this.textInput.setActualSize(_loc_3 - _loc_5, _loc_6);
            }
            else
            {
                if (!this._editable)
                {
                }
                if (this.useFullDropdownSkin)
                {
                    _loc_9 = getStyle("paddingTop");
                    _loc_10 = getStyle("paddingBottom");
                    this.downArrowButton.move(0, 0);
                    if (this.border)
                    {
                        this.border.setActualSize(_loc_3, _loc_4);
                    }
                    this.textInput.setActualSize(_loc_3 - _loc_5, _loc_6);
                    this.textInput.showBorderAndBackground(false);
                    this.textInput.move(this.textInput.x, (_loc_4 - _loc_6 - _loc_9 - _loc_10) / 2 + _loc_9);
                    this.downArrowButton.setActualSize(unscaledWidth, unscaledHeight);
                }
                else
                {
                    this.downArrowButton.move(_loc_3 - _loc_5, 0);
                    if (this.border)
                    {
                        this.border.setActualSize(_loc_3 - _loc_5, _loc_4);
                    }
                    this.textInput.setActualSize(_loc_3 - _loc_5, _loc_4);
                    this.downArrowButton.setActualSize(_loc_5, unscaledHeight);
                    this.textInput.showBorderAndBackground(true);
                }
            }
            if (this.selectedItemChanged)
            {
                this.selectedItem = this.selectedItem;
                this.selectedItemChanged = false;
                this.selectedIndexChanged = false;
            }
            if (this.selectedIndexChanged)
            {
                this.selectedIndex = this.selectedIndex;
                this.selectedIndexChanged = false;
            }
            return;
        }// end function

        override public function setFocus() : void
        {
            if (this.textInput)
            {
            }
            if (this._editable)
            {
                this.textInput.setFocus();
            }
            else
            {
                super.setFocus();
            }
            return;
        }// end function

        override protected function isOurFocus(target:DisplayObject) : Boolean
        {
            if (target != this.textInput)
            {
            }
            return super.isOurFocus(target);
        }// end function

        protected function calculatePreferredSizeFromData(numItems:int) : Object
        {
            return null;
        }// end function

        protected function itemToUID(data:Object) : String
        {
            if (!data)
            {
                return "null";
            }
            return UIDUtil.getUID(data);
        }// end function

        override protected function focusInHandler(event:FocusEvent) : void
        {
            super.focusInHandler(event);
            return;
        }// end function

        override protected function focusOutHandler(event:FocusEvent) : void
        {
            super.focusOutHandler(event);
            var _loc_2:* = focusManager;
            if (_loc_2)
            {
            }
            if (event.target == this)
            {
                _loc_2.defaultButtonEnabled = true;
            }
            if (this._editable)
            {
                dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
            }
            return;
        }// end function

        protected function collectionChangeHandler(event:Event) : void
        {
            var _loc_2:Boolean = false;
            var _loc_3:Number = NaN;
            var _loc_4:Object = null;
            var _loc_5:CollectionEvent = null;
            var _loc_6:int = 0;
            var _loc_7:String = null;
            if (event is CollectionEvent)
            {
                _loc_2 = false;
                _loc_5 = CollectionEvent(event);
                if (_loc_5.kind == CollectionEventKind.ADD)
                {
                    if (this.selectedIndex >= _loc_5.location)
                    {
                        var _loc_8:String = this;
                        var _loc_9:* = this._selectedIndex + 1;
                        _loc_8._selectedIndex = _loc_9;
                    }
                }
                if (_loc_5.kind == CollectionEventKind.REMOVE)
                {
                    _loc_6 = 0;
                    while (_loc_6 < _loc_5.items.length)
                    {
                        
                        _loc_7 = this.itemToUID(_loc_5.items[_loc_6]);
                        if (this.selectedUID == _loc_7)
                        {
                            this.selectionChanged = true;
                        }
                        _loc_6 = _loc_6 + 1;
                    }
                    if (this.selectionChanged)
                    {
                        if (this._selectedIndex >= this.collection.length)
                        {
                            this._selectedIndex = this.collection.length - 1;
                        }
                        this.selectedIndexChanged = true;
                        _loc_2 = true;
                        invalidateDisplayList();
                    }
                    else if (this.selectedIndex >= _loc_5.location)
                    {
                        var _loc_8:String = this;
                        var _loc_9:* = this._selectedIndex - 1;
                        _loc_8._selectedIndex = _loc_9;
                        this.selectedIndexChanged = true;
                        _loc_2 = true;
                        invalidateDisplayList();
                    }
                }
                if (_loc_5.kind == CollectionEventKind.REFRESH)
                {
                    this.selectedItemChanged = true;
                    _loc_2 = true;
                }
                invalidateDisplayList();
                if (_loc_2)
                {
                    dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
                }
            }
            return;
        }// end function

        private function textInput_mouseEventHandler(event:Event) : void
        {
            this.downArrowButton.dispatchEvent(event);
            return;
        }// end function

        protected function textInput_changeHandler(event:Event) : void
        {
            this._text = this.textInput.text;
            if (this._selectedIndex != -1)
            {
                this._selectedIndex = -1;
                this._selectedItem = null;
                this.selectedUID = null;
            }
            return;
        }// end function

        private function textInput_valueCommitHandler(event:FlexEvent) : void
        {
            this._text = this.textInput.text;
            dispatchEvent(event);
            return;
        }// end function

        private function textInput_enterHandler(event:FlexEvent) : void
        {
            dispatchEvent(event);
            dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
            return;
        }// end function

        protected function downArrowButton_buttonDownHandler(event:FlexEvent) : void
        {
            return;
        }// end function

        function getTextInput() : ITextInput
        {
            return this.textInput;
        }// end function

        function get ComboDownArrowButton() : Button
        {
            return this.downArrowButton;
        }// end function

    }
}
