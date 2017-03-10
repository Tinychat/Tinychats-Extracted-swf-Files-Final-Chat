package com.tinychat.model.menuoption.media
{
    import __AS3__.vec.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.guards.media.*;
    import com.tinychat.model.menuoption.*;

    public class AbstractMediaModeratorUserMenuOption extends AbstractMenuOption
    {
        private var isMediaModerator:IsMediaModeratorGuard;

        public function AbstractMediaModeratorUserMenuOption(param1:String, param2:IsMediaModeratorGuard, param3:Vector.<IdentityValidation> = null)
        {
            this.isMediaModerator = param2;
            super(param1, param3);
            return;
        }// end function

        override public function isValid(param1:Identity) : Boolean
        {
            if (super.isValid(param1))
            {
                super.isValid(param1);
            }
            return this.isMediaModerator.approve();
        }// end function

    }
}
