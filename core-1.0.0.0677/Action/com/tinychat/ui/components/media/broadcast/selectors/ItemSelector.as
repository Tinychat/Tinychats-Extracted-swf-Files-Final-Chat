package com.tinychat.ui.components.broadcast.selectors
{

    public interface ItemSelector extends IListDataproviderComponent
    {

        public function ItemSelector();

        function get preselectedItemName() : String;

        function set preselectedItemName(param1:String) : void;

        function get selectedItem();

        function set itemRendererFunction(param1:Function) : void;

    }
}
