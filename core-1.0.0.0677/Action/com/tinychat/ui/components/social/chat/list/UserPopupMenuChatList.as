package com.tinychat.ui.components.social.chat.list
{
    import com.tinychat.model.api.*;
    import com.tinychat.ui.components.popupmenu.*;
    import flash.geom.*;
    import spark.events.*;

    public class UserPopupMenuChatList extends ChatList
    {
        public var userPopupMenu:TinychatUserPopupMenu;
        private static var _skinParts:Object = {dataGroup:false, textSelectionCanvas:true, verticalScrollBar:true, userPopupMenu:true};

        public function UserPopupMenuChatList()
        {
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == dataGroup)
            {
                dataGroup.addEventListener(RendererExistenceEvent.RENDERER_ADD, this.rendererAddHandler);
                dataGroup.addEventListener(RendererExistenceEvent.RENDERER_REMOVE, this.rendererRemoveHandler);
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == dataGroup)
            {
                dataGroup.removeEventListener(RendererExistenceEvent.RENDERER_ADD, this.rendererAddHandler);
                dataGroup.removeEventListener(RendererExistenceEvent.RENDERER_REMOVE, this.rendererRemoveHandler);
            }
            return;
        }// end function

        private function rendererAddHandler(event:RendererExistenceEvent) : void
        {
            ChatListItemRenderer(event.renderer).userClicked.add(this.userClickedHandler);
            return;
        }// end function

        private function rendererRemoveHandler(event:RendererExistenceEvent) : void
        {
            if (event.renderer)
            {
                ChatListItemRenderer(event.renderer).userClicked.remove(this.userClickedHandler);
            }
            return;
        }// end function

        private function userClickedHandler(param1:RenameableUser, param2:Point) : void
        {
            this.userPopupMenu.user = param1;
            this.userPopupMenu.open(globalToLocal(param2));
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
