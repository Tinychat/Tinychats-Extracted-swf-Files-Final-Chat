package com.tinychat.model.menuoption.media
{
    import com.tinychat.model.guards.media.*;

    public class EditableDurationMediaBroadcastMenuOption extends AbstractMediaModeratorUserMenuOption
    {

        public function EditableDurationMediaBroadcastMenuOption(param1:IsMediaModeratorGuard)
        {
            super("Duration", param1);
            return;
        }// end function

    }
}
