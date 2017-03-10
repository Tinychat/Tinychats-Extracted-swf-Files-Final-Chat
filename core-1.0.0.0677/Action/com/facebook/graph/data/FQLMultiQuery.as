package com.facebook.graph.data
{
    import com.adobe.serialization.json.*;

    public class FQLMultiQuery extends Object
    {
        public var queries:Object;

        public function FQLMultiQuery()
        {
            this.queries = {};
            return;
        }// end function

        public function add(query:String, name:String, values:Object = null) : void
        {
            var _loc_4:String = null;
            if (this.queries.hasOwnProperty(name))
            {
                throw new Error("Query name already exists, there cannot be duplicate names");
            }
            for (_loc_4 in values)
            {
                
                query = query.replace(new RegExp("\\{" + _loc_4 + "\\}", "g"), values[_loc_4]);
            }
            this.queries[name] = query;
            return;
        }// end function

        public function toString() : String
        {
            return JSON.encode(this.queries);
        }// end function

    }
}
