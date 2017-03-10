package com.tinychat.ui.components.social.buttonbar
{
    import spark.components.supportClasses.*;

    public class UserCountIndicator extends SkinnableComponent
    {
        public var textDisplay:TextBase;
        private var _text:String;
        private var textChanged:Boolean;
        private static var _skinParts:Object = {textDisplay:true};

        public function UserCountIndicator()
        {
            return;
        }// end function

        public function get text() : String
        {
            return this._text;
        }// end function

        public function set text(param1:String) : void
        {
            if (this._text != param1)
            {
                this._text = param1;
                this.textChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.textChanged)
            {
            }
            if (this.textDisplay)
            {
                this.textDisplay.text = this._text;
                this.textChanged = false;
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
