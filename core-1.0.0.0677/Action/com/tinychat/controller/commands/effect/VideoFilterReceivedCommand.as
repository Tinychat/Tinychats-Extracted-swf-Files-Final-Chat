package com.tinychat.controller.commands.effect
{
    import com.tinychat.controller.commands.effect.signal.*;
    import com.tinychat.model.parsers.privatemessage.arguments.*;
    import com.tinychat.model.videoeffects.*;
    import org.robotlegs.mvcs.*;

    public class VideoFilterReceivedCommand extends Command
    {
        public var args:PrivateMessageVideoFilterArguments;
        public var selected:ApplyVideoFilter;

        public function VideoFilterReceivedCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:* = VideoFilter.fromId(this.args.filterId);
            if (this.args.sender.pro)
            {
                this.selected.dispatch(this.args.sender, _loc_1);
            }
            return;
        }// end function

    }
}
