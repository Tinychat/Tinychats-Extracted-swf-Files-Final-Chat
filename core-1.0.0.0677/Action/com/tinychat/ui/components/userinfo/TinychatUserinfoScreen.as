package com.tinychat.ui.components.userinfo
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.social.network.mqtt.*;
    import com.tinychat.services.vo.*;
    import com.tinychat.ui.components.spark.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.utils.*;

    public class TinychatUserinfoScreen extends TitleWindowElementBase
    {
        public var avatar:ImageSourceDisplay;
        public var notFoundMessageDisplay:TextBase;
        public var usernameDisplay:RichEditableText;
        public var locationDisplay:TextBase;
        public var bioDisplay:RichEditableText;
        public var websiteDisplay:RichEditableText;
        public var followerCountDisplay:TextBase;
        public var followButton:FollowButton;
        public var viewCountDisplay:TextBase;
        private var _dataProvider:TinychatUserinfo;
        private var _user:UserIdentity;
        private var _mqttProxy:MqttProxy;
        private var _notFoundMessage:String;
        private var dataProviderChanged:Boolean;
        private var notFoundMessageChanged:Boolean;
        private var mqttProxyChanged:Boolean;
        private var userChanged:Boolean;
        private static const STATE_FOUND:String = "found";
        private static const STATE_NOT_FOUND:String = "notFound";
        private static var _skinParts:Object = {cancel:false, loadingIndicator:false, usernameDisplay:true, avatar:true, locationDisplay:true, titleDisplay:false, statusLabel:false, confirm:false, viewCountDisplay:false, bioDisplay:true, notFoundMessageDisplay:true, followButton:true, websiteDisplay:true, followerCountDisplay:true};

        public function TinychatUserinfoScreen()
        {
            return;
        }// end function

        public function set notFoundMessage(param1:String) : void
        {
            if (this._notFoundMessage != param1)
            {
                this._notFoundMessage = param1;
                this.notFoundMessageChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set dataProvider(param1:TinychatUserinfo) : void
        {
            if (this._dataProvider != param1)
            {
                this._dataProvider = param1;
                this.dataProviderChanged = true;
                invalidateSkinState();
            }
            return;
        }// end function

        public function set user(param1:UserIdentity) : void
        {
            if (this._user != param1)
            {
                this._user = param1;
                this.userChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set mqttProxy(param1:MqttProxy) : void
        {
            if (this._mqttProxy != param1)
            {
                this._mqttProxy = param1;
                this.mqttProxyChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.dataProviderChanged)
            {
            }
            if (this._dataProvider)
            {
                if (this.userFound)
                {
                    this.avatar.source = this._dataProvider.avatarUrl;
                    this.usernameDisplay.textFlow = TextFlowUtil.importFromString("<TextFlow xmlns=\'http://ns.adobe.com/textLayout/2008\'>" + "<span fontWeight=\'bold\'>" + this._dataProvider.name + "</span></TextFlow>");
                    this.locationDisplay.text = this._dataProvider.location;
                    this.bioDisplay.textFlow = TextFlowUtil.importFromString("<TextFlow xmlns=\'http://ns.adobe.com/textLayout/2008\'>" + "<span fontWeight=\'bold\'>Bio:</span> " + this._dataProvider.bio + "</TextFlow>");
                    this.websiteDisplay.textFlow = TextFlowUtil.importFromString("<TextFlow xmlns=\'http://ns.adobe.com/textLayout/2008\'>" + "<span fontWeight=\'bold\'>Website: </span> " + "<a href=\'" + this._dataProvider.websiteUrl + "\'>" + this._dataProvider.websiteUrl + "</a></TextFlow>");
                    this.followerCountDisplay.text = this._dataProvider.followers.toString() + " followers";
                    if (this.viewCountDisplay)
                    {
                        this.viewCountDisplay.text = this._dataProvider.views.toString() + " views";
                    }
                }
                if (this.followButton)
                {
                    this.updateFollowButtonState();
                }
                this.dataProviderChanged = false;
            }
            if (this.notFoundMessageChanged)
            {
            }
            if (this.notFoundMessageDisplay)
            {
                this.notFoundMessageDisplay.text = this._notFoundMessage;
                this.notFoundMessageChanged = false;
            }
            if (this.mqttProxyChanged)
            {
            }
            if (this.followButton)
            {
                this.updateFollowButtonState();
                this.mqttProxyChanged = false;
            }
            if (this.userChanged)
            {
            }
            if (this.followButton)
            {
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.followButton)
            {
                this.updateFollowButtonState();
            }
            return;
        }// end function

        override protected function getCurrentSkinState() : String
        {
            if (this.userFound)
            {
                return STATE_FOUND;
            }
            return STATE_NOT_FOUND;
        }// end function

        private function get userFound() : Boolean
        {
            if (this._dataProvider)
            {
            }
            return this._dataProvider.name;
        }// end function

        private function updateFollowButtonState() : void
        {
            if (this._mqttProxy)
            {
            }
            if (this._mqttProxy.isLoggedIn)
            {
            }
            var _loc_1:* = this.userFound;
            this.followButton.visible = _loc_1;
            this.followButton.includeInLayout = _loc_1;
            if (_loc_1)
            {
                this.followButton.user = this._user;
                this.followButton.mqttUser = this._mqttProxy.getFriend(this._dataProvider.name);
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
