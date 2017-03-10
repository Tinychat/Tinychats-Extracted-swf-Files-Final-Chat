package com.tinychat.model.menuoption.media
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.guards.media.*;

    public class ReadOnlyDurationMediaBroadcastMenuOption extends AbstractMediaModeratorUserMenuOption
    {

        public function ReadOnlyDurationMediaBroadcastMenuOption(param1:IsMediaModeratorGuard)
        {
            super("Duration", param1);
            return;
        }// end function

        override public function get enabled() : Boolean
        {
            return false;
        }// end function

        override public function isValid(param1:Identity) : Boolean
        {
            return !super.isValid(param1);
        }// end function

    }
}
