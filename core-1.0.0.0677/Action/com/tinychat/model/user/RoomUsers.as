package com.tinychat.model.user
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.room.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.room.connection.callbacks.arguments.*;

    public class RoomUsers extends Users
    {
        private var settings:RoomSettings;

        public function RoomUsers(param1:ConnectionCallbackReceiver, param2:RoomSettings)
        {
            super(param1, param2);
            this.settings = param2;
            this.settings.roomInfoChanged.add(this.roomInfoChangedHandler);
            currentUserChanged.add(this.currentUserChangedHandler);
            return;
        }// end function

        public function set currentUserName(param1:String) : void
        {
            if (currentUser)
            {
                userKeeper.rename(currentUser, param1);
            }
            return;
        }// end function

        public function ignore(param1:UserIdentity, param2:Boolean) : void
        {
            userKeeper.ignore(param1, param2);
            return;
        }// end function

        override protected function addConnectionCallbackHandlers(param1:ConnectionCallbackReceiver) : void
        {
            super.addConnectionCallbackHandlers(param1);
            param1.deop.add(this.deopHandler);
            param1.oper.add(this.operHandler);
            param1.opers.add(this.opersHandler);
            param1.pro.add(this.proHandler);
            param1.pros.add(this.prosHandler);
            param1.point.add(this.pointsHandler);
            param1.points.add(this.pointsHandler);
            return;
        }// end function

        private function pointsHandler(param1:IdentitiesArgument) : void
        {
            var _loc_2:Identity = null;
            for each (_loc_2 in param1.toIdentities())
            {
                
                userKeeper.pointsUsers(_loc_2 as PointsUser);
            }
            return;
        }// end function

        private function deopHandler(param1:UserArgument) : void
        {
            var _loc_2:* = param1.toUser();
            add(_loc_2);
            userKeeper.deop(_loc_2);
            return;
        }// end function

        private function operHandler(param1:UserArgument) : void
        {
            var _loc_2:* = param1.toUser();
            userKeeper.op(_loc_2);
            return;
        }// end function

        private function opersHandler(param1:IdentitiesArgument) : void
        {
            var _loc_2:Identity = null;
            for each (_loc_2 in param1.toIdentities())
            {
                
                userKeeper.op(_loc_2 as UserIdentity);
            }
            return;
        }// end function

        private function proHandler(param1:RoomCallbackProArguments) : void
        {
            userKeeper.pro(param1.toIdentity(), param1.toRole());
            return;
        }// end function

        private function prosHandler(param1:RoomCallbackProsArguments) : void
        {
            var _loc_2:RoomCallbackProArguments = null;
            for each (_loc_2 in param1.toProUsers())
            {
                
                this.proHandler(_loc_2);
            }
            return;
        }// end function

        private function currentUserChangedHandler(param1:User, param2:User) : void
        {
            this.updatePro();
            return;
        }// end function

        private function roomInfoChangedHandler() : void
        {
            this.updatePro();
            return;
        }// end function

        private function updatePro() : void
        {
            if (currentUser)
            {
                userKeeper.pro(currentUser, this.settings.pro);
            }
            return;
        }// end function

    }
}
