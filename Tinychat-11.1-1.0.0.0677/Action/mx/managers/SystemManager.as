package mx.managers
{
    import __AS3__.vec.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.system.*;
    import flash.text.*;
    import flash.ui.*;
    import flash.utils.*;
    import mx.core.*;
    import mx.events.*;
    import mx.preloaders.*;
    import mx.utils.*;

    public class SystemManager extends MovieClip implements IChildList, IFlexDisplayObject, IFlexModuleFactory, ISystemManager
    {
        var topLevel:Boolean = true;
        private var isDispatchingResizeEvent:Boolean;
        var isStageRoot:Boolean = true;
        var isBootstrapRoot:Boolean = false;
        private var _topLevelSystemManager:ISystemManager;
        var childManager:ISystemManagerChildManager;
        private var _stage:Stage;
        var nestLevel:int = 0;
        var preloader:Preloader;
        private var mouseCatcher:Sprite;
        var topLevelWindow:IUIComponent;
        var idleCounter:int = 0;
        private var idleTimer:Timer;
        private var nextFrameTimer:Timer = null;
        private var lastFrame:int;
        private var readyForKickOff:Boolean;
        public var _resourceBundles:Array;
        private var rslDataList:Array;
        private var _height:Number;
        private var _width:Number;
        private var _allowDomainsInNewRSLs:Boolean = true;
        private var _allowInsecureDomainsInNewRSLs:Boolean = true;
        private var _applicationIndex:int = 1;
        private var _cursorChildren:SystemChildrenList;
        private var _cursorIndex:int = 0;
        private var _densityScale:Number = NaN;
        private var _document:Object;
        private var _fontList:Object = null;
        private var _explicitHeight:Number;
        private var _explicitWidth:Number;
        private var _focusPane:Sprite;
        private var _noTopMostIndex:int = 0;
        private var _numModalWindows:int = 0;
        private var _popUpChildren:SystemChildrenList;
        private var _rawChildren:SystemRawChildrenList;
        var _screen:Rectangle;
        private var _toolTipChildren:SystemChildrenList;
        private var _toolTipIndex:int = 0;
        private var _topMostIndex:int = 0;
        var _mouseX:Object;
        var _mouseY:Object;
        private var implMap:Object;
        static const VERSION:String = "4.6.0.23201";
        private static const IDLE_THRESHOLD:Number = 1000;
        private static const IDLE_INTERVAL:Number = 100;
        static var allSystemManagers:Dictionary = new Dictionary(true);

        public function SystemManager()
        {
            this.implMap = {};
            if (this.stage)
            {
                this.stage.scaleMode = StageScaleMode.NO_SCALE;
                this.stage.align = StageAlign.TOP_LEFT;
                this.stage.quality = StageQuality.HIGH;
            }
            if (SystemManagerGlobals.topLevelSystemManagers.length > 0 && !this.stage)
            {
                this.topLevel = false;
            }
            if (!this.stage)
            {
                this.isStageRoot = false;
            }
            if (this.topLevel)
            {
                SystemManagerGlobals.topLevelSystemManagers.push(this);
            }
            stop();
            if (root && root.loaderInfo)
            {
                root.loaderInfo.addEventListener(Event.INIT, this.initHandler);
            }
            return;
        }// end function

        private function deferredNextFrame() : void
        {
            if ((currentFrame + 1) > totalFrames)
            {
                return;
            }
            if ((currentFrame + 1) <= framesLoaded)
            {
                nextFrame();
            }
            else
            {
                this.nextFrameTimer = new Timer(100);
                this.nextFrameTimer.addEventListener(TimerEvent.TIMER, this.nextFrameTimerHandler);
                this.nextFrameTimer.start();
            }
            return;
        }// end function

        override public function get height() : Number
        {
            return this._height;
        }// end function

        override public function get stage() : Stage
        {
            var _loc_2:DisplayObject = null;
            if (this._stage)
            {
                return this._stage;
            }
            var _loc_1:* = super.stage;
            if (_loc_1)
            {
                this._stage = _loc_1;
                return _loc_1;
            }
            if (!this.topLevel && this._topLevelSystemManager)
            {
                this._stage = this._topLevelSystemManager.stage;
                return this._stage;
            }
            if (!this.isStageRoot && this.topLevel)
            {
                _loc_2 = this.getTopLevelRoot();
                if (_loc_2)
                {
                    this._stage = _loc_2.stage;
                    return this._stage;
                }
            }
            return null;
        }// end function

        override public function get width() : Number
        {
            return this._width;
        }// end function

        override public function get numChildren() : int
        {
            return this.noTopMostIndex - this.applicationIndex;
        }// end function

        public function get allowDomainsInNewRSLs() : Boolean
        {
            return this._allowDomainsInNewRSLs;
        }// end function

        public function set allowDomainsInNewRSLs(param1:Boolean) : void
        {
            this._allowDomainsInNewRSLs = param1;
            return;
        }// end function

        public function get allowInsecureDomainsInNewRSLs() : Boolean
        {
            return this._allowInsecureDomainsInNewRSLs;
        }// end function

        public function set allowInsecureDomainsInNewRSLs(param1:Boolean) : void
        {
            this._allowInsecureDomainsInNewRSLs = param1;
            return;
        }// end function

        public function get application() : IUIComponent
        {
            return IUIComponent(this._document);
        }// end function

        function get applicationIndex() : int
        {
            return this._applicationIndex;
        }// end function

        function set applicationIndex(param1:int) : void
        {
            this._applicationIndex = param1;
            return;
        }// end function

        public function get cursorChildren() : IChildList
        {
            if (!this.topLevel)
            {
                return this._topLevelSystemManager.cursorChildren;
            }
            if (!this._cursorChildren)
            {
                this._cursorChildren = new SystemChildrenList(this, new QName(mx_internal, "toolTipIndex"), new QName(mx_internal, "cursorIndex"));
            }
            return this._cursorChildren;
        }// end function

        function get cursorIndex() : int
        {
            return this._cursorIndex;
        }// end function

        function set cursorIndex(param1:int) : void
        {
            var _loc_2:* = param1 - this._cursorIndex;
            this._cursorIndex = param1;
            return;
        }// end function

        function get densityScale() : Number
        {
            var _loc_1:Number = NaN;
            var _loc_2:Number = NaN;
            if (isNaN(this._densityScale))
            {
                _loc_1 = this.info()["applicationDPI"];
                _loc_2 = DensityUtil.getRuntimeDPI();
                this._densityScale = DensityUtil.getDPIScale(_loc_1, _loc_2);
                if (isNaN(this._densityScale))
                {
                    this._densityScale = 1;
                }
            }
            return this._densityScale;
        }// end function

        public function get document() : Object
        {
            return this._document;
        }// end function

        public function set document(param1:Object) : void
        {
            this._document = param1;
            return;
        }// end function

        public function get embeddedFontList() : Object
        {
            var _loc_1:Object = null;
            var _loc_2:String = null;
            var _loc_3:Object = null;
            if (this._fontList == null)
            {
                this._fontList = {};
                _loc_1 = this.info()["fonts"];
                for (_loc_2 in _loc_1)
                {
                    
                    this._fontList[_loc_2] = _loc_1[_loc_2];
                }
                if (!this.topLevel && this._topLevelSystemManager)
                {
                    _loc_3 = this._topLevelSystemManager.embeddedFontList;
                    for (_loc_2 in _loc_3)
                    {
                        
                        this._fontList[_loc_2] = _loc_3[_loc_2];
                    }
                }
            }
            return this._fontList;
        }// end function

        public function get explicitHeight() : Number
        {
            return this._explicitHeight;
        }// end function

        public function set explicitHeight(param1:Number) : void
        {
            this._explicitHeight = param1;
            return;
        }// end function

        public function get explicitWidth() : Number
        {
            return this._explicitWidth;
        }// end function

        public function set explicitWidth(param1:Number) : void
        {
            this._explicitWidth = param1;
            return;
        }// end function

        public function get focusPane() : Sprite
        {
            return this._focusPane;
        }// end function

        public function set focusPane(param1:Sprite) : void
        {
            if (param1)
            {
                this.addChild(param1);
                param1.x = 0;
                param1.y = 0;
                param1.scrollRect = null;
                this._focusPane = param1;
            }
            else
            {
                this.removeChild(this._focusPane);
                this._focusPane = null;
            }
            return;
        }// end function

        public function get isProxy() : Boolean
        {
            return false;
        }// end function

        public function get measuredHeight() : Number
        {
            return this.topLevelWindow ? (this.topLevelWindow.getExplicitOrMeasuredHeight()) : (loaderInfo.height);
        }// end function

        public function get measuredWidth() : Number
        {
            return this.topLevelWindow ? (this.topLevelWindow.getExplicitOrMeasuredWidth()) : (loaderInfo.width);
        }// end function

        function get noTopMostIndex() : int
        {
            return this._noTopMostIndex;
        }// end function

        function set noTopMostIndex(param1:int) : void
        {
            var _loc_2:* = param1 - this._noTopMostIndex;
            this._noTopMostIndex = param1;
            this.topMostIndex = this.topMostIndex + _loc_2;
            return;
        }// end function

        final function get $numChildren() : int
        {
            return super.numChildren;
        }// end function

        public function get numModalWindows() : int
        {
            return this._numModalWindows;
        }// end function

        public function set numModalWindows(param1:int) : void
        {
            this._numModalWindows = param1;
            return;
        }// end function

        public function get preloadedRSLs() : Dictionary
        {
            return null;
        }// end function

        public function addPreloadedRSL(param1:LoaderInfo, param2:Vector.<RSLData>) : void
        {
            var _loc_3:RSLEvent = null;
            this.preloadedRSLs[param1] = param2;
            if (hasEventListener(RSLEvent.RSL_ADD_PRELOADED))
            {
                _loc_3 = new RSLEvent(RSLEvent.RSL_ADD_PRELOADED);
                _loc_3.loaderInfo = param1;
                dispatchEvent(_loc_3);
            }
            return;
        }// end function

        public function get preloaderBackgroundAlpha() : Number
        {
            return this.info()["backgroundAlpha"];
        }// end function

        public function get preloaderBackgroundColor() : uint
        {
            var _loc_1:* = this.info()["backgroundColor"];
            if (_loc_1 == undefined)
            {
                return 4294967295;
            }
            return _loc_1;
        }// end function

        public function get preloaderBackgroundImage() : Object
        {
            return this.info()["backgroundImage"];
        }// end function

        public function get preloaderBackgroundSize() : String
        {
            return this.info()["backgroundSize"];
        }// end function

        public function get popUpChildren() : IChildList
        {
            if (!this.topLevel)
            {
                return this._topLevelSystemManager.popUpChildren;
            }
            if (!this._popUpChildren)
            {
                this._popUpChildren = new SystemChildrenList(this, new QName(mx_internal, "noTopMostIndex"), new QName(mx_internal, "topMostIndex"));
            }
            return this._popUpChildren;
        }// end function

        public function get rawChildren() : IChildList
        {
            if (!this._rawChildren)
            {
                this._rawChildren = new SystemRawChildrenList(this);
            }
            return this._rawChildren;
        }// end function

        public function get screen() : Rectangle
        {
            if (!this._screen)
            {
                this.Stage_resizeHandler();
            }
            if (!this.isStageRoot)
            {
                this.Stage_resizeHandler();
            }
            return this._screen;
        }// end function

        public function get toolTipChildren() : IChildList
        {
            if (!this.topLevel)
            {
                return this._topLevelSystemManager.toolTipChildren;
            }
            if (!this._toolTipChildren)
            {
                this._toolTipChildren = new SystemChildrenList(this, new QName(mx_internal, "topMostIndex"), new QName(mx_internal, "toolTipIndex"));
            }
            return this._toolTipChildren;
        }// end function

        function get toolTipIndex() : int
        {
            return this._toolTipIndex;
        }// end function

        function set toolTipIndex(param1:int) : void
        {
            var _loc_2:* = param1 - this._toolTipIndex;
            this._toolTipIndex = param1;
            this.cursorIndex = this.cursorIndex + _loc_2;
            return;
        }// end function

        public function get topLevelSystemManager() : ISystemManager
        {
            if (this.topLevel)
            {
                return this;
            }
            return this._topLevelSystemManager;
        }// end function

        function get topMostIndex() : int
        {
            return this._topMostIndex;
        }// end function

        function set topMostIndex(param1:int) : void
        {
            var _loc_2:* = param1 - this._topMostIndex;
            this._topMostIndex = param1;
            this.toolTipIndex = this.toolTipIndex + _loc_2;
            return;
        }// end function

        final function $addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
        {
            super.addEventListener(param1, param2, param3, param4, param5);
            return;
        }// end function

        public function get childAllowsParent() : Boolean
        {
            try
            {
                return loaderInfo.childAllowsParent;
            }
            catch (error:Error)
            {
            }
            return false;
        }// end function

        public function get parentAllowsChild() : Boolean
        {
            try
            {
                return loaderInfo.parentAllowsChild;
            }
            catch (error:Error)
            {
            }
            return false;
        }// end function

        override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
        {
            var request:DynamicEvent;
            var type:* = param1;
            var listener:* = param2;
            var useCapture:* = param3;
            var priority:* = param4;
            var useWeakReference:* = param5;
            if (type == MouseEvent.MOUSE_MOVE || type == MouseEvent.MOUSE_UP || type == MouseEvent.MOUSE_DOWN || type == Event.ACTIVATE || type == Event.DEACTIVATE)
            {
                try
                {
                    if (this.stage)
                    {
                        this.stage.addEventListener(type, this.stageEventHandler, false, 0, true);
                    }
                }
                catch (error:SecurityError)
                {
                }
            }
            if (hasEventListener("addEventListener"))
            {
                request = new DynamicEvent("addEventListener", false, true);
                request.eventType = type;
                request.listener = listener;
                request.useCapture = useCapture;
                request.priority = priority;
                request.useWeakReference = useWeakReference;
                if (!dispatchEvent(request))
                {
                    return;
                }
            }
            if (type == SandboxMouseEvent.MOUSE_UP_SOMEWHERE)
            {
                try
                {
                    if (this.stage)
                    {
                        this.stage.addEventListener(Event.MOUSE_LEAVE, this.mouseLeaveHandler, false, 0, true);
                    }
                    else
                    {
                        super.addEventListener(Event.MOUSE_LEAVE, this.mouseLeaveHandler, false, 0, true);
                    }
                }
                catch (error:SecurityError)
                {
                    super.addEventListener(Event.MOUSE_LEAVE, mouseLeaveHandler, false, 0, true);
                }
            }
            if (type == FlexEvent.RENDER || type == FlexEvent.ENTER_FRAME)
            {
                if (type == FlexEvent.RENDER)
                {
                    type = Event.RENDER;
                }
                else
                {
                    type = Event.ENTER_FRAME;
                }
                try
                {
                    if (this.stage)
                    {
                        this.stage.addEventListener(type, listener, useCapture, priority, useWeakReference);
                    }
                    else
                    {
                        super.addEventListener(type, listener, useCapture, priority, useWeakReference);
                    }
                }
                catch (error:SecurityError)
                {
                    super.addEventListener(type, listener, useCapture, priority, useWeakReference);
                }
                if (this.stage && type == Event.RENDER)
                {
                    this.stage.invalidate();
                }
                return;
            }
            if (type == FlexEvent.IDLE && !this.idleTimer)
            {
                this.idleTimer = new Timer(IDLE_INTERVAL);
                this.idleTimer.addEventListener(TimerEvent.TIMER, this.idleTimer_timerHandler);
                this.idleTimer.start();
                this.addEventListener(MouseEvent.MOUSE_MOVE, this.mouseMoveHandler, true);
                this.addEventListener(MouseEvent.MOUSE_UP, this.mouseUpHandler, true);
            }
            super.addEventListener(type, listener, useCapture, priority, useWeakReference);
            return;
        }// end function

        final function $removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
        {
            super.removeEventListener(param1, param2, param3);
            return;
        }// end function

        override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
        {
            var _loc_4:DynamicEvent = null;
            if (hasEventListener("removeEventListener"))
            {
                _loc_4 = new DynamicEvent("removeEventListener", false, true);
                _loc_4.eventType = param1;
                _loc_4.listener = param2;
                _loc_4.useCapture = param3;
                if (!dispatchEvent(_loc_4))
                {
                    return;
                }
            }
            if (param1 == FlexEvent.RENDER || param1 == FlexEvent.ENTER_FRAME)
            {
                if (param1 == FlexEvent.RENDER)
                {
                    param1 = Event.RENDER;
                }
                else
                {
                    param1 = Event.ENTER_FRAME;
                }
                try
                {
                    if (this.stage)
                    {
                        this.stage.removeEventListener(param1, param2, param3);
                    }
                }
                catch (error:SecurityError)
                {
                }
                super.removeEventListener(param1, param2, param3);
                return;
            }
            if (param1 == FlexEvent.IDLE)
            {
                super.removeEventListener(param1, param2, param3);
                if (!hasEventListener(FlexEvent.IDLE) && this.idleTimer)
                {
                    this.idleTimer.stop();
                    this.idleTimer = null;
                    this.removeEventListener(MouseEvent.MOUSE_MOVE, this.mouseMoveHandler);
                    this.removeEventListener(MouseEvent.MOUSE_UP, this.mouseUpHandler);
                }
            }
            else
            {
                super.removeEventListener(param1, param2, param3);
            }
            if (param1 == MouseEvent.MOUSE_MOVE || param1 == MouseEvent.MOUSE_UP || param1 == MouseEvent.MOUSE_DOWN || param1 == Event.ACTIVATE || param1 == Event.DEACTIVATE)
            {
                if (!hasEventListener(param1))
                {
                    try
                    {
                        if (this.stage)
                        {
                            this.stage.removeEventListener(param1, this.stageEventHandler, false);
                        }
                    }
                    catch (error:SecurityError)
                    {
                    }
                }
            }
            if (param1 == SandboxMouseEvent.MOUSE_UP_SOMEWHERE)
            {
                if (!hasEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE))
                {
                    try
                    {
                        if (this.stage)
                        {
                            this.stage.removeEventListener(Event.MOUSE_LEAVE, this.mouseLeaveHandler);
                        }
                    }
                    catch (error:SecurityError)
                    {
                    }
                    super.removeEventListener(Event.MOUSE_LEAVE, this.mouseLeaveHandler);
                }
            }
            return;
        }// end function

        override public function addChild(param1:DisplayObject) : DisplayObject
        {
            var _loc_2:* = this.numChildren;
            if (param1.parent == this)
            {
                _loc_2 = _loc_2 - 1;
            }
            return this.addChildAt(param1, _loc_2);
        }// end function

        override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
        {
            var _loc_4:String = this;
            var _loc_5:* = this.noTopMostIndex + 1;
            _loc_4.noTopMostIndex = _loc_5;
            var _loc_3:* = param1.parent;
            if (_loc_3)
            {
                _loc_3.removeChild(param1);
            }
            return this.rawChildren_addChildAt(param1, this.applicationIndex + param2);
        }// end function

        final function $addChildAt(param1:DisplayObject, param2:int) : DisplayObject
        {
            return super.addChildAt(param1, param2);
        }// end function

        final function $removeChildAt(param1:int) : DisplayObject
        {
            return super.removeChildAt(param1);
        }// end function

        override public function removeChild(param1:DisplayObject) : DisplayObject
        {
            var _loc_2:String = this;
            var _loc_3:* = this.noTopMostIndex - 1;
            _loc_2.noTopMostIndex = _loc_3;
            return this.rawChildren_removeChild(param1);
        }// end function

        override public function removeChildAt(param1:int) : DisplayObject
        {
            var _loc_2:String = this;
            var _loc_3:* = this.noTopMostIndex - 1;
            _loc_2.noTopMostIndex = _loc_3;
            return this.rawChildren_removeChildAt(this.applicationIndex + param1);
        }// end function

        override public function getChildAt(param1:int) : DisplayObject
        {
            return super.getChildAt(this.applicationIndex + param1);
        }// end function

        override public function getChildByName(param1:String) : DisplayObject
        {
            return super.getChildByName(param1);
        }// end function

        override public function getChildIndex(param1:DisplayObject) : int
        {
            return super.getChildIndex(param1) - this.applicationIndex;
        }// end function

        override public function setChildIndex(param1:DisplayObject, param2:int) : void
        {
            super.setChildIndex(param1, this.applicationIndex + param2);
            return;
        }// end function

        override public function getObjectsUnderPoint(param1:Point) : Array
        {
            var _loc_5:DisplayObject = null;
            var _loc_6:Array = null;
            var _loc_2:Array = [];
            var _loc_3:* = this.topMostIndex;
            var _loc_4:int = 0;
            while (_loc_4 < _loc_3)
            {
                
                _loc_5 = super.getChildAt(_loc_4);
                if (_loc_5 is DisplayObjectContainer)
                {
                    _loc_6 = DisplayObjectContainer(_loc_5).getObjectsUnderPoint(param1);
                    if (_loc_6)
                    {
                        _loc_2 = _loc_2.concat(_loc_6);
                    }
                }
                _loc_4++;
            }
            return _loc_2;
        }// end function

        override public function contains(param1:DisplayObject) : Boolean
        {
            var _loc_2:int = 0;
            var _loc_3:int = 0;
            var _loc_4:DisplayObject = null;
            if (super.contains(param1))
            {
                if (param1.parent == this)
                {
                    _loc_2 = super.getChildIndex(param1);
                    if (_loc_2 < this.noTopMostIndex)
                    {
                        return true;
                    }
                }
                else
                {
                    _loc_3 = 0;
                    while (_loc_3 < this.noTopMostIndex)
                    {
                        
                        _loc_4 = super.getChildAt(_loc_3);
                        if (_loc_4 is IRawChildrenContainer)
                        {
                            if (IRawChildrenContainer(_loc_4).rawChildren.contains(param1))
                            {
                                return true;
                            }
                        }
                        if (_loc_4 is DisplayObjectContainer)
                        {
                            if (DisplayObjectContainer(_loc_4).contains(param1))
                            {
                                return true;
                            }
                        }
                        _loc_3++;
                    }
                }
            }
            return false;
        }// end function

        public function callInContext(param1:Function, param2:Object, param3:Array, param4:Boolean = true)
        {
            return undefined;
        }// end function

        public function create(... args) : Object
        {
            var _loc_4:String = null;
            var _loc_5:int = 0;
            var _loc_6:int = 0;
            args = this.info()["mainClassName"];
            if (args == null)
            {
                _loc_4 = loaderInfo.loaderURL;
                _loc_5 = _loc_4.lastIndexOf(".");
                _loc_6 = _loc_4.lastIndexOf("/");
                args = _loc_4.substring((_loc_6 + 1), _loc_5);
            }
            var _loc_3:* = Class(this.getDefinitionByName(args));
            return _loc_3 ? (new _loc_3) : (null);
        }// end function

        public function info() : Object
        {
            return {};
        }// end function

        function initialize() : void
        {
            var _loc_7:int = 0;
            var _loc_8:int = 0;
            var _loc_12:String = null;
            var _loc_13:Class = null;
            var _loc_14:Array = null;
            var _loc_15:Object = null;
            var _loc_16:RSLItem = null;
            var _loc_1:* = this.info()["runtimeDPIProvider"] as Class;
            if (_loc_1)
            {
                Singleton.registerClass("mx.core::RuntimeDPIProvider", _loc_1);
            }
            if (this.isStageRoot)
            {
                this.Stage_resizeHandler();
            }
            else
            {
                this._width = loaderInfo.width;
                this._height = loaderInfo.height;
            }
            this.preloader = new Preloader();
            this.preloader.addEventListener(FlexEvent.PRELOADER_DOC_FRAME_READY, this.preloader_preloaderDocFrameReadyHandler);
            this.preloader.addEventListener(Event.COMPLETE, this.preloader_completeHandler);
            this.preloader.addEventListener(FlexEvent.PRELOADER_DONE, this.preloader_preloaderDoneHandler);
            this.preloader.addEventListener(RSLEvent.RSL_COMPLETE, this.preloader_rslCompleteHandler);
            if (!this._popUpChildren)
            {
                this._popUpChildren = new SystemChildrenList(this, new QName(mx_internal, "noTopMostIndex"), new QName(mx_internal, "topMostIndex"));
            }
            this._popUpChildren.addChild(this.preloader);
            var _loc_2:* = this.info()["rsls"];
            var _loc_3:* = this.info()["cdRsls"];
            var _loc_4:Boolean = true;
            if (this.info()["usePreloader"] != undefined)
            {
                _loc_4 = this.info()["usePreloader"];
            }
            var _loc_5:* = this.info()["preloader"] as Class;
            var _loc_6:Array = [];
            if (_loc_3 && _loc_3.length > 0)
            {
                if (this.isTopLevel())
                {
                    this.rslDataList = _loc_3;
                }
                else
                {
                    this.rslDataList = LoaderUtil.processRequiredRSLs(this, _loc_3);
                }
                _loc_12 = LoaderUtil.normalizeURL(this.loaderInfo);
                _loc_13 = Class(this.getDefinitionByName("mx.core::CrossDomainRSLItem"));
                _loc_7 = this.rslDataList.length;
                _loc_8 = 0;
                while (_loc_8 < _loc_7)
                {
                    
                    _loc_14 = this.rslDataList[_loc_8];
                    _loc_15 = new _loc_13(_loc_14, _loc_12, this);
                    _loc_6.push(_loc_15);
                    _loc_8++;
                }
            }
            if (_loc_2 != null && _loc_2.length > 0)
            {
                if (this.rslDataList == null)
                {
                    this.rslDataList = [];
                }
                if (_loc_12 == null)
                {
                    _loc_12 = LoaderUtil.normalizeURL(this.loaderInfo);
                }
                _loc_7 = _loc_2.length;
                _loc_8 = 0;
                while (_loc_8 < _loc_7)
                {
                    
                    _loc_16 = new RSLItem(_loc_2[_loc_8].url, _loc_12, this);
                    _loc_6.push(_loc_16);
                    this.rslDataList.push([new RSLData(_loc_2[_loc_8].url, null, null, null, false, false, "current")]);
                    _loc_8++;
                }
            }
            var _loc_9:* = loaderInfo.parameters["resourceModuleURLs"];
            var _loc_10:* = loaderInfo.parameters["resourceModuleURLs"] ? (_loc_9.split(",")) : (null);
            var _loc_11:* = !this.topLevel && this.parent is Loader ? (Loader(this.parent).contentLoaderInfo.applicationDomain) : (this.info()["currentDomain"] as ApplicationDomain);
            this.preloader.initialize(_loc_4, _loc_5, this.preloaderBackgroundColor, this.preloaderBackgroundAlpha, this.preloaderBackgroundImage, this.preloaderBackgroundSize, this.isStageRoot ? (this.stage.stageWidth) : (loaderInfo.width), this.isStageRoot ? (this.stage.stageHeight) : (loaderInfo.height), null, null, _loc_6, _loc_10, _loc_11);
            return;
        }// end function

        function rawChildren_addChild(param1:DisplayObject) : DisplayObject
        {
            this.childManager.addingChild(param1);
            super.addChild(param1);
            this.childManager.childAdded(param1);
            return param1;
        }// end function

        function rawChildren_addChildAt(param1:DisplayObject, param2:int) : DisplayObject
        {
            if (this.childManager)
            {
                this.childManager.addingChild(param1);
            }
            super.addChildAt(param1, param2);
            if (this.childManager)
            {
                this.childManager.childAdded(param1);
            }
            return param1;
        }// end function

        function rawChildren_removeChild(param1:DisplayObject) : DisplayObject
        {
            this.childManager.removingChild(param1);
            super.removeChild(param1);
            this.childManager.childRemoved(param1);
            return param1;
        }// end function

        function rawChildren_removeChildAt(param1:int) : DisplayObject
        {
            var _loc_2:* = super.getChildAt(param1);
            this.childManager.removingChild(_loc_2);
            super.removeChildAt(param1);
            this.childManager.childRemoved(_loc_2);
            return _loc_2;
        }// end function

        function rawChildren_getChildAt(param1:int) : DisplayObject
        {
            return super.getChildAt(param1);
        }// end function

        function rawChildren_getChildByName(param1:String) : DisplayObject
        {
            return super.getChildByName(param1);
        }// end function

        function rawChildren_getChildIndex(param1:DisplayObject) : int
        {
            return super.getChildIndex(param1);
        }// end function

        function rawChildren_setChildIndex(param1:DisplayObject, param2:int) : void
        {
            super.setChildIndex(param1, param2);
            return;
        }// end function

        function rawChildren_getObjectsUnderPoint(param1:Point) : Array
        {
            return super.getObjectsUnderPoint(param1);
        }// end function

        function rawChildren_contains(param1:DisplayObject) : Boolean
        {
            return super.contains(param1);
        }// end function

        public function allowDomain(... args) : void
        {
            return;
        }// end function

        public function allowInsecureDomain(... args) : void
        {
            return;
        }// end function

        public function getExplicitOrMeasuredWidth() : Number
        {
            return !isNaN(this.explicitWidth) ? (this.explicitWidth) : (this.measuredWidth);
        }// end function

        public function getExplicitOrMeasuredHeight() : Number
        {
            return !isNaN(this.explicitHeight) ? (this.explicitHeight) : (this.measuredHeight);
        }// end function

        public function move(param1:Number, param2:Number) : void
        {
            return;
        }// end function

        public function setActualSize(param1:Number, param2:Number) : void
        {
            if (this.isStageRoot)
            {
                return;
            }
            if (this.mouseCatcher)
            {
                this.mouseCatcher.width = param1;
                this.mouseCatcher.height = param2;
            }
            if (this._width != param1 || this._height != param2)
            {
                this._width = param1;
                this._height = param2;
                dispatchEvent(new Event(Event.RESIZE));
            }
            return;
        }// end function

        public function getDefinitionByName(param1:String) : Object
        {
            var _loc_3:Object = null;
            var _loc_2:* = !this.topLevel && this.parent is Loader ? (Loader(this.parent).contentLoaderInfo.applicationDomain) : (this.info()["currentDomain"] as ApplicationDomain);
            if (_loc_2.hasDefinition(param1))
            {
                _loc_3 = _loc_2.getDefinition(param1);
            }
            return _loc_3;
        }// end function

        public function isTopLevel() : Boolean
        {
            return this.topLevel;
        }// end function

        public function isTopLevelRoot() : Boolean
        {
            return this.isStageRoot || this.isBootstrapRoot;
        }// end function

        public function isTopLevelWindow(param1:DisplayObject) : Boolean
        {
            return param1 is IUIComponent && IUIComponent(param1) == this.topLevelWindow;
        }// end function

        public function isFontFaceEmbedded(param1:TextFormat) : Boolean
        {
            var _loc_9:Font = null;
            var _loc_10:String = null;
            var _loc_2:* = param1.font;
            var _loc_3:* = param1.bold;
            var _loc_4:* = param1.italic;
            var _loc_5:* = Font.enumerateFonts();
            var _loc_6:* = Font.enumerateFonts().length;
            var _loc_7:int = 0;
            while (_loc_7 < _loc_6)
            {
                
                _loc_9 = Font(_loc_5[_loc_7]);
                if (_loc_9.fontName == _loc_2)
                {
                    _loc_10 = "regular";
                    if (_loc_3 && _loc_4)
                    {
                        _loc_10 = "boldItalic";
                    }
                    else if (_loc_3)
                    {
                        _loc_10 = "bold";
                    }
                    else if (_loc_4)
                    {
                        _loc_10 = "italic";
                    }
                    if (_loc_9.fontStyle == _loc_10)
                    {
                        return true;
                    }
                }
                _loc_7++;
            }
            if (!_loc_2 || !this.embeddedFontList || !this.embeddedFontList[_loc_2])
            {
                return false;
            }
            var _loc_8:* = this.embeddedFontList[_loc_2];
            return !(_loc_3 && !_loc_8.bold || _loc_4 && !_loc_8.italic || !_loc_3 && !_loc_4 && !_loc_8.regular);
        }// end function

        private function resizeMouseCatcher() : void
        {
            var _loc_1:Graphics = null;
            var _loc_2:Rectangle = null;
            if (this.mouseCatcher)
            {
                try
                {
                    _loc_1 = this.mouseCatcher.graphics;
                    _loc_2 = this.screen;
                    _loc_1.clear();
                    _loc_1.beginFill(0, 0);
                    _loc_1.drawRect(0, 0, _loc_2.width, _loc_2.height);
                    _loc_1.endFill();
                }
                catch (e:SecurityError)
                {
                }
            }
            return;
        }// end function

        private function initHandler(event:Event) : void
        {
            if (!this.isStageRoot)
            {
                if (root.loaderInfo.parentAllowsChild)
                {
                    try
                    {
                        if (!this.parent.dispatchEvent(new Event("mx.managers.SystemManager.isBootstrapRoot", false, true)) || !root.loaderInfo.sharedEvents.hasEventListener("bridgeNewApplication"))
                        {
                            this.isBootstrapRoot = true;
                        }
                    }
                    catch (e:Error)
                    {
                    }
                }
            }
            allSystemManagers[this] = this.loaderInfo.url;
            root.loaderInfo.removeEventListener(Event.INIT, this.initHandler);
            if (!SystemManagerGlobals.info)
            {
                SystemManagerGlobals.info = this.info();
            }
            if (!SystemManagerGlobals.parameters)
            {
                SystemManagerGlobals.parameters = loaderInfo.parameters;
            }
            var _loc_2:* = totalFrames == 1 ? (0) : (1);
            this.addEventListener(Event.ENTER_FRAME, this.docFrameListener);
            this.initialize();
            return;
        }// end function

        private function docFrameListener(event:Event) : void
        {
            if (currentFrame == 2)
            {
                this.removeEventListener(Event.ENTER_FRAME, this.docFrameListener);
                if (totalFrames > 2)
                {
                    this.addEventListener(Event.ENTER_FRAME, this.extraFrameListener);
                }
                this.docFrameHandler();
            }
            return;
        }// end function

        private function extraFrameListener(event:Event) : void
        {
            if (this.lastFrame == currentFrame)
            {
                return;
            }
            this.lastFrame = currentFrame;
            if ((currentFrame + 1) > totalFrames)
            {
                this.removeEventListener(Event.ENTER_FRAME, this.extraFrameListener);
            }
            this.extraFrameHandler();
            return;
        }// end function

        private function preloader_preloaderDocFrameReadyHandler(event:Event) : void
        {
            this.preloader.removeEventListener(FlexEvent.PRELOADER_DOC_FRAME_READY, this.preloader_preloaderDocFrameReadyHandler);
            this.deferredNextFrame();
            return;
        }// end function

        private function preloader_preloaderDoneHandler(event:Event) : void
        {
            var _loc_2:* = this.topLevelWindow;
            this.preloader.removeEventListener(FlexEvent.PRELOADER_DONE, this.preloader_preloaderDoneHandler);
            this.preloader.removeEventListener(RSLEvent.RSL_COMPLETE, this.preloader_rslCompleteHandler);
            this._popUpChildren.removeChild(this.preloader);
            this.preloader = null;
            this.mouseCatcher = new FlexSprite();
            this.mouseCatcher.name = "mouseCatcher";
            var _loc_3:String = this;
            var _loc_4:* = this.noTopMostIndex + 1;
            _loc_3.noTopMostIndex = _loc_4;
            super.addChildAt(this.mouseCatcher, 0);
            this.resizeMouseCatcher();
            if (!this.topLevel)
            {
                this.mouseCatcher.visible = false;
                mask = this.mouseCatcher;
            }
            var _loc_3:String = this;
            var _loc_4:* = this.noTopMostIndex + 1;
            _loc_3.noTopMostIndex = _loc_4;
            super.addChildAt(DisplayObject(_loc_2), 1);
            _loc_2.dispatchEvent(new FlexEvent(FlexEvent.APPLICATION_COMPLETE));
            dispatchEvent(new FlexEvent(FlexEvent.APPLICATION_COMPLETE));
            return;
        }// end function

        private function preloader_rslCompleteHandler(event:RSLEvent) : void
        {
            var _loc_2:Vector.<RSLData> = null;
            var _loc_3:IFlexModuleFactory = null;
            if (!event.isResourceModule && event.loaderInfo)
            {
                _loc_2 = this.Vector.<RSLData>(this.rslDataList[event.rslIndex]);
                _loc_3 = this;
                if (_loc_2 && _loc_2[0].moduleFactory)
                {
                    _loc_3 = _loc_2[0].moduleFactory;
                }
                if (_loc_3 == this)
                {
                    this.preloadedRSLs[event.loaderInfo] = _loc_2;
                }
                else
                {
                    _loc_3.addPreloadedRSL(event.loaderInfo, _loc_2);
                }
            }
            return;
        }// end function

        function docFrameHandler(event:Event = null) : void
        {
            if (this.readyForKickOff)
            {
                this.kickOff();
            }
            return;
        }// end function

        function preloader_completeHandler(event:Event) : void
        {
            this.preloader.removeEventListener(Event.COMPLETE, this.preloader_completeHandler);
            this.readyForKickOff = true;
            if (currentFrame >= 2)
            {
                this.kickOff();
            }
            return;
        }// end function

        function kickOff() : void
        {
            var _loc_5:int = 0;
            var _loc_6:int = 0;
            var _loc_7:Class = null;
            if (this.document)
            {
                return;
            }
            if (!this.isTopLevel())
            {
                SystemManagerGlobals.topLevelSystemManagers[0].dispatchEvent(new FocusEvent(FlexEvent.NEW_CHILD_APPLICATION, false, false, this));
            }
            Singleton.registerClass("mx.core::IEmbeddedFontRegistry", Class(this.getDefinitionByName("mx.core::EmbeddedFontRegistry")));
            Singleton.registerClass("mx.styles::IStyleManager", Class(this.getDefinitionByName("mx.styles::StyleManagerImpl")));
            Singleton.registerClass("mx.styles::IStyleManager2", Class(this.getDefinitionByName("mx.styles::StyleManagerImpl")));
            Singleton.registerClass("mx.managers::IBrowserManager", Class(this.getDefinitionByName("mx.managers::BrowserManagerImpl")));
            Singleton.registerClass("mx.managers::ICursorManager", Class(this.getDefinitionByName("mx.managers::CursorManagerImpl")));
            Singleton.registerClass("mx.managers::IHistoryManager", Class(this.getDefinitionByName("mx.managers::HistoryManagerImpl")));
            Singleton.registerClass("mx.managers::ILayoutManager", Class(this.getDefinitionByName("mx.managers::LayoutManager")));
            Singleton.registerClass("mx.managers::IPopUpManager", Class(this.getDefinitionByName("mx.managers::PopUpManagerImpl")));
            Singleton.registerClass("mx.managers::IToolTipManager2", Class(this.getDefinitionByName("mx.managers::ToolTipManagerImpl")));
            var _loc_1:Class = null;
            var _loc_2:* = this.info()["useNativeDragManager"];
            var _loc_3:* = _loc_2 == null ? (true) : (String(_loc_2) == "true");
            if (_loc_3)
            {
                _loc_1 = Class(this.getDefinitionByName("mx.managers::NativeDragManagerImpl"));
            }
            if (_loc_1 == null)
            {
                _loc_1 = Class(this.getDefinitionByName("mx.managers::DragManagerImpl"));
            }
            Singleton.registerClass("mx.managers::IDragManager", _loc_1);
            Singleton.registerClass("mx.core::ITextFieldFactory", Class(this.getDefinitionByName("mx.core::TextFieldFactory")));
            var _loc_4:* = this.info()["mixins"];
            if (this.info()["mixins"] && _loc_4.length > 0)
            {
                _loc_5 = _loc_4.length;
                _loc_6 = 0;
                while (_loc_6 < _loc_5)
                {
                    
                    _loc_7 = Class(this.getDefinitionByName(_loc_4[_loc_6]));
                    var _loc_8:* = _loc_7;
                    _loc_8._loc_7["init"](this);
                    _loc_6++;
                }
            }
            _loc_7 = Singleton.getClass("mx.managers::IActiveWindowManager");
            if (_loc_7)
            {
                this.registerImplementation("mx.managers::IActiveWindowManager", new _loc_7(this));
            }
            _loc_7 = Singleton.getClass("mx.managers::IMarshalSystemManager");
            if (_loc_7)
            {
                this.registerImplementation("mx.managers::IMarshalSystemManager", new _loc_7(this));
            }
            this.initializeTopLevelWindow(null);
            this.deferredNextFrame();
            return;
        }// end function

        private function keyDownHandler(event:KeyboardEvent) : void
        {
            var _loc_2:KeyboardEvent = null;
            if (!event.cancelable)
            {
                switch(event.keyCode)
                {
                    case Keyboard.UP:
                    case Keyboard.DOWN:
                    case Keyboard.PAGE_UP:
                    case Keyboard.PAGE_DOWN:
                    case Keyboard.HOME:
                    case Keyboard.END:
                    case Keyboard.LEFT:
                    case Keyboard.RIGHT:
                    case Keyboard.ENTER:
                    {
                        event.stopImmediatePropagation();
                        _loc_2 = new KeyboardEvent(event.type, event.bubbles, true, event.charCode, event.keyCode, event.keyLocation, event.ctrlKey, event.altKey, event.shiftKey);
                        event.target.dispatchEvent(_loc_2);
                    }
                    default:
                    {
                        break;
                    }
                }
            }
            return;
        }// end function

        private function mouseEventHandler(event:MouseEvent) : void
        {
            var _loc_2:MouseEvent = null;
            var _loc_3:Class = null;
            if (!event.cancelable && event.eventPhase != EventPhase.BUBBLING_PHASE)
            {
                event.stopImmediatePropagation();
                _loc_2 = null;
                if ("clickCount" in event)
                {
                    _loc_3 = MouseEvent;
                    _loc_2 = new _loc_3(event.type, event.bubbles, true, event.localX, event.localY, event.relatedObject, event.ctrlKey, event.altKey, event.shiftKey, event.buttonDown, event.delta, event["commandKey"], event["controlKey"], event["clickCount"]);
                }
                else
                {
                    _loc_2 = new MouseEvent(event.type, event.bubbles, true, event.localX, event.localY, event.relatedObject, event.ctrlKey, event.altKey, event.shiftKey, event.buttonDown, event.delta);
                }
                event.target.dispatchEvent(_loc_2);
            }
            return;
        }// end function

        private function extraFrameHandler(event:Event = null) : void
        {
            var _loc_3:Class = null;
            var _loc_2:* = this.info()["frames"];
            if (_loc_2 && _loc_2[currentLabel])
            {
                _loc_3 = Class(this.getDefinitionByName(_loc_2[currentLabel]));
                var _loc_4:* = _loc_3;
                _loc_4._loc_3["frame"](this);
            }
            this.deferredNextFrame();
            return;
        }// end function

        private function nextFrameTimerHandler(event:TimerEvent) : void
        {
            if ((currentFrame + 1) <= framesLoaded)
            {
                nextFrame();
                this.nextFrameTimer.removeEventListener(TimerEvent.TIMER, this.nextFrameTimerHandler);
                this.nextFrameTimer.reset();
            }
            return;
        }// end function

        private function initializeTopLevelWindow(event:Event) : void
        {
            var _loc_2:Number = NaN;
            var _loc_3:Number = NaN;
            var _loc_4:DisplayObjectContainer = null;
            var _loc_5:ISystemManager = null;
            var _loc_6:DisplayObject = null;
            if (this.getSandboxRoot() == this)
            {
                this.addEventListener(KeyboardEvent.KEY_DOWN, this.keyDownHandler, true, 1000);
                this.addEventListener(MouseEvent.MOUSE_WHEEL, this.mouseEventHandler, true, 1000);
                this.addEventListener(MouseEvent.MOUSE_DOWN, this.mouseEventHandler, true, 1000);
            }
            if (this.isTopLevelRoot() && this.stage)
            {
                this.stage.addEventListener(KeyboardEvent.KEY_DOWN, this.keyDownHandler, false, 1000);
                this.stage.addEventListener(MouseEvent.MOUSE_WHEEL, this.mouseEventHandler, false, 1000);
                this.stage.addEventListener(MouseEvent.MOUSE_DOWN, this.mouseEventHandler, false, 1000);
            }
            if (!this.parent && this.parentAllowsChild)
            {
                return;
            }
            if (!this.topLevel)
            {
                if (!this.parent)
                {
                    return;
                }
                _loc_4 = this.parent.parent;
                if (!_loc_4)
                {
                    return;
                }
                while (_loc_4)
                {
                    
                    if (_loc_4 is IUIComponent)
                    {
                        _loc_5 = IUIComponent(_loc_4).systemManager;
                        if (_loc_5 && !_loc_5.isTopLevel())
                        {
                            _loc_5 = _loc_5.topLevelSystemManager;
                        }
                        this._topLevelSystemManager = _loc_5;
                        break;
                    }
                    _loc_4 = _loc_4.parent;
                }
            }
            if (this.isTopLevelRoot() && this.stage)
            {
                this.stage.addEventListener(Event.RESIZE, this.Stage_resizeHandler, false, 0, true);
            }
            else if (this.topLevel && this.stage)
            {
                _loc_6 = this.getSandboxRoot();
                if (_loc_6 != this)
                {
                    _loc_6.addEventListener(Event.RESIZE, this.Stage_resizeHandler, false, 0, true);
                }
            }
            if (this.isStageRoot && this.stage)
            {
                this.Stage_resizeHandler();
                if (this._width == 0 && this._height == 0 && loaderInfo.width != this._width && loaderInfo.height != this._height)
                {
                    this._width = loaderInfo.width;
                    this._height = loaderInfo.height;
                }
                _loc_2 = this._width;
                _loc_3 = this._height;
            }
            else
            {
                _loc_2 = loaderInfo.width;
                _loc_3 = loaderInfo.height;
            }
            this.childManager.initializeTopLevelWindow(_loc_2, _loc_3);
            return;
        }// end function

        private function appCreationCompleteHandler(event:FlexEvent) : void
        {
            this.invalidateParentSizeAndDisplayList();
            return;
        }// end function

        public function invalidateParentSizeAndDisplayList() : void
        {
            var _loc_1:DisplayObjectContainer = null;
            if (!this.topLevel && this.parent)
            {
                _loc_1 = this.parent.parent;
                while (_loc_1)
                {
                    
                    if (_loc_1 is IInvalidating)
                    {
                        IInvalidating(_loc_1).invalidateSize();
                        IInvalidating(_loc_1).invalidateDisplayList();
                        return;
                    }
                    _loc_1 = _loc_1.parent;
                }
            }
            dispatchEvent(new Event("invalidateParentSizeAndDisplayList"));
            return;
        }// end function

        private function Stage_resizeHandler(event:Event = null) : void
        {
            var m:Number;
            var n:Number;
            var scale:Number;
            var event:* = event;
            if (this.isDispatchingResizeEvent)
            {
                return;
            }
            var w:Number;
            var h:Number;
            try
            {
                m = loaderInfo.width;
                n = loaderInfo.height;
            }
            catch (error:Error)
            {
                if (!_screen)
                {
                    _screen = new Rectangle();
                }
                return;
            }
            var align:* = StageAlign.TOP_LEFT;
            try
            {
                if (this.stage)
                {
                    w = this.stage.stageWidth;
                    h = this.stage.stageHeight;
                    align = this.stage.align;
                }
            }
            catch (error:SecurityError)
            {
                if (hasEventListener("getScreen"))
                {
                    dispatchEvent(new Event("getScreen"));
                    if (_screen)
                    {
                        w = _screen.width;
                        h = _screen.height;
                    }
                }
            }
            var x:* = (m - w) / 2;
            var y:* = (n - h) / 2;
            if (align == StageAlign.TOP)
            {
                y;
            }
            else if (align == StageAlign.BOTTOM)
            {
                y = n - h;
            }
            else if (align == StageAlign.LEFT)
            {
                x;
            }
            else if (align == StageAlign.RIGHT)
            {
                x = m - w;
            }
            else if (align == StageAlign.TOP_LEFT || align == "LT")
            {
                y;
                x;
            }
            else if (align == StageAlign.TOP_RIGHT)
            {
                y;
                x = m - w;
            }
            else if (align == StageAlign.BOTTOM_LEFT)
            {
                y = n - h;
                x;
            }
            else if (align == StageAlign.BOTTOM_RIGHT)
            {
                y = n - h;
                x = m - w;
            }
            if (!this._screen)
            {
                this._screen = new Rectangle();
            }
            this._screen.x = x;
            this._screen.y = y;
            this._screen.width = w;
            this._screen.height = h;
            if (this.isStageRoot)
            {
                scale = this.densityScale;
                var _loc_3:* = scale;
                root.scaleY = scale;
                root.scaleX = _loc_3;
                this._width = this.stage.stageWidth / scale;
                this._height = this.stage.stageHeight / scale;
                this._screen.x = this._screen.x / scale;
                this._screen.y = this._screen.y / scale;
                this._screen.width = this._screen.width / scale;
                this._screen.height = this._screen.height / scale;
            }
            if (event)
            {
                this.resizeMouseCatcher();
                this.isDispatchingResizeEvent = true;
                dispatchEvent(event);
                this.isDispatchingResizeEvent = false;
            }
            return;
        }// end function

        private function mouseMoveHandler(event:MouseEvent) : void
        {
            this.idleCounter = 0;
            return;
        }// end function

        private function mouseUpHandler(event:MouseEvent) : void
        {
            this.idleCounter = 0;
            return;
        }// end function

        private function idleTimer_timerHandler(event:TimerEvent) : void
        {
            var _loc_2:String = this;
            var _loc_3:* = this.idleCounter + 1;
            _loc_2.idleCounter = _loc_3;
            if (this.idleCounter * IDLE_INTERVAL > IDLE_THRESHOLD)
            {
                dispatchEvent(new FlexEvent(FlexEvent.IDLE));
            }
            return;
        }// end function

        override public function get mouseX() : Number
        {
            if (this._mouseX === undefined)
            {
                return super.mouseX;
            }
            return this._mouseX;
        }// end function

        override public function get mouseY() : Number
        {
            if (this._mouseY === undefined)
            {
                return super.mouseY;
            }
            return this._mouseY;
        }// end function

        private function getTopLevelSystemManager(param1:DisplayObject) : ISystemManager
        {
            var _loc_3:ISystemManager = null;
            var _loc_2:* = DisplayObjectContainer(param1.root);
            if ((!_loc_2 || _loc_2 is Stage) && param1 is IUIComponent)
            {
                _loc_2 = DisplayObjectContainer(IUIComponent(param1).systemManager);
            }
            if (_loc_2 is ISystemManager)
            {
                _loc_3 = ISystemManager(_loc_2);
                if (!_loc_3.isTopLevel())
                {
                    _loc_3 = _loc_3.topLevelSystemManager;
                }
            }
            return _loc_3;
        }// end function

        override public function get parent() : DisplayObjectContainer
        {
            try
            {
                return super.parent;
            }
            catch (e:SecurityError)
            {
            }
            return null;
        }// end function

        public function getTopLevelRoot() : DisplayObject
        {
            var _loc_1:ISystemManager = null;
            var _loc_2:DisplayObject = null;
            var _loc_3:DisplayObject = null;
            try
            {
                _loc_1 = this;
                if (_loc_1.topLevelSystemManager)
                {
                    _loc_1 = _loc_1.topLevelSystemManager;
                }
                _loc_2 = DisplayObject(_loc_1).parent;
                _loc_3 = DisplayObject(_loc_1);
                while (_loc_2)
                {
                    
                    if (_loc_2 is Stage)
                    {
                        return _loc_3;
                    }
                    _loc_3 = _loc_2;
                    _loc_2 = _loc_2.parent;
                }
            }
            catch (error:SecurityError)
            {
            }
            return null;
        }// end function

        public function getSandboxRoot() : DisplayObject
        {
            var _loc_2:DisplayObject = null;
            var _loc_3:DisplayObject = null;
            var _loc_4:Loader = null;
            var _loc_5:LoaderInfo = null;
            var _loc_1:ISystemManager = this;
            try
            {
                if (_loc_1.topLevelSystemManager)
                {
                    _loc_1 = _loc_1.topLevelSystemManager;
                }
                _loc_2 = DisplayObject(_loc_1).parent;
                if (_loc_2 is Stage)
                {
                    return DisplayObject(_loc_1);
                }
                if (_loc_2 && !_loc_2.dispatchEvent(new Event("mx.managers.SystemManager.isBootstrapRoot", false, true)))
                {
                    return this;
                }
                _loc_3 = this;
                while (_loc_2)
                {
                    
                    if (_loc_2 is Stage)
                    {
                        return _loc_3;
                    }
                    if (!_loc_2.dispatchEvent(new Event("mx.managers.SystemManager.isBootstrapRoot", false, true)))
                    {
                        return _loc_3;
                    }
                    if (_loc_2 is Loader)
                    {
                        _loc_4 = Loader(_loc_2);
                        _loc_5 = _loc_4.contentLoaderInfo;
                        if (!_loc_5.childAllowsParent)
                        {
                            return _loc_5.content;
                        }
                    }
                    if (_loc_2.hasEventListener("systemManagerRequest"))
                    {
                        _loc_3 = _loc_2;
                    }
                    _loc_2 = _loc_2.parent;
                }
            }
            catch (error:Error)
            {
            }
            return _loc_3 != null ? (_loc_3) : (DisplayObject(_loc_1));
        }// end function

        public function registerImplementation(param1:String, param2:Object) : void
        {
            var _loc_3:* = this.implMap[param1];
            if (!_loc_3)
            {
                this.implMap[param1] = param2;
            }
            return;
        }// end function

        public function getImplementation(param1:String) : Object
        {
            var _loc_2:* = this.implMap[param1];
            return _loc_2;
        }// end function

        public function getVisibleApplicationRect(param1:Rectangle = null, param2:Boolean = false) : Rectangle
        {
            var _loc_3:Request = null;
            var _loc_4:DisplayObject = null;
            var _loc_5:Rectangle = null;
            var _loc_6:Point = null;
            var _loc_7:Rectangle = null;
            var _loc_8:DisplayObjectContainer = null;
            var _loc_9:Rectangle = null;
            if (hasEventListener("getVisibleApplicationRect"))
            {
                _loc_3 = new Request("getVisibleApplicationRect", false, true);
                _loc_3.value = {bounds:param1, skipToSandboxRoot:param2};
                if (!dispatchEvent(_loc_3))
                {
                    return Rectangle(_loc_3.value);
                }
            }
            if (param2 && !this.topLevel)
            {
                return this.topLevelSystemManager.getVisibleApplicationRect(param1, param2);
            }
            if (!param1)
            {
                param1 = getBounds(DisplayObject(this));
                _loc_4 = this.getSandboxRoot();
                _loc_5 = this.screen.clone();
                _loc_5.topLeft = _loc_4.localToGlobal(this.screen.topLeft);
                _loc_5.bottomRight = _loc_4.localToGlobal(this.screen.bottomRight);
                _loc_6 = new Point(Math.max(0, param1.x), Math.max(0, param1.y));
                _loc_6 = localToGlobal(_loc_6);
                param1.x = _loc_6.x;
                param1.y = _loc_6.y;
                param1.width = _loc_5.width;
                param1.height = _loc_5.height;
                _loc_7 = this.stage.softKeyboardRect;
                param1.height = param1.height - _loc_7.height;
            }
            if (!this.topLevel)
            {
                _loc_8 = this.parent.parent;
                if ("getVisibleApplicationRect" in _loc_8)
                {
                    var _loc_10:* = _loc_8;
                    _loc_9 = _loc_10._loc_8["getVisibleApplicationRect"](true);
                    param1 = param1.intersection(_loc_9);
                }
            }
            return param1;
        }// end function

        public function deployMouseShields(param1:Boolean) : void
        {
            var _loc_2:DynamicEvent = null;
            if (hasEventListener("deployMouseShields"))
            {
                _loc_2 = new DynamicEvent("deployMouseShields");
                _loc_2.deploy = param1;
                dispatchEvent(_loc_2);
            }
            return;
        }// end function

        private function stageEventHandler(event:Event) : void
        {
            var _loc_2:MouseEvent = null;
            var _loc_3:Point = null;
            var _loc_4:Point = null;
            if (event.target is Stage && this.mouseCatcher)
            {
                if (event is MouseEvent)
                {
                    _loc_2 = MouseEvent(event);
                    _loc_3 = new Point(_loc_2.stageX, _loc_2.stageY);
                    _loc_4 = this.mouseCatcher.globalToLocal(_loc_3);
                    _loc_2.localX = _loc_4.x;
                    _loc_2.localY = _loc_4.y;
                }
                this.mouseCatcher.dispatchEvent(event);
            }
            return;
        }// end function

        private function mouseLeaveHandler(event:Event) : void
        {
            dispatchEvent(new SandboxMouseEvent(SandboxMouseEvent.MOUSE_UP_SOMEWHERE));
            return;
        }// end function

        public static function getSWFRoot(param1:Object) : DisplayObject
        {
            var _loc_3:* = undefined;
            var _loc_4:ISystemManager = null;
            var _loc_5:ApplicationDomain = null;
            var _loc_6:Class = null;
            var _loc_2:* = getQualifiedClassName(param1);
            var _loc_7:int = 0;
            var _loc_8:* = allSystemManagers;
            do
            {
                
                _loc_3 = _loc_8[_loc_7];
                _loc_4 = _loc_3 as ISystemManager;
                _loc_5 = _loc_4.loaderInfo.applicationDomain;
                try
                {
                    _loc_6 = Class(_loc_5.getDefinition(_loc_2));
                    if (param1 is _loc_6)
                    {
                        return _loc_4 as DisplayObject;
                    }
                }
                catch (e:Error)
                {
                }
            }while (_loc_8 in _loc_7)
            return null;
        }// end function

        private static function getChildListIndex(param1:IChildList, param2:Object) : int
        {
            var _loc_3:int = -1;
            try
            {
                _loc_3 = param1.getChildIndex(DisplayObject(param2));
            }
            catch (e:ArgumentError)
            {
            }
            return _loc_3;
        }// end function

    }
}
