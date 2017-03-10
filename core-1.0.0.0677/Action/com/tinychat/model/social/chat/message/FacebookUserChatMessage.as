package com.tinychat.model.social.chat.message
{
    import com.tinychat.model.social.network.facebook.*;
    import com.tinychat.model.social.network.presence.*;
    import org.osflash.signals.*;

    public class FacebookUserChatMessage extends AbstractUserChatMessage implements FacebookUser
    {
        private var user:FacebookUser;

        public function FacebookUserChatMessage(param1:FacebookUser, param2:String, param3:uint)
        {
            this.user = param1;
            super(param1, param2, param3);
            return;
        }// end function

        public function get firstName() : String
        {
            return this.user.firstName;
        }// end function

        public function get presence() : PresenceType
        {
            return this.user.presence;
        }// end function

        public function get presenceChanged() : ISignal
        {
            return this.user.presenceChanged;
        }// end function

    }
}
