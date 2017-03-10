package com.tinychat.controller.commands.social.network.facebook
{
    import com.facebook.graph.*;
    import com.facebook.graph.data.*;
    import com.tinychat.model.social.network.facebook.*;
    import flash.events.*;
    import flash.utils.*;
    import org.robotlegs.utilities.macrobot.*;

    public class VerifyFacebookSessionCommand extends AsyncCommand
    {
        private var permissions:FacebookPermissions;
        private var required:Array;
        private var timeout:Number;
        private var timer:Timer;

        public function VerifyFacebookSessionCommand(param1:FacebookPermissions, param2:Array, param3:Number)
        {
            this.permissions = param1;
            this.required = param2;
            this.timeout = param3;
            return;
        }// end function

        override public function execute() : void
        {
            if (this.timeout != 0)
            {
                this.timer = new Timer(100, Math.max(1, this.timeout / 100));
                this.timer.addEventListener(TimerEvent.TIMER, this.timerHandler);
                this.timer.addEventListener(TimerEvent.TIMER_COMPLETE, this.timerCompleteHandler);
                this.timer.start();
            }
            else
            {
                this.finish(this.hasFacebookSession);
            }
            return;
        }// end function

        private function timerHandler(event:TimerEvent) : void
        {
            if (this.hasFacebookSession)
            {
                this.finish(true);
            }
            return;
        }// end function

        private function timerCompleteHandler(event:TimerEvent) : void
        {
            this.finish(this.hasFacebookSession);
            return;
        }// end function

        private function finish(param1:Boolean) : void
        {
            if (this.timer)
            {
                this.timer.removeEventListener(TimerEvent.TIMER, this.timerHandler);
                this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE, this.timerCompleteHandler);
                this.timer.stop();
            }
            dispatchComplete(param1);
            return;
        }// end function

        private function get hasFacebookSession() : Boolean
        {
            var _loc_1:* = Facebook.getAuthResponse();
            if (_loc_1)
            {
            }
            if (_loc_1.accessToken)
            {
            }
            return this.permissions.has(this.required);
        }// end function

    }
}
