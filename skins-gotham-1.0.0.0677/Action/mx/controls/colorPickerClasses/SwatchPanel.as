package mx.controls.colorPickerClasses
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.ui.*;
    import mx.collections.*;
    import mx.controls.*;
    import mx.core.*;
    import mx.events.*;
    import mx.skins.halo.*;
    import mx.styles.*;

    public class SwatchPanel extends UIComponent implements IFocusManagerContainer
    {
        var textInput:ITextInput;
        var textInputClass:Class;
        private var border:SwatchPanelSkin;
        private var preview:SwatchSkin;
        private var swatches:SwatchSkin;
        private var highlight:SwatchSkin;
        var isOverGrid:Boolean = false;
        var isOpening:Boolean = false;
        var focusedIndex:int = -1;
        var tweenUp:Boolean = false;
        private var initializing:Boolean = true;
        private var indexFlag:Boolean = false;
        private var lastIndex:int = -1;
        private var grid:Rectangle;
        private var rows:int;
        private var horizontalGap:Number;
        private var verticalGap:Number;
        private var columnCount:int;
        private var paddingLeft:Number;
        private var paddingRight:Number;
        private var paddingTop:Number;
        private var paddingBottom:Number;
        private var textFieldWidth:Number;
        private var previewWidth:Number;
        private var previewHeight:Number;
        private var swatchWidth:Number;
        private var swatchHeight:Number;
        private var swatchGridBorderSize:Number;
        private var cellOffset:Number = 1;
        private var itemOffset:Number = 3;
        private var _colorField:String = "color";
        private var _dataProvider:IList;
        private var _editable:Boolean = true;
        private var _labelField:String = "label";
        private var _selectedColor:uint = 0;
        private var _selectedIndex:int = 0;
        private var _showTextField:Boolean = true;
        static const VERSION:String = "4.6.0.23201";

        public function SwatchPanel()
        {
            addEventListener(KeyboardEvent.KEY_DOWN, this.keyDownHandler);
            addEventListener(MouseEvent.MOUSE_MOVE, this.mouseMoveHandler);
            return;
        }// end function

        override public function get height() : Number
        {
            return getExplicitOrMeasuredHeight();
        }// end function

        override public function set height(value:Number) : void
        {
            return;
        }// end function

        override public function get width() : Number
        {
            return getExplicitOrMeasuredWidth();
        }// end function

        override public function set width(value:Number) : void
        {
            return;
        }// end function

        public function get colorField() : String
        {
            return this._colorField;
        }// end function

        public function set colorField(value:String) : void
        {
            this._colorField = value;
            return;
        }// end function

        public function get dataProvider() : Object
        {
            return this._dataProvider;
        }// end function

        public function set dataProvider(value:Object) : void
        {
            var _loc_2:IList = null;
            if (value is IList)
            {
                this._dataProvider = IList(value);
            }
            else if (value is Array)
            {
                _loc_2 = new ArrayList(value as Array);
                value = _loc_2;
            }
            else
            {
                this._dataProvider = null;
            }
            if (!this.initializing)
            {
                if (this.length != 0)
                {
                }
                if (isNaN(this.length))
                {
                    this.highlight.visible = false;
                    this._selectedIndex = -1;
                }
                this.refresh();
            }
            return;
        }// end function

        public function get editable() : Boolean
        {
            return this._editable;
        }// end function

        public function set editable(value:Boolean) : void
        {
            this._editable = value;
            if (!this.initializing)
            {
                this.textInput.editable = value;
            }
            return;
        }// end function

        public function get labelField() : String
        {
            return this._labelField;
        }// end function

        public function set labelField(value:String) : void
        {
            this._labelField = value;
            return;
        }// end function

        public function get length() : int
        {
            return this._dataProvider ? (this._dataProvider.length) : (0);
        }// end function

        public function get selectedColor() : uint
        {
            return this._selectedColor;
        }// end function

        public function set selectedColor(value:uint) : void
        {
            var _loc_2:int = 0;
            if (!this.indexFlag)
            {
                _loc_2 = this.findColorByName(value);
                if (_loc_2 != -1)
                {
                    this.focusedIndex = this.findColorByName(value);
                    this._selectedIndex = this.focusedIndex;
                }
                else
                {
                    this.selectedIndex = -1;
                }
            }
            else
            {
                this.indexFlag = false;
            }
            if (value == this.selectedColor)
            {
            }
            if (this.isOverGrid)
            {
            }
            if (this.isOpening)
            {
                this._selectedColor = value;
                this.updateColor(value);
                if (!this.isOverGrid)
                {
                }
                if (this.isOpening)
                {
                    this.setFocusOnSwatch(this.selectedIndex);
                }
                if (this.isOpening)
                {
                    this.isOpening = false;
                }
            }
            return;
        }// end function

        public function get selectedIndex() : int
        {
            return this._selectedIndex;
        }// end function

        public function set selectedIndex(value:int) : void
        {
            if (value != this.selectedIndex)
            {
            }
            if (!this.initializing)
            {
                this.focusedIndex = value;
                this._selectedIndex = this.focusedIndex;
                if (value >= 0)
                {
                    this.indexFlag = true;
                    this.selectedColor = this.getColor(value);
                }
            }
            return;
        }// end function

        public function get selectedItem() : Object
        {
            return this.dataProvider ? (this.dataProvider.getItemAt(this.selectedIndex)) : (null);
        }// end function

        public function set selectedItem(value:Object) : void
        {
            var _loc_2:Number = NaN;
            if (value != this.selectedItem)
            {
                if (typeof(value) == "object")
                {
                    _loc_2 = Number(value[this.colorField]);
                }
                else if (typeof(value) == "number")
                {
                    _loc_2 = Number(value);
                }
                this.selectedIndex = this.findColorByName(_loc_2);
            }
            return;
        }// end function

        public function get showTextField() : Boolean
        {
            return this._showTextField;
        }// end function

        public function set showTextField(value:Boolean) : void
        {
            this._showTextField = value;
            if (!this.initializing)
            {
                this.textInput.visible = value;
            }
            return;
        }// end function

        public function get defaultButton() : IFlexDisplayObject
        {
            return null;
        }// end function

        public function set defaultButton(value:IFlexDisplayObject) : void
        {
            return;
        }// end function

        override protected function createChildren() : void
        {
            var _loc_1:Class = null;
            super.createChildren();
            if (!this.border)
            {
                this.border = new SwatchPanelSkin();
                this.border.styleName = this;
                this.border.name = "swatchPanelBorder";
                addChild(this.border);
            }
            if (!this.preview)
            {
                this.preview = new SwatchSkin();
                this.preview.styleName = this;
                this.preview.color = this.selectedColor;
                this.preview.name = "swatchPreview";
                this.preview.setStyle("swatchBorderSize", 0);
                addChild(this.preview);
            }
            if (!this.textInput)
            {
                _loc_1 = getStyle("textInputClass");
                if (!_loc_1)
                {
                    _loc_1 = this.textInputClass;
                }
                if (_loc_1)
                {
                }
                if (FlexVersion.compatibilityVersion < FlexVersion.VERSION_4_0)
                {
                    this.textInput = new TextInput();
                }
                else
                {
                    this.textInput = new this.textInputClass();
                }
                this.textInput.styleName = getStyle("textFieldStyleName");
                this.textInput.editable = this._editable;
                this.textInput.maxChars = 6;
                this.textInput.name = "inset";
                this.textInput.text = this.rgbToHex(this.selectedColor);
                this.textInput.restrict = "#xa-fA-F0-9";
                this.textInput.addEventListener(Event.CHANGE, this.textInput_changeHandler);
                this.textInput.addEventListener(KeyboardEvent.KEY_DOWN, this.textInput_keyDownHandler);
                addChild(DisplayObject(this.textInput));
            }
            if (!this.swatches)
            {
                this.swatches = new SwatchSkin();
                this.swatches.styleName = this;
                this.swatches.colorField = this.colorField;
                this.swatches.name = "swatchGrid";
                this.swatches.addEventListener(MouseEvent.CLICK, this.swatches_clickHandler);
                addChild(this.swatches);
            }
            if (!this.highlight)
            {
                this.highlight = new SwatchSkin();
                this.highlight.styleName = this;
                this.highlight.visible = false;
                this.highlight.name = "swatchHighlight";
                addChild(this.highlight);
            }
            this.refresh();
            this.initializing = false;
            return;
        }// end function

        override protected function measure() : void
        {
            super.measure();
            this.swatches.updateGrid(IList(this.dataProvider));
            measuredWidth = Math.max(this.paddingLeft + this.paddingRight + this.swatches.width, 100);
            measuredHeight = Math.max(this.paddingTop + this.previewHeight + this.itemOffset + this.paddingBottom + this.swatches.height, 100);
            return;
        }// end function

        override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number) : void
        {
            super.updateDisplayList(unscaledWidth, unscaledHeight);
            this.preview.updateSkin(this.selectedColor);
            this.preview.move(this.paddingLeft, this.paddingTop);
            this.textInput.setActualSize(this.textFieldWidth, this.previewHeight);
            this.textInput.move(this.paddingLeft + this.previewWidth + this.itemOffset, this.paddingTop);
            this.swatches.updateGrid(IList(this.dataProvider));
            this.swatches.move(this.paddingLeft, this.paddingTop + this.previewHeight + this.itemOffset);
            this.highlight.updateSkin(0);
            this.border.setActualSize(unscaledWidth, unscaledHeight);
            if (!this.grid)
            {
                this.grid = new Rectangle();
            }
            this.grid.left = this.swatches.x + this.swatchGridBorderSize;
            this.grid.top = this.swatches.y + this.swatchGridBorderSize;
            this.grid.right = this.swatches.x + this.swatchGridBorderSize + (this.swatchWidth - 1) * this.columnCount + 1 + this.horizontalGap * (this.columnCount - 1);
            this.grid.bottom = this.swatches.y + this.swatchGridBorderSize + (this.swatchHeight - 1) * this.rows + 1 + this.verticalGap * (this.rows - 1);
            return;
        }// end function

        override public function styleChanged(styleProp:String) : void
        {
            super.styleChanged(styleProp);
            if (!this.initializing)
            {
                this.refresh();
            }
            return;
        }// end function

        override public function drawFocus(isFocused:Boolean) : void
        {
            return;
        }// end function

        override public function setFocus() : void
        {
            if (this.showTextField)
            {
            }
            if (this.editable)
            {
                this.textInput.setFocus();
                this.textInput.text = this.rgbToHex(this.selectedColor);
            }
            return;
        }// end function

        private function updateStyleCache() : void
        {
            this.horizontalGap = getStyle("horizontalGap");
            this.verticalGap = getStyle("verticalGap");
            this.columnCount = getStyle("columnCount");
            this.paddingLeft = getStyle("paddingLeft");
            this.paddingRight = getStyle("paddingRight");
            this.paddingTop = getStyle("paddingTop");
            this.paddingBottom = getStyle("paddingBottom");
            this.textFieldWidth = getStyle("textFieldWidth");
            this.previewWidth = getStyle("previewWidth");
            this.previewHeight = getStyle("previewHeight");
            this.swatchWidth = getStyle("swatchWidth");
            this.swatchHeight = getStyle("swatchHeight");
            this.swatchGridBorderSize = getStyle("swatchGridBorderSize");
            if (this.columnCount > this.length)
            {
                this.columnCount = this.length;
            }
            this.rows = Math.ceil(this.length / this.columnCount);
            return;
        }// end function

        private function refresh() : void
        {
            this.updateStyleCache();
            this.updateDisplayList(unscaledWidth, unscaledHeight);
            invalidateSize();
            return;
        }// end function

        private function updateColor(color:uint) : void
        {
            var _loc_2:String = null;
            var _loc_3:int = 0;
            var _loc_4:int = 0;
            if (!this.initializing)
            {
            }
            if (isNaN(color))
            {
                return;
            }
            this.preview.updateSkin(color);
            if (this.isOverGrid)
            {
                _loc_2 = null;
                if (this.focusedIndex >= 0)
                {
                }
                if (typeof(this.dataProvider.getItemAt(this.focusedIndex)) == "object")
                {
                    _loc_2 = this.dataProvider.getItemAt(this.focusedIndex)[this.labelField];
                }
                if (!(this.textInput is TextInput))
                {
                    _loc_3 = this.textInput.selectionAnchorPosition;
                    _loc_4 = this.textInput.selectionActivePosition;
                }
                if (_loc_2 != null)
                {
                }
                this.textInput.text = _loc_2.length != 0 ? (_loc_2) : (this.rgbToHex(color));
                if (!(this.textInput is TextInput))
                {
                    this.textInput.selectRange(_loc_3, _loc_4);
                }
            }
            return;
        }// end function

        private function rgbToHex(color:uint) : String
        {
            var _loc_2:* = color.toString(16);
            var _loc_3:* = "00000" + _loc_2;
            var _loc_4:* = _loc_3.length;
            _loc_3 = _loc_3.substring(_loc_4 - 6, _loc_4);
            return _loc_3.toUpperCase();
        }// end function

        private function findColorByName(name:Number) : int
        {
            if (name == this.getColor(this.selectedIndex))
            {
                return this.selectedIndex;
            }
            var _loc_2:int = 0;
            while (_loc_2 < this.length)
            {
                
                if (name == this.getColor(_loc_2))
                {
                    return _loc_2;
                }
                _loc_2 = _loc_2 + 1;
            }
            return -1;
        }// end function

        private function getColor(index:int) : uint
        {
            if (this.dataProvider)
            {
            }
            if (this.dataProvider.length >= 1)
            {
            }
            if (index >= 0)
            {
            }
            if (index >= this.length)
            {
                return StyleManager.NOT_A_COLOR;
            }
            return uint(typeof(this.dataProvider.getItemAt(index)) == "object" ? (this.dataProvider.getItemAt(index)[this.colorField]) : (this.dataProvider.getItemAt(index)));
        }// end function

        private function setFocusOnSwatch(index:int) : void
        {
            if (index >= 0)
            {
            }
            if (index > (this.length - 1))
            {
                this.highlight.visible = false;
                return;
            }
            var _loc_2:* = Math.floor(index / this.columnCount);
            var _loc_3:* = index - _loc_2 * this.columnCount;
            var _loc_4:* = this.swatchWidth * _loc_3 + this.horizontalGap * _loc_3 - this.cellOffset * _loc_3 + this.paddingLeft + this.swatchGridBorderSize;
            var _loc_5:* = this.swatchHeight * _loc_2 + this.verticalGap * _loc_2 - this.cellOffset * _loc_2 + this.paddingTop + this.previewHeight + this.itemOffset + this.swatchGridBorderSize;
            this.highlight.move(_loc_4, _loc_5);
            this.highlight.visible = true;
            this.isOverGrid = true;
            this.updateColor(this.getColor(index));
            return;
        }// end function

        override protected function keyDownHandler(event:KeyboardEvent) : void
        {
            if (event.eventPhase == EventPhase.AT_TARGET)
            {
            }
            if (!enabled)
            {
                return;
            }
            if (this.focusedIndex != -1)
            {
            }
            if (isNaN(this.focusedIndex))
            {
                this.focusedIndex = 0;
            }
            var _loc_2:* = Math.floor(this.focusedIndex / this.columnCount);
            var _loc_3:* = mapKeycodeForLayoutDirection(event);
            switch(_loc_3)
            {
                case Keyboard.UP:
                {
                    this.focusedIndex = this.focusedIndex - this.columnCount < 0 ? ((this.rows - 1) * this.columnCount + this.focusedIndex + 1) : (this.focusedIndex - this.columnCount);
                    this.isOverGrid = true;
                    break;
                }
                case Keyboard.DOWN:
                {
                    this.focusedIndex = this.focusedIndex + this.columnCount > this.length ? ((this.focusedIndex - 1) - (this.rows - 1) * this.columnCount) : (this.focusedIndex + this.columnCount);
                    this.isOverGrid = true;
                    break;
                }
                case Keyboard.LEFT:
                {
                    this.focusedIndex = this.focusedIndex < 1 ? ((this.length - 1)) : ((this.focusedIndex - 1));
                    this.isOverGrid = true;
                    break;
                }
                case Keyboard.RIGHT:
                {
                    this.focusedIndex = this.focusedIndex >= (this.length - 1) ? (0) : ((this.focusedIndex + 1));
                    this.isOverGrid = true;
                    break;
                }
                case Keyboard.PAGE_UP:
                {
                    this.focusedIndex = this.focusedIndex - _loc_2 * this.columnCount;
                    this.isOverGrid = true;
                    break;
                }
                case Keyboard.PAGE_DOWN:
                {
                    this.focusedIndex = this.focusedIndex + (this.rows - 1) * this.columnCount - _loc_2 * this.columnCount;
                    this.isOverGrid = true;
                    break;
                }
                case Keyboard.HOME:
                {
                    this.focusedIndex = this.focusedIndex - (this.focusedIndex - _loc_2 * this.columnCount);
                    this.isOverGrid = true;
                    break;
                }
                case Keyboard.END:
                {
                    this.focusedIndex = this.focusedIndex + (_loc_2 * this.columnCount - this.focusedIndex) + (this.columnCount - 1);
                    this.isOverGrid = true;
                    break;
                }
                default:
                {
                    break;
                }
            }
            if (this.focusedIndex < this.length)
            {
            }
            if (this.isOverGrid)
            {
                this.setFocusOnSwatch(this.focusedIndex);
                dispatchEvent(new Event("change"));
            }
            return;
        }// end function

        private function mouseMoveHandler(event:MouseEvent) : void
        {
            var _loc_2:ColorPickerEvent = null;
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            var _loc_5:Number = NaN;
            if (ColorPicker(owner).isDown)
            {
            }
            if (enabled)
            {
                if (mouseX > this.grid.left)
                {
                }
                if (mouseX < this.grid.right)
                {
                }
                if (mouseY > this.grid.top)
                {
                }
                if (mouseY < this.grid.bottom)
                {
                    _loc_3 = Math.floor((Math.floor(mouseX) - (this.grid.left + this.verticalGap)) / (this.swatchWidth + this.horizontalGap - this.cellOffset));
                    _loc_4 = Math.floor((Math.floor(mouseY) - this.grid.top) / (this.swatchHeight + this.verticalGap - this.cellOffset));
                    _loc_5 = _loc_4 * this.columnCount + _loc_3;
                    if (_loc_3 == -1)
                    {
                        _loc_5 = _loc_5 + 1;
                    }
                    else if (_loc_3 > (this.columnCount - 1))
                    {
                        _loc_5 = _loc_5 - 1;
                    }
                    else if (_loc_4 > (this.rows - 1))
                    {
                        _loc_5 = _loc_5 - this.columnCount;
                    }
                    else if (_loc_5 < 0)
                    {
                        _loc_5 = _loc_5 + this.columnCount;
                    }
                    if (this.lastIndex == _loc_5)
                    {
                    }
                    if (this.highlight.visible == false)
                    {
                    }
                    if (_loc_5 < this.length)
                    {
                        if (this.lastIndex != -1)
                        {
                        }
                        if (this.lastIndex != _loc_5)
                        {
                            _loc_2 = new ColorPickerEvent(ColorPickerEvent.ITEM_ROLL_OUT);
                            _loc_2.index = this.lastIndex;
                            _loc_2.color = this.getColor(this.lastIndex);
                            dispatchEvent(_loc_2);
                        }
                        this.focusedIndex = _loc_5;
                        this.lastIndex = this.focusedIndex;
                        this.setFocusOnSwatch(this.focusedIndex);
                        _loc_2 = new ColorPickerEvent(ColorPickerEvent.ITEM_ROLL_OVER);
                        _loc_2.index = this.focusedIndex;
                        _loc_2.color = this.getColor(this.focusedIndex);
                        dispatchEvent(_loc_2);
                    }
                }
                else
                {
                    if (this.highlight.visible == true)
                    {
                    }
                    if (this.isOverGrid)
                    {
                    }
                    if (this.lastIndex != -1)
                    {
                        this.highlight.visible = false;
                        _loc_2 = new ColorPickerEvent(ColorPickerEvent.ITEM_ROLL_OUT);
                        _loc_2.index = this.lastIndex;
                        _loc_2.color = this.getColor(this.lastIndex);
                        dispatchEvent(_loc_2);
                    }
                    this.isOverGrid = false;
                }
            }
            return;
        }// end function

        private function swatches_clickHandler(event:MouseEvent) : void
        {
            var _loc_2:ColorPickerEvent = null;
            if (!enabled)
            {
                return;
            }
            if (mouseX > this.grid.left)
            {
            }
            if (mouseX < this.grid.right)
            {
            }
            if (mouseY > this.grid.top)
            {
            }
            if (mouseY < this.grid.bottom)
            {
                this.selectedIndex = this.focusedIndex;
                if (ColorPicker(owner).selectedIndex != this.selectedIndex)
                {
                    ColorPicker(owner).selectedIndex = this.selectedIndex;
                    _loc_2 = new ColorPickerEvent(ColorPickerEvent.CHANGE);
                    _loc_2.index = this.selectedIndex;
                    _loc_2.color = this.getColor(this.selectedIndex);
                    ColorPicker(owner).dispatchEvent(_loc_2);
                }
                ColorPicker(owner).close();
            }
            return;
        }// end function

        private function textInput_keyDownHandler(event:KeyboardEvent) : void
        {
            ColorPicker(owner).dispatchEvent(event);
            return;
        }// end function

        private function textInput_changeHandler(event:Event) : void
        {
            var _loc_2:* = ITextInput(event.target).text;
            if (_loc_2.charAt(0) == "#")
            {
                this.textInput.maxChars = 7;
                _loc_2 = "0x" + _loc_2.substring(1);
            }
            else if (_loc_2.substring(0, 2) == "0x")
            {
                this.textInput.maxChars = 8;
            }
            else
            {
                this.textInput.maxChars = 6;
                _loc_2 = "0x" + _loc_2;
            }
            this.highlight.visible = false;
            this.isOverGrid = false;
            this.selectedColor = Number(_loc_2);
            dispatchEvent(new Event("change"));
            return;
        }// end function

    }
}
