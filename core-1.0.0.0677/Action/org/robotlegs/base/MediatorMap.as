package org.robotlegs.base
{
    import MediatorMap.as$22.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import org.robotlegs.core.*;

    public class MediatorMap extends ViewMapBase implements IMediatorMap
    {
        protected var mediatorByView:Dictionary;
        protected var mappingConfigByView:Dictionary;
        protected var mappingConfigByViewClassName:Dictionary;
        protected var mediatorsMarkedForRemoval:Dictionary;
        protected var hasMediatorsMarkedForRemoval:Boolean;
        protected var reflector:IReflector;
        static const enterFrameDispatcher:Sprite = new Sprite();

        public function MediatorMap(contextView:DisplayObjectContainer, injector:IInjector, reflector:IReflector)
        {
            super(contextView, injector);
            this.reflector = reflector;
            this.mediatorByView = new Dictionary(true);
            this.mappingConfigByView = new Dictionary(true);
            this.mappingConfigByViewClassName = new Dictionary(false);
            this.mediatorsMarkedForRemoval = new Dictionary(false);
            return;
        }// end function

        public function mapView(viewClassOrName, mediatorClass:Class, injectViewAs = null, autoCreate:Boolean = true, autoRemove:Boolean = true) : void
        {
            var _loc_6:* = this.reflector.getFQCN(viewClassOrName);
            if (this.mappingConfigByViewClassName[_loc_6] != null)
            {
                throw new ContextError(ContextError.E_MEDIATORMAP_OVR + " - " + mediatorClass);
            }
            if (this.reflector.classExtendsOrImplements(mediatorClass, IMediator) == false)
            {
                throw new ContextError(ContextError.E_MEDIATORMAP_NOIMPL + " - " + mediatorClass);
            }
            var _loc_7:* = new MappingConfig();
            _loc_7.mediatorClass = mediatorClass;
            _loc_7.autoCreate = autoCreate;
            _loc_7.autoRemove = autoRemove;
            if (injectViewAs)
            {
                if (injectViewAs is Array)
                {
                    _loc_7.typedViewClasses = (injectViewAs as Array).concat();
                }
                else if (injectViewAs is Class)
                {
                    _loc_7.typedViewClasses = [injectViewAs];
                }
            }
            else if (viewClassOrName is Class)
            {
                _loc_7.typedViewClasses = [viewClassOrName];
            }
            this.mappingConfigByViewClassName[_loc_6] = _loc_7;
            if (!autoCreate)
            {
            }
            if (autoRemove)
            {
                var _loc_9:* = viewListenerCount + 1;
                viewListenerCount = _loc_9;
                if (viewListenerCount == 1)
                {
                    this.addListeners();
                }
            }
            if (autoCreate)
            {
            }
            if (contextView)
            {
            }
            if (_loc_6 == getQualifiedClassName(contextView))
            {
                this.createMediatorUsing(contextView, _loc_6, _loc_7);
            }
            return;
        }// end function

        public function unmapView(viewClassOrName) : void
        {
            var _loc_2:* = this.reflector.getFQCN(viewClassOrName);
            var _loc_3:* = this.mappingConfigByViewClassName[_loc_2];
            if (_loc_3)
            {
                if (!_loc_3.autoCreate)
                {
                }
            }
            if (_loc_3.autoRemove)
            {
                var _loc_5:* = viewListenerCount - 1;
                viewListenerCount = _loc_5;
                if (viewListenerCount == 0)
                {
                    this.removeListeners();
                }
            }
            delete this.mappingConfigByViewClassName[_loc_2];
            return;
        }// end function

        public function createMediator(viewComponent:Object) : IMediator
        {
            return this.createMediatorUsing(viewComponent);
        }// end function

        public function registerMediator(viewComponent:Object, mediator:IMediator) : void
        {
            injector.mapValue(this.reflector.getClass(mediator), mediator);
            this.mediatorByView[viewComponent] = mediator;
            this.mappingConfigByView[viewComponent] = this.mappingConfigByViewClassName[getQualifiedClassName(viewComponent)];
            mediator.setViewComponent(viewComponent);
            mediator.preRegister();
            return;
        }// end function

        public function removeMediator(mediator:IMediator) : IMediator
        {
            var _loc_2:Object = null;
            if (mediator)
            {
                _loc_2 = mediator.getViewComponent();
                delete this.mediatorByView[_loc_2];
                delete this.mappingConfigByView[_loc_2];
                mediator.preRemove();
                mediator.setViewComponent(null);
                injector.unmap(this.reflector.getClass(mediator));
            }
            return mediator;
        }// end function

        public function removeMediatorByView(viewComponent:Object) : IMediator
        {
            return this.removeMediator(this.retrieveMediator(viewComponent));
        }// end function

        public function retrieveMediator(viewComponent:Object) : IMediator
        {
            return this.mediatorByView[viewComponent];
        }// end function

        public function hasMapping(viewClassOrName) : Boolean
        {
            var _loc_2:* = this.reflector.getFQCN(viewClassOrName);
            return this.mappingConfigByViewClassName[_loc_2] != null;
        }// end function

        public function hasMediatorForView(viewComponent:Object) : Boolean
        {
            return this.mediatorByView[viewComponent] != null;
        }// end function

        public function hasMediator(mediator:IMediator) : Boolean
        {
            var _loc_2:IMediator = null;
            for each (_loc_2 in this.mediatorByView)
            {
                
                if (_loc_2 == mediator)
                {
                    return true;
                }
            }
            return false;
        }// end function

        override protected function addListeners() : void
        {
            if (contextView)
            {
            }
            if (enabled)
            {
                contextView.addEventListener(Event.ADDED_TO_STAGE, this.onViewAdded, useCapture, 0, true);
                contextView.addEventListener(Event.REMOVED_FROM_STAGE, this.onViewRemoved, useCapture, 0, true);
            }
            return;
        }// end function

        override protected function removeListeners() : void
        {
            if (contextView)
            {
                contextView.removeEventListener(Event.ADDED_TO_STAGE, this.onViewAdded, useCapture);
                contextView.removeEventListener(Event.REMOVED_FROM_STAGE, this.onViewRemoved, useCapture);
            }
            return;
        }// end function

        override protected function onViewAdded(event:Event) : void
        {
            if (this.mediatorsMarkedForRemoval[event.target])
            {
                delete this.mediatorsMarkedForRemoval[event.target];
                return;
            }
            var _loc_2:* = getQualifiedClassName(event.target);
            var _loc_3:* = this.mappingConfigByViewClassName[_loc_2];
            if (_loc_3)
            {
            }
            if (_loc_3.autoCreate)
            {
                this.createMediatorUsing(event.target, _loc_2, _loc_3);
            }
            return;
        }// end function

        protected function createMediatorUsing(viewComponent:Object, viewClassName:String = "", config:MappingConfig = null) : IMediator
        {
            var _loc_5:Class = null;
            var _loc_6:Class = null;
            var _loc_4:* = this.mediatorByView[viewComponent];
            if (_loc_4 == null)
            {
                if (!viewClassName)
                {
                }
                viewClassName = getQualifiedClassName(viewComponent);
                if (!config)
                {
                }
                config = this.mappingConfigByViewClassName[viewClassName];
                if (config)
                {
                    for each (_loc_5 in config.typedViewClasses)
                    {
                        
                        injector.mapValue(_loc_5, viewComponent);
                    }
                    _loc_4 = injector.instantiate(config.mediatorClass);
                    for each (_loc_6 in config.typedViewClasses)
                    {
                        
                        injector.unmap(_loc_6);
                    }
                    this.registerMediator(viewComponent, _loc_4);
                }
            }
            return _loc_4;
        }// end function

        protected function onViewRemoved(event:Event) : void
        {
            var _loc_2:* = this.mappingConfigByView[event.target];
            if (_loc_2)
            {
            }
            if (_loc_2.autoRemove)
            {
                this.mediatorsMarkedForRemoval[event.target] = event.target;
                if (!this.hasMediatorsMarkedForRemoval)
                {
                    this.hasMediatorsMarkedForRemoval = true;
                    enterFrameDispatcher.addEventListener(Event.ENTER_FRAME, this.removeMediatorLater);
                }
            }
            return;
        }// end function

        protected function removeMediatorLater(event:Event) : void
        {
            var _loc_2:DisplayObject = null;
            enterFrameDispatcher.removeEventListener(Event.ENTER_FRAME, this.removeMediatorLater);
            for each (_loc_2 in this.mediatorsMarkedForRemoval)
            {
                
                if (!_loc_2.stage)
                {
                    this.removeMediatorByView(_loc_2);
                }
                delete this.mediatorsMarkedForRemoval[_loc_2];
            }
            this.hasMediatorsMarkedForRemoval = false;
            return;
        }// end function

    }
}
