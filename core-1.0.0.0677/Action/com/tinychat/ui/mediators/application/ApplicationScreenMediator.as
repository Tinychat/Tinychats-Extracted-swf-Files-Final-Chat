package com.tinychat.ui.mediators.application
{
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.layout.*;
    import com.tinychat.model.room.*;
    import com.tinychat.model.social.chat.message.*;
    import com.tinychat.ui.components.application.*;
    import org.robotlegs.mvcs.*;

    public class ApplicationScreenMediator extends Mediator
    {
        public var view:ApplicationScreen;
        public var applicationLayout:ApplicationLayout;
        public var broadcasts:RoomBroadcastCanvasBroadcasts;
        public var roomInfo:RoomSettingsProxy;
        public var selected:CountMessage;

        public function ApplicationScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.applicationLayout = this.applicationLayout;
            this.view.broadcasts = this.broadcasts;
            this.view.roomInfo = this.roomInfo;
            this.view.selectedChat = this.selected;
            return;
        }// end function

    }
}
