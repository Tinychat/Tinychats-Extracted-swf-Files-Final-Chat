package mx.controls
{
    import flash.display.*;
    import flash.events.*;
    import mx.controls.listClasses.*;
    import mx.events.*;

    public class Image extends SWFLoader implements IDataRenderer, IDropInListItemRenderer, IListItemRenderer
    {
        private var makeContentVisible:Boolean = false;
        private var sourceSet:Boolean;
        private var settingBrokenImage:Boolean;
        private var _data:Object;
        private var _listData:BaseListData;
        static const VERSION:String = "4.6.0.23201";

        public function Image()
        {
            tabChildren = false;
            tabEnabled = true;
            tabFocusEnabled = true;
            showInAutomationHierarchy = true;
            return;
        }// end function

        override public function set source(value:Object) : void
        {
            this.settingBrokenImage = value == getStyle("brokenImageSkin");
            this.sourceSet = !this.settingBrokenImage;
            super.source = value;
            return;
        }// end function

        public function get data() : Object
        {
            return this._data;
        }// end function

        public function set data(value:Object) : void
        {
            this._data = value;
            if (!this.sourceSet)
            {
                this.source = this.listData ? (this.listData.label) : (this.data);
                this.sourceSet = false;
            }
            dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
            return;
        }// end function

        public function get listData() : BaseListData
        {
            return this._listData;
        }// end function

        public function set listData(value:BaseListData) : void
        {
            this._listData = value;
            return;
        }// end function

        override public function invalidateSize() : void
        {
            if (this.data)
            {
            }
            if (this.settingBrokenImage)
            {
                return;
            }
            super.invalidateSize();
            return;
        }// end function

        override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number) : void
        {
            super.updateDisplayList(unscaledWidth, unscaledHeight);
            if (this.makeContentVisible)
            {
            }
            if (contentHolder)
            {
                contentHolder.visible = true;
                this.makeContentVisible = false;
            }
            return;
        }// end function

        override function contentLoaderInfo_completeEventHandler(event:Event) : void
        {
            var _loc_2:* = DisplayObject(event.target.loader);
            super.contentLoaderInfo_completeEventHandler(event);
            _loc_2.visible = false;
            this.makeContentVisible = true;
            invalidateDisplayList();
            return;
        }// end function

    }
}
