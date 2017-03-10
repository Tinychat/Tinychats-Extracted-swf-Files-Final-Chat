package com.tinychat.controller.guards.greenroom
{
    import com.tinychat.model.greenroom.*;
    import com.tinychat.model.guards.*;

    public class ConnectedToGreenRoomGuard extends AbstractLiveGuard
    {
        private var connection:GreenRoomConnection;

        public function ConnectedToGreenRoomGuard(param1:GreenRoomConnection)
        {
            this.connection = param1;
            return;
        }// end function

        override public function approve() : Boolean
        {
            return this.connection.connected;
        }// end function

        override protected function enableChangeListening() : void
        {
            this.connection.connectedChanged.add(this.connectionChangedHandler);
            return;
        }// end function

        override protected function disableChangeListening() : void
        {
            this.connection.connectedChanged.remove(this.connectionChangedHandler);
            return;
        }// end function

        private function connectionChangedHandler(param1:Boolean) : void
        {
            triggerChange();
            return;
        }// end function

    }
}
