package com.tinychat.model.lists
{
    import com.tinychat.model.api.*;

    public class SelectableUserListItem extends SelectableNamedListItem implements UserIdentity
    {
        private var user:UserIdentity;

        public function SelectableUserListItem(param1:UserIdentity)
        {
            this.user = param1;
            super(param1.name);
            return;
        }// end function

        public function get id() : String
        {
            return this.user.id;
        }// end function

        public function get account() : String
        {
            return this.user.account;
        }// end function

    }
}
