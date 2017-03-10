package com.tinychat.model.room.connection.calls
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.room.connection.*;

    public class RoomCallPrivmsg extends Object implements RoomMethod
    {
        private var message:String;
        private var color:uint;
        private var recipient:UserIdentity;
        private var broadcaster:Boolean;

        public function RoomCallPrivmsg(param1:String, param2:uint, param3:UserIdentity, param4:Boolean = false)
        {
            this.message = param1;
            this.color = param2;
            this.recipient = param3;
            this.broadcaster = param4;
            return;
        }// end function

        public function callOn(param1:AS3NetConnection) : void
        {
            var _loc_5:String = null;
            var _loc_2:Array = [];
            var _loc_3:* = "#" + this.color.toString(16) + ",en";
            var _loc_4:int = 0;
            while (_loc_4 < this.message.length)
            {
                
                _loc_2.push(this.message.charCodeAt(_loc_4).toString());
                _loc_4 = _loc_4 + 1;
            }
            if (this.recipient)
            {
                if (this.broadcaster)
                {
                    _loc_5 = "b" + this.recipient.id + "-" + this.recipient.name;
                }
                else
                {
                    _loc_5 = "n" + this.recipient.id + "-" + this.recipient.name;
                }
                param1.call(RoomCallMethodNames.PRIVMSG, null, _loc_2.join(","), _loc_3, _loc_5);
            }
            else
            {
                param1.call(RoomCallMethodNames.PRIVMSG, null, _loc_2.join(","), _loc_3);
            }
            return;
        }// end function

    }
}
