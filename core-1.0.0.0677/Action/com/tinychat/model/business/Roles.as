package com.tinychat.model.business
{

    public class Roles extends Object
    {

        public function Roles()
        {
            return;
        }// end function

        public static function get GOLD() : uint
        {
            return 30;
        }// end function

        public static function get EXTREME() : uint
        {
            return 20;
        }// end function

        public static function get PRO() : uint
        {
            return 10;
        }// end function

        public static function get FREE() : uint
        {
            return 0;
        }// end function

        public static function isGold(param1:uint) : Boolean
        {
            return param1 == GOLD;
        }// end function

        public static function isExtreme(param1:uint) : Boolean
        {
            return param1 == EXTREME;
        }// end function

        public static function isPro(param1:uint) : Boolean
        {
            return param1 == PRO;
        }// end function

        public static function isFree(param1:uint) : Boolean
        {
            return param1 == FREE;
        }// end function

        public static function inLessRoleThan(param1:uint, param2:uint) : Boolean
        {
            return param1 < param2;
        }// end function

        public static function inRoleAndMore(param1:uint, param2:uint) : Boolean
        {
            return param1 >= param2;
        }// end function

    }
}
