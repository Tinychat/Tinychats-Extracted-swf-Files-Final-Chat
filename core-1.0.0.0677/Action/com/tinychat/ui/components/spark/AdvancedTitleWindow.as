package com.tinychat.ui.components.spark
{
    import spark.components.*;

    public class AdvancedTitleWindow extends TitleWindow
    {
        private var _movable:Boolean;
        private var _closeable:Boolean;
        private var movableChanged:Boolean;
        private var closeableChanged:Boolean;
        private static var _skinParts:Object = {moveArea:false, titleDisplay:false, closeButton:false, controlBarGroup:false, contentGroup:false};

        public function AdvancedTitleWindow()
        {
            this.closeableChanged = true;
            this.movableChanged = true;
            return;
        }// end function

        public function get movable() : Boolean
        {
            return this._movable;
        }// end function

        public function set movable(param1:Boolean) : void
        {
            if (this._movable != param1)
            {
                this._movable = param1;
                this.movableChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function get closeable() : Boolean
        {
            return this._closeable;
        }// end function

        public function set closeable(param1:Boolean) : void
        {
            if (this._closeable != param1)
            {
                this._closeable = param1;
                this.closeableChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.closeableChanged)
            {
            }
            if (closeButton)
            {
                closeButton.visible = this._closeable;
                closeButton.includeInLayout = this._closeable;
                this.closeableChanged = false;
            }
            if (this.movableChanged)
            {
            }
            if (moveArea)
            {
                moveArea.visible = this._movable;
                this.movableChanged = false;
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
