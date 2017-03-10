package com.tinychat.model.social.chat.spam
{
    import __AS3__.vec.*;
    import com.tinychat.model.social.chat.message.*;

    public interface SpamFilter
    {

        public function SpamFilter();

        function filter(param1:TimestampedMessage, param2:Vector.<TimestampedMessage>) : Boolean;

    }
}
