package com.tinychat.model.social.network.presence
{
    import com.tinychat.model.signals.*;

    public class PresenceChanged extends AbstractReadOnlySignal
    {

        public function PresenceChanged()
        {
            super(PresenceType, PresenceType);
            return;
        }// end function

        public function dispatch(param1:PresenceType, param2:PresenceType) : void
        {
            signal.dispatch(param1, param2);
            return;
        }// end function

    }
}
