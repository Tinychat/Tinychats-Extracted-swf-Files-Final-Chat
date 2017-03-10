package com.tinychat.ui.components.broadcast.selectors
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.lists.*;
    import org.osmf.netmocker.*;

    public class MicrophoneItemRenderer extends AbstractDeviceItemRenderer implements IDataRenderer
    {
        private var mockNetStream:MockNetStream;
        public var audioActivityIndicator:AudioActivityIndicator;
        private static var mockNetConnection:MockNetConnection = new MockNetConnection();
        private static var _connectMockNetConnection:Boolean = connectMockNetConnection();
        private static var _skinParts:Object = {audioActivityIndicator:true, labelDisplay:false, iconDisplay:false};

        public function MicrophoneItemRenderer()
        {
            super(500);
            this.mockNetStream = new MockNetStream(mockNetConnection);
            return;
        }// end function

        override public function set data(param1:Object) : void
        {
            if (item != param1)
            {
                if (item)
                {
                    this.microphoneListItem.stopActivityPolling();
                }
                this.mockNetStream.attachAudio(null);
                super.data = param1;
            }
            return;
        }// end function

        override protected function loadDevice() : void
        {
            this.mockNetStream.attachAudio(this.microphoneListItem.microphone);
            this.microphoneListItem.startActivityPolling(100, this.audioActivityPollerHandler);
            return;
        }// end function

        private function get microphoneListItem() : MicrophoneListItem
        {
            return item as MicrophoneListItem;
        }// end function

        private function audioActivityPollerHandler(param1:Number) : void
        {
            this.audioActivityIndicator.level = param1;
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

        private static function connectMockNetConnection() : Boolean
        {
            mockNetConnection.connect(null);
            return true;
        }// end function

    }
}
