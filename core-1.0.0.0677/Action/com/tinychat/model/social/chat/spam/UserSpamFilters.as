package com.tinychat.model.social.chat.spam
{
    import __AS3__.vec.*;
    import com.tinychat.model.social.chat.message.*;
    import flash.utils.*;

    public class UserSpamFilters extends Object
    {
        private var userSpamFilterMap:Dictionary;
        private var filters:Vector.<SpamFilter>;
        private var historyTimeLength:Number;
        private var maxHistoryLength:uint;

        public function UserSpamFilters(param1:Vector.<SpamFilter>, param2:Number = 30000, param3:uint = 5)
        {
            this.userSpamFilterMap = new Dictionary(true);
            this.filters = param1;
            this.historyTimeLength = param2;
            this.maxHistoryLength = param3;
            return;
        }// end function

        public function filter(param1:AbstractUserChatMessage) : Boolean
        {
            var _loc_2:SpamFilters = null;
            if (!this.userSpamFilterMap[param1.id])
            {
                _loc_2 = new SpamFilters(this.filters, this.historyTimeLength, this.maxHistoryLength);
                this.userSpamFilterMap[param1.id] = _loc_2;
            }
            else
            {
                _loc_2 = this.userSpamFilterMap[param1.id];
            }
            return _loc_2.filter(param1);
        }// end function

    }
}
