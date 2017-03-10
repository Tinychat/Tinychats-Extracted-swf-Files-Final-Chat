package com.tinychat.model.social.chat.message
{
    import com.tinychat.model.api.*;
    import org.osflash.signals.*;

    public class AbstractUserMessage extends TimestampedMessage implements RenameableUser
    {
        private var user:RenameableUser;
        private var _indent:Boolean = false;
        private static var lastUser:RenameableUser;

        public function AbstractUserMessage(param1:RenameableUser, param2:String, param3:uint)
        {
            super(param2, param3);
            this.user = param1;
            this._indent = param1 != lastUser;
            lastUser = param1;
            return;
        }// end function

        public function get id() : String
        {
            return this.user.id;
        }// end function

        public function get name() : String
        {
            return this.user.name;
        }// end function

        public function get renamed() : ISignal
        {
            return this.user.renamed;
        }// end function

        public function get indent() : Boolean
        {
            return this._indent;
        }// end function

        public function get account() : String
        {
            return this.user.account;
        }// end function

    }
}
