package com.tinychat.model.menuoption
{

    public interface MenuOption extends IdentityValidation, Named
    {

        public function MenuOption();

        function get enabled() : Boolean;

    }
}
