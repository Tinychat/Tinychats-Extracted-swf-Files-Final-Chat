package com.tinychat.model.layout
{
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.flashvars.*;
    import org.osflash.signals.*;

    public class ApplicationLayout extends Object
    {
        private var flashvarsProxy:FlashvarsProxy;
        private var _currentState:ApplicationLayoutState;
        private var _stateChanged:Signal;
        private static const DEFAULT_STATE:ApplicationLayoutState = ApplicationLayoutState.CHAT_BELOW;

        public function ApplicationLayout(param1:FlashvarsProxy, param2:RoomBroadcastCanvasBroadcasts)
        {
            this.flashvarsProxy = param1;
            this._stateChanged = new Signal(ApplicationLayoutState);
            this._currentState = this.flashvarsProxy.chatpos != ApplicationLayoutState.UNDEFINED ? (this.flashvarsProxy.chatpos) : (DEFAULT_STATE);
            return;
        }// end function

        public function get currentState() : ApplicationLayoutState
        {
            return this._currentState;
        }// end function

        public function set currentState(param1:ApplicationLayoutState) : void
        {
            if (this._currentState != param1)
            {
                this._currentState = param1;
                this._stateChanged.dispatch(this._currentState);
            }
            return;
        }// end function

        public function get stateChanged() : ISignal
        {
            return this._stateChanged;
        }// end function

    }
}
