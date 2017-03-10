package com.tinychat.controller.commands.snapshot
{
    import com.tinychat.model.login.*;
    import com.tinychat.model.snapshot.*;
    import com.tinychat.services.snapshot.*;
    import com.tinychat.services.social.network.facebook.share.*;
    import com.tinychat.services.social.network.twitter.*;
    import org.robotlegs.mvcs.*;

    public class DirectShareSnapshotCommand extends Command
    {
        public var snapshot:Snapshot;
        public var type:LoginType;

        public function DirectShareSnapshotCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:PostSnapshotService = null;
            switch(this.type)
            {
                case LoginType.FACEBOOK:
                {
                    _loc_1 = injector.getInstance(FacebookPostSnapshotService);
                    break;
                }
                case LoginType.TWITTER:
                {
                    _loc_1 = injector.getInstance(TwitterPostSnapshotService);
                    break;
                }
                default:
                {
                    break;
                }
            }
            _loc_1.post(this.snapshot);
            return;
        }// end function

    }
}
