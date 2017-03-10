package com.tinychat.model.utils
{
    import __AS3__.vec.*;

    public class FilterFunctions extends Object
    {
        private var strict:Boolean;
        private var functions:Vector.<Function>;

        public function FilterFunctions(param1:Boolean = false)
        {
            this.strict = param1;
            this.functions = new Vector.<Function>;
            return;
        }// end function

        public function add(param1:Function) : void
        {
            this.functions.push(param1);
            return;
        }// end function

        public function apply() : Function
        {
            if (this.functions.length == 0)
            {
                return null;
            }
            return function (param1:Object) : Boolean
            {
                var _loc_2:* = undefined;
                for each (_loc_2 in functions)
                {
                    
                    if (null._loc_2(param1))
                    {
                        null._loc_2(param1);
                    }
                    if (!strict)
                    {
                        return true;
                    }
                    if (!null._loc_2(param1))
                    {
                    }
                    if (strict)
                    {
                        return false;
                    }
                }
                return strict;
            }// end function
            ;
        }// end function

    }
}
