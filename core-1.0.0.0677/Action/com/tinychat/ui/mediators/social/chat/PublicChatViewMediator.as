package com.tinychat.ui.mediators.social.chat
{
    import __AS3__.vec.*;
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.room.*;
    import com.tinychat.model.room.info.*;
    import com.tinychat.model.social.chat.conversation.tinychat.*;
    import com.tinychat.model.user.*;
    import com.tinychat.ui.components.social.chat.*;
    import org.robotlegs.mvcs.*;

    public class PublicChatViewMediator extends Mediator
    {
        public var view:PublicChatView;
        public var publicChat:PublicChat;
        public var usersProxy:RoomUsers;
        public var roomSettingsProxy:RoomSettingsProxy;
        public var parseUserInput:ParseUserInput;
        private var autoCompleteSource:Vector.<String>;

        public function PublicChatViewMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.roomSettingsProxy.lurkerChanged.add(this.lurkerHandler);
            if (this.roomSettingsProxy.lurker)
            {
                this.lurkerHandler(true);
            }
            else if (this.roomSettingsProxy.type == RoomType.READONLY)
            {
                this.view.chatInput.toolTip = "ToolTipBundle.chatInputReadonlyRestricted";
                this.view.chatInput.editable = false;
            }
            else
            {
                this.populateChatInputAutoComplete();
                this.view.chatInput.chatMessageSubmitted.add(this.messageSubmittedHandler);
                this.usersProxy.added.add(this.userAddedHandler);
                this.usersProxy.removed.add(this.userRemovedHandler);
                this.view.canInitiateChatPromptMessage = "Write here, then hit enter to send.";
            }
            this.view.chatList.dataProvider = this.publicChat.messages;
            return;
        }// end function

        override public function onRemove() : void
        {
            this.view.chatInput.chatMessageSubmitted.remove(this.messageSubmittedHandler);
            this.usersProxy.added.remove(this.userAddedHandler);
            this.usersProxy.removed.remove(this.userRemovedHandler);
            this.roomSettingsProxy.lurkerChanged.remove(this.lurkerHandler);
            return;
        }// end function

        private function lurkerHandler(param1:Boolean) : void
        {
            if (param1)
            {
                this.view.cannotInitiateChatPromptMessage = "";
                this.view.chatInput.toolTip = "ToolTipBundle.chatInputLurkerRestricted";
                this.view.chatInput.editable = false;
            }
            return;
        }// end function

        private function populateChatInputAutoComplete() : void
        {
            var allUserNamesExceptClientUser:* = this.usersProxy.allButCurrent.map(function (param1, param2:int, param3:Array) : String
            {
                var _loc_4:* = User(param1);
                _loc_4.renamed.add(userRenamedHandler);
                return _loc_4.name;
            }// end function
            );
            this.autoCompleteSource = this.Vector.<String>(allUserNamesExceptClientUser);
            this.view.chatInput.autoCompleteDataProvider = this.autoCompleteSource;
            return;
        }// end function

        private function messageSubmittedHandler(param1:String) : void
        {
            this.parseUserInput.dispatch(param1);
            return;
        }// end function

        private function userAddedHandler(param1:User) : void
        {
            this.addUsernameToAutoComplete(param1.name);
            param1.renamed.add(this.userRenamedHandler);
            return;
        }// end function

        private function userRemovedHandler(param1:User) : void
        {
            this.removeUsernameFromAutoComplete(param1.name);
            param1.renamed.remove(this.userRenamedHandler);
            return;
        }// end function

        private function userRenamedHandler(param1:String, param2:String) : void
        {
            this.removeUsernameFromAutoComplete(param1);
            this.addUsernameToAutoComplete(param2);
            return;
        }// end function

        private function addUsernameToAutoComplete(param1:String) : void
        {
            this.autoCompleteSource.push(param1);
            return;
        }// end function

        private function removeUsernameFromAutoComplete(param1:String) : void
        {
            this.autoCompleteSource.splice(this.autoCompleteSource.indexOf(param1), 1);
            return;
        }// end function

    }
}
