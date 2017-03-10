package com.tinychat.model.room.connection.callbacks.arguments
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;

    public class RoomCallbackGiftArguments extends RoomCallbackArgumentsBase
    {

        public function RoomCallbackGiftArguments(param1:Array)
        {
            super(param1);
            return;
        }// end function

        public function get isIncognito() : Boolean
        {
            return args[0] == null;
        }// end function

        public function get fromID() : Identity
        {
            return new UniqueUser(this.isIncognito ? ("") : (args[0].id), "");
        }// end function

        public function get fromName() : String
        {
            return this.isIncognito ? ("") : (args[0].name);
        }// end function

        public function get fromUrl() : String
        {
            return this.isIncognito ? ("") : (args[0].url);
        }// end function

        public function get toID() : Identity
        {
            return new UniqueUser(args[1].id, "");
        }// end function

        public function get toName() : String
        {
            return args[1].name;
        }// end function

        public function get toUrl() : String
        {
            return args[1].url;
        }// end function

        public function get comment() : String
        {
            return args[2].comment;
        }// end function

        public function get ext() : int
        {
            return args[2].ext;
        }// end function

        public function get giftName() : String
        {
            return args[2].name;
        }// end function

        public function get giftStore() : String
        {
            return args[2].store;
        }// end function

        public function get giftUrl() : String
        {
            return args[2].url;
        }// end function

    }
}
