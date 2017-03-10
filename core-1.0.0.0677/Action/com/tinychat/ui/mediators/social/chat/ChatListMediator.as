package com.tinychat.ui.mediators.social.chat
{
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.model.flashvars.*;
    import com.tinychat.ui.components.social.chat.list.*;
    import org.robotlegs.mvcs.*;

    public class ChatListMediator extends Mediator
    {
        public var view:ChatList;
        public var flashvars:FlashvarsProxy;
        public var openLink:OpenLink;

        public function ChatListMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.enableSmileys = this.flashvars.chatSmileys;
            this.view.enableLinks = this.flashvars.chatLinks;
            if (this.flashvars.chatLinks)
            {
                this.view.linkClicked.add(this.linkClickedHandler);
            }
            return;
        }// end function

        override public function onRemove() : void
        {
            this.view.linkClicked.remove(this.linkClickedHandler);
            return;
        }// end function

        private function linkClickedHandler(param1:String) : void
        {
            this.openLink.dispatch(param1);
            return;
        }// end function

    }
}
