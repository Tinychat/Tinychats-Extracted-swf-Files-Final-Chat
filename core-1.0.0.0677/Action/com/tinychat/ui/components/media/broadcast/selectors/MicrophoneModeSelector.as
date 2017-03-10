package com.tinychat.ui.components.broadcast.selectors
{
    import com.tinychat.model.lists.*;

    public class MicrophoneModeSelector extends ItemSelectorBase
    {
        private var iconList:NamedItemList;
        private var _pushToTalkItem:IconListItem;
        private var _openMicItem:IconListItem;
        private var pushToTalkChanged:Boolean;
        private var openMicItemChanged:Boolean;
        private static var _skinParts:Object = {iconItemRenderer:true, dataGroup:false};

        public function MicrophoneModeSelector()
        {
            this.iconList = new NamedItemList();
            dataProvider = this.iconList;
            return;
        }// end function

        public function set pushToTalkItem(param1:IconListItem) : void
        {
            if (this._pushToTalkItem != param1)
            {
                this._pushToTalkItem = param1;
                this.pushToTalkChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set openMicItem(param1:IconListItem) : void
        {
            if (this._openMicItem != param1)
            {
                this._openMicItem = param1;
                this.openMicItemChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            if (this.pushToTalkChanged)
            {
                if (this.iconList.hasItemWith(this._pushToTalkItem))
                {
                    this.iconList.removeItemBy(this._pushToTalkItem);
                }
                this.iconList.addItem(this._pushToTalkItem);
                this.pushToTalkChanged = false;
            }
            if (this.openMicItemChanged)
            {
                if (this.iconList.hasItemWith(this._openMicItem))
                {
                    this.iconList.removeItemBy(this._openMicItem);
                }
                this.iconList.addItem(this._openMicItem);
                this.openMicItemChanged = false;
            }
            super.commitProperties();
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
