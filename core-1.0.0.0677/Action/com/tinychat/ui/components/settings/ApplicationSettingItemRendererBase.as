package com.tinychat.ui.components.settings
{
    import com.tinychat.model.settings.*;
    import flash.errors.*;
    import flash.events.*;
    import spark.components.supportClasses.*;

    public class ApplicationSettingItemRendererBase extends ItemRenderer
    {
        private var _autoSave:Boolean;
        private var autoSaveChanged:Boolean;

        public function ApplicationSettingItemRendererBase()
        {
            autoDrawBackground = false;
            return;
        }// end function

        public function get setting() : ApplicationSetting
        {
            return ApplicationSetting(data);
        }// end function

        public function get value() : Object
        {
            throw new IllegalOperationError("Must be overridden in sub-class.");
        }// end function

        public function get autoSave() : Boolean
        {
            return this._autoSave;
        }// end function

        public function set autoSave(param1:Boolean) : void
        {
            if (this._autoSave != param1)
            {
                this._autoSave = param1;
                this.autoSaveChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function save() : void
        {
            this.setting.value = this.value;
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.autoSaveChanged)
            {
                if (this._autoSave)
                {
                    addEventListener(MouseEvent.CLICK, this.clickHandler);
                }
                else
                {
                    removeEventListener(MouseEvent.CLICK, this.clickHandler);
                }
                this.autoSaveChanged = false;
            }
            return;
        }// end function

        private function clickHandler(event:MouseEvent) : void
        {
            this.save();
            return;
        }// end function

    }
}
