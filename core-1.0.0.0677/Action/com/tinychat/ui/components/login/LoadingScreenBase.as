package com.tinychat.ui.components.login
{
    import com.tinychat.ui.components.spark.*;

    public class LoadingScreenBase extends TitleWindowElementBase
    {
        private var _loadingMessage:String;
        private var _failureMessage:String;
        private var _isLoading:Boolean;
        private var loadingMessageChanged:Boolean;
        private var failedMessageChanged:Boolean;
        private var isLoadingChanged:Boolean;
        private static const STATE_LOADING:String = "loading";
        private static const STATE_FAILED:String = "failed";
        private static var _skinParts:Object = {confirm:false, cancel:false, titleDisplay:false, statusLabel:false, loadingIndicator:false};

        public function LoadingScreenBase()
        {
            return;
        }// end function

        public function set loadingMessage(param1:String) : void
        {
            if (this._loadingMessage != param1)
            {
                this._loadingMessage = param1;
                this.loadingMessageChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set failureMessage(param1:String) : void
        {
            if (this._failureMessage != param1)
            {
                this._failureMessage = param1;
                this.failedMessageChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set isLoading(param1:Boolean) : void
        {
            if (this._isLoading != param1)
            {
                this._isLoading = param1;
                this.isLoadingChanged = true;
                invalidateSkinState();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            if (!this.isLoadingChanged)
            {
            }
            if (!this.loadingMessageChanged)
            {
            }
            if (this.failedMessageChanged)
            {
            }
            if (statusLabel)
            {
                if (this._isLoading)
                {
                    statusLabelText = this._loadingMessage;
                }
                else
                {
                    statusLabelText = this._failureMessage;
                }
                this.loadingMessageChanged = false;
                this.failedMessageChanged = false;
                this.isLoadingChanged = false;
            }
            super.commitProperties();
            return;
        }// end function

        override protected function getCurrentSkinState() : String
        {
            if (this._isLoading)
            {
                return STATE_LOADING;
            }
            return STATE_FAILED;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
