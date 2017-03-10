package com.tinychat.controller.commands.social.network.twitter
{
    import com.tinychat.model.room.*;
    import com.tinychat.services.social.network.twitter.*;
    import org.robotlegs.mvcs.*;

    public class TwitterPostTweetCommand extends Command
    {
        public var service:TwitterPostTweetService;
        public var roomInfo:RoomSettingsProxy;
        public var message:String;

        public function TwitterPostTweetCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.service.send(this.roomInfo.name, this.message);
            return;
        }// end function

    }
}
