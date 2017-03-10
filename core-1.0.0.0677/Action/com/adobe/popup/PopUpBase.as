package com.adobe.popup
{
    import flash.display.*;
    import flash.events.*;
    import mx.core.*;
    import mx.events.*;
    import mx.managers.*;

    public class PopUpBase extends EventDispatcher implements IMXMLObject
    {
        private var child:IFlexDisplayObject;
        private var firstTime:Boolean = true;
        private var suspendedBehaviors:int = 0;
        private var suspendedCallback:Function;
        private var _995424086parent:DisplayObject;
        private var _104069805modal:Boolean;
        private var _95409190childList:String;
        private var _1364013995center:Boolean = true;
        private var _open:Boolean = false;
        private var _behaviors:Array;

        public function PopUpBase()
        {
            this._behaviors = [];
            return;
        }// end function

        public function get open() : Boolean
        {
            return this._open;
        }// end function

        public function set open(value:Boolean) : void
        {
            if (this._open != value)
            {
                this._open = value;
                if (this.suspendedBehaviors > 0)
                {
                    this.suspendedBehaviors = 0;
                    this.removePopUp();
                }
                if (this._open)
                {
                    this.openPopUp();
                }
                else
                {
                    this.closePopUp();
                }
            }
            return;
        }// end function

        public function set behaviors(value:Array) : void
        {
            var _loc_2:IPopUpBehavior = null;
            if (this._behaviors != value)
            {
                this._behaviors = value;
                for each (_loc_2 in this._behaviors)
                {
                    
                    _loc_2.apply(this);
                }
            }
            return;
        }// end function

        public function initialized(document:Object, id:String) : void
        {
            return;
        }// end function

        protected function getPopUp() : IFlexDisplayObject
        {
            throw new Error("Abstract method call");
        }// end function

        protected function popUpClosed() : void
        {
            return;
        }// end function

        private function openPopUp() : void
        {
            if (!this.parent)
            {
                this.parent = DisplayObject(FlexGlobals.topLevelApplication);
            }
            this.child = this.getPopUp();
            this.dispatchPopUpEvent(PopUpEvent.OPENING);
            if (this.suspendedBehaviors == 0)
            {
                this.addPopUp();
            }
            else
            {
                this.suspendedCallback = this.addPopUp;
            }
            return;
        }// end function

        private function onClose(event:Event) : void
        {
            this.child.removeEventListener(Event.CLOSE, this.onClose);
            this.open = false;
            return;
        }// end function

        private function closePopUp() : void
        {
            if (this.child)
            {
                this.dispatchPopUpEvent(PopUpEvent.CLOSING);
                if (this.suspendedBehaviors == 0)
                {
                    this.removePopUp();
                }
                else
                {
                    this.suspendedCallback = this.removePopUp;
                }
            }
            return;
        }// end function

        private function addPopUp() : void
        {
            PopUpManager.addPopUp(this.child, this.parent, this.modal, this.childList);
            if (this.center)
            {
                PopUpManager.centerPopUp(this.child);
            }
            this.dispatchPopUpEvent(PopUpEvent.OPENED);
            this.dispatchShowEvent();
            return;
        }// end function

        private function removePopUp() : void
        {
            if (this.child)
            {
                PopUpManager.removePopUp(this.child);
                this.popUpClosed();
                this.child = null;
                this.dispatchPopUpEvent(PopUpEvent.CLOSED);
            }
            return;
        }// end function

        private function suspendCallback() : void
        {
            var _loc_1:String = this;
            var _loc_2:* = this.suspendedBehaviors + 1;
            _loc_1.suspendedBehaviors = _loc_2;
            return;
        }// end function

        private function resumeCallback() : void
        {
            if (this.suspendedBehaviors > 0)
            {
                var _loc_1:String = this;
                var _loc_2:* = this.suspendedBehaviors - 1;
                _loc_1.suspendedBehaviors = _loc_2;
            }
            if (this.suspendedBehaviors == 0)
            {
                this.suspendedCallback.call();
            }
            return;
        }// end function

        private function dispatchPopUpEvent(type:String) : void
        {
            dispatchEvent(new PopUpEvent(type, this.child, this.suspendCallback, this.resumeCallback));
            return;
        }// end function

        private function dispatchShowEvent() : void
        {
            if (!this.firstTime)
            {
            }
            if (this.modal)
            {
                this.firstTime = false;
                this.child.dispatchEvent(new FlexEvent(FlexEvent.SHOW));
            }
            return;
        }// end function

        public function get parent() : DisplayObject
        {
            return this._995424086parent;
        }// end function

        public function set parent(value:DisplayObject) : void
        {
            var _loc_2:* = this._995424086parent;
            if (_loc_2 !== value)
            {
                this._995424086parent = value;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "parent", _loc_2, value));
                }
            }
            return;
        }// end function

        public function get modal() : Boolean
        {
            return this._104069805modal;
        }// end function

        public function set modal(value:Boolean) : void
        {
            var _loc_2:* = this._104069805modal;
            if (_loc_2 !== value)
            {
                this._104069805modal = value;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "modal", _loc_2, value));
                }
            }
            return;
        }// end function

        public function get childList() : String
        {
            return this._95409190childList;
        }// end function

        public function set childList(value:String) : void
        {
            var _loc_2:* = this._95409190childList;
            if (_loc_2 !== value)
            {
                this._95409190childList = value;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "childList", _loc_2, value));
                }
            }
            return;
        }// end function

        public function get center() : Boolean
        {
            return this._1364013995center;
        }// end function

        public function set center(value:Boolean) : void
        {
            var _loc_2:* = this._1364013995center;
            if (_loc_2 !== value)
            {
                this._1364013995center = value;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "center", _loc_2, value));
                }
            }
            return;
        }// end function

    }
}
