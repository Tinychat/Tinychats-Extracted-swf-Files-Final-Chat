package com.facebook.graph.utils
{

    public class FQLMultiQueryParser extends Object implements IResultParser
    {

        public function FQLMultiQueryParser()
        {
            return;
        }// end function

        public function parse(data:Object) : Object
        {
            var _loc_3:String = null;
            var _loc_2:Object = {};
            for (_loc_3 in data)
            {
                
                _loc_2[data[_loc_3].name] = data[_loc_3].fql_result_set;
            }
            return _loc_2;
        }// end function

    }
}
