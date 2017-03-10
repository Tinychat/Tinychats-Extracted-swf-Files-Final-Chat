package org.robotlegs.mvcs
{
    import flash.display.*;
    import flash.events.*;
    import flash.system.*;
    import org.robotlegs.adapters.*;
    import org.robotlegs.base.*;
    import org.robotlegs.core.*;

    public class Context extends ContextBase implements IContext
    {
        protected var _injector:IInjector;
        protected var _reflector:IReflector;
        protected var _autoStartup:Boolean;
        protected var _contextView:DisplayObjectContainer;
        protected var _commandMap:ICommandMap;
        protected var _mediatorMap:IMediatorMap;
        protected var _viewMap:IViewMap;

        public function Context(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
        {
            this._contextView = contextView;
            this._autoStartup = autoStartup;
            this.mapInjections();
            this.checkAutoStartup();
            return;
        }// end function

        public function startup() : void
        {
            dispatchEvent(new ContextEvent(ContextEvent.STARTUP_COMPLETE));
            return;
        }// end function

        public function shutdown() : void
        {
            dispatchEvent(new ContextEvent(ContextEvent.SHUTDOWN_COMPLETE));
            return;
        }// end function

        public function get contextView() : DisplayObjectContainer
        {
            return this._contextView;
        }// end function

        public function set contextView(value:DisplayObjectContainer) : void
        {
            if (this._contextView != value)
            {
                this._contextView = value;
                this._injector.applicationDomain = this.getApplicationDomainFromContextView();
                this._commandMap = null;
                this._mediatorMap = null;
                this._viewMap = null;
                this.mapInjections();
                this.checkAutoStartup();
            }
            return;
        }// end function

        protected function get injector() : IInjector
        {
            if (!this._injector)
            {
            }
            var _loc_1:* = this.createInjector();
            this._injector = this.createInjector();
            return _loc_1;
        }// end function

        protected function set injector(value:IInjector) : void
        {
            this._injector = value;
            return;
        }// end function

        protected function get reflector() : IReflector
        {
            if (!this._reflector)
            {
            }
            var _loc_1:* = new SwiftSuspendersReflector();
            this._reflector = new SwiftSuspendersReflector();
            return _loc_1;
        }// end function

        protected function set reflector(value:IReflector) : void
        {
            this._reflector = value;
            return;
        }// end function

        protected function get commandMap() : ICommandMap
        {
            if (!this._commandMap)
            {
            }
            var _loc_1:* = new CommandMap(eventDispatcher, this.createChildInjector(), this.reflector);
            this._commandMap = new CommandMap(eventDispatcher, this.createChildInjector(), this.reflector);
            return _loc_1;
        }// end function

        protected function set commandMap(value:ICommandMap) : void
        {
            this._commandMap = value;
            return;
        }// end function

        protected function get mediatorMap() : IMediatorMap
        {
            if (!this._mediatorMap)
            {
            }
            var _loc_1:* = new MediatorMap(this.contextView, this.createChildInjector(), this.reflector);
            this._mediatorMap = new MediatorMap(this.contextView, this.createChildInjector(), this.reflector);
            return _loc_1;
        }// end function

        protected function set mediatorMap(value:IMediatorMap) : void
        {
            this._mediatorMap = value;
            return;
        }// end function

        protected function get viewMap() : IViewMap
        {
            if (!this._viewMap)
            {
            }
            var _loc_1:* = new ViewMap(this.contextView, this.injector);
            this._viewMap = new ViewMap(this.contextView, this.injector);
            return _loc_1;
        }// end function

        protected function set viewMap(value:IViewMap) : void
        {
            this._viewMap = value;
            return;
        }// end function

        protected function mapInjections() : void
        {
            this.injector.mapValue(IReflector, this.reflector);
            this.injector.mapValue(IInjector, this.injector);
            this.injector.mapValue(IEventDispatcher, eventDispatcher);
            this.injector.mapValue(DisplayObjectContainer, this.contextView);
            this.injector.mapValue(ICommandMap, this.commandMap);
            this.injector.mapValue(IMediatorMap, this.mediatorMap);
            this.injector.mapValue(IViewMap, this.viewMap);
            this.injector.mapClass(IEventMap, EventMap);
            return;
        }// end function

        protected function checkAutoStartup() : void
        {
            if (this._autoStartup)
            {
            }
            if (this.contextView)
            {
                if (this.contextView.stage)
                {
                    this.startup();
                }
                else
                {
                    this.contextView.addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage, false, 0, true);
                }
            }
            return;
        }// end function

        protected function onAddedToStage(event:Event) : void
        {
            this.contextView.removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            this.startup();
            return;
        }// end function

        protected function createInjector() : IInjector
        {
            var _loc_1:* = new SwiftSuspendersInjector();
            _loc_1.applicationDomain = this.getApplicationDomainFromContextView();
            return _loc_1;
        }// end function

        protected function createChildInjector() : IInjector
        {
            return this.injector.createChild(this.getApplicationDomainFromContextView());
        }// end function

        protected function getApplicationDomainFromContextView() : ApplicationDomain
        {
            if (this.contextView)
            {
            }
            if (this.contextView.loaderInfo)
            {
                return this.contextView.loaderInfo.applicationDomain;
            }
            return ApplicationDomain.currentDomain;
        }// end function

    }
}
