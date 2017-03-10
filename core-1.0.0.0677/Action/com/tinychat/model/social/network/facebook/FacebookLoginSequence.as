package com.tinychat.model.social.network.facebook
{
    import com.tinychat.services.social.network.facebook.*;
    import nl.dpdk.commands.tasks.*;
    import org.osflash.signals.*;

    public class FacebookLoginSequence extends Sequence
    {
        private var _complete:Signal;

        public function FacebookLoginSequence(param1:FacebookLoginService, param2:FacebookUserInfoService)
        {
            super(true);
            add(new FacebookLoginTask(param1));
            add(new FacebookUserInfoTask(param2));
            addEventListener(SequenceEvent.DONE, this.sequenceDoneHandler);
            addEventListener(SequenceEvent.ERROR, this.sequenceErrorHandler);
            this._complete = new Signal(Boolean);
            return;
        }// end function

        public function get complete() : ISignal
        {
            return this._complete;
        }// end function

        private function sequenceDoneHandler(event:SequenceEvent) : void
        {
            this._complete.dispatch(true);
            return;
        }// end function

        private function sequenceErrorHandler(event:SequenceEvent) : void
        {
            this._complete.dispatch(false);
            return;
        }// end function

    }
}
