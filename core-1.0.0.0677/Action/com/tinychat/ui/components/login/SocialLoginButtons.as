package com.tinychat.ui.components.login
{
    import com.tinychat.model.login.*;
    import com.tinychat.model.room.*;
    import com.tinychat.ui.components.login.facebook.*;
    import com.tinychat.ui.components.login.tumblr.*;
    import com.tinychat.ui.components.login.twitter.*;
    import flash.events.*;
    import flash.utils.*;
    import org.osflash.signals.*;
    import spark.components.*;
    import spark.components.supportClasses.*;

    public class SocialLoginButtons extends SkinnableComponent
    {
        public var facebookButton:FacebookButton;
        public var tumblrButton:TumblrButton;
        public var twitterButton:TwitterButton;
        public var guestButton:ToggleButton;
        private var buttonToListener:Dictionary;
        private var _roomLoginRestriction:RoomLoginRestriction;
        private var _selected:LoginType;
        private var _clicked:Signal;
        public static const STATE_ANY:String = "any";
        public static const STATE_NON_GUEST:String = "nonGuest";
        public static const STATE_FACEBOOK:String = "facebook";
        public static const STATE_TUMBLR:String = "tumblr";
        public static const STATE_TWITTER:String = "twitter";
        public static const STATE_FACEBOOK_AND_TUMBLR:String = "facebookAndTumblr";
        public static const STATE_FACEBOOK_AND_TWITTER:String = "facebookAndTwitter";
        public static const STATE_TUMBLR_AND_TWITTER:String = "tumblrAndTwitter";
        private static var _skinParts:Object = {twitterButton:false, tumblrButton:false, facebookButton:false, guestButton:true};

        public function SocialLoginButtons()
        {
            this.buttonToListener = new Dictionary();
            this._clicked = new Signal(LoginType);
            return;
        }// end function

        public function get selected() : LoginType
        {
            return this._selected;
        }// end function

        public function get clicked() : ISignal
        {
            return this._clicked;
        }// end function

        public function set loginRestriction(param1:RoomLoginRestriction) : void
        {
            if (this._roomLoginRestriction != param1)
            {
                this._roomLoginRestriction = param1;
                invalidateSkinState();
            }
            return;
        }// end function

        override protected function getCurrentSkinState() : String
        {
            switch(this._roomLoginRestriction)
            {
                case RoomLoginRestriction.FACEBOOK:
                {
                    return STATE_FACEBOOK;
                }
                case RoomLoginRestriction.TWITTER:
                {
                    return STATE_TWITTER;
                }
                case RoomLoginRestriction.FACEBOOK_AND_TWITTER:
                {
                    return STATE_FACEBOOK_AND_TWITTER;
                }
                case RoomLoginRestriction.TUMBLR_AND_TWITTER:
                {
                    return STATE_TUMBLR_AND_TWITTER;
                }
                case RoomLoginRestriction.NON_GUEST:
                {
                    return STATE_NON_GUEST;
                }
                case RoomLoginRestriction.FACEBOOK_AND_TUMBLR:
                case RoomLoginRestriction.TUMBLR:
                case RoomLoginRestriction.ANY:
                {
                }
                default:
                {
                    return STATE_ANY;
                    break;
                }
            }
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            if (param2 == this.facebookButton)
            {
                this.addClickHandler(this.facebookButton, LoginType.FACEBOOK);
            }
            else if (param2 == this.tumblrButton)
            {
                this.addClickHandler(this.tumblrButton, LoginType.TUMBLR);
            }
            else if (param2 == this.twitterButton)
            {
                this.addClickHandler(this.twitterButton, LoginType.TWITTER);
            }
            else
            {
                this.addClickHandler(this.guestButton, LoginType.GUEST);
            }
            return;
        }// end function

        private function addClickHandler(param1:ButtonBase, param2:LoginType) : void
        {
            var button:* = param1;
            var type:* = param2;
            var listener:* = function (event:MouseEvent) : void
            {
                if (button is ToggleButton)
                {
                }
                _selected = ToggleButton(button).selected ? (type) : (null);
                _clicked.dispatch(type);
                return;
            }// end function
            ;
            button.addEventListener(MouseEvent.CLICK, listener);
            this.buttonToListener[button] = listener;
            return;
        }// end function

        private function removeClickHandler(param1:ButtonBase) : void
        {
            var _loc_2:* = this.buttonToListener[param1];
            param1.removeEventListener(MouseEvent.CLICK, _loc_2);
            delete this.buttonToListener[param1];
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            if (param2 != this.facebookButton)
            {
            }
            if (param2 != this.tumblrButton)
            {
            }
            if (param2 != this.twitterButton)
            {
            }
            if (param2 == this.guestButton)
            {
                this.removeClickHandler(param2 as ButtonBase);
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
