package com.tinychat.ui.components.social.chat.list
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.business.*;
    import com.tinychat.model.social.chat.encoding.*;
    import com.tinychat.model.social.chat.message.*;
    import com.tinychat.ui.components.spark.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.text.engine.*;
    import flashx.textLayout.compose.*;
    import mx.controls.*;
    import mx.core.*;
    import org.osflash.signals.*;

    public class ChatListItemRenderer extends UIComponent implements IDataRenderer, IItemRenderer
    {
        private var _data:Object;
        private var _itemIndex:int;
        private var _messageEncoder:TextEncoder;
        private var _timestampEncoder:TextEncoder;
        private var _userEncoder:TextEncoder;
        private var proBadge:VectorImage;
        private var giftImage:Image;
        private var iconAchiev:Image;
        private var userText:MessageText;
        private var messageText:MessageText;
        private var commentText:MessageText;
        private var timestampText:MessageText;
        private var userVisible:Boolean;
        private var timestampVisible:Boolean;
        private var proBadgeVisible:Boolean;
        private var iconAchievVisible:Boolean;
        private var lastDrawUnscaledWidth:Number = 0;
        private var firstLineHeight:Number = 0;
        private var _userRole:uint = 0;
        private var dataChanged:Boolean;
        private var _userClicked:Signal;
        private static const USER_PADDING:uint = 4;
        private static const TIMESTAMP_PADDING:uint = 8;
        private static const GIFT_PADDING:uint = 15;
        public static var lineHeight:Number = 22;

        public function ChatListItemRenderer()
        {
            this._userClicked = new Signal(RenameableUser, Point);
            return;
        }// end function

        public function get userClicked() : ISignal
        {
            return this._userClicked;
        }// end function

        public function get data() : Object
        {
            return this._data;
        }// end function

        public function set data(param1:Object) : void
        {
            if (this._data != param1)
            {
                this._data = param1;
                this.dataChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function get itemIndex() : int
        {
            return this._itemIndex;
        }// end function

        public function set itemIndex(param1:int) : void
        {
            if (this._itemIndex != param1)
            {
                this._itemIndex = param1;
                invalidateDisplayList();
            }
            return;
        }// end function

        public function set userEncoder(param1:TextEncoder) : void
        {
            this._userEncoder = param1;
            return;
        }// end function

        public function set messageEncoder(param1:TextEncoder) : void
        {
            this._messageEncoder = param1;
            return;
        }// end function

        public function set timestampEncoder(param1:TextEncoder) : void
        {
            this._timestampEncoder = param1;
            return;
        }// end function

        public function get firstLine() : TextLine
        {
            return this.messageText.firstLine;
        }// end function

        public function get lastLine() : TextLine
        {
            return this.messageText.lastLine;
        }// end function

        override protected function createChildren() : void
        {
            super.createChildren();
            var _loc_1:* = ISWFContext(getFontContext(this._timestampEncoder.family, false, false, true));
            this.userText = new MessageText(this._userEncoder, _loc_1);
            this.timestampText = new MessageText(this._timestampEncoder, _loc_1);
            this.messageText = new MessageText(this._messageEncoder, _loc_1);
            this.commentText = new MessageText(this._messageEncoder, _loc_1);
            addChild(this.messageText);
            this.messageText.x = 0;
            this.messageText.y = 0;
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.dataChanged)
            {
            }
            if (this.data)
            {
                this.lastDrawUnscaledWidth = 0;
                if (this._data is TinychatUserChatMessage)
                {
                    this.toggleProBadge(TinychatUserChatMessage(this._data).pro);
                    this.iconAchievBadge(TinychatUserChatMessage(this._data).achievement);
                }
                else
                {
                    this.toggleProBadge(Roles.FREE);
                    this.iconAchievBadge(null);
                }
                this.giftBadge(this.isGiftMessage);
                if (this._data is AbstractUserMessage)
                {
                    this.showUser();
                }
                else
                {
                    this.hideUser();
                }
                if (this._data is TimestampedMessage)
                {
                    this.showTimestamp();
                }
                else
                {
                    this.hideTimestamp();
                }
                this.renderText(getMaxBoundsWidth() - this.giftBadgeWidth);
                invalidateDisplayList();
                this.dataChanged = false;
            }
            return;
        }// end function

        override protected function measure() : void
        {
            super.measure();
            measuredWidth = Math.ceil(this.messageText.width);
            measuredHeight = Math.ceil(Math.max(this.userText.height, this.messageText.height + this.commentText.height, this.timestampText.height, this.giftBadgeHeight));
            measuredMinWidth = measuredWidth;
            measuredMinHeight = measuredHeight;
            return;
        }// end function

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            super.updateDisplayList(param1, param2);
            if (param1 != 0)
            {
            }
            if (param1 != this.lastDrawUnscaledWidth)
            {
                this.renderText(param1 - this.giftBadgeWidth);
                this.layoutText();
                if (this.timestampVisible)
                {
                    this.timestampText.x = param1 - this.timestampText.width;
                }
                this.lastDrawUnscaledWidth = param1;
                invalidateSize();
            }
            return;
        }// end function

        private function renderText(param1:Number) : void
        {
            var _loc_3:uint = 0;
            var _loc_2:* = param1 - this.proBadgeWidth - this.iconAchievWidth;
            this.firstLineHeight = 0;
            if (this._data is AbstractUserMessage)
            {
                if (this._data is AbstractUserChatMessage)
                {
                }
                if (this.userMessage.indent)
                {
                    this.firstLineHeight = 5;
                }
                this.userText.text = this._data is AbstractUserChatMessage ? (this.userMessage.name + ":") : (this.userMessage.name);
                _loc_3 = 5460819;
                if (Roles.isPro(this._userRole))
                {
                    _loc_3 = 2070553;
                }
                else if (Roles.isExtreme(this._userRole))
                {
                    _loc_3 = 8461186;
                }
                else if (Roles.isGold(this._userRole))
                {
                    _loc_3 = 15836672;
                }
                if (this.isGiftMessage)
                {
                    _loc_3 = 29452;
                }
                this.userText.color = _loc_3;
                this.userText.weight = FontWeight.BOLD;
                this.userText.render(param1, param1, lineHeight, this.firstLineHeight);
                _loc_2 = Math.max(0, _loc_2 - this.userText.width);
            }
            if (this._data is TimestampedMessage)
            {
                this.timestampText.text = this.timestampedMessage.timestampString;
                this.timestampText.render(param1, param1, lineHeight, this.firstLineHeight);
                _loc_2 = Math.max(0, _loc_2 - (this.timestampText.width + TIMESTAMP_PADDING));
            }
            if (this.isGiftMessage)
            {
                this.commentText.text = this.getGiftComments;
                this.commentText.color = 9934743;
                this.commentText.render(_loc_2, param1, lineHeight, this.firstLineHeight);
            }
            this.messageText.text = this.coloredMessage.text;
            this.messageText.color = this.coloredMessage.color;
            this.messageText.render(_loc_2, param1, lineHeight, this.firstLineHeight);
            return;
        }// end function

        private function layoutText() : void
        {
            var _loc_1:* = this.proBadgeWidth + this.iconAchievWidth;
            if (this._data is AbstractUserMessage)
            {
                this.userText.x = this.proBadgeWidth + this.iconAchievWidth + this.giftBadgeWidth;
                this.userText.layout();
                _loc_1 = _loc_1 + (this.userText.width + USER_PADDING);
            }
            if (this._data is TimestampedMessage)
            {
                this.timestampText.layout();
            }
            if (this.iconAchiev)
            {
                this.iconAchiev.move(this.proBadgeWidth, this.firstLineHeight - 2);
            }
            if (this.proBadge)
            {
                this.proBadge.y = this.firstLineHeight;
            }
            this.messageText.x = this.giftBadgeWidth;
            this.messageText.layout(_loc_1);
            if (this.isGiftMessage)
            {
                this.commentText.x = this.messageText.x;
                this.commentText.layout();
            }
            if (this.isGiftMessage)
            {
            }
            var _loc_2:* = this.giftBadgeHeight > this.messageText.height + this.commentText.height ? (Math.ceil((this.giftBadgeHeight - this.messageText.height - this.commentText.height) / 2)) : (0);
            this.userText.y = this.giftBadgeHeight > this.messageText.height + this.commentText.height ? (Math.ceil((this.giftBadgeHeight - this.messageText.height - this.commentText.height) / 2)) : (0);
            this.messageText.y = _loc_2;
            this.commentText.y = this.messageText.y + this.messageText.height;
            return;
        }// end function

        private function showUser() : void
        {
            if (!this.userVisible)
            {
                this.userText.addEventListener(MouseEvent.CLICK, this.userClickedHandler);
                addChild(this.userText);
                this.userText.y = 0;
                this.userVisible = true;
            }
            return;
        }// end function

        private function hideUser() : void
        {
            if (this.userVisible)
            {
                this.userText.removeEventListener(MouseEvent.CLICK, this.userClickedHandler);
                removeChild(this.userText);
                this.userVisible = false;
            }
            return;
        }// end function

        private function showTimestamp() : void
        {
            if (!this.timestampVisible)
            {
                addChild(this.timestampText);
                this.timestampText.y = 0;
                this.timestampVisible = true;
            }
            return;
        }// end function

        private function hideTimestamp() : void
        {
            if (this.timestampVisible)
            {
                removeChild(this.timestampText);
                this.timestampVisible = false;
            }
            return;
        }// end function

        private function giftBadge(param1:Boolean) : void
        {
            if (param1)
            {
            }
            if (!this.giftImage)
            {
                this.giftImage = new Image();
                this.giftImage.smoothBitmapContent = true;
                this.giftImage.maintainAspectRatio = true;
                this.giftImage.width = 65;
                this.giftImage.height = 65;
            }
            if (this.giftImage)
            {
                if (param1)
                {
                    this.giftImage.source = this.getGiftUrl;
                    addChild(this.giftImage);
                    addChild(this.commentText);
                }
                else
                {
                    this.giftImage.source = null;
                    removeChild(this.giftImage);
                    this.giftImage = null;
                    removeChild(this.commentText);
                }
            }
            return;
        }// end function

        private function toggleProBadge(param1:uint) : void
        {
            this._userRole = param1;
            var _loc_2:Boolean = false;
            if (_loc_2)
            {
            }
            if (!this.proBadge)
            {
            }
            if (getStyle("proBadgeIcon") != undefined)
            {
                this.proBadge = new VectorImage();
                this.proBadge.source = getStyle("proBadgeIcon");
                this.proBadge.width = getStyle("proBadgeIconWidth");
            }
            if (this.proBadge)
            {
                if (_loc_2)
                {
                }
                if (!contains(this.proBadge))
                {
                    addChild(this.proBadge);
                    this.proBadgeVisible = true;
                }
                else
                {
                    if (!_loc_2)
                    {
                    }
                    if (contains(this.proBadge))
                    {
                        removeChild(this.proBadge);
                        this.proBadgeVisible = false;
                    }
                }
            }
            return;
        }// end function

        private function iconAchievBadge(param1:String) : void
        {
            if (param1)
            {
            }
            if (param1.length > 0)
            {
            }
            if (!this.iconAchiev)
            {
                this.iconAchiev = new Image();
                this.iconAchiev.smoothBitmapContent = true;
                this.iconAchiev.maintainAspectRatio = true;
                this.iconAchiev.setActualSize(14, 14);
            }
            if (this.iconAchiev)
            {
                if (param1)
                {
                    this.iconAchiev.source = param1;
                    addChild(this.iconAchiev);
                    this.iconAchievVisible = true;
                }
                else
                {
                    this.iconAchiev.source = null;
                    removeChild(this.iconAchiev);
                    this.iconAchiev = null;
                    this.iconAchievVisible = false;
                }
            }
            return;
        }// end function

        private function get proBadgeWidth() : Number
        {
            if (this.proBadgeVisible)
            {
            }
            return !isNaN(this.proBadge.width) ? (this.proBadge.width + USER_PADDING) : (0);
        }// end function

        private function get iconAchievWidth() : Number
        {
            if (this.iconAchievVisible)
            {
            }
            return !isNaN(this.iconAchiev.width) ? (this.iconAchiev.width + USER_PADDING) : (0);
        }// end function

        private function get giftBadgeWidth() : Number
        {
            if (this.giftImage)
            {
            }
            return !isNaN(this.giftImage.width) ? (this.giftImage.width + GIFT_PADDING) : (0);
        }// end function

        private function get giftBadgeHeight() : Number
        {
            if (this.giftImage)
            {
            }
            return !isNaN(this.giftImage.height) ? (this.giftImage.height) : (0);
        }// end function

        private function get userMessage() : AbstractUserMessage
        {
            return AbstractUserMessage(this._data);
        }// end function

        private function get isGiftMessage() : Boolean
        {
            if (!(this._data is AbstractGiftMessage))
            {
            }
            return this._data is AbstractGiftUserMessage;
        }// end function

        private function get getGiftUrl() : String
        {
            return this.isGiftMessage ? (this._data["url"]) : ("");
        }// end function

        private function get getGiftComments() : String
        {
            return this.isGiftMessage ? (this._data["comment"]) : ("");
        }// end function

        private function get timestampedMessage() : TimestampedMessage
        {
            return TimestampedMessage(this._data);
        }// end function

        private function get coloredMessage() : ColoredMessage
        {
            return ColoredMessage(this._data);
        }// end function

        private function userClickedHandler(event:MouseEvent) : void
        {
            this._userClicked.dispatch(this.userMessage, new Point(event.stageX, event.stageY));
            return;
        }// end function

        public function get dragging() : Boolean
        {
            return false;
        }// end function

        public function set dragging(param1:Boolean) : void
        {
            return;
        }// end function

        public function get label() : String
        {
            return "";
        }// end function

        public function set label(param1:String) : void
        {
            return;
        }// end function

        public function get selected() : Boolean
        {
            return false;
        }// end function

        public function set selected(param1:Boolean) : void
        {
            return;
        }// end function

        public function get showsCaret() : Boolean
        {
            return false;
        }// end function

        public function set showsCaret(param1:Boolean) : void
        {
            return;
        }// end function

    }
}
