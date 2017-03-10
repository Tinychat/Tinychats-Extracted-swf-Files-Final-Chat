package com.tinychat.ui.mediators.controlbar.buttons
{
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.controller.commands.state.signals.*;
    import com.tinychat.controller.commands.utils.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;
    import com.tinychat.ui.components.controlbar.buttons.*;
    import flash.events.*;
    import mx.collections.*;
    import org.robotlegs.mvcs.*;

    public class SettingsButtonMediator extends Mediator
    {
        private var currentUser:User;
        public var view:SettingsButton;
        public var users:RoomUsers;
        public var dispatchSignal:DispatchSignal;
        public var triggerStateAction:TriggerStateAction;
        public var openLink:OpenLink;
        private static const DEVELOPMENT_NEWS_LINK:String = "http://twitter.com/tinychatdev";
        private static const APPLICATION_SETTINGS:String = "applicationSettings";
        private static const AUTO_BAN_WORD_LIST:String = "autoBanWordList";
        private static const BAN_LIST:String = "banList";
        private static const DEVELOPMENT_NEWS:String = "developmentNews";
        private static const TOPIC:String = "topic";
        private static const APPLICATION_SETTINGS_ITEM:Object = {label:"Application settings", value:APPLICATION_SETTINGS};
        private static const AUTO_BAN_WORD_LIST_ITEM:Object = {label:"Auto ban word list", value:AUTO_BAN_WORD_LIST};
        private static const BAN_LIST_ITEM:Object = {label:"Ban list", value:BAN_LIST};
        private static const DEVELOPMENT_NEWS_ITEM:Object = {label:"Development news", value:DEVELOPMENT_NEWS};
        private static const TOPIC_ITEM:Object = {label:"Change topic", value:TOPIC};
        private static const everyoneItems:Array = [APPLICATION_SETTINGS_ITEM, DEVELOPMENT_NEWS_ITEM];
        private static const operatorItems:Array = [TOPIC_ITEM, BAN_LIST_ITEM];

        public function SettingsButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.labelField = "label";
            this.view.toolTip = "Settings";
            this.currentUser = this.users.currentUser;
            this.setAvailableOptions();
            this.users.currentUserChanged.add(this.currentUserChanged);
            eventMap.mapListener(this.view, Event.CHANGE, this.changeHandler, Event);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.users.currentUserChanged.remove(this.currentUserChanged);
            if (this.currentUser)
            {
                this.currentUser.operatorChange.remove(this.operatorChangeHandler);
            }
            return;
        }// end function

        private function setAvailableOptions() : void
        {
            var _loc_1:* = everyoneItems.concat();
            if (this.currentUser)
            {
            }
            if (this.currentUser.operator)
            {
                _loc_1 = _loc_1.concat(operatorItems);
            }
            this.view.dataProvider = new ArrayList(_loc_1);
            this.view.enabled = _loc_1.length > 0;
            return;
        }// end function

        private function currentUserChanged(param1:User, param2:User) : void
        {
            if (param1)
            {
                param1.operatorChange.remove(this.operatorChangeHandler);
            }
            if (param2)
            {
                this.currentUser = param2;
                this.currentUser.operatorChange.add(this.operatorChangeHandler);
                this.setAvailableOptions();
            }
            return;
        }// end function

        private function operatorChangeHandler(param1:Boolean) : void
        {
            this.setAvailableOptions();
            return;
        }// end function

        private function changeHandler(event:Event) : void
        {
            switch(this.view.selectedItem)
            {
                case APPLICATION_SETTINGS_ITEM:
                {
                    this.triggerStateAction.dispatch(StateAction.SHOW_APPLICATION_SETTINGS);
                    break;
                }
                case AUTO_BAN_WORD_LIST_ITEM:
                {
                    this.triggerStateAction.dispatch(StateAction.SHOW_AUTO_BAN_WORD_LIST);
                    break;
                }
                case BAN_LIST_ITEM:
                {
                    this.triggerStateAction.dispatch(StateAction.SHOW_BAN_LIST);
                    break;
                }
                case DEVELOPMENT_NEWS_ITEM:
                {
                    this.openLink.dispatch(DEVELOPMENT_NEWS_LINK);
                    break;
                }
                case TOPIC_ITEM:
                {
                    this.triggerStateAction.dispatch(StateAction.CHANGE_TOPIC);
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        private function invokeSignal(param1:Class, param2:Array = null) : void
        {
            if (!param2)
            {
            }
            param2 = [];
            this.dispatchSignal.dispatch(param1, param2);
            return;
        }// end function

    }
}
