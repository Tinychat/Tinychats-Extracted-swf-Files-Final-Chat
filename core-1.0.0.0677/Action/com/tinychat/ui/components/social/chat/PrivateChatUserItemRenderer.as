package com.tinychat.ui.components.social.chat
{
    import com.tinychat.model.social.chat.conversation.*;
    import com.tinychat.ui.components.social.buttonbar.*;
    import com.tinychat.ui.components.spark.*;
    import flash.events.*;
    import mx.events.*;
    import spark.components.*;

    public class PrivateChatUserItemRenderer extends CountDisplayButtonBarButton implements IDataRenderer
    {
        public var close:Button;
        public var nameDisplay:NameDisplay;
        public var contentGroup:Group;
        private var _data:AbstractUserConversation;
        private var dataChanged:Boolean;
        private var nameChanged:Boolean;
        private static const STATE_UNREAD_MESSAGES:String = "unreadMessages";
        private static var _skinParts:Object = {popupOverlayDisplay:false, iconDisplay:false, nameDisplay:true, contentGroup:true, close:true, labelDisplay:false, iconDisplay2:false};

        public function PrivateChatUserItemRenderer()
        {
            mouseChildren = true;
            addEventListener(FlexEvent.VALUE_COMMIT, this.valueCommitHandler);
            addEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
            addEventListener(Event.REMOVED_FROM_STAGE, this.removedFromStageHandler);
            addEventListener(FlexEvent.SHOW, this.addedToStageHandler);
            addEventListener(FlexEvent.HIDE, this.removedFromStageHandler);
            return;
        }// end function

        override public function set count(param1:uint) : void
        {
            super.count = param1;
            invalidateSkinState();
            return;
        }// end function

        override public function get data() : Object
        {
            return this._data;
        }// end function

        override public function set data(param1:Object) : void
        {
            if (this._data != param1)
            {
                if (this._data)
                {
                    this._data.unreadMessageCountChanged.remove(this.unreadMessageCountChangedHandler);
                }
                this._data = param1 as AbstractUserConversation;
                if (this._data)
                {
                    if (selected)
                    {
                    }
                    if (this._data.unreadMessageCount > 0)
                    {
                        this._data.markAllRead();
                    }
                    this._data.unreadMessageCountChanged.add(this.unreadMessageCountChangedHandler);
                    this.dataChanged = true;
                    invalidateProperties();
                }
                dispatchEvent(new Event(Event.CHANGE));
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            if (this.dataChanged)
            {
            }
            if (this.nameDisplay)
            {
                if (!selected)
                {
                    this.count = this._data.unreadMessageCount;
                }
                this.nameDisplay.user = this._data;
                this.dataChanged = false;
            }
            super.commitProperties();
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.close)
            {
                this.close.addEventListener(MouseEvent.CLICK, this.closeClickHandler);
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == this.close)
            {
                this.close.removeEventListener(MouseEvent.CLICK, this.closeClickHandler);
            }
            return;
        }// end function

        override protected function getCurrentSkinState() : String
        {
            if (!hovered)
            {
            }
            if (count > 0)
            {
                return STATE_UNREAD_MESSAGES;
            }
            return super.getCurrentSkinState();
        }// end function

        override protected function addPopupOverlayToLayout() : void
        {
            this.contentGroup.addElement(popupOverlayDisplayInstance);
            return;
        }// end function

        override protected function removePopupOverlayFromLayout() : void
        {
            this.contentGroup.removeElement(popupOverlayDisplayInstance);
            return;
        }// end function

        override protected function formatCountString() : String
        {
            return "(" + count.toString() + ")";
        }// end function

        protected function addedToStageHandler(event:Event) : void
        {
            if (this._data)
            {
                this.count = this._data.unreadMessageCount;
                this._data.unreadMessageCountChanged.add(this.unreadMessageCountChangedHandler);
                if (selected)
                {
                    this._data.markAllRead();
                }
            }
            addEventListener(FlexEvent.VALUE_COMMIT, this.valueCommitHandler);
            return;
        }// end function

        protected function removedFromStageHandler(event:Event) : void
        {
            if (this._data)
            {
                this._data.unreadMessageCountChanged.remove(this.unreadMessageCountChangedHandler);
            }
            removeEventListener(FlexEvent.VALUE_COMMIT, this.valueCommitHandler);
            return;
        }// end function

        private function closeClickHandler(event:MouseEvent) : void
        {
            if (this._data)
            {
                this._data.markAllRead();
            }
            event.stopImmediatePropagation();
            dispatchEvent(new Event(Event.CLOSE));
            return;
        }// end function

        private function unreadMessageCountChangedHandler(param1:uint) : void
        {
            if (stage)
            {
            }
            if (selected)
            {
            }
            if (param1 > 0)
            {
                this._data.markAllRead();
            }
            else
            {
                this.count = param1;
            }
            return;
        }// end function

        private function valueCommitHandler(event:FlexEvent) : void
        {
            if (selected)
            {
            }
            if (this._data)
            {
                this._data.markAllRead();
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
