package com.tinychat.ui.components.application
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.layout.*;
    import com.tinychat.model.room.*;
    import com.tinychat.model.social.chat.message.*;
    import com.tinychat.ui.components.broadcast.lists.*;
    import com.tinychat.ui.components.controlbar.buttons.*;
    import com.tinychat.ui.components.social.buttonbar.*;
    import com.tinychat.ui.components.url.*;
    import mx.containers.*;
    import mx.events.*;
    import spark.components.supportClasses.*;

    public class ApplicationScreen extends SkinnableComponent
    {
        public var videoCanvas:RoomBroadcastCanvas;
        public var broadcastButton:BroadcastButton;
        public var roomUrlField:UrlDisplay;
        public var chatListButtonBar:SocialButtonBar;
        public var socialButtonBar:SocialButtonBar;
        public var chatViewStack:ViewStack;
        public var socialViewStack:ViewStack;
        public var socialViewStack2:ViewStack;
        private var _applicationLayout:ApplicationLayout;
        private var pendingSelectedContainerName:String;
        private var _broadcasts:RoomBroadcastCanvasBroadcasts;
        private var _roomInfo:RoomSettingsProxy;
        private var _userListContainer:CountMessage;
        private var _state:String;
        private static const STATE_CHAT_RIGHT:String = "chatRight";
        private static const STATE_CHAT_ONLY_RIGHT:String = "chatOnlyRight";
        private static const STATE_CHAT_BELOW:String = "chatBelow";
        private static const STATE_CHAT_ONLY_BELOW:String = "chatOnlyBelow";
        private static const STATE_VIDEO_ONLY:String = "videoOnly";
        private static var _skinParts:Object = {chatListButtonBar:true, roomUrlField:false, chatViewStack:true, socialViewStack:true, videoCanvas:true, socialButtonBar:true, broadcastButton:false, socialViewStack2:false};

        public function ApplicationScreen()
        {
            this._userListContainer = new CountMessage();
            return;
        }// end function

        public function set applicationLayout(param1:ApplicationLayout) : void
        {
            if (this._applicationLayout != param1)
            {
                if (this._applicationLayout)
                {
                    this._applicationLayout.stateChanged.remove(this.applicationLayoutStateChangedHandler);
                }
                this._applicationLayout = param1;
                this.updateSkinState();
                if (this._applicationLayout)
                {
                    this._applicationLayout.stateChanged.add(this.applicationLayoutStateChangedHandler);
                }
            }
            return;
        }// end function

        public function set broadcasts(param1:RoomBroadcastCanvasBroadcasts) : void
        {
            if (this._broadcasts != param1)
            {
                if (this._broadcasts)
                {
                    this._broadcasts.started.remove(this.broadcastChangedHandler);
                    this._broadcasts.stopped.remove(this.broadcastChangedHandler);
                }
                this._broadcasts = param1;
                this.updateSkinState();
                if (this._broadcasts)
                {
                    this._broadcasts.started.add(this.broadcastChangedHandler);
                    this._broadcasts.stopped.add(this.broadcastChangedHandler);
                }
            }
            return;
        }// end function

        public function set roomInfo(param1:RoomSettingsProxy) : void
        {
            if (this._roomInfo != param1)
            {
                if (this.roomUrlField)
                {
                    this.roomUrlField.url = param1.url;
                    this.roomUrlField.invalidateDisplayList();
                }
            }
            return;
        }// end function

        public function set selectedChat(param1:CountMessage) : void
        {
            this._userListContainer = param1;
            return;
        }// end function

        override protected function getCurrentSkinState() : String
        {
            if (this._state)
            {
                return this._state;
            }
            return STATE_CHAT_ONLY_BELOW;
        }// end function

        private function broadcastChangedHandler(param1:Broadcast) : void
        {
            this.updateSkinState();
            return;
        }// end function

        private function updateSkinState() : void
        {
            if (this._broadcasts)
            {
            }
            var _loc_1:* = this._broadcasts.all.length > 0;
            if (this._applicationLayout.currentState == ApplicationLayoutState.CHAT_BELOW)
            {
                if (_loc_1)
                {
                    this.state = STATE_CHAT_BELOW;
                }
                else
                {
                    this.state = STATE_CHAT_ONLY_BELOW;
                }
            }
            else if (this._applicationLayout.currentState == ApplicationLayoutState.CHAT_RIGHT)
            {
                if (_loc_1)
                {
                    this.state = STATE_CHAT_RIGHT;
                }
                else
                {
                    this.state = STATE_CHAT_ONLY_RIGHT;
                }
            }
            else
            {
                this.state = STATE_VIDEO_ONLY;
            }
            return;
        }// end function

        override protected function stateChanged(param1:String, param2:String, param3:Boolean) : void
        {
            super.stateChanged(param1, param2, param3);
            this.pendingSelectedContainerName = "";
            if (this.socialButtonBar)
            {
            }
            if (this.chatListButtonBar)
            {
                if (param1 == STATE_CHAT_ONLY_RIGHT)
                {
                }
                if (param2 == STATE_CHAT_RIGHT)
                {
                    this.pendingSelectedContainerName = this.chatListButtonBar.selectedItem.name;
                    this._userListContainer.selected = this.pendingSelectedContainerName == SocialButtonBar.USERS_LIST_CONTAINER;
                }
                else
                {
                    if (param1 == STATE_CHAT_RIGHT)
                    {
                    }
                    if (param2 == STATE_CHAT_ONLY_RIGHT)
                    {
                        this.pendingSelectedContainerName = this.socialButtonBar.selectedItem.name;
                        this._userListContainer.selected = false;
                    }
                }
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.socialViewStack)
            {
                this.socialViewStack.addEventListener(FlexEvent.UPDATE_COMPLETE, this.socialViewStackUpdateCompleteHandler);
            }
            else if (param2 == this.socialViewStack2)
            {
                this.socialViewStack2.addEventListener(FlexEvent.UPDATE_COMPLETE, this.socialViewStackUpdateCompleteHandler);
            }
            else if (param2 == this.chatViewStack)
            {
                this.chatViewStack.addEventListener(FlexEvent.UPDATE_COMPLETE, this.chatViewStackUpdateCompleteHandler);
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == this.socialViewStack)
            {
                this.socialViewStack.removeEventListener(FlexEvent.UPDATE_COMPLETE, this.socialViewStackUpdateCompleteHandler);
            }
            else if (param2 == this.socialViewStack2)
            {
                this.socialViewStack2.removeEventListener(FlexEvent.UPDATE_COMPLETE, this.socialViewStackUpdateCompleteHandler);
            }
            else if (param2 == this.chatViewStack)
            {
                this.chatViewStack.removeEventListener(FlexEvent.UPDATE_COMPLETE, this.chatViewStackUpdateCompleteHandler);
            }
            return;
        }// end function

        private function set state(param1:String) : void
        {
            if (this._state != param1)
            {
                this._state = param1;
                invalidateSkinState();
            }
            return;
        }// end function

        private function socialViewStackUpdateCompleteHandler(event:FlexEvent) : void
        {
            if (this.pendingSelectedContainerName != "")
            {
            }
            if (this.socialViewStack.getChildByName(this.pendingSelectedContainerName))
            {
                this.socialButtonBar.selectedItem = this.socialViewStack.getChildByName(this.pendingSelectedContainerName);
                this.pendingSelectedContainerName = "";
            }
            else
            {
                if (this.pendingSelectedContainerName != "")
                {
                }
                if (this.socialViewStack2.getChildByName(this.pendingSelectedContainerName))
                {
                    this.pendingSelectedContainerName = "";
                }
            }
            if (this.getCurrentSkinState() == STATE_CHAT_RIGHT)
            {
            }
            this._userListContainer.selected = this.socialButtonBar.selectedItem.name == SocialButtonBar.USERS_LIST_CONTAINER;
            return;
        }// end function

        private function chatViewStackUpdateCompleteHandler(event:FlexEvent) : void
        {
            var _loc_2:uint = 0;
            if (this.pendingSelectedContainerName != "")
            {
                _loc_2 = this.chatListButtonBar.selectedIndex;
                this.chatListButtonBar.selectedIndex = 0;
                if (this.chatViewStack.getChildByName(this.pendingSelectedContainerName))
                {
                    this.chatListButtonBar.selectedItem = this.chatViewStack.getChildByName(this.pendingSelectedContainerName);
                }
                else
                {
                    this.chatListButtonBar.selectedIndex = _loc_2;
                }
                this.pendingSelectedContainerName = "";
            }
            this._userListContainer.selected = false;
            return;
        }// end function

        private function applicationLayoutStateChangedHandler(param1:ApplicationLayoutState) : void
        {
            this.updateSkinState();
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
