package mx.controls
{
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.ui.*;
    import flash.utils.*;
    import mx.controls.dataGridClasses.*;
    import mx.controls.listClasses.*;
    import mx.core.*;
    import mx.events.*;
    import mx.styles.*;

    public class Button extends UIComponent implements IDataRenderer, IDropInListItemRenderer, IFocusManagerComponent, IListItemRenderer, IFontContextComponent, IButton
    {
        private var skins:Array;
        var currentSkin:IFlexDisplayObject;
        protected var icons:Array;
        var currentIcon:IFlexDisplayObject;
        private var autoRepeatTimer:Timer;
        var buttonOffset:Number = 0;
        var centerContent:Boolean = true;
        var extraSpacing:Number = 20;
        private var styleChangedFlag:Boolean = true;
        private var skinMeasuredWidth:Number;
        private var skinMeasuredHeight:Number;
        private var oldUnscaledWidth:Number;
        private var selectedSet:Boolean;
        private var labelSet:Boolean;
        var checkedDefaultSkin:Boolean = false;
        var defaultSkinUsesStates:Boolean = false;
        var checkedDefaultIcon:Boolean = false;
        var defaultIconUsesStates:Boolean = false;
        var skinName:String = "skin";
        var emphasizedSkinName:String = "emphasizedSkin";
        var upSkinName:String = "upSkin";
        var overSkinName:String = "overSkin";
        var downSkinName:String = "downSkin";
        var disabledSkinName:String = "disabledSkin";
        var selectedUpSkinName:String = "selectedUpSkin";
        var selectedOverSkinName:String = "selectedOverSkin";
        var selectedDownSkinName:String = "selectedDownSkin";
        var selectedDisabledSkinName:String = "selectedDisabledSkin";
        var iconName:String = "icon";
        var upIconName:String = "upIcon";
        var overIconName:String = "overIcon";
        var downIconName:String = "downIcon";
        var disabledIconName:String = "disabledIcon";
        var selectedUpIconName:String = "selectedUpIcon";
        var selectedOverIconName:String = "selectedOverIcon";
        var selectedDownIconName:String = "selectedDownIcon";
        var selectedDisabledIconName:String = "selectedDisabledIcon";
        private var enabledChanged:Boolean = false;
        protected var textField:IUITextField;
        private var toolTipSet:Boolean = false;
        private var _autoRepeat:Boolean = false;
        private var _data:Object;
        var _emphasized:Boolean = false;
        private var emphasizedChanged:Boolean = false;
        private var _label:String = "";
        private var labelChanged:Boolean = false;
        var _labelPlacement:String = "right";
        private var _listData:BaseListData;
        private var _phase:String = "up";
        var phaseChanged:Boolean = false;
        var _selected:Boolean = false;
        public var selectedField:String = null;
        private var skinLayoutDirectionSet:Boolean = false;
        private var _skinLayoutDirection:String;
        public var stickyHighlighting:Boolean = false;
        var _toggle:Boolean = false;
        var toggleChanged:Boolean = false;
        protected var _currentButtonState:String;
        static const VERSION:String = "4.6.0.23201";
        static var createAccessibilityImplementation:Function;
        static var TEXT_WIDTH_PADDING:Number = 6;

        public function Button()
        {
            this.skins = [];
            this.icons = [];
            mouseChildren = false;
            addEventListener(MouseEvent.ROLL_OVER, this.rollOverHandler);
            addEventListener(MouseEvent.ROLL_OUT, this.rollOutHandler);
            addEventListener(MouseEvent.MOUSE_DOWN, this.mouseDownHandler);
            addEventListener(MouseEvent.MOUSE_UP, this.mouseUpHandler);
            addEventListener(MouseEvent.CLICK, this.clickHandler);
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
            if (super.enabled == value)
            {
                return;
            }
            super.enabled = value;
            this.enabledChanged = true;
            invalidateProperties();
            invalidateDisplayList();
            return;
        }// end function

        override public function set toolTip(value:String) : void
        {
            super.toolTip = value;
            if (value)
            {
                this.toolTipSet = true;
            }
            else
            {
                this.toolTipSet = false;
                invalidateDisplayList();
            }
            return;
        }// end function

        public function get autoRepeat() : Boolean
        {
            return this._autoRepeat;
        }// end function

        public function set autoRepeat(value:Boolean) : void
        {
            this._autoRepeat = value;
            if (value)
            {
                this.autoRepeatTimer = new Timer(1);
            }
            else
            {
                this.autoRepeatTimer = null;
            }
            return;
        }// end function

        public function get data() : Object
        {
            return this._data;
        }// end function

        public function set data(value:Object) : void
        {
            var _loc_2:* = undefined;
            var _loc_3:* = undefined;
            this._data = value;
            if (this._listData)
            {
            }
            if (this._listData is DataGridListData)
            {
            }
            if (DataGridListData(this._listData).dataField != null)
            {
                _loc_2 = this._data[DataGridListData(this._listData).dataField];
                _loc_3 = "";
            }
            else if (this._listData)
            {
                if (this.selectedField)
                {
                    _loc_2 = this._data[this.selectedField];
                }
                _loc_3 = this._listData.label;
            }
            else
            {
                _loc_2 = this._data;
            }
            if (_loc_2 !== undefined)
            {
            }
            if (!this.selectedSet)
            {
                this.selected = _loc_2 as Boolean;
                this.selectedSet = false;
            }
            if (_loc_3 !== undefined)
            {
            }
            if (!this.labelSet)
            {
                this.label = _loc_3;
                this.labelSet = false;
            }
            dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
            return;
        }// end function

        public function get emphasized() : Boolean
        {
            return this._emphasized;
        }// end function

        public function set emphasized(value:Boolean) : void
        {
            this._emphasized = value;
            this.emphasizedChanged = true;
            invalidateDisplayList();
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

        public function get label() : String
        {
            return this._label;
        }// end function

        public function set label(value:String) : void
        {
            this.labelSet = true;
            if (this._label != value)
            {
                this._label = value;
                this.labelChanged = true;
                invalidateSize();
                invalidateDisplayList();
                dispatchEvent(new Event("labelChanged"));
            }
            return;
        }// end function

        public function get labelPlacement() : String
        {
            return this._labelPlacement;
        }// end function

        public function set labelPlacement(value:String) : void
        {
            this._labelPlacement = value;
            invalidateSize();
            invalidateDisplayList();
            dispatchEvent(new Event("labelPlacementChanged"));
            return;
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

        function get phase() : String
        {
            return this._phase;
        }// end function

        function set phase(value:String) : void
        {
            this._phase = value;
            this.phaseChanged = true;
            invalidateSize();
            invalidateProperties();
            invalidateDisplayList();
            return;
        }// end function

        public function get selected() : Boolean
        {
            return this._selected;
        }// end function

        public function set selected(value:Boolean) : void
        {
            this.selectedSet = true;
            this.setSelected(value, true);
            return;
        }// end function

        function setSelected(value:Boolean, isProgrammatic:Boolean = false) : void
        {
            if (this._selected != value)
            {
                this._selected = value;
                invalidateDisplayList();
                if (this.toggle)
                {
                }
                if (!isProgrammatic)
                {
                    dispatchEvent(new Event(Event.CHANGE));
                }
                dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
            }
            return;
        }// end function

        function set skinLayoutDirection(value:String) : void
        {
            this.skinLayoutDirectionSet = true;
            this._skinLayoutDirection = value;
            return;
        }// end function

        public function get toggle() : Boolean
        {
            return this._toggle;
        }// end function

        public function set toggle(value:Boolean) : void
        {
            this._toggle = value;
            this.toggleChanged = true;
            invalidateProperties();
            invalidateDisplayList();
            dispatchEvent(new Event("toggleChanged"));
            return;
        }// end function

        override protected function initializeAccessibility() : void
        {
            if (Button.createAccessibilityImplementation != null)
            {
                Button.createAccessibilityImplementation(this);
            }
            return;
        }// end function

        override protected function createChildren() : void
        {
            super.createChildren();
            if (!this.textField)
            {
                this.textField = IUITextField(createInFontContext(UITextField));
                this.textField.styleName = this;
                addChild(DisplayObject(this.textField));
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            var _loc_1:String = null;
            super.commitProperties();
            if (hasFontContextChanged())
            {
                hasFontContextChanged();
            }
            if (this.textField != null)
            {
                removeChild(DisplayObject(this.textField));
                this.textField = null;
            }
            if (!this.textField)
            {
                this.textField = IUITextField(createInFontContext(UITextField));
                this.textField.styleName = this;
                addChild(DisplayObject(this.textField));
                this.enabledChanged = true;
                this.toggleChanged = true;
            }
            if (!initialized)
            {
                this.viewSkin();
                this.viewIcon();
            }
            if (this.enabledChanged)
            {
                this.textField.enabled = enabled;
                if (this.currentIcon)
                {
                }
                if (this.currentIcon is IUIComponent)
                {
                    IUIComponent(this.currentIcon).enabled = enabled;
                }
                this.enabledChanged = false;
            }
            if (this.toggleChanged)
            {
                if (!this.toggle)
                {
                    this.selected = false;
                }
                this.toggleChanged = false;
            }
            if (this.phaseChanged)
            {
                _loc_1 = this._currentButtonState;
                if (_loc_1 != this.getCurrentButtonState())
                {
                    stateChanged(_loc_1, this._currentButtonState, false);
                }
                this.phaseChanged = false;
            }
            return;
        }// end function

        override protected function measure() : void
        {
            var _loc_9:TextLineMetrics = null;
            super.measure();
            var _loc_1:Number = 0;
            var _loc_2:Number = 0;
            if (this.label)
            {
                _loc_9 = measureText(this.label);
                _loc_1 = _loc_9.width + TEXT_WIDTH_PADDING;
                _loc_2 = _loc_9.height + UITextField.TEXT_HEIGHT_PADDING;
            }
            var _loc_3:* = this.getCurrentIcon();
            var _loc_4:* = _loc_3 ? (_loc_3.width) : (0);
            var _loc_5:* = _loc_3 ? (_loc_3.height) : (0);
            var _loc_6:Number = 0;
            var _loc_7:Number = 0;
            if (this.labelPlacement != ButtonLabelPlacement.LEFT)
            {
            }
            if (this.labelPlacement == ButtonLabelPlacement.RIGHT)
            {
                _loc_6 = _loc_1 + _loc_4;
                if (_loc_1)
                {
                }
                if (_loc_4)
                {
                    _loc_6 = _loc_6 + getStyle("horizontalGap");
                }
                _loc_7 = Math.max(_loc_2, _loc_5);
            }
            else
            {
                _loc_6 = Math.max(_loc_1, _loc_4);
                _loc_7 = _loc_2 + _loc_5;
                if (_loc_2)
                {
                }
                if (_loc_5)
                {
                    _loc_7 = _loc_7 + getStyle("verticalGap");
                }
            }
            if (!_loc_1)
            {
            }
            if (_loc_4)
            {
                _loc_6 = _loc_6 + (getStyle("paddingLeft") + getStyle("paddingRight"));
                _loc_7 = _loc_7 + (getStyle("paddingTop") + getStyle("paddingBottom"));
            }
            if (this.currentSkin)
            {
            }
            if (this.currentSkin is IBorder)
            {
            }
            var _loc_8:* = !(this.currentSkin is IFlexAsset) ? (IBorder(this.currentSkin).borderMetrics) : (null);
            if (_loc_8)
            {
                _loc_6 = _loc_6 + (_loc_8.left + _loc_8.right);
                _loc_7 = _loc_7 + (_loc_8.top + _loc_8.bottom);
            }
            if (this.currentSkin)
            {
                if (!isNaN(this.skinMeasuredWidth))
                {
                    isNaN(this.skinMeasuredWidth);
                }
            }
            if (isNaN(this.skinMeasuredHeight))
            {
                this.skinMeasuredWidth = this.currentSkin.measuredWidth;
                this.skinMeasuredHeight = this.currentSkin.measuredHeight;
            }
            if (!isNaN(this.skinMeasuredWidth))
            {
                _loc_6 = Math.max(this.skinMeasuredWidth, _loc_6);
            }
            if (!isNaN(this.skinMeasuredHeight))
            {
                _loc_7 = Math.max(this.skinMeasuredHeight, _loc_7);
            }
            var _loc_10:* = _loc_6;
            measuredWidth = _loc_6;
            measuredMinWidth = _loc_10;
            var _loc_10:* = _loc_7;
            measuredHeight = _loc_7;
            measuredMinHeight = _loc_10;
            return;
        }// end function

        override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number) : void
        {
            var _loc_5:IFlexDisplayObject = null;
            var _loc_6:Boolean = false;
            super.updateDisplayList(unscaledWidth, unscaledHeight);
            if (this.emphasizedChanged)
            {
                this.changeSkins();
                this.emphasizedChanged = false;
            }
            var _loc_3:* = this.skins.length;
            var _loc_4:int = 0;
            while (_loc_4 < _loc_3)
            {
                
                _loc_5 = IFlexDisplayObject(this.skins[_loc_4]);
                _loc_5.setActualSize(unscaledWidth, unscaledHeight);
                _loc_4 = _loc_4 + 1;
            }
            this.viewSkin();
            this.viewIcon();
            this.layoutContents(unscaledWidth, unscaledHeight, this.phase == ButtonPhase.DOWN);
            if (this.oldUnscaledWidth <= unscaledWidth)
            {
            }
            if (this.textField.text == this.label)
            {
            }
            if (!this.labelChanged)
            {
            }
            if (this.styleChangedFlag)
            {
                this.textField.text = this.label;
                _loc_6 = this.textField.truncateToFit();
                if (!this.toolTipSet)
                {
                    if (_loc_6)
                    {
                        super.toolTip = this.label;
                    }
                    else
                    {
                        super.toolTip = null;
                    }
                }
                this.styleChangedFlag = false;
                this.labelChanged = false;
            }
            this.oldUnscaledWidth = unscaledWidth;
            return;
        }// end function

        override public function styleChanged(styleProp:String) : void
        {
            this.styleChangedFlag = true;
            super.styleChanged(styleProp);
            if (styleProp)
            {
            }
            if (styleProp == "styleName")
            {
                this.changeSkins();
                this.changeIcons();
                if (initialized)
                {
                    this.viewSkin();
                    this.viewIcon();
                }
            }
            else if (styleProp.toLowerCase().indexOf("skin") != -1)
            {
                this.changeSkins();
            }
            else if (styleProp.toLowerCase().indexOf("icon") != -1)
            {
                this.changeIcons();
                invalidateSize();
            }
            return;
        }// end function

        override protected function adjustFocusRect(object:DisplayObject = null) : void
        {
            super.adjustFocusRect(!this.currentSkin ? (DisplayObject(this.currentIcon)) : (this));
            return;
        }// end function

        override protected function get currentCSSState() : String
        {
            return this.getCurrentButtonState();
        }// end function

        function viewSkin() : void
        {
            var _loc_1:String = null;
            if (!enabled)
            {
                _loc_1 = this.selected ? (this.selectedDisabledSkinName) : (this.disabledSkinName);
            }
            else if (this.phase == ButtonPhase.UP)
            {
                _loc_1 = this.selected ? (this.selectedUpSkinName) : (this.upSkinName);
            }
            else if (this.phase == ButtonPhase.OVER)
            {
                _loc_1 = this.selected ? (this.selectedOverSkinName) : (this.overSkinName);
            }
            else if (this.phase == ButtonPhase.DOWN)
            {
                _loc_1 = this.selected ? (this.selectedDownSkinName) : (this.downSkinName);
            }
            this.viewSkinForPhase(_loc_1, this.getCurrentButtonState());
            return;
        }// end function

        function viewSkinForPhase(tempSkinName:String, stateName:String) : void
        {
            var _loc_4:IFlexDisplayObject = null;
            var _loc_5:Number = NaN;
            var _loc_6:ISimpleStyleClient = null;
            var _loc_3:* = Class(getStyle(tempSkinName));
            if (!_loc_3)
            {
                _loc_3 = this._emphasized ? (Class(getStyle(this.emphasizedSkinName))) : (Class(getStyle(this.skinName)));
                if (!_loc_3)
                {
                }
                _loc_3 = this._emphasized ? (Class(getStyle(this.skinName))) : (_loc_3);
                if (this.defaultSkinUsesStates)
                {
                    tempSkinName = this.skinName;
                }
                if (!this.checkedDefaultSkin)
                {
                }
                if (_loc_3)
                {
                    _loc_4 = IFlexDisplayObject(new _loc_3);
                    if (!(_loc_4 is IProgrammaticSkin))
                    {
                    }
                    if (_loc_4 is IStateClient)
                    {
                        this.defaultSkinUsesStates = true;
                        tempSkinName = this.skinName;
                    }
                    if (_loc_4)
                    {
                        this.checkedDefaultSkin = true;
                        if (_loc_4 is ILayoutDirectionElement)
                        {
                        }
                        if (this.skinLayoutDirectionSet)
                        {
                            ILayoutDirectionElement(_loc_4).layoutDirection = this._skinLayoutDirection;
                        }
                    }
                }
            }
            _loc_4 = IFlexDisplayObject(getChildByName(tempSkinName));
            if (!_loc_4)
            {
                if (_loc_3)
                {
                    _loc_4 = IFlexDisplayObject(new _loc_3);
                    _loc_4.name = tempSkinName;
                    _loc_6 = _loc_4 as ISimpleStyleClient;
                    if (_loc_6)
                    {
                        _loc_6.styleName = this;
                    }
                    if (_loc_4 is ILayoutDirectionElement)
                    {
                    }
                    if (this.skinLayoutDirectionSet)
                    {
                        ILayoutDirectionElement(_loc_4).layoutDirection = this._skinLayoutDirection;
                    }
                    addChild(DisplayObject(_loc_4));
                    _loc_4.setActualSize(unscaledWidth, unscaledHeight);
                    if (_loc_4 is IInvalidating)
                    {
                    }
                    if (initialized)
                    {
                        IInvalidating(_loc_4).validateNow();
                    }
                    else
                    {
                        if (_loc_4 is IProgrammaticSkin)
                        {
                        }
                        if (initialized)
                        {
                            IProgrammaticSkin(_loc_4).validateDisplayList();
                        }
                    }
                    this.skins.push(_loc_4);
                }
            }
            if (this.currentSkin)
            {
                this.currentSkin.visible = false;
            }
            this.currentSkin = _loc_4;
            if (this.defaultSkinUsesStates)
            {
            }
            if (this.currentSkin is IStateClient)
            {
                IStateClient(this.currentSkin).currentState = stateName;
                if (this.currentSkin is IInvalidating)
                {
                    IInvalidating(this.currentSkin).validateNow();
                }
            }
            if (this.currentSkin)
            {
                this.currentSkin.visible = true;
            }
            if (enabled)
            {
                if (this.phase == ButtonPhase.OVER)
                {
                    _loc_5 = this.textField.getStyle("textRollOverColor");
                }
                else if (this.phase == ButtonPhase.DOWN)
                {
                    _loc_5 = this.textField.getStyle("textSelectedColor");
                }
                else
                {
                    _loc_5 = this.textField.getStyle("color");
                }
                this.textField.setColor(_loc_5);
            }
            return;
        }// end function

        function getCurrentIconName() : String
        {
            var _loc_1:String = null;
            if (!enabled)
            {
                _loc_1 = this.selected ? (this.selectedDisabledIconName) : (this.disabledIconName);
            }
            else if (this.phase == ButtonPhase.UP)
            {
                _loc_1 = this.selected ? (this.selectedUpIconName) : (this.upIconName);
            }
            else if (this.phase == ButtonPhase.OVER)
            {
                _loc_1 = this.selected ? (this.selectedOverIconName) : (this.overIconName);
            }
            else if (this.phase == ButtonPhase.DOWN)
            {
                _loc_1 = this.selected ? (this.selectedDownIconName) : (this.downIconName);
            }
            return _loc_1;
        }// end function

        function getCurrentIcon() : IFlexDisplayObject
        {
            var _loc_1:* = this.getCurrentIconName();
            if (!_loc_1)
            {
                return null;
            }
            return this.viewIconForPhase(_loc_1);
        }// end function

        function viewIcon() : void
        {
            var _loc_1:* = this.getCurrentIconName();
            this.viewIconForPhase(_loc_1);
            return;
        }// end function

        function viewIconForPhase(tempIconName:String) : IFlexDisplayObject
        {
            var _loc_3:IFlexDisplayObject = null;
            var _loc_4:Boolean = false;
            var _loc_2:* = Class(getStyle(tempIconName));
            if (!_loc_2)
            {
                _loc_2 = Class(getStyle(this.iconName));
                if (this.defaultIconUsesStates)
                {
                    tempIconName = this.iconName;
                }
                if (!this.checkedDefaultIcon)
                {
                }
                if (_loc_2)
                {
                    _loc_3 = IFlexDisplayObject(new _loc_2);
                    if (!(_loc_3 is IProgrammaticSkin))
                    {
                    }
                    if (_loc_3 is IStateClient)
                    {
                        this.defaultIconUsesStates = true;
                        tempIconName = this.iconName;
                    }
                    if (_loc_3)
                    {
                        this.checkedDefaultIcon = true;
                    }
                }
            }
            _loc_3 = IFlexDisplayObject(getChildByName(tempIconName));
            if (_loc_3 == null)
            {
                if (_loc_2 != null)
                {
                    _loc_3 = IFlexDisplayObject(new _loc_2);
                    _loc_3.name = tempIconName;
                    if (_loc_3 is ISimpleStyleClient)
                    {
                        ISimpleStyleClient(_loc_3).styleName = this;
                    }
                    addChild(DisplayObject(_loc_3));
                    _loc_4 = false;
                    if (_loc_3 is IInvalidating)
                    {
                        IInvalidating(_loc_3).validateNow();
                        _loc_4 = true;
                    }
                    else if (_loc_3 is IProgrammaticSkin)
                    {
                        IProgrammaticSkin(_loc_3).validateDisplayList();
                        _loc_4 = true;
                    }
                    if (_loc_3)
                    {
                    }
                    if (_loc_3 is IUIComponent)
                    {
                        IUIComponent(_loc_3).enabled = enabled;
                    }
                    if (_loc_4)
                    {
                        _loc_3.setActualSize(_loc_3.measuredWidth, _loc_3.measuredHeight);
                    }
                    this.icons.push(_loc_3);
                }
            }
            if (this.currentIcon != null)
            {
                this.currentIcon.visible = false;
            }
            this.currentIcon = _loc_3;
            if (this.defaultIconUsesStates)
            {
            }
            if (this.currentIcon is IStateClient)
            {
                IStateClient(this.currentIcon).currentState = this.getCurrentButtonState();
                if (this.currentIcon is IInvalidating)
                {
                    IInvalidating(this.currentIcon).validateNow();
                }
            }
            if (this.currentIcon != null)
            {
                this.currentIcon.visible = true;
            }
            return _loc_3;
        }// end function

        function getCurrentButtonState() : String
        {
            this._currentButtonState = "";
            if (!enabled)
            {
                this._currentButtonState = this.selected ? ("selectedDisabled") : ("disabled");
            }
            else if (this.phase == ButtonPhase.UP)
            {
                this._currentButtonState = this.selected ? ("selectedUp") : ("up");
            }
            else if (this.phase == ButtonPhase.OVER)
            {
                this._currentButtonState = this.selected ? ("selectedOver") : ("over");
            }
            else if (this.phase == ButtonPhase.DOWN)
            {
                this._currentButtonState = this.selected ? ("selectedDown") : ("down");
            }
            return this._currentButtonState;
        }// end function

        function layoutContents(unscaledWidth:Number, unscaledHeight:Number, offset:Boolean) : void
        {
            var _loc_20:TextLineMetrics = null;
            var _loc_28:MoveEvent = null;
            var _loc_4:Number = 0;
            var _loc_5:Number = 0;
            var _loc_6:Number = 0;
            var _loc_7:Number = 0;
            var _loc_8:Number = 0;
            var _loc_9:Number = 0;
            var _loc_10:Number = 0;
            var _loc_11:Number = 0;
            var _loc_12:Number = 0;
            var _loc_13:Number = 0;
            var _loc_14:* = getStyle("paddingLeft");
            var _loc_15:* = getStyle("paddingRight");
            var _loc_16:* = getStyle("paddingTop");
            var _loc_17:* = getStyle("paddingBottom");
            var _loc_18:Number = 0;
            var _loc_19:Number = 0;
            if (this.label)
            {
                _loc_20 = measureText(this.label);
                _loc_18 = _loc_20.width + TEXT_WIDTH_PADDING;
                _loc_19 = _loc_20.height + UITextField.TEXT_HEIGHT_PADDING;
            }
            else
            {
                _loc_20 = measureText("Wj");
                _loc_19 = _loc_20.height + UITextField.TEXT_HEIGHT_PADDING;
            }
            var _loc_21:* = offset ? (this.buttonOffset) : (0);
            var _loc_22:* = getStyle("textAlign");
            if (_loc_22 == "start")
            {
                _loc_22 = TextFormatAlign.LEFT;
            }
            else if (_loc_22 == "end")
            {
                _loc_22 = TextFormatAlign.RIGHT;
            }
            var _loc_23:* = unscaledWidth;
            var _loc_24:* = unscaledHeight;
            if (this.currentSkin)
            {
            }
            if (this.currentSkin is IBorder)
            {
            }
            var _loc_25:* = !(this.currentSkin is IFlexAsset) ? (IBorder(this.currentSkin).borderMetrics) : (null);
            if (_loc_25)
            {
                _loc_23 = _loc_23 - (_loc_25.left + _loc_25.right);
                _loc_24 = _loc_24 - (_loc_25.top + _loc_25.bottom);
            }
            if (this.currentIcon)
            {
                _loc_8 = this.currentIcon.width;
                _loc_9 = this.currentIcon.height;
            }
            if (this.labelPlacement != ButtonLabelPlacement.LEFT)
            {
            }
            if (this.labelPlacement == ButtonLabelPlacement.RIGHT)
            {
                _loc_12 = getStyle("horizontalGap");
                if (_loc_8 != 0)
                {
                }
                if (_loc_18 == 0)
                {
                    _loc_12 = 0;
                }
                if (_loc_18 > 0)
                {
                    var _loc_29:* = Math.max(Math.min(_loc_23 - _loc_8 - _loc_12 - _loc_14 - _loc_15, _loc_18), 0);
                    _loc_4 = Math.max(Math.min(_loc_23 - _loc_8 - _loc_12 - _loc_14 - _loc_15, _loc_18), 0);
                    this.textField.width = _loc_29;
                }
                else
                {
                    var _loc_29:int = 0;
                    _loc_4 = 0;
                    this.textField.width = _loc_29;
                }
                var _loc_29:* = Math.min(_loc_24, _loc_19);
                _loc_5 = Math.min(_loc_24, _loc_19);
                this.textField.height = _loc_29;
                if (_loc_22 == "left")
                {
                    _loc_6 = _loc_6 + _loc_14;
                }
                else if (_loc_22 == "right")
                {
                    _loc_6 = _loc_6 + (_loc_23 - _loc_4 - _loc_8 - _loc_12 - _loc_15);
                }
                else
                {
                    _loc_6 = _loc_6 + ((_loc_23 - _loc_4 - _loc_8 - _loc_12 - _loc_14 - _loc_15) / 2 + _loc_14);
                }
                if (this.labelPlacement == ButtonLabelPlacement.RIGHT)
                {
                    _loc_6 = _loc_6 + (_loc_8 + _loc_12);
                    _loc_10 = _loc_6 - (_loc_8 + _loc_12);
                }
                else
                {
                    _loc_10 = _loc_6 + _loc_4 + _loc_12;
                }
                _loc_11 = (_loc_24 - _loc_9 - _loc_16 - _loc_17) / 2 + _loc_16;
                _loc_7 = (_loc_24 - _loc_5 - _loc_16 - _loc_17) / 2 + _loc_16;
            }
            else
            {
                _loc_13 = getStyle("verticalGap");
                if (_loc_9 != 0)
                {
                }
                if (this.label == "")
                {
                    _loc_13 = 0;
                }
                if (_loc_18 > 0)
                {
                    var _loc_29:* = Math.max(_loc_23 - _loc_14 - _loc_15, 0);
                    _loc_4 = Math.max(_loc_23 - _loc_14 - _loc_15, 0);
                    this.textField.width = _loc_29;
                    var _loc_29:* = Math.min(_loc_24 - _loc_9 - _loc_16 - _loc_17 - _loc_13, _loc_19);
                    _loc_5 = Math.min(_loc_24 - _loc_9 - _loc_16 - _loc_17 - _loc_13, _loc_19);
                    this.textField.height = _loc_29;
                }
                else
                {
                    var _loc_29:int = 0;
                    _loc_4 = 0;
                    this.textField.width = _loc_29;
                    var _loc_29:int = 0;
                    _loc_5 = 0;
                    this.textField.height = _loc_29;
                }
                _loc_6 = _loc_14;
                if (_loc_22 == "left")
                {
                    _loc_10 = _loc_10 + _loc_14;
                }
                else if (_loc_22 == "right")
                {
                    _loc_10 = _loc_10 + Math.max(_loc_23 - _loc_8 - _loc_15, _loc_14);
                }
                else
                {
                    _loc_10 = _loc_10 + ((_loc_23 - _loc_8 - _loc_14 - _loc_15) / 2 + _loc_14);
                }
                if (this.labelPlacement == ButtonLabelPlacement.TOP)
                {
                    _loc_7 = _loc_7 + ((_loc_24 - _loc_5 - _loc_9 - _loc_16 - _loc_17 - _loc_13) / 2 + _loc_16);
                    _loc_11 = _loc_11 + (_loc_7 + _loc_5 + _loc_13);
                }
                else
                {
                    _loc_11 = _loc_11 + ((_loc_24 - _loc_5 - _loc_9 - _loc_16 - _loc_17 - _loc_13) / 2 + _loc_16);
                    _loc_7 = _loc_7 + (_loc_11 + _loc_9 + _loc_13);
                }
            }
            var _loc_26:* = _loc_21;
            var _loc_27:* = _loc_21;
            if (_loc_25)
            {
                _loc_26 = _loc_26 + _loc_25.left;
                _loc_27 = _loc_27 + _loc_25.top;
            }
            if (FlexVersion.compatibilityVersion >= FlexVersion.VERSION_4_0)
            {
                _loc_7 = _loc_7 + getStyle("labelVerticalOffset");
            }
            this.textField.x = Math.round(_loc_6 + _loc_26);
            this.textField.y = Math.round(_loc_7 + _loc_27);
            if (this.currentIcon)
            {
                _loc_10 = _loc_10 + _loc_26;
                _loc_11 = _loc_11 + _loc_27;
                _loc_28 = new MoveEvent(MoveEvent.MOVE);
                _loc_28.oldX = this.currentIcon.x;
                _loc_28.oldY = this.currentIcon.y;
                this.currentIcon.x = Math.round(_loc_10);
                this.currentIcon.y = Math.round(_loc_11);
                this.currentIcon.dispatchEvent(_loc_28);
            }
            if (this.currentSkin)
            {
                setChildIndex(DisplayObject(this.currentSkin), (numChildren - 1));
            }
            if (this.currentIcon)
            {
                setChildIndex(DisplayObject(this.currentIcon), (numChildren - 1));
            }
            if (this.textField)
            {
                setChildIndex(DisplayObject(this.textField), (numChildren - 1));
            }
            return;
        }// end function

        function changeSkins() : void
        {
            var _loc_1:* = this.skins.length;
            var _loc_2:int = 0;
            while (_loc_2 < _loc_1)
            {
                
                removeChild(this.skins[_loc_2]);
                _loc_2 = _loc_2 + 1;
            }
            this.skins = [];
            this.skinMeasuredWidth = NaN;
            this.skinMeasuredHeight = NaN;
            this.checkedDefaultSkin = false;
            this.defaultSkinUsesStates = false;
            if (initialized)
            {
                this.viewSkin();
                invalidateSize();
            }
            return;
        }// end function

        function changeIcons() : void
        {
            var _loc_1:* = this.icons.length;
            var _loc_2:int = 0;
            while (_loc_2 < _loc_1)
            {
                
                removeChild(this.icons[_loc_2]);
                _loc_2 = _loc_2 + 1;
            }
            this.icons = [];
            this.checkedDefaultIcon = false;
            this.defaultIconUsesStates = false;
            return;
        }// end function

        function buttonPressed() : void
        {
            this.phase = ButtonPhase.DOWN;
            dispatchEvent(new FlexEvent(FlexEvent.BUTTON_DOWN));
            if (this.autoRepeat)
            {
                this.autoRepeatTimer.delay = getStyle("repeatDelay");
                this.autoRepeatTimer.addEventListener(TimerEvent.TIMER, this.autoRepeatTimer_timerDelayHandler);
                this.autoRepeatTimer.start();
            }
            return;
        }// end function

        function buttonReleased() : void
        {
            systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_UP, this.systemManager_mouseUpHandler, true);
            systemManager.getSandboxRoot().removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, this.stage_mouseLeaveHandler);
            if (this.autoRepeatTimer)
            {
                this.autoRepeatTimer.removeEventListener(TimerEvent.TIMER, this.autoRepeatTimer_timerDelayHandler);
                this.autoRepeatTimer.removeEventListener(TimerEvent.TIMER, this.autoRepeatTimer_timerHandler);
                this.autoRepeatTimer.reset();
            }
            return;
        }// end function

        function getTextField() : IUITextField
        {
            return this.textField;
        }// end function

        override protected function focusOutHandler(event:FocusEvent) : void
        {
            super.focusOutHandler(event);
            if (this.phase != ButtonPhase.UP)
            {
                this.phase = ButtonPhase.UP;
            }
            return;
        }// end function

        override protected function keyDownHandler(event:KeyboardEvent) : void
        {
            if (!enabled)
            {
                return;
            }
            if (event.keyCode == Keyboard.SPACE)
            {
                this.buttonPressed();
            }
            return;
        }// end function

        override protected function keyUpHandler(event:KeyboardEvent) : void
        {
            if (!enabled)
            {
                return;
            }
            if (event.keyCode == Keyboard.SPACE)
            {
                this.buttonReleased();
                if (this.phase == ButtonPhase.DOWN)
                {
                    dispatchEvent(new MouseEvent(MouseEvent.CLICK));
                }
                this.phase = ButtonPhase.UP;
            }
            return;
        }// end function

        protected function rollOverHandler(event:MouseEvent) : void
        {
            if (this.phase == ButtonPhase.UP)
            {
                if (event.buttonDown)
                {
                    return;
                }
                this.phase = ButtonPhase.OVER;
                event.updateAfterEvent();
            }
            else if (this.phase == ButtonPhase.OVER)
            {
                this.phase = ButtonPhase.DOWN;
                event.updateAfterEvent();
                if (this.autoRepeatTimer)
                {
                    this.autoRepeatTimer.start();
                }
            }
            return;
        }// end function

        protected function rollOutHandler(event:MouseEvent) : void
        {
            if (this.phase == ButtonPhase.OVER)
            {
                this.phase = ButtonPhase.UP;
                event.updateAfterEvent();
            }
            else
            {
                if (this.phase == ButtonPhase.DOWN)
                {
                }
                if (!this.stickyHighlighting)
                {
                    this.phase = ButtonPhase.OVER;
                    event.updateAfterEvent();
                    if (this.autoRepeatTimer)
                    {
                        this.autoRepeatTimer.stop();
                    }
                }
            }
            return;
        }// end function

        protected function mouseDownHandler(event:MouseEvent) : void
        {
            if (!enabled)
            {
                return;
            }
            systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_UP, this.systemManager_mouseUpHandler, true);
            systemManager.getSandboxRoot().addEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, this.stage_mouseLeaveHandler);
            this.buttonPressed();
            event.updateAfterEvent();
            return;
        }// end function

        protected function mouseUpHandler(event:MouseEvent) : void
        {
            if (!enabled)
            {
                return;
            }
            this.phase = ButtonPhase.OVER;
            this.buttonReleased();
            if (!this.toggle)
            {
                event.updateAfterEvent();
            }
            return;
        }// end function

        protected function clickHandler(event:MouseEvent) : void
        {
            if (!enabled)
            {
                event.stopImmediatePropagation();
                return;
            }
            if (this.toggle)
            {
                this.setSelected(!this.selected);
                event.updateAfterEvent();
            }
            return;
        }// end function

        private function systemManager_mouseUpHandler(event:MouseEvent) : void
        {
            if (contains(DisplayObject(event.target)))
            {
                return;
            }
            this.phase = ButtonPhase.UP;
            this.buttonReleased();
            event.updateAfterEvent();
            return;
        }// end function

        private function stage_mouseLeaveHandler(event:Event) : void
        {
            this.phase = ButtonPhase.UP;
            this.buttonReleased();
            return;
        }// end function

        private function autoRepeatTimer_timerDelayHandler(event:Event) : void
        {
            if (!enabled)
            {
                return;
            }
            dispatchEvent(new FlexEvent(FlexEvent.BUTTON_DOWN));
            if (this.autoRepeat)
            {
                this.autoRepeatTimer.reset();
                this.autoRepeatTimer.removeEventListener(TimerEvent.TIMER, this.autoRepeatTimer_timerDelayHandler);
                this.autoRepeatTimer.delay = getStyle("repeatInterval");
                this.autoRepeatTimer.addEventListener(TimerEvent.TIMER, this.autoRepeatTimer_timerHandler);
                this.autoRepeatTimer.start();
            }
            return;
        }// end function

        private function autoRepeatTimer_timerHandler(event:Event) : void
        {
            if (!enabled)
            {
                return;
            }
            dispatchEvent(new FlexEvent(FlexEvent.BUTTON_DOWN));
            return;
        }// end function

    }
}
