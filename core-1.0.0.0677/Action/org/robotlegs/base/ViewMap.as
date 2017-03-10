package org.robotlegs.base
{
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import org.robotlegs.core.*;

    public class ViewMap extends ViewMapBase implements IViewMap
    {
        protected var mappedPackages:Array;
        protected var mappedTypes:Dictionary;
        protected var injectedViews:Dictionary;

        public function ViewMap(contextView:DisplayObjectContainer, injector:IInjector)
        {
            super(contextView, injector);
            this.mappedPackages = new Array();
            this.mappedTypes = new Dictionary(false);
            this.injectedViews = new Dictionary(true);
            return;
        }// end function

        public function mapPackage(packageName:String) : void
        {
            if (this.mappedPackages.indexOf(packageName) == -1)
            {
                this.mappedPackages.push(packageName);
                var _loc_3:* = viewListenerCount + 1;
                viewListenerCount = _loc_3;
                if (viewListenerCount == 1)
                {
                    this.addListeners();
                }
            }
            return;
        }// end function

        public function unmapPackage(packageName:String) : void
        {
            var _loc_2:* = this.mappedPackages.indexOf(packageName);
            if (_loc_2 > -1)
            {
                this.mappedPackages.splice(_loc_2, 1);
                var _loc_4:* = viewListenerCount - 1;
                viewListenerCount = _loc_4;
                if (viewListenerCount == 0)
                {
                    this.removeListeners();
                }
            }
            return;
        }// end function

        public function mapType(type:Class) : void
        {
            if (this.mappedTypes[type])
            {
                return;
            }
            this.mappedTypes[type] = type;
            var _loc_3:* = viewListenerCount + 1;
            viewListenerCount = _loc_3;
            if (viewListenerCount == 1)
            {
                this.addListeners();
            }
            if (contextView)
            {
            }
            if (contextView is type)
            {
                this.injectInto(contextView);
            }
            return;
        }// end function

        public function unmapType(type:Class) : void
        {
            var _loc_2:* = this.mappedTypes[type];
            delete this.mappedTypes[type];
            if (_loc_2)
            {
                var _loc_4:* = viewListenerCount - 1;
                viewListenerCount = _loc_4;
                if (viewListenerCount == 0)
                {
                    this.removeListeners();
                }
            }
            return;
        }// end function

        public function hasType(type:Class) : Boolean
        {
            return this.mappedTypes[type] != null;
        }// end function

        public function hasPackage(packageName:String) : Boolean
        {
            return this.mappedPackages.indexOf(packageName) > -1;
        }// end function

        override protected function addListeners() : void
        {
            if (contextView)
            {
            }
            if (enabled)
            {
                contextView.addEventListener(Event.ADDED_TO_STAGE, this.onViewAdded, useCapture, 0, true);
            }
            return;
        }// end function

        override protected function removeListeners() : void
        {
            if (contextView)
            {
                contextView.removeEventListener(Event.ADDED_TO_STAGE, this.onViewAdded, useCapture);
            }
            return;
        }// end function

        override protected function onViewAdded(event:Event) : void
        {
            var _loc_3:Class = null;
            var _loc_4:int = 0;
            var _loc_5:String = null;
            var _loc_6:int = 0;
            var _loc_7:String = null;
            var _loc_2:* = DisplayObject(event.target);
            if (this.injectedViews[_loc_2])
            {
                return;
            }
            for each (_loc_3 in this.mappedTypes)
            {
                
                if (_loc_2 is _loc_3)
                {
                    this.injectInto(_loc_2);
                    return;
                }
            }
            _loc_4 = this.mappedPackages.length;
            if (_loc_4 > 0)
            {
                _loc_5 = getQualifiedClassName(_loc_2);
                _loc_6 = 0;
                while (_loc_6 < _loc_4)
                {
                    
                    _loc_7 = this.mappedPackages[_loc_6];
                    if (_loc_5.indexOf(_loc_7) == 0)
                    {
                        this.injectInto(_loc_2);
                        return;
                    }
                    _loc_6 = _loc_6 + 1;
                }
            }
            return;
        }// end function

        protected function injectInto(target:DisplayObject) : void
        {
            injector.org.robotlegs.core:IInjector::injectInto(target);
            this.injectedViews[target] = true;
            return;
        }// end function

    }
}
