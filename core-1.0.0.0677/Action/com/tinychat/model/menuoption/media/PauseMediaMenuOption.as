package com.tinychat.model.menuoption.media
{
    import com.tinychat.model.guards.media.*;
    import com.tinychat.model.validation.*;
    import com.tinychat.model.validation.media.*;

    public class PauseMediaMenuOption extends AbstractMediaModeratorUserMenuOption
    {

        public function PauseMediaMenuOption(param1:IsMediaModeratorGuard, param2:MediaIsPlaying)
        {
            super("Pause", param1, this.Vector.<IdentityValidation>([param2]));
            return;
        }// end function

    }
}
