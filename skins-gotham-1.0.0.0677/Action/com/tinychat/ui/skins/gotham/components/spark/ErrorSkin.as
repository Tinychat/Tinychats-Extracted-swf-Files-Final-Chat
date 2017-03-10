package com.tinychat.ui.skins.gotham.components.spark
{
    import flash.events.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.primitives.*;

    public class ErrorSkin extends Group
    {
        private var _1063782265focusGroup:Rect;
        private var _891980232stroke:SolidColorStroke;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _target:SkinnableComponent;

        public function ErrorSkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._ErrorSkin_Rect1_i()];
            return;
        }// end function

        override public function set moduleFactory(param1:IFlexModuleFactory) : void
        {
            super.moduleFactory = param1;
            if (this.__moduleFactoryInitialized)
            {
                return;
            }
            this.__moduleFactoryInitialized = true;
            return;
        }// end function

        override public function initialize() : void
        {
            super.initialize();
            return;
        }// end function

        public function get target() : SkinnableComponent
        {
            return this._target;
        }// end function

        public function set target(param1:SkinnableComponent) : void
        {
            this._target = param1;
            if (this._target.skin)
            {
                this._target.skin.addEventListener(FlexEvent.UPDATE_COMPLETE, this.skin_updateCompleteHandler, false, 0, true);
            }
            return;
        }// end function

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            this.setActualSize(this.target.width, this.target.height);
            var _loc_3:Number = 1;
            if (this.target)
            {
            }
            if (this.target.getStyle("errorBorderWidth") != undefined)
            {
                _loc_3 = this.target.getStyle("errorBorderWidth");
            }
            this.stroke.weight = _loc_3;
            super.updateDisplayList(this.target.width, this.target.height);
            return;
        }// end function

        private function skin_updateCompleteHandler(event:Event) : void
        {
            invalidateDisplayList();
            return;
        }// end function

        private function _ErrorSkin_Rect1_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.top = -1;
            _loc_1.left = -1;
            _loc_1.right = -1;
            _loc_1.bottom = -1;
            _loc_1.stroke = this._ErrorSkin_SolidColorStroke1_i();
            _loc_1.initialized(this, "focusGroup");
            this.focusGroup = _loc_1;
            BindingManager.executeBindings(this, "focusGroup", this.focusGroup);
            return _loc_1;
        }// end function

        private function _ErrorSkin_SolidColorStroke1_i() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 16711680;
            this.stroke = _loc_1;
            BindingManager.executeBindings(this, "stroke", this.stroke);
            return _loc_1;
        }// end function

        public function get focusGroup() : Rect
        {
            return this._1063782265focusGroup;
        }// end function

        public function set focusGroup(param1:Rect) : void
        {
            var _loc_2:* = this._1063782265focusGroup;
            if (_loc_2 !== param1)
            {
                this._1063782265focusGroup = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "focusGroup", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get stroke() : SolidColorStroke
        {
            return this._891980232stroke;
        }// end function

        public function set stroke(param1:SolidColorStroke) : void
        {
            var _loc_2:* = this._891980232stroke;
            if (_loc_2 !== param1)
            {
                this._891980232stroke = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stroke", _loc_2, param1));
                }
            }
            return;
        }// end function

    }
}
