package com.tinychat.model.login
{
    import com.tinychat.model.social.network.presence.*;
    import com.tinychat.model.user.*;
    import org.osflash.signals.*;

    public class GuestUser extends UniqueUser implements SocialNetworkUser
    {
        private static var dummy:Signal = new Signal();

        public function GuestUser(param1:String, param2:String)
        {
            super(param1, param2);
            return;
        }// end function

        public function get renamed() : ISignal
        {
            return dummy;
        }// end function

        public function get presence() : PresenceType
        {
            return PresenceType.ONLINE;
        }// end function

        public function get presenceChanged() : ISignal
        {
            return dummy;
        }// end function

    }
}
