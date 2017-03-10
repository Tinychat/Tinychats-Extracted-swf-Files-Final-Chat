package com.tinychat.controller.commands.social.network.twitter
{
    import com.tinychat.model.room.*;
    import com.tinychat.services.social.network.twitter.*;
    import org.robotlegs.mvcs.*;

    public class TwitterFollowCommand extends Command
    {
        public var service:TwitterFollowService;
        public var followTinychat:Boolean;
        public var twitterOwner:String;
        public var roomInfo:RoomSettingsProxy;

        public function TwitterFollowCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.service.send(this.roomInfo.name, this.followTinychat, this.twitterOwner);
            return;
        }// end function

    }
}
