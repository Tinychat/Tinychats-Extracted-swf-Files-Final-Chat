package com.tinychat.controller.commands.social.network.tumblr
{
    import com.tinychat.model.room.*;
    import com.tinychat.services.social.network.tumblr.*;
    import org.robotlegs.mvcs.*;

    public class TumblrReblogCommand extends Command
    {
        public var service:TumblrReblogService;
        public var roomInfo:RoomSettingsProxy;
        public var message:String;

        public function TumblrReblogCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.service.send(this.roomInfo.name, this.roomInfo.url, this.message);
            return;
        }// end function

    }
}
