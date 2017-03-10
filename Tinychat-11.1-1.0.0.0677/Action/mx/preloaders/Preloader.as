package mx.preloaders
{
    import flash.display.*;
    import flash.events.*;
    import flash.system.*;
    import flash.utils.*;
    import mx.core.*;
    import mx.events.*;

    public class Preloader extends Sprite
    {
        private var displayClass:IPreloaderDisplay = null;
        private var timer:Timer;
        private var showDisplay:Boolean;
        private var rslListLoader:RSLListLoader;
        private var resourceModuleListLoader:RSLListLoader;
        private var rslDone:Boolean = false;
        private var loadingRSLs:Boolean = false;
        private var waitingToLoadResourceModules:Boolean = false;
        private var sentDocFrameReady:Boolean = false;
        private var app:IEventDispatcher = null;
        private var applicationDomain:ApplicationDomain = null;
        private var waitedAFrame:Boolean = false;
        static const VERSION:String = "4.6.0.23201";

        public function Preloader()
        {
            return;
        }// end function

        public function initialize(param1:Boolean, param2:Class, param3:uint, param4:Number, param5:Object, param6:String, param7:Number, param8:Number, param9:Array = null, param10:Array = null, param11:Array = null, param12:Array = null, param13:ApplicationDomain = null) : void
        {
            var _loc_14:int = 0;
            var _loc_15:int = 0;
            var _loc_17:RSLItem = null;
            var _loc_18:ResourceModuleRSLItem = null;
            if ((param9 != null || param10 != null) && param11 != null)
            {
                throw new Error("RSLs may only be specified by using libs and sizes or rslList, not both.");
            }
            this.applicationDomain = param13;
            root.loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.ioErrorHandler);
            if (param9 && param9.length > 0)
            {
                if (param11 == null)
                {
                    param11 = [];
                }
                _loc_14 = param9.length;
                _loc_15 = 0;
                while (_loc_15 < _loc_14)
                {
                    
                    _loc_17 = new RSLItem(param9[_loc_15]);
                    param11.push(_loc_17);
                    _loc_15++;
                }
            }
            var _loc_16:Array = [];
            if (param12 && param12.length > 0)
            {
                _loc_14 = param12.length;
                _loc_15 = 0;
                while (_loc_15 < _loc_14)
                {
                    
                    _loc_18 = new ResourceModuleRSLItem(param12[_loc_15], param13);
                    _loc_16.push(_loc_18);
                    _loc_15++;
                }
            }
            this.rslListLoader = new RSLListLoader(param11);
            if (_loc_16.length)
            {
                this.resourceModuleListLoader = new RSLListLoader(_loc_16);
            }
            this.showDisplay = param1;
            this.timer = new Timer(10);
            this.timer.addEventListener(TimerEvent.TIMER, this.timerHandler);
            this.timer.start();
            if (param1)
            {
                this.displayClass = new param2;
                this.displayClass.addEventListener(Event.COMPLETE, this.displayClassCompleteHandler);
                addChild(DisplayObject(this.displayClass));
                this.displayClass.backgroundColor = param3;
                this.displayClass.backgroundAlpha = param4;
                this.displayClass.backgroundImage = param5;
                this.displayClass.backgroundSize = param6;
                this.displayClass.stageWidth = param7;
                this.displayClass.stageHeight = param8;
                this.displayClass.initialize();
                this.displayClass.preloader = this;
                this.addEventListener(Event.ENTER_FRAME, this.waitAFrame);
            }
            if (this.rslListLoader.getItemCount() > 0)
            {
                this.rslListLoader.load(this.rslProgressHandler, this.rslCompleteHandler, this.rslErrorHandler, this.rslErrorHandler, this.rslErrorHandler);
                this.loadingRSLs = true;
            }
            else if (this.resourceModuleListLoader && this.resourceModuleListLoader.getItemCount() > 0)
            {
                if (param13.hasDefinition("mx.resources::ResourceManager"))
                {
                    this.rslListLoader = this.resourceModuleListLoader;
                    this.rslListLoader.load(this.rslProgressHandler, this.rslCompleteHandler, this.rslErrorHandler, this.rslErrorHandler, this.rslErrorHandler);
                }
                else
                {
                    this.waitingToLoadResourceModules = true;
                    this.rslDone = true;
                }
            }
            else
            {
                this.rslDone = true;
            }
            return;
        }// end function

        public function registerApplication(param1:IEventDispatcher) : void
        {
            param1.addEventListener("validatePropertiesComplete", this.appProgressHandler);
            param1.addEventListener("validateSizeComplete", this.appProgressHandler);
            param1.addEventListener("validateDisplayListComplete", this.appProgressHandler);
            param1.addEventListener(FlexEvent.CREATION_COMPLETE, this.appCreationCompleteHandler);
            this.app = param1;
            return;
        }// end function

        private function getByteValues() : Object
        {
            var _loc_6:int = 0;
            var _loc_1:* = root.loaderInfo;
            var _loc_2:* = _loc_1.bytesLoaded;
            var _loc_3:* = _loc_1.bytesTotal;
            var _loc_4:* = this.rslListLoader ? (this.rslListLoader.getItemCount()) : (0);
            var _loc_5:int = 0;
            while (_loc_5 < _loc_4)
            {
                
                _loc_2 = _loc_2 + this.rslListLoader.getItem(_loc_5).loaded;
                _loc_6 = this.rslListLoader.getItem(_loc_5).total;
                _loc_3 = _loc_3 + _loc_6;
                _loc_5++;
            }
            return {loaded:_loc_2, total:_loc_3};
        }// end function

        private function dispatchAppEndEvent(param1:Object = null) : void
        {
            dispatchEvent(new FlexEvent(FlexEvent.INIT_COMPLETE));
            if (!this.showDisplay)
            {
                this.displayClassCompleteHandler(null);
            }
            return;
        }// end function

        function rslProgressHandler(event:ProgressEvent) : void
        {
            var _loc_2:* = this.rslListLoader.getIndex();
            var _loc_3:* = this.rslListLoader.getItem(_loc_2);
            var _loc_4:* = new RSLEvent(RSLEvent.RSL_PROGRESS);
            new RSLEvent(RSLEvent.RSL_PROGRESS).isResourceModule = this.rslListLoader == this.resourceModuleListLoader;
            _loc_4.bytesLoaded = event.bytesLoaded;
            _loc_4.bytesTotal = event.bytesTotal;
            _loc_4.rslIndex = _loc_2;
            _loc_4.rslTotal = this.rslListLoader.getItemCount();
            _loc_4.url = _loc_3.urlRequest;
            dispatchEvent(_loc_4);
            return;
        }// end function

        function rslCompleteHandler(event:Event) : void
        {
            var _loc_2:* = this.rslListLoader.getIndex();
            var _loc_3:* = this.rslListLoader.getItem(_loc_2);
            var _loc_4:* = new RSLEvent(RSLEvent.RSL_COMPLETE);
            new RSLEvent(RSLEvent.RSL_COMPLETE).isResourceModule = this.rslListLoader == this.resourceModuleListLoader;
            _loc_4.bytesLoaded = _loc_3.total;
            _loc_4.bytesTotal = _loc_3.total;
            _loc_4.loaderInfo = event.target as LoaderInfo;
            _loc_4.rslIndex = _loc_2;
            _loc_4.rslTotal = this.rslListLoader.getItemCount();
            _loc_4.url = _loc_3.urlRequest;
            dispatchEvent(_loc_4);
            if (this.loadingRSLs && this.resourceModuleListLoader && (_loc_2 + 1) == _loc_4.rslTotal)
            {
                this.loadingRSLs = false;
                this.waitingToLoadResourceModules = true;
            }
            this.rslDone = (_loc_2 + 1) == _loc_4.rslTotal;
            return;
        }// end function

        function rslErrorHandler(event:ErrorEvent) : void
        {
            var _loc_2:* = this.rslListLoader.getIndex();
            var _loc_3:* = this.rslListLoader.getItem(_loc_2);
            var _loc_4:* = new RSLEvent(RSLEvent.RSL_ERROR);
            new RSLEvent(RSLEvent.RSL_ERROR).isResourceModule = this.rslListLoader == this.resourceModuleListLoader;
            _loc_4.bytesLoaded = 0;
            _loc_4.bytesTotal = 0;
            _loc_4.rslIndex = _loc_2;
            _loc_4.rslTotal = this.rslListLoader.getItemCount();
            _loc_4.url = _loc_3.urlRequest;
            _loc_4.errorText = decodeURI(event.text);
            dispatchEvent(_loc_4);
            return;
        }// end function

        private function timerHandler(event:TimerEvent) : void
        {
            if (!root)
            {
                return;
            }
            var _loc_2:* = this.getByteValues();
            var _loc_3:* = _loc_2.loaded;
            var _loc_4:* = _loc_2.total;
            dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS, false, false, _loc_3, _loc_4));
            if (this.waitingToLoadResourceModules)
            {
                if (this.applicationDomain.hasDefinition("mx.resources::ResourceManager"))
                {
                    this.waitingToLoadResourceModules = false;
                    this.rslListLoader = this.resourceModuleListLoader;
                    this.rslDone = false;
                    this.rslListLoader.load(this.rslProgressHandler, this.rslCompleteHandler, this.rslErrorHandler, this.rslErrorHandler, this.rslErrorHandler);
                }
            }
            if (this.rslDone && (_loc_3 >= _loc_4 && _loc_4 > 0 || _loc_4 == 0 && _loc_3 > 0 || root is MovieClip && MovieClip(root).totalFrames > 2 && MovieClip(root).framesLoaded >= 2))
            {
                if (!this.sentDocFrameReady)
                {
                    if (this.showDisplay && !this.waitedAFrame)
                    {
                        return;
                    }
                    this.sentDocFrameReady = true;
                    dispatchEvent(new FlexEvent(FlexEvent.PRELOADER_DOC_FRAME_READY));
                    return;
                }
                if (this.waitingToLoadResourceModules)
                {
                    if (this.applicationDomain.hasDefinition("mx.resources::ResourceManager"))
                    {
                        this.waitingToLoadResourceModules = false;
                        this.rslListLoader = this.resourceModuleListLoader;
                        this.rslDone = false;
                        this.rslListLoader.load(this.rslProgressHandler, this.rslCompleteHandler, this.rslErrorHandler, this.rslErrorHandler, this.rslErrorHandler);
                        return;
                    }
                }
                this.timer.removeEventListener(TimerEvent.TIMER, this.timerHandler);
                this.timer.reset();
                dispatchEvent(new Event(Event.COMPLETE));
                dispatchEvent(new FlexEvent(FlexEvent.INIT_PROGRESS));
            }
            return;
        }// end function

        private function ioErrorHandler(event:IOErrorEvent) : void
        {
            return;
        }// end function

        private function displayClassCompleteHandler(event:Event) : void
        {
            if (this.displayClass)
            {
                this.displayClass.removeEventListener(Event.COMPLETE, this.displayClassCompleteHandler);
            }
            if (root)
            {
                root.loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, this.ioErrorHandler);
            }
            if (this.app)
            {
                this.app.removeEventListener("validatePropertiesComplete", this.appProgressHandler);
                this.app.removeEventListener("validateSizeComplete", this.appProgressHandler);
                this.app.removeEventListener("validateDisplayListComplete", this.appProgressHandler);
                this.app.removeEventListener(FlexEvent.CREATION_COMPLETE, this.appCreationCompleteHandler);
                this.app = null;
            }
            dispatchEvent(new FlexEvent(FlexEvent.PRELOADER_DONE));
            return;
        }// end function

        private function appCreationCompleteHandler(event:FlexEvent) : void
        {
            this.dispatchAppEndEvent();
            return;
        }// end function

        private function appProgressHandler(event:Event) : void
        {
            dispatchEvent(new FlexEvent(FlexEvent.INIT_PROGRESS));
            return;
        }// end function

        private function waitAFrame(event:Event) : void
        {
            this.removeEventListener(Event.ENTER_FRAME, this.waitAFrame);
            this.waitedAFrame = true;
            return;
        }// end function

    }
}
