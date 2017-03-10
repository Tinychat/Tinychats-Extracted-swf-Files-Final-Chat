package com.tinychat.ui.components.settings
{
    import com.tinychat.model.settings.*;
    import com.tinychat.ui.components.spark.*;
    import flash.events.*;
    import mx.collections.*;
    import spark.components.*;

    public class ApplicationSettingsScreen extends TitleWindowElementBase
    {
        public var settingsGroup:DataGroup;
        private var _dataProvider:ApplicationSettings;
        private var dataProviderChanged:Boolean;
        private static var _skinParts:Object = {confirm:false, cancel:false, titleDisplay:false, settingsGroup:true, statusLabel:false, loadingIndicator:false};

        public function ApplicationSettingsScreen()
        {
            return;
        }// end function

        public function set dataProvider(param1:ApplicationSettings) : void
        {
            if (this._dataProvider != param1)
            {
                this._dataProvider = param1;
                this.dataProviderChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.dataProviderChanged)
            {
            }
            if (this._dataProvider)
            {
            }
            if (this.settingsGroup)
            {
                this.settingsGroup.dataProvider = new ArrayList(this._dataProvider.settings);
                this.dataProviderChanged = false;
            }
            return;
        }// end function

        override protected function confirmClickHandler(event:MouseEvent) : void
        {
            var _loc_2:uint = 0;
            var _loc_3:ApplicationSettingItemRendererBase = null;
            super.confirmClickHandler(event);
            if (this.settingsGroup)
            {
                _loc_2 = 0;
                while (_loc_2 < this.settingsGroup.numElements)
                {
                    
                    _loc_3 = this.settingsGroup.getElementAt(_loc_2) as ApplicationSettingItemRendererBase;
                    if (_loc_3)
                    {
                        _loc_3.save();
                    }
                    _loc_2 = _loc_2 + 1;
                }
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
