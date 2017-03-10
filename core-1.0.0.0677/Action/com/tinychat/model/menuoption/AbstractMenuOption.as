package com.tinychat.model.menuoption
{
    import __AS3__.vec.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.validation.*;

    public class AbstractMenuOption extends Object implements MenuOption
    {
        private var _name:String;
        private var validators:Vector.<IdentityValidation>;

        public function AbstractMenuOption(param1:String, param2:Vector.<IdentityValidation> = null)
        {
            this._name = param1;
            if (param2)
            {
                this.validators = param2;
            }
            else
            {
                this.validators = new Vector.<IdentityValidation>;
            }
            return;
        }// end function

        public function get name() : String
        {
            return this._name;
        }// end function

        public function get enabled() : Boolean
        {
            return true;
        }// end function

        public function isValid(param1:Identity) : Boolean
        {
            var identity:* = param1;
            return this.validators.every(function (param1:Object, param2:int, param3:Vector.<IdentityValidation>) : Boolean
            {
                return param1.isValid(identity);
            }// end function
            );
        }// end function

    }
}
