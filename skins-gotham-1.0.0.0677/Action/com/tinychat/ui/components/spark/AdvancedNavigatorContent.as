package com.tinychat.ui.components.spark
{
    import __AS3__.vec.*;
    import mx.core.*;
    import mx.events.*;
    import spark.components.*;

    public class AdvancedNavigatorContent extends NavigatorContent
    {
        private var elementCache:Vector.<IVisualElement>;
        private var creationComplete:Boolean;
        private var elementsCached:Boolean;
        private var _removeChildrenOnHide:Boolean;
        private static var _skinParts:Object = {contentGroup:false};

        public function AdvancedNavigatorContent()
        {
            this.elementCache = new Vector.<IVisualElement>;
            addEventListener(FlexEvent.CREATION_COMPLETE, this.creationCompleteHandler);
            addEventListener(FlexEvent.SHOW, this.showHandler, false, 0, true);
            addEventListener(FlexEvent.HIDE, this.hideHandler, false, 0, true);
            return;
        }// end function

        public function get removeChildrenOnHide() : Boolean
        {
            return this._removeChildrenOnHide;
        }// end function

        public function set removeChildrenOnHide(param1:Boolean) : void
        {
            this._removeChildrenOnHide = param1;
            return;
        }// end function

        private function showHandler(event:FlexEvent) : void
        {
            this.reAddElements();
            return;
        }// end function

        private function hideHandler(event:FlexEvent) : void
        {
            this.removeAndCacheElements();
            return;
        }// end function

        override public function addElementAt(param1:IVisualElement, param2:int) : IVisualElement
        {
            if (!visible)
            {
            }
            if (this.creationComplete)
            {
                this.elementCache.push(param1);
                return param1;
            }
            return super.addElementAt(param1, param2);
        }// end function

        override public function set visible(param1:Boolean) : void
        {
            super.visible = param1;
            if (param1)
            {
                this.reAddElements();
            }
            else if (this.removeChildrenOnHide)
            {
                this.removeAndCacheElements();
            }
            return;
        }// end function

        private function creationCompleteHandler(event:FlexEvent) : void
        {
            this.creationComplete = true;
            removeEventListener(FlexEvent.CREATION_COMPLETE, this.creationCompleteHandler);
            return;
        }// end function

        private function reAddElements() : void
        {
            var _loc_1:uint = 0;
            while (_loc_1 < this.elementCache.length)
            {
                
                addElement(this.elementCache[_loc_1]);
                _loc_1 = _loc_1 + 1;
            }
            this.elementCache.length = 0;
            return;
        }// end function

        private function removeAndCacheElements() : void
        {
            var _loc_1:uint = 0;
            while (_loc_1 < numElements)
            {
                
                this.elementCache.push(removeElementAt(_loc_1));
                _loc_1 = _loc_1 + 1;
            }
            this.elementsCached = true;
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
