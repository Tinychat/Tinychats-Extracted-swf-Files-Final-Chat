package com.tinychat.ui.components.invite
{
    import com.tinychat.ui.components.controlbar.buttons.*;
    import flash.events.*;
    import org.osflash.signals.*;
    import spark.components.supportClasses.*;

    public class NewRoomCreatedScreen extends InviteSelectionScreen
    {
        public var startBroadcast:BroadcastButton;
        public var startBroadcastLabel:TextBase;
        private var _startBrodcastLabelText:String;
        private var startBroadcastLabelTextChanged:Boolean;
        private var _startBroadcastClicked:Signal;
        private static var _skinParts:Object = {confirm:false, cancel:false, roomUrlHeader:false, roomUrlField:false, socialNetworksHeader:false, loadingIndicator:false, startBroadcastLabel:true, startBroadcast:true, titleDisplay:false, socialLoginButtons:false, statusLabel:false};

        public function NewRoomCreatedScreen()
        {
            this._startBroadcastClicked = new Signal();
            return;
        }// end function

        public function get startBroadcastClicked() : ISignal
        {
            return this._startBroadcastClicked;
        }// end function

        public function set startBroadcastLabelText(param1:String) : void
        {
            if (this._startBrodcastLabelText != param1)
            {
                this._startBrodcastLabelText = param1;
                this.startBroadcastLabelTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.startBroadcastLabelTextChanged)
            {
                this.startBroadcastLabel.text = this._startBrodcastLabelText;
                this.startBroadcastLabelTextChanged = false;
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.startBroadcast)
            {
                this.startBroadcast.addEventListener(MouseEvent.CLICK, this.startBroadcastClickHandler);
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == this.startBroadcast)
            {
                this.startBroadcast.removeEventListener(MouseEvent.CLICK, this.startBroadcastClickHandler);
            }
            return;
        }// end function

        private function startBroadcastClickHandler(event:MouseEvent) : void
        {
            this._startBroadcastClicked.dispatch();
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
