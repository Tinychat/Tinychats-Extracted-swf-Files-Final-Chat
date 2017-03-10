package org.robotlegs.utilities.modular.mvcs
{
    import flash.display.*;
    import flash.events.*;
    import flash.system.*;
    import org.robotlegs.base.*;
    import org.robotlegs.core.*;
    import org.robotlegs.mvcs.*;
    import org.robotlegs.utilities.modular.base.*;
    import org.robotlegs.utilities.modular.core.*;

    public class ModuleContext extends Context implements IModuleContext
    {
        protected var _applicationDomain:ApplicationDomain;
        protected var _moduleDispatcher:IModuleEventDispatcher;
        protected var _moduleCommandMap:IModuleCommandMap;

        public function ModuleContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true, parentInjector:IInjector = null, applicationDomain:ApplicationDomain = null)
        {
            if (!applicationDomain)
            {
            }
            this._applicationDomain = ApplicationDomain.currentDomain;
            if (parentInjector)
            {
                _injector = parentInjector.createChild(this._applicationDomain);
            }
            super(contextView, autoStartup);
            return;
        }// end function

        protected function get moduleDispatcher() : IModuleEventDispatcher
        {
            return this._moduleDispatcher;
        }// end function

        protected function set moduleDispatcher(value:IModuleEventDispatcher) : void
        {
            this._moduleDispatcher = value;
            return;
        }// end function

        protected function get moduleCommandMap() : IModuleCommandMap
        {
            if (!this._moduleCommandMap)
            {
                var _loc_1:* = new ModuleCommandMap(this.moduleDispatcher, injector.createChild(this._applicationDomain), reflector);
                this._moduleCommandMap = new ModuleCommandMap(this.moduleDispatcher, injector.createChild(this._applicationDomain), reflector);
            }
            return _loc_1;
        }// end function

        protected function set moduleCommandMap(value:IModuleCommandMap) : void
        {
            this._moduleCommandMap = value;
            return;
        }// end function

        override protected function get commandMap() : ICommandMap
        {
            if (!_commandMap)
            {
                var _loc_1:* = new CommandMap(eventDispatcher, injector.createChild(this._applicationDomain), reflector);
                _commandMap = new CommandMap(eventDispatcher, injector.createChild(this._applicationDomain), reflector);
            }
            return _loc_1;
        }// end function

        override protected function set commandMap(value:ICommandMap) : void
        {
            _commandMap = value;
            return;
        }// end function

        override protected function set mediatorMap(value:IMediatorMap) : void
        {
            _mediatorMap = value;
            return;
        }// end function

        override protected function get mediatorMap() : IMediatorMap
        {
            if (!_mediatorMap)
            {
                var _loc_1:* = new MediatorMap(contextView, injector.createChild(this._applicationDomain), reflector);
                _mediatorMap = new MediatorMap(contextView, injector.createChild(this._applicationDomain), reflector);
            }
            return _loc_1;
        }// end function

        override protected function mapInjections() : void
        {
            super.mapInjections();
            this.initializeModuleEventDispatcher();
            injector.mapValue(IModuleCommandMap, this.moduleCommandMap);
            return;
        }// end function

        protected function initializeModuleEventDispatcher() : void
        {
            if (injector.hasMapping(IModuleEventDispatcher))
            {
                this.moduleDispatcher = injector.getInstance(IModuleEventDispatcher);
            }
            else
            {
                this.moduleDispatcher = new ModuleEventDispatcher(this);
                injector.mapValue(IModuleEventDispatcher, this.moduleDispatcher);
            }
            return;
        }// end function

        protected function dispatchToModules(event:Event) : Boolean
        {
            if (this.moduleDispatcher.hasEventListener(event.type))
            {
                return this.moduleDispatcher.dispatchEvent(event);
            }
            return true;
        }// end function

        public function dispose() : void
        {
            dispatchEvent(new ContextEvent(ContextEvent.SHUTDOWN));
            _commandMap.unmapEvents();
            this._moduleCommandMap.unmapEvents();
            this._moduleCommandMap = null;
            this._moduleDispatcher = null;
            _contextView = null;
            _injector = null;
            _reflector = null;
            _commandMap = null;
            _mediatorMap = null;
            _viewMap = null;
            _eventDispatcher = null;
            this._applicationDomain = null;
            return;
        }// end function

    }
}
