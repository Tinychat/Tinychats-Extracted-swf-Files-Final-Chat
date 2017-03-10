package com.tinychat.ui.components.alerts
{
    import com.tinychat.model.utils.url.*;
    import com.tinychat.ui.components.spark.*;
    import spark.components.supportClasses.*;

    public class LinkAlertBaseScreen extends TitleWindowElementBase
    {
        public var urlDisplay:TextBase;
        private var _url:Url;
        private var urlChanged:Boolean;
        private static var _skinParts:Object = {confirm:false, cancel:false, titleDisplay:false, urlDisplay:true, statusLabel:false, loadingIndicator:false};

        public function LinkAlertBaseScreen()
        {
            return;
        }// end function

        public function set url(param1:Url) : void
        {
            if (this._url != param1)
            {
                this._url = param1;
                this.urlChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.urlChanged)
            {
            }
            if (this.urlDisplay)
            {
                this.urlDisplay.text = this._url.href;
                this.urlChanged = false;
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
