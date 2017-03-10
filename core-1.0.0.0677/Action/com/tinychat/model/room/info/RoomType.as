package com.tinychat.model.room.info
{

    public class RoomType extends Object
    {
        private var value:String;
        public static const DEFAULT:RoomType = new RoomType(DEFAULT, "default");
        public static const GROUP:RoomType = new RoomType(GROUP, "group");
        public static const READONLY:RoomType = new RoomType(READONLY, "readonly");
        public static const SHOW:RoomType = new RoomType(SHOW, "show");

        public function RoomType(param1:RoomType, param2:String)
        {
            this.value = param2;
            return;
        }// end function

        public function toString() : String
        {
            return this.value;
        }// end function

        public static function fromString(param1:String) : RoomType
        {
            switch(param1)
            {
                case DEFAULT.value:
                {
                    return DEFAULT;
                }
                case GROUP.value:
                {
                    return GROUP;
                }
                case READONLY.value:
                {
                    return READONLY;
                }
                case SHOW.value:
                {
                    return SHOW;
                }
                default:
                {
                    return DEFAULT;
                    break;
                }
            }
        }// end function

    }
}
