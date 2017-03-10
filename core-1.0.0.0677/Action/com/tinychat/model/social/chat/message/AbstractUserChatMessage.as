package com.tinychat.model.social.chat.message
{
    import com.tinychat.model.api.*;

    public class AbstractUserChatMessage extends AbstractUserMessage
    {

        public function AbstractUserChatMessage(param1:RenameableUser, param2:String, param3:uint)
        {
            super(param1, param2, param3);
            return;
        }// end function

        override public function toString() : String
        {
            return "[" + timestampString + "] " + name + ": " + text;
        }// end function

    }
}
