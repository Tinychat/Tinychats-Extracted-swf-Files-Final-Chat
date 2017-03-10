package com.tinychat.ui.skins.gotham.components.invite
{
    import com.tinychat.model.social.network.presence.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import spark.components.*;
    import spark.primitives.*;

    public class InviteFriendsPresenceIndicator extends Group implements PresenceIndicator
    {
        private var _1141881952fillColor:SolidColor;
        private var __moduleFactoryInitialized:Boolean = false;

        public function InviteFriendsPresenceIndicator()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._InviteFriendsPresenceIndicator_Rect1_c()];
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

        public function set presence(param1:PresenceType) : void
        {
            var _loc_2:uint = 0;
            switch(param1)
            {
                case PresenceType.ONLINE:
                {
                    _loc_2 = 5360420;
                    break;
                }
                case PresenceType.AWAY:
                {
                    _loc_2 = 7837649;
                    break;
                }
                case PresenceType.OFFLINE:
                {
                }
                default:
                {
                    _loc_2 = 14606046;
                    break;
                }
            }
            this.fillColor.color = _loc_2;
            return;
        }// end function

        private function _InviteFriendsPresenceIndicator_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._InviteFriendsPresenceIndicator_SolidColor1_i();
            _loc_1.stroke = this._InviteFriendsPresenceIndicator_SolidColorStroke1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _InviteFriendsPresenceIndicator_SolidColor1_i() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 5360420;
            this.fillColor = _loc_1;
            BindingManager.executeBindings(this, "fillColor", this.fillColor);
            return _loc_1;
        }// end function

        private function _InviteFriendsPresenceIndicator_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 16777215;
            _loc_1.weight = 1;
            return _loc_1;
        }// end function

        public function get fillColor() : SolidColor
        {
            return this._1141881952fillColor;
        }// end function

        public function set fillColor(param1:SolidColor) : void
        {
            var _loc_2:* = this._1141881952fillColor;
            if (_loc_2 !== param1)
            {
                this._1141881952fillColor = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fillColor", _loc_2, param1));
                }
            }
            return;
        }// end function

    }
}
