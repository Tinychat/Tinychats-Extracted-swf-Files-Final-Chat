package com.tinychat.model.social.chat.message
{
    import com.tinychat.model.api.*;
    import org.osflash.signals.*;

    public class TinychatUserChatMessage extends AbstractUserChatMessage implements User
    {
        private var user:User;

        public function TinychatUserChatMessage(param1:User, param2:String, param3:uint)
        {
            super(param1, param2, param3);
            this.user = param1;
            return;
        }// end function

        public function get isLoggedIn() : Boolean
        {
            return this.user.isLoggedIn;
        }// end function

        public function get pro() : uint
        {
            return this.user.pro;
        }// end function

        public function get proChange() : ISignal
        {
            return this.user.proChange;
        }// end function

        public function get points() : uint
        {
            return this.user.points;
        }// end function

        public function get pointsChange() : ISignal
        {
            return this.user.pointsChange;
        }// end function

        public function get achievement() : String
        {
            return this.user.achievement;
        }// end function

        public function get achievementChange() : ISignal
        {
            return this.user.achievementChange;
        }// end function

        public function get ignored() : Boolean
        {
            return this.user.ignored;
        }// end function

        public function get ignoreChange() : ISignal
        {
            return this.user.ignoreChange;
        }// end function

        public function get operator() : Boolean
        {
            return this.user.operator;
        }// end function

        public function get operatorChange() : ISignal
        {
            return this.user.operatorChange;
        }// end function

    }
}
