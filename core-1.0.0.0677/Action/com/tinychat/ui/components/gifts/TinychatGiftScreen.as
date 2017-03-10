package com.tinychat.ui.components.gifts
{
    import com.tinychat.model.api.*;
    import com.tinychat.ui.components.spark.*;
    import spark.components.supportClasses.*;

    public class TinychatGiftScreen extends TitleWindowElementBase
    {
        public var notFoundMessageDisplay:TextBase;
        public var viewCountDisplay:TextBase;
        private var _user:UserIdentity;
        private var _notFoundMessage:String;
        private var dataProviderChanged:Boolean;
        private var notFoundMessageChanged:Boolean;
        private var userChanged:Boolean;
        private static const STATE_FOUND:String = "found";
        private static const STATE_NOT_FOUND:String = "notFound";
        private static var _skinParts:Object = {confirm:false, cancel:false, viewCountDisplay:false, notFoundMessageDisplay:true, loadingIndicator:false, titleDisplay:false, statusLabel:false};

        public function TinychatGiftScreen()
        {
            return;
        }// end function

        public function set notFoundMessage(param1:String) : void
        {
            if (this._notFoundMessage != param1)
            {
                this._notFoundMessage = param1;
                this.notFoundMessageChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set user(param1:UserIdentity) : void
        {
            if (this._user != param1)
            {
                this._user = param1;
                this.userChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.notFoundMessageChanged)
            {
            }
            if (this.notFoundMessageDisplay)
            {
                this.notFoundMessageDisplay.text = this._notFoundMessage;
                this.notFoundMessageChanged = false;
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            return;
        }// end function

        override protected function getCurrentSkinState() : String
        {
            return STATE_NOT_FOUND;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
