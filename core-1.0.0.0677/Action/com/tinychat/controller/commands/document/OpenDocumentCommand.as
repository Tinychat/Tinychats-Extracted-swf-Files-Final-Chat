package com.tinychat.controller.commands.document
{
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.model.javascript.*;
    import com.tinychat.model.room.*;
    import com.tinychat.model.user.*;
    import org.robotlegs.mvcs.*;

    public class OpenDocumentCommand extends Command
    {
        public var javascript:ApplicationJavascript;
        public var usersProxy:RoomUsers;
        public var roomInfo:RoomSettingsProxy;
        public var postChat:PostGlobalNotice;

        public function OpenDocumentCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:* = "http://willyou.typewith.me/p/tinychat-" + this.roomInfo.name + "?userName=" + this.usersProxy.currentUser.name + "&fullScreen=1&createImmediately=1&showChat=false";
            this.javascript.openPopup(_loc_1);
            this.postChat.dispatch("joined the group document.");
            return;
        }// end function

    }
}
