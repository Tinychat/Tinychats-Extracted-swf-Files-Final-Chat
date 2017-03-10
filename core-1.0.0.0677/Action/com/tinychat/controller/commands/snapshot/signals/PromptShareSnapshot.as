package com.tinychat.controller.commands.snapshot.signals
{
    import com.tinychat.model.login.*;
    import com.tinychat.model.snapshot.*;
    import org.osflash.signals.*;

    public class PromptShareSnapshot extends Signal
    {

        public function PromptShareSnapshot()
        {
            super(Snapshot, LoginType);
            return;
        }// end function

    }
}
