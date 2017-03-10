package org.robotlegs.base
{
    import flash.display.*;
    import flash.events.*;
    import org.robotlegs.core.*;

    public class ViewMapBase extends Object
    {
        protected var _enabled:Boolean = true;
        protected var _contextView:DisplayObjectContainer;
        protected var injector:IInjector;
        protected var useCapture:Boolean;
        protected var viewListenerCount:uint;

        public function ViewMapBase(contextView:DisplayObjectContainer, injector:IInjector)
        {
            this.injector = injector;
            this.useCapture = true;
            this.contextView = contextView;
            return;
        }// end function

        public function get contextView() : DisplayObjectContainer
        {
            return this._contextView;
        }// end function

        public function set contextView(value:DisplayObjectContainer) : void
        {
            if (value != this._contextView)
            {
                this.removeListeners();
                this._contextView = value;
                if (this.viewListenerCount > 0)
                {
                    this.addListeners();
                }
            }
            return;
        }// end function

        public function get enabled() : Boolean
        {
            return this._enabled;
        }// end function

        public function set enabled(value:Boolean) : void
        {
            if (value != this._enabled)
            {
                this.removeListeners();
                this._enabled = value;
                if (this.viewListenerCount > 0)
                {
                    this.addListeners();
                }
            }
            return;
        }// end function

        protected function addListeners() : void
        {
            return;
        }// end function

        protected function removeListeners() : void
        {
            return;
        }// end function

        protected function onViewAdded(event:Event) : void
        {
            return;
        }// end function

    }
}
