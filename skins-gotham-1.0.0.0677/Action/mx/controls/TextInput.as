package mx.controls
{
    import flash.accessibility.*;
    import flash.display.*;
    import flash.events.*;
    import flash.system.*;
    import flash.text.*;
    import flash.ui.*;
    import mx.controls.listClasses.*;
    import mx.core.*;
    import mx.events.*;
    import mx.managers.*;
    import mx.styles.*;

    public class TextInput extends UIComponent implements ITextInput
    {
        var border:IFlexDisplayObject;
        private var textSet:Boolean;
        private var selectionChanged:Boolean = false;
        private var errorCaught:Boolean = false;
        private var _accessibilityProperties:AccessibilityProperties;
        private var accessibilityPropertiesChanged:Boolean = false;
        private var enabledChanged:Boolean = false;
        private var _tabIndex:int = -1;
        private var tabIndexChanged:Boolean = false;
        private var _condenseWhite:Boolean = false;
        private var condenseWhiteChanged:Boolean = false;
        private var _data:Object;
        private var _displayAsPassword:Boolean = false;
        private var displayAsPasswordChanged:Boolean = false;
        private var _editable:Boolean = true;
        private var editableChanged:Boolean = false;
        private var _horizontalScrollPosition:Number = 0;
        private var horizontalScrollPositionChanged:Boolean = false;
        private var _htmlText:String = "";
        private var htmlTextChanged:Boolean = false;
        private var explicitHTMLText:String = null;
        private var _imeMode:String = null;
        private var _listData:BaseListData;
        private var _maxChars:int = 0;
        private var maxCharsChanged:Boolean = false;
        private var _parentDrawsFocus:Boolean = false;
        private var _restrict:String;
        private var restrictChanged:Boolean = false;
        private var _selectable:Boolean = true;
        private var selectableChanged:Boolean = false;
        private var _selectionBeginIndex:int = 0;
        private var _selectionEndIndex:int = 0;
        private var _text:String = "";
        private var textChanged:Boolean = false;
        protected var textField:IUITextField;
        private var _textHeight:Number;
        private var _textWidth:Number;
        static const VERSION:String = "4.6.0.23201";

        public function TextInput()
        {
            return;
        }// end function

        override public function get accessibilityProperties() : AccessibilityProperties
        {
            return this._accessibilityProperties;
        }// end function

        override public function set accessibilityProperties(value:AccessibilityProperties) : void
        {
            if (value == this._accessibilityProperties)
            {
                return;
            }
            this._accessibilityProperties = value;
            this.accessibilityPropertiesChanged = true;
            invalidateProperties();
            return;
        }// end function

        override public function get baselinePosition() : Number
        {
            if (!validateBaselinePosition())
            {
                return NaN;
            }
            return this.textField.y + this.textField.baselinePosition;
        }// end function

        override public function set enabled(value:Boolean) : void
        {
            if (value == enabled)
            {
                return;
            }
            super.enabled = value;
            this.enabledChanged = true;
            invalidateProperties();
            if (this.border)
            {
            }
            if (this.border is IInvalidating)
            {
                IInvalidating(this.border).invalidateDisplayList();
            }
            return;
        }// end function

        public function get fontContext() : IFlexModuleFactory
        {
            return moduleFactory;
        }// end function

        public function set fontContext(moduleFactory:IFlexModuleFactory) : void
        {
            this.moduleFactory = moduleFactory;
            return;
        }// end function

        override public function get tabIndex() : int
        {
            return this._tabIndex;
        }// end function

        override public function set tabIndex(value:int) : void
        {
            if (value == this._tabIndex)
            {
                return;
            }
            this._tabIndex = value;
            this.tabIndexChanged = true;
            invalidateProperties();
            return;
        }// end function

        public function get condenseWhite() : Boolean
        {
            return this._condenseWhite;
        }// end function

        public function set condenseWhite(value:Boolean) : void
        {
            if (value == this._condenseWhite)
            {
                return;
            }
            this._condenseWhite = value;
            this.condenseWhiteChanged = true;
            if (this.isHTML)
            {
                this.htmlTextChanged = true;
            }
            invalidateProperties();
            invalidateSize();
            invalidateDisplayList();
            dispatchEvent(new Event("condenseWhiteChanged"));
            return;
        }// end function

        public function get data() : Object
        {
            return this._data;
        }// end function

        public function set data(value:Object) : void
        {
            var _loc_2:* = undefined;
            this._data = value;
            if (this._listData)
            {
                _loc_2 = this._listData.label;
            }
            else if (this._data != null)
            {
                if (this._data is String)
                {
                    _loc_2 = String(this._data);
                }
                else
                {
                    _loc_2 = this._data.toString();
                }
            }
            if (_loc_2 !== undefined)
            {
            }
            if (!this.textSet)
            {
                this.text = _loc_2;
                this.textSet = false;
                this.textField.setSelection(0, 0);
            }
            dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
            return;
        }// end function

        public function get displayAsPassword() : Boolean
        {
            return this._displayAsPassword;
        }// end function

        public function set displayAsPassword(value:Boolean) : void
        {
            if (value == this._displayAsPassword)
            {
                return;
            }
            this._displayAsPassword = value;
            this.displayAsPasswordChanged = true;
            invalidateProperties();
            invalidateSize();
            invalidateDisplayList();
            dispatchEvent(new Event("displayAsPasswordChanged"));
            return;
        }// end function

        public function get editable() : Boolean
        {
            return this._editable;
        }// end function

        public function set editable(value:Boolean) : void
        {
            if (value == this._editable)
            {
                return;
            }
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

        public function get horizontalScrollPosition() : Number
        {
            return this._horizontalScrollPosition;
        }// end function

        public function set horizontalScrollPosition(value:Number) : void
        {
            if (value == this._horizontalScrollPosition)
            {
                return;
            }
            this._horizontalScrollPosition = value;
            this.horizontalScrollPositionChanged = true;
            invalidateProperties();
            dispatchEvent(new Event("horizontalScrollPositionChanged"));
            return;
        }// end function

        public function get htmlText() : String
        {
            return this._htmlText;
        }// end function

        public function set htmlText(value:String) : void
        {
            this.textSet = true;
            if (!value)
            {
                value = "";
            }
            this._htmlText = value;
            this.htmlTextChanged = true;
            this._text = null;
            this.explicitHTMLText = value;
            invalidateProperties();
            invalidateSize();
            invalidateDisplayList();
            dispatchEvent(new Event("htmlTextChanged"));
            return;
        }// end function

        public function get imeMode() : String
        {
            return this._imeMode;
        }// end function

        public function set imeMode(value:String) : void
        {
            this._imeMode = value;
            return;
        }// end function

        private function get isHTML() : Boolean
        {
            return this.explicitHTMLText != null;
        }// end function

        public function get length() : int
        {
            return this.text != null ? (this.text.length) : (-1);
        }// end function

        public function get listData() : BaseListData
        {
            return this._listData;
        }// end function

        public function set listData(value:BaseListData) : void
        {
            this._listData = value;
            return;
        }// end function

        public function get maxChars() : int
        {
            return this._maxChars;
        }// end function

        public function set maxChars(value:int) : void
        {
            if (value == this._maxChars)
            {
                return;
            }
            this._maxChars = value;
            this.maxCharsChanged = true;
            invalidateProperties();
            dispatchEvent(new Event("maxCharsChanged"));
            return;
        }// end function

        public function get maxHorizontalScrollPosition() : Number
        {
            return this.textField ? (this.textField.maxScrollH) : (0);
        }// end function

        public function get parentDrawsFocus() : Boolean
        {
            return this._parentDrawsFocus;
        }// end function

        public function set parentDrawsFocus(value:Boolean) : void
        {
            this._parentDrawsFocus = value;
            return;
        }// end function

        public function get restrict() : String
        {
            return this._restrict;
        }// end function

        public function set restrict(value:String) : void
        {
            if (value == this._restrict)
            {
                return;
            }
            this._restrict = value;
            this.restrictChanged = true;
            invalidateProperties();
            dispatchEvent(new Event("restrictChanged"));
            return;
        }// end function

        public function get selectable() : Boolean
        {
            return this._selectable;
        }// end function

        public function set selectable(value:Boolean) : void
        {
            if (this._selectable == value)
            {
                return;
            }
            this._selectable = value;
            this.selectableChanged = true;
            invalidateProperties();
            return;
        }// end function

        public function get selectionBeginIndex() : int
        {
            return this.textField ? (this.textField.selectionBeginIndex) : (this._selectionBeginIndex);
        }// end function

        public function set selectionBeginIndex(value:int) : void
        {
            this._selectionBeginIndex = value;
            this.selectionChanged = true;
            invalidateProperties();
            return;
        }// end function

        public function get selectionEndIndex() : int
        {
            return this.textField ? (this.textField.selectionEndIndex) : (this._selectionEndIndex);
        }// end function

        public function set selectionEndIndex(value:int) : void
        {
            this._selectionEndIndex = value;
            this.selectionChanged = true;
            invalidateProperties();
            return;
        }// end function

        public function get text() : String
        {
            return this._text;
        }// end function

        public function set text(value:String) : void
        {
            this.textSet = true;
            if (!value)
            {
                value = "";
            }
            if (!this.isHTML)
            {
            }
            if (value == this._text)
            {
                return;
            }
            this._text = value;
            this.textChanged = true;
            this._htmlText = null;
            this.explicitHTMLText = null;
            invalidateProperties();
            invalidateSize();
            invalidateDisplayList();
            dispatchEvent(new Event("textChanged"));
            dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
            return;
        }// end function

        public function get textHeight() : Number
        {
            return this._textHeight;
        }// end function

        public function get textWidth() : Number
        {
            return this._textWidth;
        }// end function

        override protected function createChildren() : void
        {
            super.createChildren();
            this.createBorder();
            this.createTextField(-1);
            return;
        }// end function

        override protected function commitProperties() : void
        {
            var _loc_1:int = 0;
            super.commitProperties();
            if (hasFontContextChanged())
            {
                hasFontContextChanged();
            }
            if (this.textField != null)
            {
                _loc_1 = getChildIndex(DisplayObject(this.textField));
                this.removeTextField();
                this.createTextField(_loc_1);
                this.accessibilityPropertiesChanged = true;
                this.condenseWhiteChanged = true;
                this.displayAsPasswordChanged = true;
                this.enabledChanged = true;
                this.maxCharsChanged = true;
                this.restrictChanged = true;
                this.tabIndexChanged = true;
                this.textChanged = true;
                this.selectionChanged = true;
                this.horizontalScrollPositionChanged = true;
            }
            if (this.accessibilityPropertiesChanged)
            {
                this.textField.accessibilityProperties = this._accessibilityProperties;
                this.accessibilityPropertiesChanged = false;
            }
            if (this.condenseWhiteChanged)
            {
                this.textField.condenseWhite = this._condenseWhite;
                this.condenseWhiteChanged = false;
            }
            if (this.displayAsPasswordChanged)
            {
                this.textField.displayAsPassword = this._displayAsPassword;
                this.displayAsPasswordChanged = false;
            }
            if (!this.enabledChanged)
            {
            }
            if (this.editableChanged)
            {
                if (enabled)
                {
                }
                this.textField.type = this._editable ? (TextFieldType.INPUT) : (TextFieldType.DYNAMIC);
                if (this.enabledChanged)
                {
                    if (this.textField.enabled != enabled)
                    {
                        this.textField.enabled = enabled;
                    }
                    this.enabledChanged = false;
                }
                this.selectableChanged = true;
                this.editableChanged = false;
            }
            if (this.selectableChanged)
            {
                if (this._editable)
                {
                    this.textField.selectable = enabled;
                }
                else
                {
                    if (enabled)
                    {
                    }
                    this.textField.selectable = this._selectable;
                }
                this.selectableChanged = false;
            }
            if (this.maxCharsChanged)
            {
                this.textField.maxChars = this._maxChars;
                this.maxCharsChanged = false;
            }
            if (this.restrictChanged)
            {
                this.textField.restrict = this._restrict;
                this.restrictChanged = false;
            }
            if (this.tabIndexChanged)
            {
                this.textField.tabIndex = this._tabIndex;
                this.tabIndexChanged = false;
            }
            if (!this.textChanged)
            {
            }
            if (this.htmlTextChanged)
            {
                if (this.isHTML)
                {
                    this.textField.htmlText = this.explicitHTMLText;
                }
                else
                {
                    this.textField.text = this._text;
                }
                this.textFieldChanged(false, true);
                this.textChanged = false;
                this.htmlTextChanged = false;
            }
            if (this.selectionChanged)
            {
                this.textField.setSelection(this._selectionBeginIndex, this._selectionEndIndex);
                this.selectionChanged = false;
            }
            if (this.horizontalScrollPositionChanged)
            {
                this.textField.scrollH = this._horizontalScrollPosition;
                this.horizontalScrollPositionChanged = false;
            }
            return;
        }// end function

        override protected function measure() : void
        {
            var _loc_2:Number = NaN;
            var _loc_3:Number = NaN;
            var _loc_4:TextLineMetrics = null;
            super.measure();
            if (this.border)
            {
            }
            var _loc_1:* = this.border is IRectangularBorder ? (IRectangularBorder(this.border).borderMetrics) : (EdgeMetrics.EMPTY);
            measuredWidth = DEFAULT_MEASURED_WIDTH;
            if (this.maxChars)
            {
                measuredWidth = Math.min(measuredWidth, measureText("W").width * this.maxChars + _loc_1.left + _loc_1.right + 8);
            }
            if (this.text)
            {
            }
            if (this.text == "")
            {
                _loc_2 = DEFAULT_MEASURED_MIN_WIDTH;
                _loc_3 = measureText(" ").height + _loc_1.top + _loc_1.bottom + UITextField.TEXT_HEIGHT_PADDING;
                _loc_3 = _loc_3 + (getStyle("paddingTop") + getStyle("paddingBottom"));
            }
            else
            {
                _loc_4 = measureText(this.text);
                _loc_2 = _loc_4.width + _loc_1.left + _loc_1.right + 8;
                _loc_3 = _loc_4.height + _loc_1.top + _loc_1.bottom + UITextField.TEXT_HEIGHT_PADDING;
                _loc_2 = _loc_2 + (getStyle("paddingLeft") + getStyle("paddingRight"));
                _loc_3 = _loc_3 + (getStyle("paddingTop") + getStyle("paddingBottom"));
            }
            measuredWidth = Math.max(_loc_2, measuredWidth);
            measuredHeight = Math.max(_loc_3, DEFAULT_MEASURED_HEIGHT);
            measuredMinWidth = DEFAULT_MEASURED_MIN_WIDTH;
            measuredMinHeight = DEFAULT_MEASURED_MIN_HEIGHT;
            return;
        }// end function

        override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number) : void
        {
            var _loc_3:EdgeMetrics = null;
            super.updateDisplayList(unscaledWidth, unscaledHeight);
            if (this.border)
            {
                this.border.setActualSize(unscaledWidth, unscaledHeight);
                _loc_3 = this.border is IRectangularBorder ? (IRectangularBorder(this.border).borderMetrics) : (EdgeMetrics.EMPTY);
            }
            else
            {
                _loc_3 = EdgeMetrics.EMPTY;
            }
            var _loc_4:* = getStyle("paddingLeft");
            var _loc_5:* = getStyle("paddingRight");
            var _loc_6:* = getStyle("paddingTop");
            var _loc_7:* = getStyle("paddingBottom");
            var _loc_8:* = _loc_3.left + _loc_3.right;
            var _loc_9:* = _loc_3.top + _loc_3.bottom + 1;
            this.textField.x = _loc_3.left;
            this.textField.y = _loc_3.top;
            this.textField.x = this.textField.x + _loc_4;
            this.textField.y = this.textField.y + _loc_6;
            _loc_8 = _loc_8 + (_loc_4 + _loc_5);
            _loc_9 = _loc_9 + (_loc_6 + _loc_7);
            this.textField.width = Math.max(0, unscaledWidth - _loc_8);
            this.textField.height = Math.max(0, unscaledHeight - _loc_9);
            return;
        }// end function

        override public function setFocus() : void
        {
            this.textField.setFocus();
            return;
        }// end function

        override protected function isOurFocus(target:DisplayObject) : Boolean
        {
            if (target != this.textField)
            {
            }
            return super.isOurFocus(target);
        }// end function

        override public function drawFocus(isFocused:Boolean) : void
        {
            if (this._parentDrawsFocus)
            {
                IFocusManagerComponent(parent).drawFocus(isFocused);
                return;
            }
            super.drawFocus(isFocused);
            return;
        }// end function

        override public function styleChanged(styleProp:String) : void
        {
            if (styleProp != null)
            {
            }
            var _loc_2:* = styleProp == "styleName";
            super.styleChanged(styleProp);
            if (!_loc_2)
            {
            }
            if (styleProp == "borderSkin")
            {
                if (this.border)
                {
                    removeChild(DisplayObject(this.border));
                    this.border = null;
                    this.createBorder();
                }
            }
            return;
        }// end function

        function createTextField(childIndex:int) : void
        {
            if (!this.textField)
            {
                this.textField = IUITextField(createInFontContext(UITextField));
                this.textField.autoSize = TextFieldAutoSize.NONE;
                this.textField.enabled = enabled;
                this.textField.ignorePadding = false;
                this.textField.multiline = false;
                this.textField.tabEnabled = true;
                this.textField.wordWrap = false;
                this.textField.addEventListener(Event.CHANGE, this.textField_changeHandler);
                this.textField.addEventListener(TextEvent.TEXT_INPUT, this.textField_textInputHandler);
                this.textField.addEventListener(Event.SCROLL, this.textField_scrollHandler);
                this.textField.addEventListener("textFieldStyleChange", this.textField_textFieldStyleChangeHandler);
                this.textField.addEventListener("textFormatChange", this.textField_textFormatChangeHandler);
                this.textField.addEventListener("textInsert", this.textField_textModifiedHandler);
                this.textField.addEventListener("textReplace", this.textField_textModifiedHandler);
                this.textField.addEventListener("nativeDragDrop", this.textField_nativeDragDropHandler);
                if (childIndex == -1)
                {
                    addChild(DisplayObject(this.textField));
                }
                else
                {
                    addChildAt(DisplayObject(this.textField), childIndex);
                }
            }
            return;
        }// end function

        function removeTextField() : void
        {
            if (this.textField)
            {
                this.textField.removeEventListener(Event.CHANGE, this.textField_changeHandler);
                this.textField.removeEventListener(TextEvent.TEXT_INPUT, this.textField_textInputHandler);
                this.textField.removeEventListener(Event.SCROLL, this.textField_scrollHandler);
                this.textField.removeEventListener("textFieldStyleChange", this.textField_textFieldStyleChangeHandler);
                this.textField.removeEventListener("textFormatChange", this.textField_textFormatChangeHandler);
                this.textField.removeEventListener("textInsert", this.textField_textModifiedHandler);
                this.textField.removeEventListener("textReplace", this.textField_textModifiedHandler);
                this.textField.removeEventListener("nativeDragDrop", this.textField_nativeDragDropHandler);
                removeChild(DisplayObject(this.textField));
                this.textField = null;
            }
            return;
        }// end function

        protected function createBorder() : void
        {
            var _loc_1:Class = null;
            if (!this.border)
            {
                _loc_1 = getStyle("borderSkin");
                if (_loc_1 != null)
                {
                    this.border = new _loc_1;
                    if (this.border is ISimpleStyleClient)
                    {
                        ISimpleStyleClient(this.border).styleName = this;
                    }
                    addChildAt(DisplayObject(this.border), 0);
                    invalidateDisplayList();
                }
            }
            return;
        }// end function

        public function getLineMetrics(lineIndex:int) : TextLineMetrics
        {
            return this.textField ? (this.textField.getLineMetrics(lineIndex)) : (null);
        }// end function

        public function setSelection(beginIndex:int, endIndex:int) : void
        {
            this._selectionBeginIndex = beginIndex;
            this._selectionEndIndex = endIndex;
            this.selectionChanged = true;
            invalidateProperties();
            return;
        }// end function

        private function textFieldChanged(styleChangeOnly:Boolean, dispatchValueCommitEvent:Boolean) : void
        {
            var _loc_3:Boolean = false;
            var _loc_4:Boolean = false;
            if (!styleChangeOnly)
            {
                _loc_3 = this._text != this.textField.text;
                this._text = this.textField.text;
            }
            _loc_4 = this._htmlText != this.textField.htmlText;
            this._htmlText = this.textField.htmlText;
            if (_loc_3)
            {
                dispatchEvent(new Event("textChanged"));
                if (dispatchValueCommitEvent)
                {
                    dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
                }
            }
            if (_loc_4)
            {
                dispatchEvent(new Event("htmlTextChanged"));
            }
            this._textWidth = this.textField.textWidth;
            this._textHeight = this.textField.textHeight;
            return;
        }// end function

        function getTextField() : IUITextField
        {
            return this.textField;
        }// end function

        public function get selectionActivePosition() : int
        {
            return this.selectionEndIndex;
        }// end function

        public function get selectionAnchorPosition() : int
        {
            return this.selectionBeginIndex;
        }// end function

        public function showBorderAndBackground(visible:Boolean) : void
        {
            if (this.border)
            {
                this.border.visible = visible;
            }
            return;
        }// end function

        public function selectRange(anchorIndex:int, activeIndex:int) : void
        {
            this.textField.setSelection(anchorIndex, activeIndex);
            return;
        }// end function

        override protected function focusInHandler(event:FocusEvent) : void
        {
            var message:String;
            var event:* = event;
            if (event.target == this)
            {
                systemManager.stage.focus = TextField(this.textField);
            }
            var fm:* = focusManager;
            if (this.editable)
            {
            }
            if (fm)
            {
                fm.showFocusIndicator = true;
                if (this.textField.selectable)
                {
                }
                if (this._selectionBeginIndex == this._selectionEndIndex)
                {
                    this.textField.setSelection(0, this.textField.length);
                }
            }
            super.focusInHandler(event);
            if (this._imeMode != null)
            {
            }
            if (this._editable)
            {
                try
                {
                    if (!this.errorCaught)
                    {
                    }
                    if (IME.conversionMode != IMEConversionMode.UNKNOWN)
                    {
                        IME.conversionMode = this._imeMode;
                    }
                    this.errorCaught = false;
                }
                catch (e:Error)
                {
                    errorCaught = true;
                    message = resourceManager.getString("controls", "unsupportedMode", [_imeMode]);
                    throw new Error(message);
                }
            }
            return;
        }// end function

        override protected function focusOutHandler(event:FocusEvent) : void
        {
            super.focusOutHandler(event);
            dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
            return;
        }// end function

        override protected function keyDownHandler(event:KeyboardEvent) : void
        {
            switch(event.keyCode)
            {
                case Keyboard.ENTER:
                {
                    dispatchEvent(new FlexEvent(FlexEvent.ENTER));
                    if (!this.textChanged)
                    {
                    }
                    if (this.htmlTextChanged)
                    {
                        validateNow();
                    }
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        private function textField_changeHandler(event:Event) : void
        {
            this.textFieldChanged(false, false);
            this.textChanged = false;
            this.htmlTextChanged = false;
            event.stopImmediatePropagation();
            dispatchEvent(new Event(Event.CHANGE));
            return;
        }// end function

        private function textField_nativeDragDropHandler(event:Event) : void
        {
            this.textField_changeHandler(event);
            return;
        }// end function

        private function textField_textInputHandler(event:TextEvent) : void
        {
            event.stopImmediatePropagation();
            var _loc_2:* = new TextEvent(TextEvent.TEXT_INPUT, false, true);
            _loc_2.text = event.text;
            dispatchEvent(_loc_2);
            if (_loc_2.isDefaultPrevented())
            {
                event.preventDefault();
            }
            return;
        }// end function

        private function textField_scrollHandler(event:Event) : void
        {
            this._horizontalScrollPosition = this.textField.scrollH;
            return;
        }// end function

        private function textField_textFieldStyleChangeHandler(event:Event) : void
        {
            this.textFieldChanged(true, false);
            return;
        }// end function

        private function textField_textFormatChangeHandler(event:Event) : void
        {
            this.textFieldChanged(true, false);
            return;
        }// end function

        private function textField_textModifiedHandler(event:Event) : void
        {
            this.textFieldChanged(false, true);
            return;
        }// end function

    }
}
