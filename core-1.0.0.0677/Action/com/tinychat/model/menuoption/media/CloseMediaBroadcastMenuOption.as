package com.tinychat.model.menuoption.media
{
    import com.tinychat.model.guards.media.*;

    public class CloseMediaBroadcastMenuOption extends AbstractMediaModeratorUserMenuOption
    {

        public function CloseMediaBroadcastMenuOption(param1:IsMediaModeratorGuard)
        {
            super("Close broadcast", param1);
            return;
        }// end function

    }
}
