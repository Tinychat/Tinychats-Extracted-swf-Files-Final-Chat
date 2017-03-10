package com.tinychat.ui.components.login
{
    import com.tinychat.ui.components.spark.*;
    import org.osflash.signals.*;

    public class NicknameSelectionScreen extends TitleWindowElementBase
    {
        public var nicknameSelector:NicknameSelector;
        private var _nicknameSubmitted:Signal;
        private var nicknameChanged:Boolean;
        private var _nickname:String;
        private static var _skinParts:Object = {confirm:false, cancel:false, nicknameSelector:true, titleDisplay:false, statusLabel:false, loadingIndicator:false};

        public function NicknameSelectionScreen()
        {
            this._nicknameSubmitted = new Signal(String);
            return;
        }// end function

        public function get nicknameSubmitted() : Signal
        {
            return this._nicknameSubmitted;
        }// end function

        public function set nickname(param1:String) : void
        {
            if (this._nickname != param1)
            {
                this._nickname = param1;
                this.nicknameChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.nicknameChanged)
            {
            }
            if (this.nicknameSelector)
            {
                this.nicknameSelector.username = this._nickname;
                this.nicknameChanged = false;
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.nicknameSelector)
            {
                this.nicknameSelector.submitted.add(this.nicknameSelectorSubmittedHandler);
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == this.nicknameSelector)
            {
                this.nicknameSelector.submitted.remove(this.nicknameSelectorSubmittedHandler);
            }
            return;
        }// end function

        private function nicknameSelectorSubmittedHandler(param1:String, param2:String) : void
        {
            this._nicknameSubmitted.dispatch(param1);
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
