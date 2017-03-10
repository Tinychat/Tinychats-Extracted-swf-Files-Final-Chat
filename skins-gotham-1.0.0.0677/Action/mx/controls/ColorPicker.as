package mx.controls
{
    import flash.events.*;
    import flash.geom.*;
    import flash.ui.*;
    import mx.controls.colorPickerClasses.*;
    import mx.core.*;
    import mx.effects.*;
    import mx.events.*;
    import mx.managers.*;
    import mx.skins.halo.*;
    import mx.styles.*;

    public class ColorPicker extends ComboBase
    {
        var showingDropdown:Boolean = false;
        var isDown:Boolean = false;
        var isOpening:Boolean = false;
        private var dropdownGap:Number = 6;
        private var indexFlag:Boolean = false;
        private var initializing:Boolean = true;
        private var isModelInited:Boolean = false;
        private var collectionChanged:Boolean = false;
        private var swatchPreview:SwatchSkin;
        private var dropdownSwatch:SwatchPanel;
        private var triggerEvent:Event;
        private var _editable:Boolean = true;
        private var _colorField:String = "color";
        private var _labelField:String = "label";
        private var _selectedColor:uint = 0;
        private var _showTextField:Boolean = true;
        static const VERSION:String = "4.6.0.23201";
        static var createAccessibilityImplementation:Function;
        private static const _swatchStyleFilters:Object = {swatchBorderColor:"swatchBorderColor", swatchBorderSize:"swatchBorderSize"};

        public function ColorPicker()
        {
            if (!this.isModelInited)
            {
                this.loadDefaultPalette();
            }
            super.editable = false;
            addEventListener(KeyboardEvent.KEY_DOWN, this.keyDownHandler);
            return;
        }// end function

        override public function set dataProvider(value:Object) : void
        {
            super.dataProvider = value;
            this.isModelInited = true;
            if (this.dropdownSwatch)
            {
                this.dropdownSwatch.dataProvider = value;
            }
            return;
        }// end function

        override public function get editable() : Boolean
        {
            return this._editable;
        }// end function

        override public function set editable(value:Boolean) : void
        {
            this._editable = value;
            if (this.dropdownSwatch)
            {
                this.dropdownSwatch.editable = value;
            }
            dispatchEvent(new Event("editableChanged"));
            return;
        }// end function

        override public function set selectedIndex(value:int) : void
        {
            if (selectedIndex == -1)
            {
            }
            if (!isNaN(this.selectedColor))
            {
            }
            if (value != selectedIndex)
            {
                if (value >= 0)
                {
                    this.indexFlag = true;
                    this.selectedColor = this.getColor(value);
                    super.selectedIndex = value;
                }
                if (this.dropdownSwatch)
                {
                    this.dropdownSwatch.selectedIndex = value;
                }
            }
            return;
        }// end function

        override public function set selectedItem(value:Object) : void
        {
            if (value != selectedItem)
            {
                super.selectedItem = value;
                if (typeof(value) == "object")
                {
                    this.selectedColor = Number(value[this.colorField]);
                }
                else if (typeof(value) == "number")
                {
                    this.selectedColor = Number(value);
                }
                this.indexFlag = true;
                if (this.dropdownSwatch)
                {
                    this.dropdownSwatch.selectedItem = value;
                }
            }
            return;
        }// end function

        public function get colorField() : String
        {
            return this._colorField;
        }// end function

        public function set colorField(value:String) : void
        {
            this._colorField = value;
            if (this.dropdownSwatch)
            {
                this.dropdownSwatch.colorField = value;
            }
            dispatchEvent(new Event("colorFieldChanged"));
            return;
        }// end function

        function get dropdown() : SwatchPanel
        {
            return this.dropdownSwatch;
        }// end function

        public function get labelField() : String
        {
            return this._labelField;
        }// end function

        public function set labelField(value:String) : void
        {
            this._labelField = value;
            if (this.dropdownSwatch)
            {
                this.dropdownSwatch.labelField = value;
            }
            dispatchEvent(new Event("labelFieldChanged"));
            return;
        }// end function

        public function get selectedColor() : uint
        {
            return this._selectedColor;
        }// end function

        public function set selectedColor(value:uint) : void
        {
            if (!this.indexFlag)
            {
                super.selectedIndex = this.findColorByName(value);
            }
            else
            {
                this.indexFlag = false;
            }
            if (value != this.selectedColor)
            {
                this._selectedColor = value;
                this.updateColor(value);
                if (this.dropdownSwatch)
                {
                    this.dropdownSwatch.selectedColor = value;
                }
            }
            dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
            return;
        }// end function

        public function get showTextField() : Boolean
        {
            return this._showTextField;
        }// end function

        public function set showTextField(value:Boolean) : void
        {
            this._showTextField = value;
            if (this.dropdownSwatch)
            {
                this.dropdownSwatch.showTextField = value;
            }
            return;
        }// end function

        protected function get swatchStyleFilters() : Object
        {
            return _swatchStyleFilters;
        }// end function

        override protected function initializeAccessibility() : void
        {
            if (ColorPicker.createAccessibilityImplementation != null)
            {
                ColorPicker.createAccessibilityImplementation(this);
            }
            return;
        }// end function

        override protected function createChildren() : void
        {
            super.createChildren();
            if (!this.swatchPreview)
            {
                this.swatchPreview = new SwatchSkin();
                this.swatchPreview.styleName = new StyleProxy(this, this.swatchStyleFilters);
                this.swatchPreview.color = this.selectedColor;
                this.swatchPreview.name = "colorPickerSwatch";
                addChild(this.swatchPreview);
            }
            setChildIndex(this.swatchPreview, getChildIndex(downArrowButton));
            textInput.visible = false;
            if (!enabled)
            {
                super.enabled = enabled;
            }
            this.initializing = false;
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.collectionChanged)
            {
                if (this.findColorByName(this.selectedColor) == -1)
                {
                    if (dataProvider.length > 0)
                    {
                    }
                    if (selectedIndex > dataProvider.length)
                    {
                        this.selectedIndex = 0;
                    }
                    if (this.getColor(selectedIndex) >= 0)
                    {
                        this.selectedColor = this.getColor(selectedIndex);
                        this.swatchPreview.color = this.selectedColor;
                    }
                    else if (this.dropdownSwatch)
                    {
                        this.swatchPreview.color = this.dropdownSwatch.selectedColor;
                    }
                }
                else
                {
                    this.selectedIndex = this.findColorByName(this.selectedColor);
                }
                this.collectionChanged = false;
            }
            return;
        }// end function

        override protected function measure() : void
        {
            var _loc_1:* = DEFAULT_MEASURED_MIN_HEIGHT;
            measuredWidth = DEFAULT_MEASURED_MIN_HEIGHT;
            measuredMinWidth = _loc_1;
            var _loc_1:* = DEFAULT_MEASURED_MIN_HEIGHT;
            measuredHeight = DEFAULT_MEASURED_MIN_HEIGHT;
            measuredMinHeight = _loc_1;
            return;
        }// end function

        override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number) : void
        {
            super.updateDisplayList(unscaledWidth, unscaledHeight);
            this.swatchPreview.color = this.selectedColor;
            this.swatchPreview.setActualSize(unscaledWidth, unscaledHeight);
            downArrowButton.move(0, 0);
            downArrowButton.setActualSize(unscaledWidth, unscaledHeight);
            if (this.dropdownSwatch)
            {
                this.dropdownSwatch.setActualSize(this.dropdownSwatch.getExplicitOrMeasuredWidth(), this.dropdownSwatch.getExplicitOrMeasuredHeight());
            }
            return;
        }// end function

        override public function styleChanged(styleProp:String) : void
        {
            var _loc_2:Object = null;
            if (this.dropdownSwatch)
            {
                if (styleProp == "swatchPanelStyleName")
                {
                    _loc_2 = getStyle("swatchPanelStyleName");
                    if (_loc_2)
                    {
                        this.dropdownSwatch.styleName = _loc_2;
                    }
                }
                this.dropdownSwatch.styleChanged(styleProp);
            }
            super.styleChanged(styleProp);
            invalidateDisplayList();
            return;
        }// end function

        public function open() : void
        {
            this.displayDropdown(true);
            return;
        }// end function

        public function close(event:Event = null) : void
        {
            this.displayDropdown(false, event);
            return;
        }// end function

        function getDropdown() : SwatchPanel
        {
            var _loc_1:Object = null;
            if (this.initializing)
            {
                return null;
            }
            if (!this.dropdownSwatch)
            {
                this.dropdownSwatch = new SwatchPanel();
                this.dropdownSwatch.owner = this;
                this.dropdownSwatch.editable = this.editable;
                this.dropdownSwatch.colorField = this.colorField;
                this.dropdownSwatch.labelField = this.labelField;
                this.dropdownSwatch.dataProvider = dataProvider;
                this.dropdownSwatch.showTextField = this.showTextField;
                this.dropdownSwatch.selectedColor = this.selectedColor;
                this.dropdownSwatch.selectedIndex = selectedIndex;
                this.dropdownSwatch.textInputClass = getStyle("textInputClass");
                _loc_1 = getStyle("swatchPanelStyleName");
                if (_loc_1)
                {
                    this.dropdownSwatch.styleName = _loc_1;
                }
                this.dropdownSwatch.addEventListener(ColorPickerEvent.ITEM_ROLL_OVER, this.dropdownSwatch_itemRollOverHandler);
                this.dropdownSwatch.addEventListener(ColorPickerEvent.ITEM_ROLL_OUT, this.dropdownSwatch_itemRollOutHandler);
                this.dropdownSwatch.cacheAsBitmap = true;
                this.dropdownSwatch.scrollRect = new Rectangle(0, 0, 0, 0);
                PopUpManager.addPopUp(this.dropdownSwatch, this);
                UIComponentGlobals.layoutManager.validateClient(this.dropdownSwatch, true);
                this.dropdownSwatch.setActualSize(this.dropdownSwatch.getExplicitOrMeasuredWidth(), this.dropdownSwatch.getExplicitOrMeasuredHeight());
                this.dropdownSwatch.validateDisplayList();
            }
            this.dropdownSwatch.layoutDirection = layoutDirection;
            this.dropdownSwatch.scaleX = scaleX;
            this.dropdownSwatch.scaleY = scaleY;
            return this.dropdownSwatch;
        }// end function

        function displayDropdown(show:Boolean, trigger:Event = null) : void
        {
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            var _loc_6:Function = null;
            var _loc_7:Number = NaN;
            var _loc_8:Point = null;
            var _loc_9:ISystemManager = null;
            var _loc_10:Rectangle = null;
            if (show == this.showingDropdown)
            {
                return;
            }
            var _loc_5:Tween = null;
            this.triggerEvent = trigger;
            if (show)
            {
                this.getDropdown();
                _loc_8 = new Point(layoutDirection == LayoutDirection.RTL ? (this.dropdownSwatch.getExplicitOrMeasuredWidth()) : (0), 0);
                _loc_8 = localToGlobal(_loc_8);
                if (this.dropdownSwatch.parent == null)
                {
                    PopUpManager.addPopUp(this.dropdownSwatch, this, false);
                }
                else
                {
                    PopUpManager.bringToFront(this.dropdownSwatch);
                }
                this.dropdownSwatch.addEventListener(FlexMouseEvent.MOUSE_DOWN_OUTSIDE, this.dropdownSwatch_mouseDownOutsideHandler);
                this.dropdownSwatch.addEventListener(FlexMouseEvent.MOUSE_WHEEL_OUTSIDE, this.dropdownSwatch_mouseDownOutsideHandler);
                this.dropdownSwatch.addEventListener(SandboxMouseEvent.MOUSE_DOWN_SOMEWHERE, this.dropdownSwatch_mouseDownOutsideHandler);
                this.dropdownSwatch.addEventListener(SandboxMouseEvent.MOUSE_WHEEL_SOMEWHERE, this.dropdownSwatch_mouseDownOutsideHandler);
                this.dropdownSwatch.isOpening = true;
                this.dropdownSwatch.showTextField = this.showTextField;
                this.dropdownSwatch.selectedColor = this.selectedColor;
                this.dropdownSwatch.owner = this;
                _loc_9 = systemManager.topLevelSystemManager;
                _loc_10 = _loc_9.getVisibleApplicationRect(null, true);
                if (_loc_8.y + height + this.dropdownGap + this.dropdownSwatch.height > _loc_10.bottom)
                {
                }
                if (_loc_8.y > _loc_10.top + this.dropdownGap + this.dropdownSwatch.height)
                {
                    _loc_8.y = _loc_8.y - (this.dropdownGap + this.dropdownSwatch.height);
                    _loc_3 = (-this.dropdownSwatch.height) / scaleY;
                    this.dropdownSwatch.tweenUp = true;
                }
                else
                {
                    _loc_8.y = _loc_8.y + (this.dropdownGap + height);
                    _loc_3 = this.dropdownSwatch.height / scaleY;
                    this.dropdownSwatch.tweenUp = false;
                }
                if (_loc_8.x + this.dropdownSwatch.width > _loc_10.right)
                {
                }
                if (_loc_8.x > _loc_10.left + this.dropdownSwatch.width)
                {
                    _loc_8.x = _loc_8.x - (this.dropdownSwatch.width - width);
                }
                _loc_8.x = Math.max(_loc_8.x, 0);
                _loc_8 = this.dropdownSwatch.parent.globalToLocal(_loc_8);
                this.dropdownSwatch.move(_loc_8.x, _loc_8.y);
                this.isDown = true;
                this.isOpening = true;
                _loc_4 = 0;
                _loc_7 = getStyle("openDuration");
                _loc_6 = getStyle("openEasingFunction") as Function;
                this.showingDropdown = show;
            }
            else
            {
                _loc_3 = 0;
                _loc_4 = this.dropdownSwatch.tweenUp ? ((-this.dropdownSwatch.height) / scaleY) : (this.dropdownSwatch.height / scaleY);
                this.isDown = false;
                _loc_7 = getStyle("closeDuration");
                _loc_6 = getStyle("closeEasingFunction") as Function;
                this.showingDropdown = show;
                this.dropdownSwatch.removeEventListener(FlexMouseEvent.MOUSE_DOWN_OUTSIDE, this.dropdownSwatch_mouseDownOutsideHandler);
                this.dropdownSwatch.removeEventListener(FlexMouseEvent.MOUSE_WHEEL_OUTSIDE, this.dropdownSwatch_mouseDownOutsideHandler);
                this.dropdownSwatch.removeEventListener(SandboxMouseEvent.MOUSE_DOWN_SOMEWHERE, this.dropdownSwatch_mouseDownOutsideHandler);
                this.dropdownSwatch.removeEventListener(SandboxMouseEvent.MOUSE_WHEEL_SOMEWHERE, this.dropdownSwatch_mouseDownOutsideHandler);
                PopUpManager.removePopUp(this.dropdownSwatch);
            }
            if (this.dropdownSwatch)
            {
                this.dropdownSwatch.visible = true;
                this.dropdownSwatch.enabled = false;
            }
            UIComponentGlobals.layoutManager.validateNow();
            UIComponent.suspendBackgroundProcessing();
            _loc_5 = new Tween(this, _loc_3, _loc_4, _loc_7);
            if (_loc_6 != null)
            {
                _loc_5.easingFunction = _loc_6;
            }
            return;
        }// end function

        private function loadDefaultPalette() : void
        {
            var _loc_1:WebSafePalette = null;
            if (dataProvider)
            {
            }
            if (dataProvider.length < 1)
            {
                _loc_1 = new WebSafePalette();
                this.dataProvider = _loc_1.getList();
            }
            this.selectedIndex = this.findColorByName(this.selectedColor);
            return;
        }// end function

        private function updateColor(color:Number) : void
        {
            if (!this.initializing)
            {
            }
            if (isNaN(color))
            {
                return;
            }
            this.swatchPreview.updateSkin(color);
            return;
        }// end function

        private function findColorByName(name:Number) : int
        {
            if (name == this.getColor(selectedIndex))
            {
                return selectedIndex;
            }
            var _loc_2:* = dataProvider.length;
            var _loc_3:int = 0;
            while (_loc_3 < dataProvider.length)
            {
                
                if (name == this.getColor(_loc_3))
                {
                    return _loc_3;
                }
                _loc_3 = _loc_3 + 1;
            }
            return -1;
        }// end function

        private function getColor(location:int) : Number
        {
            if (dataProvider)
            {
            }
            if (dataProvider.length >= 1)
            {
            }
            if (location >= 0)
            {
            }
            if (location >= dataProvider.length)
            {
                return -1;
            }
            return Number(typeof(dataProvider.getItemAt(location)) == "object" ? (dataProvider.getItemAt(location)[this.colorField]) : (dataProvider.getItemAt(location)));
        }// end function

        override protected function focusInHandler(event:FocusEvent) : void
        {
            var _loc_2:* = focusManager;
            if (_loc_2)
            {
                _loc_2.showFocusIndicator = true;
            }
            if (this.isDown)
            {
            }
            if (!this.isOpening)
            {
                this.close();
            }
            else if (this.isOpening)
            {
                this.isOpening = false;
            }
            super.focusInHandler(event);
            return;
        }// end function

        override protected function keyDownHandler(event:KeyboardEvent) : void
        {
            var _loc_2:ColorPickerEvent = null;
            var _loc_3:* = mapKeycodeForLayoutDirection(event);
            if (event.ctrlKey)
            {
            }
            if (_loc_3 == Keyboard.DOWN)
            {
                this.displayDropdown(true, event);
            }
            else
            {
                if (event.ctrlKey)
                {
                }
                if (_loc_3 != Keyboard.UP)
                {
                }
                if (_loc_3 == Keyboard.ESCAPE)
                {
                    if (this.dropdownSwatch)
                    {
                    }
                    if (this.dropdownSwatch.enabled)
                    {
                        this.close(event);
                    }
                }
                else
                {
                    if (this.showingDropdown)
                    {
                    }
                    if (_loc_3 == Keyboard.ENTER)
                    {
                    }
                    if (this.dropdownSwatch.enabled)
                    {
                        if (!this.dropdownSwatch.isOverGrid)
                        {
                        }
                        if (this.editable)
                        {
                            if (this.selectedColor != this.dropdownSwatch.selectedColor)
                            {
                                this.selectedColor = this.dropdownSwatch.selectedColor;
                                _loc_2 = new ColorPickerEvent(ColorPickerEvent.CHANGE);
                                _loc_2.index = selectedIndex;
                                _loc_2.color = this.selectedColor;
                                dispatchEvent(_loc_2);
                                _loc_2 = new ColorPickerEvent(ColorPickerEvent.ENTER);
                                _loc_2.color = this.selectedColor;
                                dispatchEvent(_loc_2);
                            }
                        }
                        else if (selectedIndex != this.dropdownSwatch.focusedIndex)
                        {
                            this.dropdownSwatch.selectedIndex = this.dropdownSwatch.focusedIndex;
                            this.selectedIndex = this.dropdownSwatch.selectedIndex;
                            _loc_2 = new ColorPickerEvent(ColorPickerEvent.CHANGE);
                            _loc_2.index = selectedIndex;
                            _loc_2.color = this.selectedColor;
                            dispatchEvent(_loc_2);
                        }
                        this.close();
                        event.stopPropagation();
                    }
                    else
                    {
                        if (this.showingDropdown)
                        {
                            if (_loc_3 != Keyboard.HOME)
                            {
                            }
                            if (_loc_3 != Keyboard.END)
                            {
                            }
                            if (_loc_3 != Keyboard.PAGE_UP)
                            {
                            }
                            if (_loc_3 != Keyboard.PAGE_DOWN)
                            {
                            }
                            if (_loc_3 != Keyboard.LEFT)
                            {
                            }
                            if (_loc_3 != Keyboard.RIGHT)
                            {
                            }
                            if (_loc_3 != Keyboard.UP)
                            {
                            }
                        }
                        if (_loc_3 == Keyboard.DOWN)
                        {
                            this.dropdownSwatch.dispatchEvent(event);
                        }
                        else if (_loc_3 == Keyboard.LEFT)
                        {
                            if (selectedIndex == -1)
                            {
                                this.selectedIndex = this.findColorByName(this.selectedColor);
                            }
                            if ((selectedIndex - 1) >= 0)
                            {
                                var _loc_5:* = selectedIndex - 1;
                                selectedIndex = _loc_5;
                                _loc_2 = new ColorPickerEvent(ColorPickerEvent.CHANGE);
                                _loc_2.index = selectedIndex;
                                _loc_2.color = this.selectedColor;
                                dispatchEvent(_loc_2);
                            }
                        }
                        else if (_loc_3 == Keyboard.RIGHT)
                        {
                            if (selectedIndex == -1)
                            {
                                this.selectedIndex = this.findColorByName(this.selectedColor);
                            }
                            if ((selectedIndex + 1) < dataProvider.length)
                            {
                                var _loc_5:* = selectedIndex + 1;
                                selectedIndex = _loc_5;
                                _loc_2 = new ColorPickerEvent(ColorPickerEvent.CHANGE);
                                _loc_2.index = selectedIndex;
                                _loc_2.color = this.selectedColor;
                                dispatchEvent(_loc_2);
                            }
                        }
                    }
                }
            }
            return;
        }// end function

        override protected function collectionChangeHandler(event:Event) : void
        {
            if (!this.initializing)
            {
                if (dataProvider.length > 0)
                {
                    invalidateProperties();
                }
                else
                {
                    this.selectedColor = 0;
                    this.selectedIndex = -1;
                }
                this.collectionChanged = true;
            }
            if (this.dropdownSwatch)
            {
                this.dropdownSwatch.dataProvider = dataProvider;
            }
            return;
        }// end function

        override protected function downArrowButton_buttonDownHandler(event:FlexEvent) : void
        {
            this.displayDropdown(!this.showingDropdown, event);
            return;
        }// end function

        private function dropdownSwatch_itemRollOverHandler(event:ColorPickerEvent) : void
        {
            dispatchEvent(event);
            return;
        }// end function

        private function dropdownSwatch_itemRollOutHandler(event:ColorPickerEvent) : void
        {
            dispatchEvent(event);
            return;
        }// end function

        private function dropdownSwatch_mouseDownOutsideHandler(event:Event) : void
        {
            var _loc_2:MouseEvent = null;
            if (event is MouseEvent)
            {
                _loc_2 = MouseEvent(event);
                if (!hitTestPoint(_loc_2.stageX, _loc_2.stageY, true))
                {
                    this.close(event);
                }
            }
            else if (event is SandboxMouseEvent)
            {
                this.close(event);
            }
            return;
        }// end function

        function onTweenUpdate(value:Number) : void
        {
            this.dropdownSwatch.scrollRect = new Rectangle(0, value, this.dropdownSwatch.width, this.dropdownSwatch.height);
            return;
        }// end function

        function onTweenEnd(value:Number) : void
        {
            if (this.showingDropdown)
            {
                this.dropdownSwatch.scrollRect = null;
            }
            else
            {
                this.onTweenUpdate(value);
                this.dropdownSwatch.visible = false;
                this.isOpening = false;
            }
            UIComponent.resumeBackgroundProcessing();
            if (this.showingDropdown)
            {
            }
            if (this.showTextField)
            {
                this.dropdownSwatch.callLater(this.dropdownSwatch.setFocus);
            }
            else
            {
                setFocus();
            }
            this.dropdownSwatch.enabled = true;
            dispatchEvent(new DropdownEvent(this.showingDropdown ? (DropdownEvent.OPEN) : (DropdownEvent.CLOSE), false, false, this.triggerEvent));
            return;
        }// end function

    }
}
