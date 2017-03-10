package mx.core
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.system.*;
    import flash.text.*;
    import flash.ui.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.containers.utilityClasses.*;
    import mx.controls.*;
    import mx.controls.scrollClasses.*;
    import mx.events.*;
    import mx.geom.*;
    import mx.managers.*;
    import mx.styles.*;

    public class Container extends UIComponent implements IContainer, IDataRenderer, IFocusManagerContainer, IListItemRenderer, IRawChildrenContainer, IChildList, IVisualElementContainer, INavigatorContent
    {
        protected var actualCreationPolicy:String;
        private var numChildrenBefore:int;
        private var recursionFlag:Boolean = true;
        private var forceLayout:Boolean = false;
        var doingLayout:Boolean = false;
        private var changedStyles:String = null;
        private var _creatingContentPane:Boolean = false;
        protected var whiteBox:Shape;
        var contentPane:Sprite = null;
        private var scrollPropertiesChanged:Boolean = false;
        private var scrollPositionChanged:Boolean = true;
        private var horizontalScrollPositionPending:Number;
        private var verticalScrollPositionPending:Number;
        private var scrollableWidth:Number = 0;
        private var scrollableHeight:Number = 0;
        private var viewableWidth:Number = 0;
        private var viewableHeight:Number = 0;
        var border:IFlexDisplayObject;
        var blocker:Sprite;
        private var mouseEventReferenceCount:int = 0;
        private var richEditableTextClass:Class;
        private var _focusPane:Sprite;
        var _numChildren:int = 0;
        private var _autoLayout:Boolean = true;
        private var _childDescriptors:Array;
        private var _childRepeaters:Array;
        private var _clipContent:Boolean = true;
        private var _createdComponents:Array;
        private var _creationIndex:int = -1;
        private var creationPolicyNone:Boolean = false;
        private var _defaultButton:IFlexDisplayObject;
        private var _data:Object;
        private var _firstChildIndex:int = 0;
        private var _horizontalLineScrollSize:Number = 5;
        private var _horizontalPageScrollSize:Number = 0;
        private var _horizontalScrollBar:ScrollBar;
        private var _horizontalScrollPosition:Number = 0;
        var _horizontalScrollPolicy:String = "auto";
        private var _icon:Class = null;
        private var _label:String = "";
        private var _numChildrenCreated:int = -1;
        private var _rawChildren:ContainerRawChildrenList;
        private var _verticalLineScrollSize:Number = 5;
        private var _verticalPageScrollSize:Number = 0;
        private var _verticalScrollBar:ScrollBar;
        private var _verticalScrollPosition:Number = 0;
        var _verticalScrollPolicy:String = "auto";
        private var _viewMetrics:EdgeMetrics;
        private var _viewMetricsAndPadding:EdgeMetrics;
        private var _forceClippingCount:int;
        static const VERSION:String = "4.6.0.23201";
        private static const MULTIPLE_PROPERTIES:String = "<MULTIPLE>";
        private static var haloBorder:Class;
        private static var sparkBorder:Class;
        private static var sparkContainerBorder:Class;
        private static var didLookup:Boolean = false;

        public function Container()
        {
            tabEnabled = false;
            tabFocusEnabled = false;
            showInAutomationHierarchy = false;
            if (ApplicationDomain.currentDomain.hasDefinition("spark.components.RichEditableText"))
            {
                this.richEditableTextClass = Class(ApplicationDomain.currentDomain.getDefinition("spark.components.RichEditableText"));
            }
            return;
        }// end function

        function getLayoutChildAt(index:int) : IUIComponent
        {
            return PostScaleAdapter.getCompatibleIUIComponent(this.getChildAt(index));
        }// end function

        public function get creatingContentPane() : Boolean
        {
            return this._creatingContentPane;
        }// end function

        public function set creatingContentPane(value:Boolean) : void
        {
            this._creatingContentPane = value;
            return;
        }// end function

        override public function get baselinePosition() : Number
        {
            if (!validateBaselinePosition())
            {
                return NaN;
            }
            var _loc_1:* = measureText("Wj");
            if (height < 2 * this.viewMetrics.top + 4 + _loc_1.ascent)
            {
                return int(height + (_loc_1.ascent - height) / 2);
            }
            return this.viewMetrics.top + 2 + _loc_1.ascent;
        }// end function

        override public function get contentMouseX() : Number
        {
            if (this.contentPane)
            {
                return this.contentPane.mouseX;
            }
            return super.contentMouseX;
        }// end function

        override public function get contentMouseY() : Number
        {
            if (this.contentPane)
            {
                return this.contentPane.mouseY;
            }
            return super.contentMouseY;
        }// end function

        override public function set doubleClickEnabled(value:Boolean) : void
        {
            var _loc_2:int = 0;
            var _loc_3:int = 0;
            var _loc_4:InteractiveObject = null;
            super.doubleClickEnabled = value;
            if (this.contentPane)
            {
                _loc_2 = this.contentPane.numChildren;
                _loc_3 = 0;
                while (_loc_3 < _loc_2)
                {
                    
                    _loc_4 = this.contentPane.getChildAt(_loc_3) as InteractiveObject;
                    if (_loc_4)
                    {
                        _loc_4.doubleClickEnabled = value;
                    }
                    _loc_3 = _loc_3 + 1;
                }
            }
            return;
        }// end function

        override public function set enabled(value:Boolean) : void
        {
            super.enabled = value;
            if (this.horizontalScrollBar)
            {
                this.horizontalScrollBar.enabled = value;
            }
            if (this.verticalScrollBar)
            {
                this.verticalScrollBar.enabled = value;
            }
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

        override public function get focusPane() : Sprite
        {
            return this._focusPane;
        }// end function

        override public function set focusPane(o:Sprite) : void
        {
            var _loc_2:* = invalidateSizeFlag;
            var _loc_3:* = invalidateDisplayListFlag;
            invalidateSizeFlag = true;
            invalidateDisplayListFlag = true;
            if (o)
            {
                this.rawChildren.addChild(o);
                o.x = 0;
                o.y = 0;
                o.scrollRect = null;
                this._focusPane = o;
            }
            else
            {
                this.rawChildren.removeChild(this._focusPane);
                this._focusPane = null;
            }
            if (o)
            {
            }
            if (this.contentPane)
            {
                o.x = this.contentPane.x;
                o.y = this.contentPane.y;
                o.scrollRect = this.contentPane.scrollRect;
            }
            invalidateSizeFlag = _loc_2;
            invalidateDisplayListFlag = _loc_3;
            return;
        }// end function

        override public function set moduleFactory(moduleFactory:IFlexModuleFactory) : void
        {
            super.moduleFactory = moduleFactory;
            styleManager.registerInheritingStyle("_creationPolicy");
            return;
        }// end function

        final function get $numChildren() : int
        {
            return super.numChildren;
        }// end function

        override public function get numChildren() : int
        {
            return this.contentPane ? (this.contentPane.numChildren) : (this._numChildren);
        }// end function

        public function get autoLayout() : Boolean
        {
            return this._autoLayout;
        }// end function

        public function set autoLayout(value:Boolean) : void
        {
            var _loc_2:IInvalidating = null;
            this._autoLayout = value;
            if (value)
            {
                invalidateSize();
                invalidateDisplayList();
                _loc_2 = parent as IInvalidating;
                if (_loc_2)
                {
                    _loc_2.invalidateSize();
                    _loc_2.invalidateDisplayList();
                }
            }
            return;
        }// end function

        public function get borderMetrics() : EdgeMetrics
        {
            if (this.border)
            {
            }
            return this.border is IRectangularBorder ? (IRectangularBorder(this.border).borderMetrics) : (EdgeMetrics.EMPTY);
        }// end function

        public function get childDescriptors() : Array
        {
            return this._childDescriptors;
        }// end function

        function get childRepeaters() : Array
        {
            return this._childRepeaters;
        }// end function

        function set childRepeaters(value:Array) : void
        {
            this._childRepeaters = value;
            return;
        }// end function

        public function get clipContent() : Boolean
        {
            return this._clipContent;
        }// end function

        public function set clipContent(value:Boolean) : void
        {
            if (this._clipContent != value)
            {
                this._clipContent = value;
                invalidateDisplayList();
            }
            return;
        }// end function

        function get createdComponents() : Array
        {
            return this._createdComponents;
        }// end function

        function set createdComponents(value:Array) : void
        {
            this._createdComponents = value;
            return;
        }// end function

        public function get creationIndex() : int
        {
            return this._creationIndex;
        }// end function

        public function set creationIndex(value:int) : void
        {
            this._creationIndex = value;
            return;
        }// end function

        public function get creationPolicy() : String
        {
            if (this.creationPolicyNone)
            {
                return ContainerCreationPolicy.NONE;
            }
            return getStyle("_creationPolicy");
        }// end function

        public function set creationPolicy(value:String) : void
        {
            var _loc_2:* = value;
            if (value == ContainerCreationPolicy.NONE)
            {
                this.creationPolicyNone = true;
                _loc_2 = ContainerCreationPolicy.AUTO;
            }
            else
            {
                this.creationPolicyNone = false;
            }
            setStyle("_creationPolicy", _loc_2);
            this.setActualCreationPolicies(value);
            return;
        }// end function

        public function get defaultButton() : IFlexDisplayObject
        {
            return this._defaultButton;
        }// end function

        public function set defaultButton(value:IFlexDisplayObject) : void
        {
            this._defaultButton = value;
            ContainerGlobals.focusedContainer = null;
            return;
        }// end function

        public function get deferredContentCreated() : Boolean
        {
            return processedDescriptors;
        }// end function

        public function get data() : Object
        {
            return this._data;
        }// end function

        public function set data(value:Object) : void
        {
            this._data = value;
            dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
            invalidateDisplayList();
            return;
        }// end function

        function get firstChildIndex() : int
        {
            return this._firstChildIndex;
        }// end function

        public function get horizontalLineScrollSize() : Number
        {
            return this._horizontalLineScrollSize;
        }// end function

        public function set horizontalLineScrollSize(value:Number) : void
        {
            this.scrollPropertiesChanged = true;
            this._horizontalLineScrollSize = value;
            invalidateDisplayList();
            dispatchEvent(new Event("horizontalLineScrollSizeChanged"));
            return;
        }// end function

        public function get horizontalPageScrollSize() : Number
        {
            return this._horizontalPageScrollSize;
        }// end function

        public function set horizontalPageScrollSize(value:Number) : void
        {
            this.scrollPropertiesChanged = true;
            this._horizontalPageScrollSize = value;
            invalidateDisplayList();
            dispatchEvent(new Event("horizontalPageScrollSizeChanged"));
            return;
        }// end function

        public function get horizontalScrollBar() : ScrollBar
        {
            return this._horizontalScrollBar;
        }// end function

        public function set horizontalScrollBar(value:ScrollBar) : void
        {
            this._horizontalScrollBar = value;
            return;
        }// end function

        public function get horizontalScrollPosition() : Number
        {
            if (!isNaN(this.horizontalScrollPositionPending))
            {
                return this.horizontalScrollPositionPending;
            }
            return this._horizontalScrollPosition;
        }// end function

        public function set horizontalScrollPosition(value:Number) : void
        {
            if (this._horizontalScrollPosition == value)
            {
                return;
            }
            this._horizontalScrollPosition = value;
            this.scrollPositionChanged = true;
            if (!initialized)
            {
                this.horizontalScrollPositionPending = value;
            }
            invalidateDisplayList();
            dispatchEvent(new Event("viewChanged"));
            return;
        }// end function

        public function get horizontalScrollPolicy() : String
        {
            return this._horizontalScrollPolicy;
        }// end function

        public function set horizontalScrollPolicy(value:String) : void
        {
            if (this._horizontalScrollPolicy != value)
            {
                this._horizontalScrollPolicy = value;
                invalidateDisplayList();
                dispatchEvent(new Event("horizontalScrollPolicyChanged"));
            }
            return;
        }// end function

        public function get icon() : Class
        {
            return this._icon;
        }// end function

        public function set icon(value:Class) : void
        {
            this._icon = value;
            dispatchEvent(new Event("iconChanged"));
            return;
        }// end function

        public function get label() : String
        {
            return this._label;
        }// end function

        public function set label(value:String) : void
        {
            this._label = value;
            dispatchEvent(new Event("labelChanged"));
            return;
        }// end function

        public function get maxHorizontalScrollPosition() : Number
        {
            return this.horizontalScrollBar ? (this.horizontalScrollBar.maxScrollPosition) : (Math.max(this.scrollableWidth - this.viewableWidth, 0));
        }// end function

        public function get maxVerticalScrollPosition() : Number
        {
            return this.verticalScrollBar ? (this.verticalScrollBar.maxScrollPosition) : (Math.max(this.scrollableHeight - this.viewableHeight, 0));
        }// end function

        function get numChildrenCreated() : int
        {
            return this._numChildrenCreated;
        }// end function

        function set numChildrenCreated(value:int) : void
        {
            this._numChildrenCreated = value;
            return;
        }// end function

        function get numRepeaters() : int
        {
            return this.childRepeaters ? (this.childRepeaters.length) : (0);
        }// end function

        public function get rawChildren() : IChildList
        {
            if (!this._rawChildren)
            {
                this._rawChildren = new ContainerRawChildrenList(this);
            }
            return this._rawChildren;
        }// end function

        function get usePadding() : Boolean
        {
            return true;
        }// end function

        public function get verticalLineScrollSize() : Number
        {
            return this._verticalLineScrollSize;
        }// end function

        public function set verticalLineScrollSize(value:Number) : void
        {
            this.scrollPropertiesChanged = true;
            this._verticalLineScrollSize = value;
            invalidateDisplayList();
            dispatchEvent(new Event("verticalLineScrollSizeChanged"));
            return;
        }// end function

        public function get verticalPageScrollSize() : Number
        {
            return this._verticalPageScrollSize;
        }// end function

        public function set verticalPageScrollSize(value:Number) : void
        {
            this.scrollPropertiesChanged = true;
            this._verticalPageScrollSize = value;
            invalidateDisplayList();
            dispatchEvent(new Event("verticalPageScrollSizeChanged"));
            return;
        }// end function

        public function get verticalScrollBar() : ScrollBar
        {
            return this._verticalScrollBar;
        }// end function

        public function set verticalScrollBar(value:ScrollBar) : void
        {
            this._verticalScrollBar = value;
            return;
        }// end function

        public function get verticalScrollPosition() : Number
        {
            if (!isNaN(this.verticalScrollPositionPending))
            {
                return this.verticalScrollPositionPending;
            }
            return this._verticalScrollPosition;
        }// end function

        public function set verticalScrollPosition(value:Number) : void
        {
            if (this._verticalScrollPosition == value)
            {
                return;
            }
            this._verticalScrollPosition = value;
            this.scrollPositionChanged = true;
            if (!initialized)
            {
                this.verticalScrollPositionPending = value;
            }
            invalidateDisplayList();
            dispatchEvent(new Event("viewChanged"));
            return;
        }// end function

        public function get verticalScrollPolicy() : String
        {
            return this._verticalScrollPolicy;
        }// end function

        public function set verticalScrollPolicy(value:String) : void
        {
            if (this._verticalScrollPolicy != value)
            {
                this._verticalScrollPolicy = value;
                invalidateDisplayList();
                dispatchEvent(new Event("verticalScrollPolicyChanged"));
            }
            return;
        }// end function

        public function get viewMetrics() : EdgeMetrics
        {
            var _loc_1:* = this.borderMetrics;
            if (this.verticalScrollBar != null)
            {
                if (!this.doingLayout)
                {
                }
            }
            var _loc_2:* = this.verticalScrollPolicy == ScrollPolicy.ON;
            if (this.horizontalScrollBar != null)
            {
                if (!this.doingLayout)
                {
                }
            }
            var _loc_3:* = this.horizontalScrollPolicy == ScrollPolicy.ON;
            if (!_loc_2)
            {
            }
            if (!_loc_3)
            {
                return _loc_1;
            }
            if (!this._viewMetrics)
            {
                this._viewMetrics = _loc_1.clone();
            }
            else
            {
                this._viewMetrics.left = _loc_1.left;
                this._viewMetrics.right = _loc_1.right;
                this._viewMetrics.top = _loc_1.top;
                this._viewMetrics.bottom = _loc_1.bottom;
            }
            if (_loc_2)
            {
                this._viewMetrics.right = this._viewMetrics.right + this.verticalScrollBar.minWidth;
            }
            if (_loc_3)
            {
                this._viewMetrics.bottom = this._viewMetrics.bottom + this.horizontalScrollBar.minHeight;
            }
            return this._viewMetrics;
        }// end function

        public function get viewMetricsAndPadding() : EdgeMetrics
        {
            if (this._viewMetricsAndPadding)
            {
                if (this.horizontalScrollBar)
                {
                }
            }
            if (this.horizontalScrollPolicy == ScrollPolicy.ON)
            {
                if (this.verticalScrollBar)
                {
                }
            }
            if (this.verticalScrollPolicy == ScrollPolicy.ON)
            {
                return this._viewMetricsAndPadding;
            }
            if (!this._viewMetricsAndPadding)
            {
                this._viewMetricsAndPadding = new EdgeMetrics();
            }
            var _loc_1:* = this._viewMetricsAndPadding;
            var _loc_2:* = this.viewMetrics;
            _loc_1.left = _loc_2.left + getStyle("paddingLeft");
            _loc_1.right = _loc_2.right + getStyle("paddingRight");
            _loc_1.top = _loc_2.top + getStyle("paddingTop");
            _loc_1.bottom = _loc_2.bottom + getStyle("paddingBottom");
            return _loc_1;
        }// end function

        override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false) : void
        {
            super.addEventListener(type, listener, useCapture, priority, useWeakReference);
            if (type != MouseEvent.CLICK)
            {
            }
            if (type != MouseEvent.DOUBLE_CLICK)
            {
            }
            if (type != MouseEvent.MOUSE_DOWN)
            {
            }
            if (type != MouseEvent.MOUSE_MOVE)
            {
            }
            if (type != MouseEvent.MOUSE_OVER)
            {
            }
            if (type != MouseEvent.MOUSE_OUT)
            {
            }
            if (type != MouseEvent.MOUSE_UP)
            {
            }
            if (type == MouseEvent.MOUSE_WHEEL)
            {
                if (this.mouseEventReferenceCount < 2147483647)
                {
                    var _loc_6:String = this;
                    _loc_6.mouseEventReferenceCount = this.mouseEventReferenceCount + 1;
                }
                if (this.mouseEventReferenceCount++ == 0)
                {
                    setStyle("mouseShield", true);
                    setStyle("mouseShieldChildren", true);
                }
            }
            return;
        }// end function

        function $addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false) : void
        {
            super.addEventListener(type, listener, useCapture, priority, useWeakReference);
            return;
        }// end function

        override public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false) : void
        {
            super.removeEventListener(type, listener, useCapture);
            if (type != MouseEvent.CLICK)
            {
            }
            if (type != MouseEvent.DOUBLE_CLICK)
            {
            }
            if (type != MouseEvent.MOUSE_DOWN)
            {
            }
            if (type != MouseEvent.MOUSE_MOVE)
            {
            }
            if (type != MouseEvent.MOUSE_OVER)
            {
            }
            if (type != MouseEvent.MOUSE_OUT)
            {
            }
            if (type != MouseEvent.MOUSE_UP)
            {
            }
            if (type == MouseEvent.MOUSE_WHEEL)
            {
                if (this.mouseEventReferenceCount > 0)
                {
                    var _loc_4:String = this;
                    _loc_4.mouseEventReferenceCount = this.mouseEventReferenceCount - 1;
                }
                if (--this.mouseEventReferenceCount == 0)
                {
                    setStyle("mouseShield", false);
                    setStyle("mouseShieldChildren", false);
                }
            }
            return;
        }// end function

        function $removeEventListener(type:String, listener:Function, useCapture:Boolean = false) : void
        {
            super.removeEventListener(type, listener, useCapture);
            return;
        }// end function

        override public function addChild(child:DisplayObject) : DisplayObject
        {
            return this.addChildAt(child, this.numChildren);
        }// end function

        override public function addChildAt(child:DisplayObject, index:int) : DisplayObject
        {
            var _loc_3:* = child.parent;
            if (_loc_3)
            {
            }
            if (!(_loc_3 is Loader))
            {
                if (_loc_3 == this)
                {
                    index = index == this.numChildren ? ((index - 1)) : (index);
                }
                _loc_3.removeChild(child);
            }
            this.addingChild(child);
            if (this.contentPane)
            {
                this.contentPane.addChildAt(child, index);
            }
            else
            {
                $addChildAt(child, this._firstChildIndex + index);
            }
            this.childAdded(child);
            if (child is UIComponent)
            {
            }
            if (UIComponent(child).isDocument)
            {
                BindingManager.setEnabled(child, true);
            }
            return child;
        }// end function

        override public function removeChild(child:DisplayObject) : DisplayObject
        {
            var _loc_2:int = 0;
            var _loc_3:int = 0;
            if (child is IDeferredInstantiationUIComponent)
            {
            }
            if (IDeferredInstantiationUIComponent(child).descriptor)
            {
                if (this.createdComponents)
                {
                    _loc_2 = this.createdComponents.length;
                    _loc_3 = 0;
                    while (_loc_3 < _loc_2)
                    {
                        
                        if (this.createdComponents[_loc_3] === child)
                        {
                            this.createdComponents.splice(_loc_3, 1);
                        }
                        _loc_3 = _loc_3 + 1;
                    }
                }
            }
            this.removingChild(child);
            if (child is UIComponent)
            {
            }
            if (UIComponent(child).isDocument)
            {
                BindingManager.setEnabled(child, false);
            }
            if (this.contentPane)
            {
                this.contentPane.removeChild(child);
            }
            else
            {
                $removeChild(child);
            }
            this.childRemoved(child);
            return child;
        }// end function

        override public function removeChildAt(index:int) : DisplayObject
        {
            return this.removeChild(this.getChildAt(index));
        }// end function

        override public function getChildAt(index:int) : DisplayObject
        {
            if (this.contentPane)
            {
                return this.contentPane.getChildAt(index);
            }
            return super.getChildAt(this._firstChildIndex + index);
        }// end function

        override public function getChildByName(name:String) : DisplayObject
        {
            var _loc_2:DisplayObject = null;
            var _loc_3:int = 0;
            if (this.contentPane)
            {
                return this.contentPane.getChildByName(name);
            }
            _loc_2 = super.getChildByName(name);
            if (!_loc_2)
            {
                return null;
            }
            _loc_3 = super.getChildIndex(_loc_2) - this._firstChildIndex;
            if (_loc_3 >= 0)
            {
            }
            if (_loc_3 >= this._numChildren)
            {
                return null;
            }
            return _loc_2;
        }// end function

        override public function getChildIndex(child:DisplayObject) : int
        {
            var _loc_2:int = 0;
            if (this.contentPane)
            {
                return this.contentPane.getChildIndex(child);
            }
            _loc_2 = super.getChildIndex(child) - this._firstChildIndex;
            return _loc_2;
        }// end function

        override public function setChildIndex(child:DisplayObject, newIndex:int) : void
        {
            var _loc_3:int = 0;
            var _loc_4:* = _loc_3;
            var _loc_5:* = newIndex;
            if (this.contentPane)
            {
                this.contentPane.setChildIndex(child, newIndex);
                if (!this._autoLayout)
                {
                }
                if (this.forceLayout)
                {
                    invalidateDisplayList();
                }
            }
            else
            {
                _loc_3 = super.getChildIndex(child);
                newIndex = newIndex + this._firstChildIndex;
                if (newIndex == _loc_3)
                {
                    return;
                }
                super.setChildIndex(child, newIndex);
                invalidateDisplayList();
                _loc_4 = _loc_3 - this._firstChildIndex;
                _loc_5 = newIndex - this._firstChildIndex;
            }
            var _loc_6:* = new IndexChangedEvent(IndexChangedEvent.CHILD_INDEX_CHANGE);
            _loc_6.relatedObject = child;
            _loc_6.oldIndex = _loc_4;
            _loc_6.newIndex = _loc_5;
            dispatchEvent(_loc_6);
            dispatchEvent(new Event("childrenChanged"));
            return;
        }// end function

        override public function contains(child:DisplayObject) : Boolean
        {
            if (this.contentPane)
            {
                return this.contentPane.contains(child);
            }
            return super.contains(child);
        }// end function

        public function get numElements() : int
        {
            return this.numChildren;
        }// end function

        public function getElementAt(index:int) : IVisualElement
        {
            return this.getChildAt(index) as IVisualElement;
        }// end function

        public function getElementIndex(element:IVisualElement) : int
        {
            if (!(element is DisplayObject))
            {
                throw ArgumentError(element + " is not found in this Container");
            }
            return this.getChildIndex(element as DisplayObject);
        }// end function

        public function addElement(element:IVisualElement) : IVisualElement
        {
            if (!(element is DisplayObject))
            {
                throw ArgumentError(element + " is not supported in this Container");
            }
            return this.addChild(element as DisplayObject) as IVisualElement;
        }// end function

        public function addElementAt(element:IVisualElement, index:int) : IVisualElement
        {
            if (!(element is DisplayObject))
            {
                throw ArgumentError(element + " is not supported in this Container");
            }
            return this.addChildAt(element as DisplayObject, index) as IVisualElement;
        }// end function

        public function removeElement(element:IVisualElement) : IVisualElement
        {
            if (!(element is DisplayObject))
            {
                throw ArgumentError(element + " is not found in this Container");
            }
            return this.removeChild(element as DisplayObject) as IVisualElement;
        }// end function

        public function removeElementAt(index:int) : IVisualElement
        {
            return this.removeChildAt(index) as IVisualElement;
        }// end function

        public function removeAllElements() : void
        {
            var _loc_1:* = this.numElements - 1;
            while (_loc_1 >= 0)
            {
                
                this.removeElementAt(_loc_1);
                _loc_1 = _loc_1 - 1;
            }
            return;
        }// end function

        public function setElementIndex(element:IVisualElement, index:int) : void
        {
            if (!(element is DisplayObject))
            {
                throw ArgumentError(element + " is not found in this Container");
            }
            return this.setChildIndex(element as DisplayObject, index);
        }// end function

        public function swapElements(element1:IVisualElement, element2:IVisualElement) : void
        {
            if (!(element1 is DisplayObject))
            {
                throw ArgumentError(element1 + " is not found in this Container");
            }
            if (!(element2 is DisplayObject))
            {
                throw ArgumentError(element2 + " is not found in this Container");
            }
            swapChildren(element1 as DisplayObject, element2 as DisplayObject);
            return;
        }// end function

        public function swapElementsAt(index1:int, index2:int) : void
        {
            swapChildrenAt(index1, index2);
            return;
        }// end function

        override public function initialize() : void
        {
            var _loc_1:* = undefined;
            var _loc_2:String = null;
            if (documentDescriptor)
            {
            }
            if (!processedDescriptors)
            {
                _loc_1 = documentDescriptor.properties;
                if (_loc_1)
                {
                }
                if (_loc_1.childDescriptors)
                {
                    if (this._childDescriptors)
                    {
                        _loc_2 = resourceManager.getString("core", "multipleChildSets_ClassAndInstance");
                        throw new Error(_loc_2);
                    }
                    this._childDescriptors = _loc_1.childDescriptors;
                }
            }
            super.initialize();
            return;
        }// end function

        override protected function createChildren() : void
        {
            var _loc_1:* = undefined;
            super.createChildren();
            this.createBorder();
            if (this.horizontalScrollPolicy != ScrollPolicy.ON)
            {
            }
            this.createOrDestroyScrollbars(this.horizontalScrollPolicy == ScrollPolicy.ON, this.verticalScrollPolicy == ScrollPolicy.ON, this.verticalScrollPolicy == ScrollPolicy.ON);
            if (this.actualCreationPolicy == null)
            {
                if (this.creationPolicy != null)
                {
                    this.actualCreationPolicy = this.creationPolicy;
                }
                if (this.actualCreationPolicy == ContainerCreationPolicy.QUEUED)
                {
                    this.actualCreationPolicy = ContainerCreationPolicy.AUTO;
                }
            }
            if (this.actualCreationPolicy == ContainerCreationPolicy.NONE)
            {
                this.actualCreationPolicy = ContainerCreationPolicy.AUTO;
            }
            else if (this.actualCreationPolicy == ContainerCreationPolicy.QUEUED)
            {
                _loc_1 = parentApplication ? (parentApplication) : (FlexGlobals.topLevelApplication);
                if ("addToCreationQueue" in _loc_1)
                {
                    _loc_1.addToCreationQueue(this, this._creationIndex, null, this);
                }
                else
                {
                    this.createComponentsFromDescriptors();
                }
            }
            else if (this.recursionFlag)
            {
                this.createComponentsFromDescriptors();
            }
            if (this.autoLayout == false)
            {
                this.forceLayout = true;
            }
            UIComponentGlobals.layoutManager.addEventListener(FlexEvent.UPDATE_COMPLETE, this.layoutCompleteHandler, false, 0, true);
            return;
        }// end function

        override protected function initializationComplete() : void
        {
            return;
        }// end function

        override public function invalidateLayoutDirection() : void
        {
            var _loc_1:int = 0;
            var _loc_2:int = 0;
            var _loc_3:DisplayObject = null;
            super.invalidateLayoutDirection();
            if (this._rawChildren)
            {
                _loc_1 = this._rawChildren.numChildren;
                _loc_2 = 0;
                while (_loc_2 < _loc_1)
                {
                    
                    _loc_3 = this._rawChildren.getChildAt(_loc_2);
                    if (!(_loc_3 is IStyleClient))
                    {
                    }
                    if (_loc_3 is ILayoutDirectionElement)
                    {
                        ILayoutDirectionElement(_loc_3).invalidateLayoutDirection();
                    }
                    _loc_2 = _loc_2 + 1;
                }
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            var _loc_1:String = null;
            super.commitProperties();
            if (this.changedStyles)
            {
                _loc_1 = this.changedStyles == MULTIPLE_PROPERTIES ? (null) : (this.changedStyles);
                super.notifyStyleChangeInChildren(_loc_1, true);
                this.changedStyles = null;
            }
            this.createOrDestroyBlocker();
            return;
        }// end function

        override public function validateSize(recursive:Boolean = false) : void
        {
            var _loc_2:int = 0;
            var _loc_3:int = 0;
            var _loc_4:DisplayObject = null;
            if (this.autoLayout == false)
            {
            }
            if (this.forceLayout == false)
            {
                if (recursive)
                {
                    _loc_2 = super.numChildren;
                    _loc_3 = 0;
                    while (_loc_3 < _loc_2)
                    {
                        
                        _loc_4 = super.getChildAt(_loc_3);
                        if (_loc_4 is ILayoutManagerClient)
                        {
                            ILayoutManagerClient(_loc_4).validateSize(true);
                        }
                        _loc_3 = _loc_3 + 1;
                    }
                }
                adjustSizesForScaleChanges();
            }
            else
            {
                super.validateSize(recursive);
            }
            return;
        }// end function

        override public function validateDisplayList() : void
        {
            var _loc_1:EdgeMetrics = null;
            var _loc_2:Number = NaN;
            var _loc_3:Number = NaN;
            var _loc_4:Object = null;
            var _loc_5:Number = NaN;
            var _loc_6:Number = NaN;
            var _loc_7:Number = NaN;
            if (!this._autoLayout)
            {
            }
            if (this.forceLayout)
            {
                this.doingLayout = true;
                super.validateDisplayList();
                this.doingLayout = false;
            }
            else
            {
                this.layoutChrome(unscaledWidth, unscaledHeight);
            }
            invalidateDisplayListFlag = true;
            if (this.createContentPaneAndScrollbarsIfNeeded())
            {
                if (!this._autoLayout)
                {
                }
                if (this.forceLayout)
                {
                    this.doingLayout = true;
                    super.validateDisplayList();
                    this.doingLayout = false;
                }
                this.createContentPaneAndScrollbarsIfNeeded();
            }
            if (this.clampScrollPositions())
            {
                this.scrollChildren();
            }
            if (this.contentPane)
            {
                _loc_1 = this.viewMetrics;
                if (effectOverlay)
                {
                    effectOverlay.x = 0;
                    effectOverlay.y = 0;
                    effectOverlay.width = unscaledWidth;
                    effectOverlay.height = unscaledHeight;
                }
                if (!this.horizontalScrollBar)
                {
                }
                if (this.verticalScrollBar)
                {
                    if (this.verticalScrollBar)
                    {
                    }
                    if (this.verticalScrollPolicy == ScrollPolicy.ON)
                    {
                        _loc_1.right = _loc_1.right - this.verticalScrollBar.minWidth;
                    }
                    if (this.horizontalScrollBar)
                    {
                    }
                    if (this.horizontalScrollPolicy == ScrollPolicy.ON)
                    {
                        _loc_1.bottom = _loc_1.bottom - this.horizontalScrollBar.minHeight;
                    }
                    if (this.horizontalScrollBar)
                    {
                        _loc_2 = unscaledWidth - _loc_1.left - _loc_1.right;
                        if (this.verticalScrollBar)
                        {
                            _loc_2 = _loc_2 - this.verticalScrollBar.minWidth;
                        }
                        this.horizontalScrollBar.setActualSize(_loc_2, this.horizontalScrollBar.minHeight);
                        this.horizontalScrollBar.move(_loc_1.left, unscaledHeight - _loc_1.bottom - this.horizontalScrollBar.minHeight);
                    }
                    if (this.verticalScrollBar)
                    {
                        _loc_3 = unscaledHeight - _loc_1.top - _loc_1.bottom;
                        if (this.horizontalScrollBar)
                        {
                            _loc_3 = _loc_3 - this.horizontalScrollBar.minHeight;
                        }
                        this.verticalScrollBar.setActualSize(this.verticalScrollBar.minWidth, _loc_3);
                        this.verticalScrollBar.move(unscaledWidth - _loc_1.right - this.verticalScrollBar.minWidth, _loc_1.top);
                    }
                    if (this.whiteBox)
                    {
                        this.whiteBox.x = this.verticalScrollBar.x;
                        this.whiteBox.y = this.horizontalScrollBar.y;
                    }
                }
                this.contentPane.x = _loc_1.left;
                this.contentPane.y = _loc_1.top;
                if (this.focusPane)
                {
                    this.focusPane.x = _loc_1.left;
                    this.focusPane.y = _loc_1.top;
                }
                this.scrollChildren();
            }
            invalidateDisplayListFlag = false;
            if (this.blocker)
            {
                _loc_1 = this.viewMetrics;
                if (FlexVersion.compatibilityVersion >= FlexVersion.VERSION_4_0)
                {
                    _loc_1 = EdgeMetrics.EMPTY;
                }
                _loc_4 = enabled ? (null) : (getStyle("backgroundDisabledColor"));
                if (_loc_4 !== null)
                {
                }
                if (isNaN(Number(_loc_4)))
                {
                    _loc_4 = getStyle("backgroundColor");
                }
                if (_loc_4 !== null)
                {
                }
                if (isNaN(Number(_loc_4)))
                {
                    _loc_4 = 16777215;
                }
                _loc_5 = getStyle("disabledOverlayAlpha");
                if (isNaN(_loc_5))
                {
                    _loc_5 = 0.6;
                }
                this.blocker.x = _loc_1.left;
                this.blocker.y = _loc_1.top;
                _loc_6 = unscaledWidth - (_loc_1.left + _loc_1.right);
                _loc_7 = unscaledHeight - (_loc_1.top + _loc_1.bottom);
                this.blocker.graphics.clear();
                this.blocker.graphics.beginFill(uint(_loc_4), _loc_5);
                this.blocker.graphics.drawRect(0, 0, _loc_6, _loc_7);
                this.blocker.graphics.endFill();
                this.rawChildren.setChildIndex(this.blocker, (this.rawChildren.numChildren - 1));
            }
            return;
        }// end function

        override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number) : void
        {
            var _loc_3:Object = null;
            var _loc_4:Number = NaN;
            super.updateDisplayList(unscaledWidth, unscaledHeight);
            this.layoutChrome(unscaledWidth, unscaledHeight);
            if (this.scrollPositionChanged)
            {
                this.clampScrollPositions();
                this.scrollChildren();
                this.scrollPositionChanged = false;
            }
            if (this.scrollPropertiesChanged)
            {
                if (this.horizontalScrollBar)
                {
                    this.horizontalScrollBar.lineScrollSize = this.horizontalLineScrollSize;
                    this.horizontalScrollBar.pageScrollSize = this.horizontalPageScrollSize;
                }
                if (this.verticalScrollBar)
                {
                    this.verticalScrollBar.lineScrollSize = this.verticalLineScrollSize;
                    this.verticalScrollBar.pageScrollSize = this.verticalPageScrollSize;
                }
                this.scrollPropertiesChanged = false;
            }
            if (this.contentPane)
            {
            }
            if (this.contentPane.scrollRect)
            {
                _loc_3 = enabled ? (null) : (getStyle("backgroundDisabledColor"));
                if (_loc_3 !== null)
                {
                }
                if (isNaN(Number(_loc_3)))
                {
                    _loc_3 = getStyle("backgroundColor");
                }
                _loc_4 = getStyle("backgroundAlpha");
                if (this._clipContent)
                {
                }
                if (!isNaN(Number(_loc_3)))
                {
                    isNaN(Number(_loc_3));
                }
                if (_loc_3 !== "")
                {
                    if (!this.horizontalScrollBar)
                    {
                    }
                    if (!this.verticalScrollBar)
                    {
                    }
                }
                if (!cacheAsBitmap)
                {
                    _loc_3 = null;
                }
                else
                {
                    if (!getStyle("backgroundImage"))
                    {
                        getStyle("backgroundImage");
                    }
                    if (getStyle("background"))
                    {
                        _loc_3 = null;
                    }
                    else if (_loc_4 != 1)
                    {
                        _loc_3 = null;
                    }
                }
                this.contentPane.opaqueBackground = _loc_3;
                this.contentPane.cacheAsBitmap = _loc_3 != null;
            }
            return;
        }// end function

        override public function contentToGlobal(point:Point) : Point
        {
            if (this.contentPane)
            {
                return this.contentPane.localToGlobal(point);
            }
            return localToGlobal(point);
        }// end function

        override public function globalToContent(point:Point) : Point
        {
            if (this.contentPane)
            {
                return this.contentPane.globalToLocal(point);
            }
            return globalToLocal(point);
        }// end function

        override public function contentToLocal(point:Point) : Point
        {
            if (!this.contentPane)
            {
                return point;
            }
            point = this.contentToGlobal(point);
            return globalToLocal(point);
        }// end function

        override public function localToContent(point:Point) : Point
        {
            if (!this.contentPane)
            {
                return point;
            }
            point = localToGlobal(point);
            return this.globalToContent(point);
        }// end function

        override public function styleChanged(styleProp:String) : void
        {
            var _loc_3:String = null;
            var _loc_4:String = null;
            if (styleProp != null)
            {
            }
            var _loc_2:* = styleProp == "styleName";
            if (!_loc_2)
            {
            }
            if (styleManager.isSizeInvalidatingStyle(styleProp))
            {
                invalidateDisplayList();
            }
            if (!_loc_2)
            {
            }
            if (styleProp == "borderSkin")
            {
                if (this.border)
                {
                    this.rawChildren.removeChild(DisplayObject(this.border));
                    this.border = null;
                    this.createBorder();
                }
            }
            if (!_loc_2)
            {
            }
            if (styleProp != "borderStyle")
            {
            }
            if (styleProp != "backgroundColor")
            {
            }
            if (styleProp != "backgroundImage")
            {
            }
            if (styleProp != "mouseShield")
            {
            }
            if (styleProp == "mouseShieldChildren")
            {
                this.createBorder();
            }
            super.styleChanged(styleProp);
            if (!_loc_2)
            {
            }
            if (styleManager.isSizeInvalidatingStyle(styleProp))
            {
                this.invalidateViewMetricsAndPadding();
            }
            if (!_loc_2)
            {
            }
            if (styleProp == "horizontalScrollBarStyleName")
            {
                if (this.horizontalScrollBar)
                {
                }
                if (this.horizontalScrollBar is ISimpleStyleClient)
                {
                    _loc_3 = getStyle("horizontalScrollBarStyleName");
                    ISimpleStyleClient(this.horizontalScrollBar).styleName = _loc_3;
                }
            }
            if (!_loc_2)
            {
            }
            if (styleProp == "verticalScrollBarStyleName")
            {
                if (this.verticalScrollBar)
                {
                }
                if (this.verticalScrollBar is ISimpleStyleClient)
                {
                    _loc_4 = getStyle("verticalScrollBarStyleName");
                    ISimpleStyleClient(this.verticalScrollBar).styleName = _loc_4;
                }
            }
            return;
        }// end function

        override public function notifyStyleChangeInChildren(styleProp:String, recursive:Boolean) : void
        {
            var _loc_5:ISimpleStyleClient = null;
            var _loc_3:* = super.numChildren;
            var _loc_4:int = 0;
            while (_loc_4 < _loc_3)
            {
                
                if (!this.contentPane)
                {
                }
                if (_loc_4 >= this._firstChildIndex)
                {
                }
                if (_loc_4 >= this._firstChildIndex + this._numChildren)
                {
                    _loc_5 = super.getChildAt(_loc_4) as ISimpleStyleClient;
                    if (_loc_5)
                    {
                        _loc_5.styleChanged(styleProp);
                        if (_loc_5 is IStyleClient)
                        {
                            IStyleClient(_loc_5).notifyStyleChangeInChildren(styleProp, recursive);
                        }
                    }
                }
                _loc_4 = _loc_4 + 1;
            }
            if (recursive)
            {
                if (this.changedStyles == null)
                {
                }
                this.changedStyles = styleProp == null ? (MULTIPLE_PROPERTIES) : (styleProp);
                invalidateProperties();
            }
            return;
        }// end function

        override public function regenerateStyleCache(recursive:Boolean) : void
        {
            var _loc_2:int = 0;
            var _loc_3:int = 0;
            var _loc_4:DisplayObject = null;
            super.regenerateStyleCache(recursive);
            if (this.contentPane)
            {
                _loc_2 = this.contentPane.numChildren;
                _loc_3 = 0;
                while (_loc_3 < _loc_2)
                {
                    
                    _loc_4 = this.getChildAt(_loc_3);
                    if (_loc_4 is UIComponent)
                    {
                        if (UIComponent(_loc_4).inheritingStyles != StyleProtoChain.STYLE_UNINITIALIZED)
                        {
                            UIComponent(_loc_4).regenerateStyleCache(recursive);
                        }
                    }
                    else
                    {
                        if (_loc_4 is IUITextField)
                        {
                        }
                        if (IUITextField(_loc_4).inheritingStyles)
                        {
                            StyleProtoChain.initTextField(IUITextField(_loc_4));
                        }
                    }
                    _loc_3 = _loc_3 + 1;
                }
            }
            return;
        }// end function

        override protected function attachOverlay() : void
        {
            this.rawChildren_addChild(effectOverlay);
            return;
        }// end function

        override function fillOverlay(overlay:UIComponent, color:uint, targetArea:RoundedRectangle = null) : void
        {
            var _loc_4:* = this.viewMetrics;
            var _loc_5:Number = 0;
            if (!targetArea)
            {
                targetArea = new RoundedRectangle(_loc_4.left, _loc_4.top, unscaledWidth - _loc_4.right - _loc_4.left, unscaledHeight - _loc_4.bottom - _loc_4.top, _loc_5);
            }
            if (!isNaN(targetArea.x))
            {
                isNaN(targetArea.x);
            }
            if (!isNaN(targetArea.y))
            {
                isNaN(targetArea.y);
            }
            if (!isNaN(targetArea.width))
            {
                isNaN(targetArea.width);
            }
            if (!isNaN(targetArea.height))
            {
                isNaN(targetArea.height);
            }
            if (isNaN(targetArea.cornerRadius))
            {
                return;
            }
            var _loc_6:* = overlay.graphics;
            _loc_6.clear();
            _loc_6.beginFill(color);
            _loc_6.drawRoundRect(targetArea.x, targetArea.y, targetArea.width, targetArea.height, targetArea.cornerRadius * 2, targetArea.cornerRadius * 2);
            _loc_6.endFill();
            return;
        }// end function

        override public function executeBindings(recurse:Boolean = false) : void
        {
            if (descriptor)
            {
            }
            var _loc_2:* = descriptor.document ? (descriptor.document) : (parentDocument);
            BindingManager.executeBindings(_loc_2, id, this);
            if (recurse)
            {
                this.executeChildBindings(recurse);
            }
            return;
        }// end function

        override public function prepareToPrint(target:IFlexDisplayObject) : Object
        {
            if (this.contentPane)
            {
            }
            var _loc_2:* = this.contentPane.scrollRect ? (this.contentPane.scrollRect) : (null);
            if (_loc_2)
            {
                this.contentPane.scrollRect = null;
            }
            super.prepareToPrint(target);
            return _loc_2;
        }// end function

        override public function finishPrint(obj:Object, target:IFlexDisplayObject) : void
        {
            if (obj)
            {
                this.contentPane.scrollRect = Rectangle(obj);
            }
            super.finishPrint(obj, target);
            return;
        }// end function

        override function addingChild(child:DisplayObject) : void
        {
            var _loc_2:* = IUIComponent(child);
            super.addingChild(child);
            invalidateSize();
            invalidateDisplayList();
            if (!this.contentPane)
            {
                if (this._numChildren == 0)
                {
                    this._firstChildIndex = super.numChildren;
                }
                var _loc_3:String = this;
                var _loc_4:* = this._numChildren + 1;
                _loc_3._numChildren = _loc_4;
            }
            if (this.contentPane)
            {
            }
            if (!this.autoLayout)
            {
                this.forceLayout = true;
                UIComponentGlobals.layoutManager.addEventListener(FlexEvent.UPDATE_COMPLETE, this.layoutCompleteHandler, false, 0, true);
            }
            return;
        }// end function

        override function childAdded(child:DisplayObject) : void
        {
            var _loc_2:ChildExistenceChangedEvent = null;
            if (hasEventListener("childrenChanged"))
            {
                dispatchEvent(new Event("childrenChanged"));
            }
            if (hasEventListener(ChildExistenceChangedEvent.CHILD_ADD))
            {
                _loc_2 = new ChildExistenceChangedEvent(ChildExistenceChangedEvent.CHILD_ADD);
                _loc_2.relatedObject = child;
                dispatchEvent(_loc_2);
            }
            if (child.hasEventListener(FlexEvent.ADD))
            {
                child.dispatchEvent(new FlexEvent(FlexEvent.ADD));
            }
            super.childAdded(child);
            return;
        }// end function

        override function removingChild(child:DisplayObject) : void
        {
            var _loc_2:ChildExistenceChangedEvent = null;
            super.removingChild(child);
            if (child.hasEventListener(FlexEvent.REMOVE))
            {
                child.dispatchEvent(new FlexEvent(FlexEvent.REMOVE));
            }
            if (hasEventListener(ChildExistenceChangedEvent.CHILD_REMOVE))
            {
                _loc_2 = new ChildExistenceChangedEvent(ChildExistenceChangedEvent.CHILD_REMOVE);
                _loc_2.relatedObject = child;
                dispatchEvent(_loc_2);
            }
            return;
        }// end function

        override function childRemoved(child:DisplayObject) : void
        {
            super.childRemoved(child);
            invalidateSize();
            invalidateDisplayList();
            if (!this.contentPane)
            {
                var _loc_2:String = this;
                var _loc_3:* = this._numChildren - 1;
                _loc_2._numChildren = _loc_3;
                if (this._numChildren == 0)
                {
                    this._firstChildIndex = super.numChildren;
                }
            }
            if (this.contentPane)
            {
            }
            if (!this.autoLayout)
            {
                this.forceLayout = true;
                UIComponentGlobals.layoutManager.addEventListener(FlexEvent.UPDATE_COMPLETE, this.layoutCompleteHandler, false, 0, true);
            }
            if (hasEventListener("childrenChanged"))
            {
                dispatchEvent(new Event("childrenChanged"));
            }
            return;
        }// end function

        public function getChildren() : Array
        {
            var _loc_1:Array = [];
            var _loc_2:* = this.numChildren;
            var _loc_3:int = 0;
            while (_loc_3 < _loc_2)
            {
                
                _loc_1.push(this.getChildAt(_loc_3));
                _loc_3 = _loc_3 + 1;
            }
            return _loc_1;
        }// end function

        public function removeAllChildren() : void
        {
            while (this.numChildren > 0)
            {
                
                this.removeChildAt(0);
            }
            return;
        }// end function

        function setDocumentDescriptor(desc:UIComponentDescriptor) : void
        {
            var _loc_2:String = null;
            if (processedDescriptors)
            {
                return;
            }
            if (_documentDescriptor)
            {
            }
            if (_documentDescriptor.properties.childDescriptors)
            {
                if (desc.properties.childDescriptors)
                {
                    _loc_2 = resourceManager.getString("core", "multipleChildSets_ClassAndSubclass");
                    throw new Error(_loc_2);
                }
            }
            else
            {
                _documentDescriptor = desc;
                _documentDescriptor.document = this;
            }
            return;
        }// end function

        function setActualCreationPolicies(policy:String) : void
        {
            var _loc_5:IFlexDisplayObject = null;
            var _loc_6:Container = null;
            this.actualCreationPolicy = policy;
            var _loc_2:* = policy;
            if (policy == ContainerCreationPolicy.QUEUED)
            {
                _loc_2 = ContainerCreationPolicy.AUTO;
            }
            var _loc_3:* = this.numChildren;
            var _loc_4:int = 0;
            while (_loc_4 < _loc_3)
            {
                
                _loc_5 = IFlexDisplayObject(this.getChildAt(_loc_4));
                if (_loc_5 is Container)
                {
                    _loc_6 = Container(_loc_5);
                    if (_loc_6.creationPolicy == null)
                    {
                        _loc_6.setActualCreationPolicies(_loc_2);
                    }
                }
                _loc_4 = _loc_4 + 1;
            }
            return;
        }// end function

        public function createComponentsFromDescriptors(recurse:Boolean = true) : void
        {
            var _loc_4:IFlexDisplayObject = null;
            this.numChildrenBefore = this.numChildren;
            this.createdComponents = [];
            var _loc_2:* = this.childDescriptors ? (this.childDescriptors.length) : (0);
            var _loc_3:int = 0;
            while (_loc_3 < _loc_2)
            {
                
                _loc_4 = this.createComponentFromDescriptor(this.childDescriptors[_loc_3], recurse);
                this.createdComponents.push(_loc_4);
                _loc_3 = _loc_3 + 1;
            }
            if (this.creationPolicy != ContainerCreationPolicy.QUEUED)
            {
            }
            if (this.creationPolicy == ContainerCreationPolicy.NONE)
            {
                UIComponentGlobals.layoutManager.usePhasedInstantiation = false;
            }
            this.numChildrenCreated = this.numChildren - this.numChildrenBefore;
            processedDescriptors = true;
            dispatchEvent(new FlexEvent(FlexEvent.CONTENT_CREATION_COMPLETE));
            return;
        }// end function

        public function createDeferredContent() : void
        {
            this.createComponentsFromDescriptors(true);
            return;
        }// end function

        public function createComponentFromDescriptor(descriptor:ComponentDescriptor, recurse:Boolean) : IFlexDisplayObject
        {
            var _loc_7:String = null;
            var _loc_10:IRepeaterClient = null;
            var _loc_11:IStyleClient = null;
            var _loc_12:String = null;
            var _loc_13:String = null;
            var _loc_3:* = UIComponentDescriptor(descriptor);
            var _loc_4:* = _loc_3.properties;
            if (this.numChildrenBefore == 0)
            {
            }
            if (this.numChildrenCreated != -1)
            {
            }
            if (_loc_3.instanceIndices == null)
            {
            }
            if (this.hasChildMatchingDescriptor(_loc_3))
            {
                return null;
            }
            UIComponentGlobals.layoutManager.usePhasedInstantiation = true;
            var _loc_5:* = _loc_3.type;
            var _loc_6:* = new _loc_5;
            _loc_6.id = _loc_3.id;
            if (_loc_6.id)
            {
            }
            if (_loc_6.id != "")
            {
                _loc_6.name = _loc_6.id;
            }
            _loc_6.descriptor = _loc_3;
            if (_loc_4.childDescriptors)
            {
            }
            if (_loc_6 is Container)
            {
                Container(_loc_6)._childDescriptors = _loc_4.childDescriptors;
                delete _loc_4.childDescriptors;
            }
            for (_loc_7 in _loc_4)
            {
                
                _loc_6[_loc_7] = _loc_4[_loc_7];
            }
            if (_loc_6 is Container)
            {
                Container(_loc_6).recursionFlag = recurse;
            }
            if (_loc_3.instanceIndices)
            {
                if (_loc_6 is IRepeaterClient)
                {
                    _loc_10 = IRepeaterClient(_loc_6);
                    _loc_10.instanceIndices = _loc_3.instanceIndices;
                    _loc_10.repeaters = _loc_3.repeaters;
                    _loc_10.repeaterIndices = _loc_3.repeaterIndices;
                }
            }
            if (_loc_6 is IStyleClient)
            {
                _loc_11 = IStyleClient(_loc_6);
                if (_loc_3.stylesFactory != null)
                {
                    if (!_loc_11.styleDeclaration)
                    {
                        _loc_11.styleDeclaration = new CSSStyleDeclaration(null, styleManager);
                    }
                    _loc_11.styleDeclaration.factory = _loc_3.stylesFactory;
                }
            }
            var _loc_8:* = _loc_3.events;
            if (_loc_8)
            {
                for (_loc_12 in _loc_8)
                {
                    
                    _loc_13 = _loc_8[_loc_12];
                    _loc_6.addEventListener(_loc_12, _loc_3.document[_loc_13]);
                }
            }
            var _loc_9:* = _loc_3.effects;
            if (_loc_9)
            {
                _loc_6.registerEffects(_loc_9);
            }
            if (_loc_6 is IRepeaterClient)
            {
                IRepeaterClient(_loc_6).initializeRepeaterArrays(this);
            }
            _loc_6.createReferenceOnParentDocument(IFlexDisplayObject(_loc_3.document));
            if (!_loc_6.document)
            {
                _loc_6.document = _loc_3.document;
            }
            if (_loc_6 is IRepeater)
            {
                if (!this.childRepeaters)
                {
                    this.childRepeaters = [];
                }
                this.childRepeaters.push(_loc_6);
                _loc_6.executeBindings();
                IRepeater(_loc_6).initializeRepeater(this, recurse);
            }
            else
            {
                this.addChild(DisplayObject(_loc_6));
                _loc_6.executeBindings();
                if (this.creationPolicy != ContainerCreationPolicy.QUEUED)
                {
                }
                if (this.creationPolicy == ContainerCreationPolicy.NONE)
                {
                    _loc_6.addEventListener(FlexEvent.CREATION_COMPLETE, this.creationCompleteHandler);
                }
            }
            return _loc_6;
        }// end function

        private function hasChildMatchingDescriptor(descriptor:UIComponentDescriptor) : Boolean
        {
            var _loc_4:int = 0;
            var _loc_5:IUIComponent = null;
            var _loc_2:* = descriptor.id;
            if (_loc_2 != null)
            {
            }
            if (_loc_2 in document)
            {
            }
            if (document[_loc_2] == null)
            {
                return false;
            }
            var _loc_3:* = this.numChildren;
            _loc_4 = 0;
            while (_loc_4 < _loc_3)
            {
                
                _loc_5 = IUIComponent(this.getChildAt(_loc_4));
                if (_loc_5 is IDeferredInstantiationUIComponent)
                {
                }
                if (IDeferredInstantiationUIComponent(_loc_5).descriptor == descriptor)
                {
                    return true;
                }
                _loc_4 = _loc_4 + 1;
            }
            if (this.childRepeaters)
            {
                _loc_3 = this.childRepeaters.length;
                _loc_4 = 0;
                while (_loc_4 < _loc_3)
                {
                    
                    if (IDeferredInstantiationUIComponent(this.childRepeaters[_loc_4]).descriptor == descriptor)
                    {
                        return true;
                    }
                    _loc_4 = _loc_4 + 1;
                }
            }
            return false;
        }// end function

        function rawChildren_addChild(child:DisplayObject) : DisplayObject
        {
            if (this._numChildren == 0)
            {
                var _loc_2:String = this;
                var _loc_3:* = this._firstChildIndex + 1;
                _loc_2._firstChildIndex = _loc_3;
            }
            super.addingChild(child);
            $addChild(child);
            super.childAdded(child);
            dispatchEvent(new Event("childrenChanged"));
            return child;
        }// end function

        function rawChildren_addChildAt(child:DisplayObject, index:int) : DisplayObject
        {
            if (this._firstChildIndex < index)
            {
            }
            if (index < this._firstChildIndex + this._numChildren + 1)
            {
                var _loc_3:String = this;
                var _loc_4:* = this._numChildren + 1;
                _loc_3._numChildren = _loc_4;
            }
            else if (index <= this._firstChildIndex)
            {
                var _loc_3:String = this;
                var _loc_4:* = this._firstChildIndex + 1;
                _loc_3._firstChildIndex = _loc_4;
            }
            super.addingChild(child);
            $addChildAt(child, index);
            super.childAdded(child);
            dispatchEvent(new Event("childrenChanged"));
            return child;
        }// end function

        function rawChildren_removeChild(child:DisplayObject) : DisplayObject
        {
            var _loc_2:* = this.rawChildren_getChildIndex(child);
            return this.rawChildren_removeChildAt(_loc_2);
        }// end function

        function rawChildren_removeChildAt(index:int) : DisplayObject
        {
            var _loc_2:* = super.getChildAt(index);
            super.removingChild(_loc_2);
            $removeChildAt(index);
            super.childRemoved(_loc_2);
            if (this._firstChildIndex < index)
            {
            }
            if (index < this._firstChildIndex + this._numChildren)
            {
                var _loc_3:String = this;
                var _loc_4:* = this._numChildren - 1;
                _loc_3._numChildren = _loc_4;
            }
            else
            {
                if (this._numChildren != 0)
                {
                }
                if (index < this._firstChildIndex)
                {
                    var _loc_3:String = this;
                    var _loc_4:* = this._firstChildIndex - 1;
                    _loc_3._firstChildIndex = _loc_4;
                }
            }
            invalidateSize();
            invalidateDisplayList();
            dispatchEvent(new Event("childrenChanged"));
            return _loc_2;
        }// end function

        function rawChildren_getChildAt(index:int) : DisplayObject
        {
            return super.getChildAt(index);
        }// end function

        function rawChildren_getChildByName(name:String) : DisplayObject
        {
            return super.getChildByName(name);
        }// end function

        function rawChildren_getChildIndex(child:DisplayObject) : int
        {
            return super.getChildIndex(child);
        }// end function

        function rawChildren_setChildIndex(child:DisplayObject, newIndex:int) : void
        {
            var _loc_3:* = super.getChildIndex(child);
            super.setChildIndex(child, newIndex);
            if (_loc_3 < this._firstChildIndex)
            {
            }
            if (newIndex >= this._firstChildIndex)
            {
                var _loc_4:String = this;
                var _loc_5:* = this._firstChildIndex - 1;
                _loc_4._firstChildIndex = _loc_5;
            }
            else
            {
                if (_loc_3 >= this._firstChildIndex)
                {
                }
                if (newIndex <= this._firstChildIndex)
                {
                    var _loc_4:String = this;
                    var _loc_5:* = this._firstChildIndex + 1;
                    _loc_4._firstChildIndex = _loc_5;
                }
            }
            dispatchEvent(new Event("childrenChanged"));
            return;
        }// end function

        function rawChildren_getObjectsUnderPoint(pt:Point) : Array
        {
            return super.getObjectsUnderPoint(pt);
        }// end function

        function rawChildren_contains(child:DisplayObject) : Boolean
        {
            return super.contains(child);
        }// end function

        protected function layoutChrome(unscaledWidth:Number, unscaledHeight:Number) : void
        {
            if (this.border)
            {
                this.updateBackgroundImageRect();
                this.border.move(0, 0);
                this.border.setActualSize(unscaledWidth, unscaledHeight);
            }
            return;
        }// end function

        protected function createBorder() : void
        {
            var _loc_1:Class = null;
            if (!this.border)
            {
            }
            if (this.isBorderNeeded())
            {
                _loc_1 = getStyle("borderSkin");
                if (_loc_1 != null)
                {
                    this.border = new _loc_1;
                    this.border.name = "border";
                    if (this.border is IUIComponent)
                    {
                        IUIComponent(this.border).enabled = enabled;
                    }
                    if (this.border is ISimpleStyleClient)
                    {
                        ISimpleStyleClient(this.border).styleName = this;
                    }
                    this.rawChildren.addChildAt(DisplayObject(this.border), 0);
                    invalidateDisplayList();
                }
            }
            return;
        }// end function

        private function isBorderNeeded() : Boolean
        {
            var _loc_1:* = getStyle("borderSkin");
            if (!didLookup)
            {
                haloBorder = getDefinition("mx.skins.halo::HaloBorder");
                sparkBorder = getDefinition("mx.skins.spark::BorderSkin");
                sparkContainerBorder = getDefinition("mx.skins.spark::ContainerBorderSkin");
                didLookup = true;
            }
            if (_loc_1 != haloBorder)
            {
            }
            if (_loc_1 != sparkBorder)
            {
            }
            if (_loc_1 != sparkContainerBorder)
            {
                return true;
            }
            var _loc_2:* = getStyle("borderStyle");
            if (_loc_2)
            {
                if (_loc_2 == "none")
                {
                    if (_loc_2 == "none")
                    {
                    }
                }
                if (getStyle("mouseShield"))
                {
                    return true;
                }
            }
            _loc_2 = getStyle("contentBackgroundColor");
            if (_loc_1 == sparkBorder)
            {
            }
            if (_loc_2 !== null)
            {
                return true;
            }
            _loc_2 = getStyle("backgroundColor");
            if (_loc_2 !== null)
            {
            }
            if (_loc_2 !== "")
            {
                return true;
            }
            _loc_2 = getStyle("backgroundImage");
            if (_loc_2 != null)
            {
            }
            return _loc_2 != "";
        }// end function

        function invalidateViewMetricsAndPadding() : void
        {
            this._viewMetricsAndPadding = null;
            return;
        }// end function

        private function createOrDestroyBlocker() : void
        {
            var _loc_1:DisplayObject = null;
            var _loc_2:ISystemManager = null;
            if (enabled)
            {
                if (this.blocker)
                {
                    this.rawChildren.removeChild(this.blocker);
                    this.blocker = null;
                }
            }
            else if (!this.blocker)
            {
                this.blocker = new FlexSprite();
                this.blocker.name = "blocker";
                this.blocker.mouseEnabled = true;
                this.rawChildren.addChild(this.blocker);
                this.blocker.addEventListener(MouseEvent.CLICK, this.blocker_clickHandler);
                _loc_1 = focusManager ? (DisplayObject(focusManager.getFocus())) : (null);
                while (_loc_1)
                {
                    
                    if (_loc_1 == this)
                    {
                        _loc_2 = systemManager;
                        if (_loc_2)
                        {
                        }
                        if (_loc_2.stage)
                        {
                            _loc_2.stage.focus = null;
                        }
                        break;
                    }
                    _loc_1 = _loc_1.parent;
                }
            }
            return;
        }// end function

        private function updateBackgroundImageRect() : void
        {
            var _loc_1:* = this.border as IRectangularBorder;
            if (!_loc_1)
            {
                return;
            }
            if (this.viewableWidth == 0)
            {
            }
            if (this.viewableHeight == 0)
            {
                _loc_1.backgroundImageBounds = null;
                return;
            }
            var _loc_2:* = this.viewMetrics;
            var _loc_3:* = this.viewableWidth ? (this.viewableWidth) : (unscaledWidth - _loc_2.left - _loc_2.right);
            var _loc_4:* = this.viewableHeight ? (this.viewableHeight) : (unscaledHeight - _loc_2.top - _loc_2.bottom);
            if (getStyle("backgroundAttachment") == "fixed")
            {
                _loc_1.backgroundImageBounds = new Rectangle(_loc_2.left, _loc_2.top, _loc_3, _loc_4);
            }
            else
            {
                _loc_1.backgroundImageBounds = new Rectangle(_loc_2.left, _loc_2.top, Math.max(this.scrollableWidth, _loc_3), Math.max(this.scrollableHeight, _loc_4));
            }
            return;
        }// end function

        private function createContentPaneAndScrollbarsIfNeeded() : Boolean
        {
            var _loc_1:Rectangle = null;
            var _loc_2:Boolean = false;
            if (this._clipContent)
            {
                _loc_1 = this.getScrollableRect();
                _loc_2 = this.createScrollbarsIfNeeded(_loc_1);
                if (this.border)
                {
                    this.updateBackgroundImageRect();
                }
                return _loc_2;
            }
            else
            {
                _loc_2 = this.createOrDestroyScrollbars(false, false, false);
                _loc_1 = this.getScrollableRect();
                this.scrollableWidth = _loc_1.right;
                this.scrollableHeight = _loc_1.bottom;
                if (_loc_2)
                {
                }
                if (this.border)
                {
                    this.updateBackgroundImageRect();
                }
                return _loc_2;
            }
        }// end function

        function getScrollableRect() : Rectangle
        {
            var _loc_9:Number = NaN;
            var _loc_10:Number = NaN;
            var _loc_11:Number = NaN;
            var _loc_12:Number = NaN;
            var _loc_13:DisplayObject = null;
            var _loc_14:IUIComponent = null;
            var _loc_1:Number = 0;
            var _loc_2:Number = 0;
            var _loc_3:Number = 0;
            var _loc_4:Number = 0;
            var _loc_5:* = this.numChildren;
            var _loc_6:int = 0;
            while (_loc_6 < _loc_5)
            {
                
                _loc_13 = this.getChildAt(_loc_6);
                if (_loc_13 is IUIComponent)
                {
                    if (!IUIComponent(_loc_13).includeInLayout)
                    {
                    }
                    _loc_14 = PostScaleAdapter.getCompatibleIUIComponent(_loc_13);
                    _loc_11 = _loc_14.width;
                    _loc_12 = _loc_14.height;
                    _loc_9 = _loc_14.x;
                    _loc_10 = _loc_14.y;
                }
                else
                {
                    _loc_11 = _loc_13.width;
                    _loc_12 = _loc_13.height;
                    _loc_9 = _loc_13.x;
                    _loc_10 = _loc_13.y;
                }
                _loc_1 = Math.min(_loc_1, _loc_9);
                _loc_2 = Math.min(_loc_2, _loc_10);
                if (!isNaN(_loc_11))
                {
                    _loc_3 = Math.max(_loc_3, _loc_9 + _loc_11);
                }
                if (!isNaN(_loc_12))
                {
                    _loc_4 = Math.max(_loc_4, _loc_10 + _loc_12);
                }
                _loc_6 = _loc_6 + 1;
            }
            var _loc_7:* = this.viewMetrics;
            var _loc_8:* = new Rectangle();
            _loc_8.left = _loc_1;
            _loc_8.top = _loc_2;
            _loc_8.right = _loc_3;
            _loc_8.bottom = _loc_4;
            if (this.usePadding)
            {
                _loc_8.right = _loc_8.right + getStyle("paddingRight");
                _loc_8.bottom = _loc_8.bottom + getStyle("paddingBottom");
            }
            return _loc_8;
        }// end function

        private function createScrollbarsIfNeeded(bounds:Rectangle) : Boolean
        {
            var _loc_2:* = bounds.right;
            var _loc_3:* = bounds.bottom;
            var _loc_4:* = unscaledWidth;
            var _loc_5:* = unscaledHeight;
            if (bounds.left >= 0)
            {
            }
            var _loc_6:* = bounds.top < 0;
            var _loc_7:* = this.viewMetrics;
            if (scaleX != 1)
            {
                _loc_4 = _loc_4 + 1 / Math.abs(scaleX);
            }
            if (scaleY != 1)
            {
                _loc_5 = _loc_5 + 1 / Math.abs(scaleY);
            }
            _loc_4 = Math.floor(_loc_4);
            _loc_5 = Math.floor(_loc_5);
            _loc_2 = Math.floor(_loc_2);
            _loc_3 = Math.floor(_loc_3);
            if (this.horizontalScrollBar)
            {
            }
            if (this.horizontalScrollPolicy != ScrollPolicy.ON)
            {
                _loc_5 = _loc_5 - this.horizontalScrollBar.minHeight;
            }
            if (this.verticalScrollBar)
            {
            }
            if (this.verticalScrollPolicy != ScrollPolicy.ON)
            {
                _loc_4 = _loc_4 - this.verticalScrollBar.minWidth;
            }
            _loc_4 = _loc_4 - (_loc_7.left + _loc_7.right);
            _loc_5 = _loc_5 - (_loc_7.top + _loc_7.bottom);
            var _loc_8:* = this.horizontalScrollPolicy == ScrollPolicy.ON;
            var _loc_9:* = this.verticalScrollPolicy == ScrollPolicy.ON;
            if (!_loc_8)
            {
            }
            if (!_loc_9)
            {
            }
            if (!_loc_6)
            {
            }
            if (effectOverlay == null)
            {
            }
            if (_loc_7.left <= 0)
            {
            }
            var _loc_10:* = _loc_7.top > 0;
            if (_loc_4 < _loc_2)
            {
                _loc_10 = true;
                if (this.horizontalScrollPolicy == ScrollPolicy.AUTO)
                {
                }
                if (unscaledHeight - _loc_7.top - _loc_7.bottom >= 18)
                {
                }
                if (unscaledWidth - _loc_7.left - _loc_7.right >= 32)
                {
                    _loc_8 = true;
                }
            }
            if (_loc_5 < _loc_3)
            {
                _loc_10 = true;
                if (this.verticalScrollPolicy == ScrollPolicy.AUTO)
                {
                }
                if (unscaledWidth - _loc_7.left - _loc_7.right >= 18)
                {
                }
                if (unscaledHeight - _loc_7.top - _loc_7.bottom >= 32)
                {
                    _loc_9 = true;
                }
            }
            if (_loc_8)
            {
            }
            if (_loc_9)
            {
            }
            if (this.horizontalScrollPolicy == ScrollPolicy.AUTO)
            {
            }
            if (this.verticalScrollPolicy == ScrollPolicy.AUTO)
            {
            }
            if (this.horizontalScrollBar)
            {
            }
            if (this.verticalScrollBar)
            {
            }
            if (_loc_4 + this.verticalScrollBar.minWidth >= _loc_2)
            {
            }
            if (_loc_5 + this.horizontalScrollBar.minHeight >= _loc_3)
            {
                var _loc_12:Boolean = false;
                _loc_9 = false;
                _loc_8 = _loc_12;
            }
            else
            {
                if (_loc_8)
                {
                }
                if (!_loc_9)
                {
                }
                if (this.verticalScrollBar)
                {
                }
                if (this.horizontalScrollPolicy == ScrollPolicy.AUTO)
                {
                }
                if (_loc_4 + this.verticalScrollBar.minWidth >= _loc_2)
                {
                    _loc_8 = false;
                }
            }
            var _loc_11:* = this.createOrDestroyScrollbars(_loc_8, _loc_9, _loc_10);
            if (this.scrollableWidth == _loc_2)
            {
            }
            if (this.viewableWidth == _loc_4)
            {
            }
            if (_loc_11)
            {
                if (this.horizontalScrollBar)
                {
                    this.horizontalScrollBar.setScrollProperties(_loc_4, 0, _loc_2 - _loc_4, this.horizontalPageScrollSize);
                    this.scrollPositionChanged = true;
                }
                this.viewableWidth = _loc_4;
                this.scrollableWidth = _loc_2;
            }
            if (this.scrollableHeight == _loc_3)
            {
            }
            if (this.viewableHeight == _loc_5)
            {
            }
            if (_loc_11)
            {
                if (this.verticalScrollBar)
                {
                    this.verticalScrollBar.setScrollProperties(_loc_5, 0, _loc_3 - _loc_5, this.verticalPageScrollSize);
                    this.scrollPositionChanged = true;
                }
                this.viewableHeight = _loc_5;
                this.scrollableHeight = _loc_3;
            }
            return _loc_11;
        }// end function

        private function createOrDestroyScrollbars(needHorizontal:Boolean, needVertical:Boolean, needContentPane:Boolean) : Boolean
        {
            var _loc_5:IFocusManager = null;
            var _loc_6:String = null;
            var _loc_7:String = null;
            var _loc_8:Graphics = null;
            var _loc_4:Boolean = false;
            if (!needHorizontal)
            {
            }
            if (!needVertical)
            {
            }
            if (needContentPane)
            {
                this.createContentPane();
            }
            if (needHorizontal)
            {
                if (!this.horizontalScrollBar)
                {
                    this.horizontalScrollBar = new HScrollBar();
                    this.horizontalScrollBar.name = "horizontalScrollBar";
                    _loc_6 = getStyle("horizontalScrollBarStyleName");
                    if (_loc_6)
                    {
                    }
                    if (this.horizontalScrollBar is ISimpleStyleClient)
                    {
                        ISimpleStyleClient(this.horizontalScrollBar).styleName = _loc_6;
                    }
                    this.rawChildren.addChild(DisplayObject(this.horizontalScrollBar));
                    this.horizontalScrollBar.lineScrollSize = this.horizontalLineScrollSize;
                    this.horizontalScrollBar.pageScrollSize = this.horizontalPageScrollSize;
                    this.horizontalScrollBar.addEventListener(ScrollEvent.SCROLL, this.horizontalScrollBar_scrollHandler);
                    this.horizontalScrollBar.enabled = enabled;
                    if (this.horizontalScrollBar is IInvalidating)
                    {
                        IInvalidating(this.horizontalScrollBar).validateNow();
                    }
                    invalidateDisplayList();
                    this.invalidateViewMetricsAndPadding();
                    _loc_4 = true;
                    if (!this.verticalScrollBar)
                    {
                        this.addEventListener(KeyboardEvent.KEY_DOWN, this.keyDownHandler);
                    }
                }
            }
            else if (this.horizontalScrollBar)
            {
                this.horizontalScrollBar.removeEventListener(ScrollEvent.SCROLL, this.horizontalScrollBar_scrollHandler);
                this.rawChildren.removeChild(DisplayObject(this.horizontalScrollBar));
                this.horizontalScrollBar = null;
                var _loc_9:int = 0;
                this.scrollableWidth = 0;
                this.viewableWidth = _loc_9;
                if (this._horizontalScrollPosition != 0)
                {
                    this._horizontalScrollPosition = 0;
                    this.scrollPositionChanged = true;
                }
                invalidateDisplayList();
                this.invalidateViewMetricsAndPadding();
                _loc_4 = true;
                _loc_5 = focusManager;
                if (!this.verticalScrollBar)
                {
                    if (_loc_5)
                    {
                    }
                }
                if (_loc_5.getFocus() != this)
                {
                    this.removeEventListener(KeyboardEvent.KEY_DOWN, this.keyDownHandler);
                }
            }
            if (needVertical)
            {
                if (!this.verticalScrollBar)
                {
                    this.verticalScrollBar = new VScrollBar();
                    this.verticalScrollBar.name = "verticalScrollBar";
                    _loc_7 = getStyle("verticalScrollBarStyleName");
                    if (_loc_7)
                    {
                    }
                    if (this.verticalScrollBar is ISimpleStyleClient)
                    {
                        ISimpleStyleClient(this.verticalScrollBar).styleName = _loc_7;
                    }
                    this.rawChildren.addChild(DisplayObject(this.verticalScrollBar));
                    this.verticalScrollBar.lineScrollSize = this.verticalLineScrollSize;
                    this.verticalScrollBar.pageScrollSize = this.verticalPageScrollSize;
                    this.verticalScrollBar.addEventListener(ScrollEvent.SCROLL, this.verticalScrollBar_scrollHandler);
                    this.verticalScrollBar.enabled = enabled;
                    if (this.verticalScrollBar is IInvalidating)
                    {
                        IInvalidating(this.verticalScrollBar).validateNow();
                    }
                    invalidateDisplayList();
                    this.invalidateViewMetricsAndPadding();
                    _loc_4 = true;
                    if (!this.horizontalScrollBar)
                    {
                        this.addEventListener(KeyboardEvent.KEY_DOWN, this.keyDownHandler);
                    }
                    this.addEventListener(MouseEvent.MOUSE_WHEEL, this.mouseWheelHandler);
                }
            }
            else if (this.verticalScrollBar)
            {
                this.verticalScrollBar.removeEventListener(ScrollEvent.SCROLL, this.verticalScrollBar_scrollHandler);
                this.rawChildren.removeChild(DisplayObject(this.verticalScrollBar));
                this.verticalScrollBar = null;
                var _loc_9:int = 0;
                this.scrollableHeight = 0;
                this.viewableHeight = _loc_9;
                if (this._verticalScrollPosition != 0)
                {
                    this._verticalScrollPosition = 0;
                    this.scrollPositionChanged = true;
                }
                invalidateDisplayList();
                this.invalidateViewMetricsAndPadding();
                _loc_4 = true;
                _loc_5 = focusManager;
                if (!this.horizontalScrollBar)
                {
                    if (_loc_5)
                    {
                    }
                }
                if (_loc_5.getFocus() != this)
                {
                    this.removeEventListener(KeyboardEvent.KEY_DOWN, this.keyDownHandler);
                }
                this.removeEventListener(MouseEvent.MOUSE_WHEEL, this.mouseWheelHandler);
            }
            if (this.horizontalScrollBar)
            {
            }
            if (this.verticalScrollBar)
            {
                if (!this.whiteBox)
                {
                    this.whiteBox = new FlexShape();
                    this.whiteBox.name = "whiteBox";
                    _loc_8 = this.whiteBox.graphics;
                    _loc_8.beginFill(16777215);
                    _loc_8.drawRect(0, 0, this.verticalScrollBar.minWidth, this.horizontalScrollBar.minHeight);
                    _loc_8.endFill();
                    this.rawChildren.addChild(this.whiteBox);
                }
            }
            else if (this.whiteBox)
            {
                this.rawChildren.removeChild(this.whiteBox);
                this.whiteBox = null;
            }
            return _loc_4;
        }// end function

        private function clampScrollPositions() : Boolean
        {
            var _loc_1:Boolean = false;
            if (this._horizontalScrollPosition < 0)
            {
                this._horizontalScrollPosition = 0;
                _loc_1 = true;
            }
            else if (this._horizontalScrollPosition > this.maxHorizontalScrollPosition)
            {
                this._horizontalScrollPosition = this.maxHorizontalScrollPosition;
                _loc_1 = true;
            }
            if (this.horizontalScrollBar)
            {
            }
            if (this.horizontalScrollBar.scrollPosition != this._horizontalScrollPosition)
            {
                this.horizontalScrollBar.scrollPosition = this._horizontalScrollPosition;
            }
            if (this._verticalScrollPosition < 0)
            {
                this._verticalScrollPosition = 0;
                _loc_1 = true;
            }
            else if (this._verticalScrollPosition > this.maxVerticalScrollPosition)
            {
                this._verticalScrollPosition = this.maxVerticalScrollPosition;
                _loc_1 = true;
            }
            if (this.verticalScrollBar)
            {
            }
            if (this.verticalScrollBar.scrollPosition != this._verticalScrollPosition)
            {
                this.verticalScrollBar.scrollPosition = this._verticalScrollPosition;
            }
            return _loc_1;
        }// end function

        function createContentPane() : void
        {
            var _loc_3:int = 0;
            var _loc_5:IUIComponent = null;
            if (this.contentPane)
            {
                return;
            }
            this.creatingContentPane = true;
            var _loc_1:* = this.numChildren;
            var _loc_2:* = new FlexSprite();
            _loc_2.name = "contentPane";
            if (this.border)
            {
                _loc_3 = this.rawChildren.getChildIndex(DisplayObject(this.border)) + 1;
                if (this.border is IRectangularBorder)
                {
                }
                if (IRectangularBorder(this.border).hasBackgroundImage)
                {
                    _loc_3 = _loc_3 + 1;
                }
            }
            else
            {
                _loc_3 = 0;
            }
            this.rawChildren.addChildAt(_loc_2, _loc_3);
            var _loc_4:int = 0;
            while (_loc_4 < _loc_1)
            {
                
                _loc_5 = IUIComponent(super.getChildAt(this._firstChildIndex));
                _loc_2.addChild(DisplayObject(_loc_5));
                _loc_5.parentChanged(_loc_2);
                var _loc_6:String = this;
                var _loc_7:* = this._numChildren - 1;
                _loc_6._numChildren = _loc_7;
                _loc_4 = _loc_4 + 1;
            }
            this.contentPane = _loc_2;
            this.creatingContentPane = false;
            this.contentPane.visible = true;
            return;
        }// end function

        protected function scrollChildren() : void
        {
            if (!this.contentPane)
            {
                return;
            }
            var _loc_1:* = this.viewMetrics;
            var _loc_2:Number = 0;
            var _loc_3:Number = 0;
            var _loc_4:* = unscaledWidth - _loc_1.left - _loc_1.right;
            var _loc_5:* = unscaledHeight - _loc_1.top - _loc_1.bottom;
            if (this._clipContent)
            {
                _loc_2 = _loc_2 + this._horizontalScrollPosition;
                if (this.horizontalScrollBar)
                {
                    _loc_4 = this.viewableWidth;
                }
                _loc_3 = _loc_3 + this._verticalScrollPosition;
                if (this.verticalScrollBar)
                {
                    _loc_5 = this.viewableHeight;
                }
            }
            else
            {
                _loc_4 = this.scrollableWidth;
                _loc_5 = this.scrollableHeight;
            }
            var _loc_6:* = this.getScrollableRect();
            if (_loc_2 == 0)
            {
            }
            if (_loc_3 == 0)
            {
            }
            if (_loc_4 >= _loc_6.right)
            {
            }
            if (_loc_5 >= _loc_6.bottom)
            {
            }
            if (_loc_6.left >= 0)
            {
            }
            if (_loc_6.top >= 0)
            {
            }
            if (this._forceClippingCount <= 0)
            {
                this.contentPane.scrollRect = null;
                this.contentPane.opaqueBackground = null;
                this.contentPane.cacheAsBitmap = false;
            }
            else
            {
                this.contentPane.scrollRect = new Rectangle(_loc_2, _loc_3, _loc_4, _loc_5);
            }
            if (this.focusPane)
            {
                this.focusPane.scrollRect = this.contentPane.scrollRect;
            }
            if (this.border)
            {
            }
            if (this.border is IRectangularBorder)
            {
            }
            if (IRectangularBorder(this.border).hasBackgroundImage)
            {
                IRectangularBorder(this.border).layoutBackgroundImage();
            }
            return;
        }// end function

        private function dispatchScrollEvent(direction:String, oldPosition:Number, newPosition:Number, detail:String) : void
        {
            var _loc_5:* = new ScrollEvent(ScrollEvent.SCROLL);
            _loc_5.direction = direction;
            _loc_5.position = newPosition;
            _loc_5.delta = newPosition - oldPosition;
            _loc_5.detail = detail;
            dispatchEvent(_loc_5);
            return;
        }// end function

        function set forceClipping(value:Boolean) : void
        {
            if (this._clipContent)
            {
                if (value)
                {
                    var _loc_2:String = this;
                    var _loc_3:* = this._forceClippingCount + 1;
                    _loc_2._forceClippingCount = _loc_3;
                }
                else
                {
                    var _loc_2:String = this;
                    var _loc_3:* = this._forceClippingCount - 1;
                    _loc_2._forceClippingCount = _loc_3;
                }
                this.createContentPane();
                this.scrollChildren();
            }
            return;
        }// end function

        public function executeChildBindings(recurse:Boolean) : void
        {
            var _loc_4:IUIComponent = null;
            var _loc_2:* = this.numChildren;
            var _loc_3:int = 0;
            while (_loc_3 < _loc_2)
            {
                
                _loc_4 = IUIComponent(this.getChildAt(_loc_3));
                if (_loc_4 is IDeferredInstantiationUIComponent)
                {
                    IDeferredInstantiationUIComponent(_loc_4).executeBindings(recurse);
                }
                _loc_3 = _loc_3 + 1;
            }
            return;
        }// end function

        override protected function keyDownHandler(event:KeyboardEvent) : void
        {
            var _loc_3:String = null;
            var _loc_4:Number = NaN;
            var _loc_5:uint = 0;
            var _loc_2:* = getFocus();
            if (!(_loc_2 is TextField))
            {
                if (this.richEditableTextClass)
                {
                }
            }
            if (_loc_2 is this.richEditableTextClass)
            {
                return;
            }
            if (event.isDefaultPrevented())
            {
                return;
            }
            if (this.verticalScrollBar)
            {
                _loc_3 = ScrollEventDirection.VERTICAL;
                _loc_4 = this.verticalScrollPosition;
                switch(event.keyCode)
                {
                    case Keyboard.DOWN:
                    {
                        this.verticalScrollPosition = this.verticalScrollPosition + this.verticalLineScrollSize;
                        this.dispatchScrollEvent(_loc_3, _loc_4, this.verticalScrollPosition, ScrollEventDetail.LINE_DOWN);
                        event.stopPropagation();
                        break;
                    }
                    case Keyboard.UP:
                    {
                        this.verticalScrollPosition = this.verticalScrollPosition - this.verticalLineScrollSize;
                        this.dispatchScrollEvent(_loc_3, _loc_4, this.verticalScrollPosition, ScrollEventDetail.LINE_UP);
                        event.stopPropagation();
                        break;
                    }
                    case Keyboard.PAGE_UP:
                    {
                        this.verticalScrollPosition = this.verticalScrollPosition - this.verticalPageScrollSize;
                        this.dispatchScrollEvent(_loc_3, _loc_4, this.verticalScrollPosition, ScrollEventDetail.PAGE_UP);
                        event.stopPropagation();
                        break;
                    }
                    case Keyboard.PAGE_DOWN:
                    {
                        this.verticalScrollPosition = this.verticalScrollPosition + this.verticalPageScrollSize;
                        this.dispatchScrollEvent(_loc_3, _loc_4, this.verticalScrollPosition, ScrollEventDetail.PAGE_DOWN);
                        event.stopPropagation();
                        break;
                    }
                    case Keyboard.HOME:
                    {
                        this.verticalScrollPosition = this.verticalScrollBar.minScrollPosition;
                        this.dispatchScrollEvent(_loc_3, _loc_4, this.verticalScrollPosition, ScrollEventDetail.AT_TOP);
                        event.stopPropagation();
                        break;
                    }
                    case Keyboard.END:
                    {
                        this.verticalScrollPosition = this.verticalScrollBar.maxScrollPosition;
                        this.dispatchScrollEvent(_loc_3, _loc_4, this.verticalScrollPosition, ScrollEventDetail.AT_BOTTOM);
                        event.stopPropagation();
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }
            }
            if (this.horizontalScrollBar)
            {
                _loc_3 = ScrollEventDirection.HORIZONTAL;
                _loc_4 = this.horizontalScrollPosition;
                _loc_5 = mapKeycodeForLayoutDirection(event);
                switch(_loc_5)
                {
                    case Keyboard.LEFT:
                    {
                        this.horizontalScrollPosition = this.horizontalScrollPosition - this.horizontalLineScrollSize;
                        this.dispatchScrollEvent(_loc_3, _loc_4, this.horizontalScrollPosition, ScrollEventDetail.LINE_LEFT);
                        event.stopPropagation();
                        break;
                    }
                    case Keyboard.RIGHT:
                    {
                        this.horizontalScrollPosition = this.horizontalScrollPosition + this.horizontalLineScrollSize;
                        this.dispatchScrollEvent(_loc_3, _loc_4, this.horizontalScrollPosition, ScrollEventDetail.LINE_RIGHT);
                        event.stopPropagation();
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

        private function mouseWheelHandler(event:MouseEvent) : void
        {
            var _loc_2:int = 0;
            var _loc_3:int = 0;
            var _loc_4:Number = NaN;
            var _loc_5:Number = NaN;
            if (this.verticalScrollBar)
            {
            }
            if (!event.isDefaultPrevented())
            {
                _loc_2 = event.delta <= 0 ? (1) : (-1);
                _loc_3 = this.verticalScrollBar ? (this.verticalScrollBar.lineScrollSize) : (1);
                _loc_4 = Math.max(Math.abs(event.delta), _loc_3);
                _loc_5 = this.verticalScrollPosition;
                this.verticalScrollPosition = this.verticalScrollPosition + 3 * _loc_4 * _loc_2;
                this.dispatchScrollEvent(ScrollEventDirection.VERTICAL, _loc_5, this.verticalScrollPosition, event.delta <= 0 ? (ScrollEventDetail.LINE_UP) : (ScrollEventDetail.LINE_DOWN));
                event.preventDefault();
            }
            return;
        }// end function

        private function layoutCompleteHandler(event:FlexEvent) : void
        {
            UIComponentGlobals.layoutManager.removeEventListener(FlexEvent.UPDATE_COMPLETE, this.layoutCompleteHandler);
            this.forceLayout = false;
            var _loc_2:Boolean = false;
            if (!isNaN(this.horizontalScrollPositionPending))
            {
                if (this.horizontalScrollPositionPending < 0)
                {
                    this.horizontalScrollPositionPending = 0;
                }
                else if (this.horizontalScrollPositionPending > this.maxHorizontalScrollPosition)
                {
                    this.horizontalScrollPositionPending = this.maxHorizontalScrollPosition;
                }
                if (this.horizontalScrollBar)
                {
                }
                if (this.horizontalScrollBar.scrollPosition != this.horizontalScrollPositionPending)
                {
                    this._horizontalScrollPosition = this.horizontalScrollPositionPending;
                    this.horizontalScrollBar.scrollPosition = this.horizontalScrollPositionPending;
                    _loc_2 = true;
                }
                this.horizontalScrollPositionPending = NaN;
            }
            if (!isNaN(this.verticalScrollPositionPending))
            {
                if (this.verticalScrollPositionPending < 0)
                {
                    this.verticalScrollPositionPending = 0;
                }
                else if (this.verticalScrollPositionPending > this.maxVerticalScrollPosition)
                {
                    this.verticalScrollPositionPending = this.maxVerticalScrollPosition;
                }
                if (this.verticalScrollBar)
                {
                }
                if (this.verticalScrollBar.scrollPosition != this.verticalScrollPositionPending)
                {
                    this._verticalScrollPosition = this.verticalScrollPositionPending;
                    this.verticalScrollBar.scrollPosition = this.verticalScrollPositionPending;
                    _loc_2 = true;
                }
                this.verticalScrollPositionPending = NaN;
            }
            if (_loc_2)
            {
                this.scrollChildren();
            }
            return;
        }// end function

        private function creationCompleteHandler(event:FlexEvent) : void
        {
            var _loc_2:String = this;
            var _loc_3:* = this.numChildrenCreated - 1;
            _loc_2.numChildrenCreated = _loc_3;
            if (this.numChildrenCreated <= 0)
            {
                dispatchEvent(new FlexEvent("childrenCreationComplete"));
            }
            return;
        }// end function

        private function horizontalScrollBar_scrollHandler(event:Event) : void
        {
            var _loc_2:Number = NaN;
            if (event is ScrollEvent)
            {
                _loc_2 = this.horizontalScrollPosition;
                this.horizontalScrollPosition = this.horizontalScrollBar.scrollPosition;
                this.dispatchScrollEvent(ScrollEventDirection.HORIZONTAL, _loc_2, this.horizontalScrollPosition, ScrollEvent(event).detail);
            }
            return;
        }// end function

        private function verticalScrollBar_scrollHandler(event:Event) : void
        {
            var _loc_2:Number = NaN;
            if (event is ScrollEvent)
            {
                _loc_2 = this.verticalScrollPosition;
                this.verticalScrollPosition = this.verticalScrollBar.scrollPosition;
                this.dispatchScrollEvent(ScrollEventDirection.VERTICAL, _loc_2, this.verticalScrollPosition, ScrollEvent(event).detail);
            }
            return;
        }// end function

        private function blocker_clickHandler(event:Event) : void
        {
            event.stopPropagation();
            return;
        }// end function

        private static function getDefinition(name:String) : Class
        {
            var _loc_2:Object = null;
            try
            {
                _loc_2 = getDefinitionByName(name);
            }
            catch (e:Error)
            {
            }
            return _loc_2 as Class;
        }// end function

    }
}
