package com.tinychat.model.utils
{
    import mx.collections.*;

    public interface IListDataproviderComponent
    {

        public function IListDataproviderComponent();

        function get dataProvider() : IList;

        function set dataProvider(param1:IList) : void;

    }
}
