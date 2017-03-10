package com.tinychat.ui.components.social.userlist
{
    import com.tinychat.model.api.*;
    import mx.collections.*;
    import spark.components.supportClasses.*;
    import spark.events.*;

    public class SortedList extends ListBase implements IListDataproviderComponent
    {
        private var sort:Sort;
        private var sortedDataProvider:ListCollectionView;
        private var sortedDataProviderChanged:Boolean;
        private static var _skinParts:Object = {dataGroup:false};

        public function SortedList()
        {
            return;
        }// end function

        override public function set dataProvider(param1:IList) : void
        {
            if (this.sortedDataProvider)
            {
            }
            if (this.sortedDataProvider.list != param1)
            {
                this.sortedDataProvider = new ListCollectionView(param1);
                super.dataProvider = this.sortedDataProvider;
                this.sortedDataProviderChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        protected function get sortCompare() : Function
        {
            return function (param1:Object, param2:Object, param3:Array = null) : int
            {
                return nameCompare(param1, param2);
            }// end function
            ;
        }// end function

        protected function get filterFunction() : Function
        {
            return null;
        }// end function

        protected function nameCompare(param1:Object, param2:Object) : int
        {
            if (param1.name.toLowerCase() > param2.name.toLowerCase())
            {
                return 1;
            }
            if (param1.name.toLowerCase() == param2.name.toLowerCase())
            {
                return 0;
            }
            return -1;
        }// end function

        protected function giftCompare(param1:Object, param2:Object) : int
        {
            if (param1.points < param2.points)
            {
                return 1;
            }
            if (param1.points == param2.points)
            {
                return this.nameCompare(param1, param2);
            }
            return -1;
        }// end function

        protected function refreshSort() : void
        {
            if (this.sortedDataProvider)
            {
                this.sortedDataProvider.refresh();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.sortedDataProviderChanged)
            {
            }
            if (this.sortedDataProvider)
            {
                if (!this.sort)
                {
                    this.sort = new Sort();
                    this.sort.compareFunction = this.sortCompare;
                }
                this.sortedDataProvider.sort = this.sort;
                this.sortedDataProvider.filterFunction = this.filterFunction;
                this.sortedDataProvider.refresh();
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == dataGroup)
            {
                dataGroup.addEventListener(RendererExistenceEvent.RENDERER_ADD, this.rendererAddedHandler);
                dataGroup.addEventListener(RendererExistenceEvent.RENDERER_REMOVE, this.rendererRemovedHandler);
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == dataGroup)
            {
                dataGroup.removeEventListener(RendererExistenceEvent.RENDERER_ADD, this.rendererAddedHandler);
                dataGroup.removeEventListener(RendererExistenceEvent.RENDERER_REMOVE, this.rendererRemovedHandler);
            }
            return;
        }// end function

        protected function rendererAddedHandler(event:RendererExistenceEvent) : void
        {
            return;
        }// end function

        protected function rendererRemovedHandler(event:RendererExistenceEvent) : void
        {
            if (event.renderer)
            {
            }
            if (event.renderer is Disposable)
            {
                (event.renderer as Disposable).dispose();
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
