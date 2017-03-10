package com.tinychat.model.menuoption.media
{
    import com.tinychat.model.guards.media.*;
    import com.tinychat.model.validation.*;
    import com.tinychat.model.validation.media.*;

    public class PlayMediaMenuOption extends AbstractMediaModeratorUserMenuOption
    {

        public function PlayMediaMenuOption(param1:IsMediaModeratorGuard, param2:MediaIsPaused)
        {
            super("Play", param1, this.Vector.<IdentityValidation>([param2]));
            return;
        }// end function

    }
}
