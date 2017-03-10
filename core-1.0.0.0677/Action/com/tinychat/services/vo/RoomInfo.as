package com.tinychat.services.vo
{
    import com.tinychat.model.room.*;
    import com.tinychat.model.room.info.*;

    public class RoomInfo extends Object
    {
        private var _access:RoomAccess;
        private var _name:String;
        private var _namespace:String;
        private var _type:RoomType;
        private var _rtmp:String;
        private var _login:RoomLoginRestriction;
        private var _broadcastMode:RoomBroadcastMode;
        private var _broadcastPassword:String;
        private var _tinychatId:String;
        private var _tinychatName:String;
        private var _domainBlock:String;
        private var _pro:Boolean;
        private var _isRoomOwner:Boolean;
        private var _greenRoom:Boolean;

        public function RoomInfo(param1:RoomAccess, param2:String, param3:String, param4:RoomType, param5:String, param6:RoomLoginRestriction, param7:RoomBroadcastMode, param8:String, param9:String, param10:String, param11:String, param12:Boolean, param13:Boolean, param14:Boolean)
        {
            this._access = param1;
            this._name = param2;
            this._namespace = param3;
            this._type = param4;
            this._rtmp = param5;
            this._login = param6;
            this._broadcastMode = param7;
            this._broadcastPassword = param8;
            this._tinychatId = param9;
            this._tinychatName = param10;
            this._domainBlock = param11;
            this._pro = param12;
            this._isRoomOwner = param13;
            this._greenRoom = param14;
            return;
        }// end function

        public function get access() : RoomAccess
        {
            return this._access;
        }// end function

        public function get name() : String
        {
            return this._name;
        }// end function

        public function get namespace() : String
        {
            return this._namespace;
        }// end function

        public function get type() : RoomType
        {
            return this._type;
        }// end function

        public function get rtmp() : String
        {
            return this._rtmp;
        }// end function

        public function get login() : RoomLoginRestriction
        {
            return this._login;
        }// end function

        public function get broadcastMode() : RoomBroadcastMode
        {
            return this._broadcastMode;
        }// end function

        public function get broadcastPassword() : String
        {
            return this._broadcastPassword;
        }// end function

        public function get tinychatId() : String
        {
            return this._tinychatId;
        }// end function

        public function get tinychatName() : String
        {
            return this._tinychatName;
        }// end function

        public function get domainBlock() : String
        {
            return this._domainBlock;
        }// end function

        public function get pro() : Boolean
        {
            return this._pro;
        }// end function

        public function get isRoomOwner() : Boolean
        {
            return this._isRoomOwner;
        }// end function

        public function get greenRoom() : Boolean
        {
            return this._greenRoom;
        }// end function

        public function toString() : String
        {
            return [this.access, this.name, this.namespace, this.type, this.rtmp, this.login, this.broadcastMode, this.broadcastPassword, this.tinychatId, this.tinychatName, this.domainBlock, this.pro, this.isRoomOwner, this.greenRoom].toString();
        }// end function

    }
}
