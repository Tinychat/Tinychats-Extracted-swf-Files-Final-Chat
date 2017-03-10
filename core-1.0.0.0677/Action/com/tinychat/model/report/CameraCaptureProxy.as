package com.tinychat.model.report
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.parsers.privatemessage.*;
    import com.tinychat.model.parsers.privatemessage.arguments.*;
    import com.tinychat.services.report.*;
    import com.tinychat.ui.components.broadcast.lists.*;
    import flash.events.*;
    import flash.utils.*;

    public class CameraCaptureProxy extends Object
    {
        private var parser:PrivateMessageParser;
        private var broadcasts:RoomCameraBroadcasts;
        private var service:BroadcastScreenshotService;
        private var canvas:RoomBroadcastCanvas;
        private var screenshotTimer:Timer;
        private var reportedTimeout:Timer;
        private var currentBroadcast:CameraBroadcast;
        private static const INITIAL_SCREENSHOT_TIMEOUT:uint = 5000;
        private static const SCREENSHOT_INTERVAL:uint = 75000;
        private static const REPORTED_TIMEOUT:uint = 30000;

        public function CameraCaptureProxy(param1:PrivateMessageParser, param2:RoomCameraBroadcasts, param3:BroadcastScreenshotService, param4:RoomBroadcastCanvas)
        {
            this.parser = param1;
            this.broadcasts = param2;
            this.service = param3;
            this.canvas = param4;
            this.screenshotTimer = new Timer(SCREENSHOT_INTERVAL);
            this.screenshotTimer.addEventListener(TimerEvent.TIMER, this.screenshotTimerHandler);
            this.reportedTimeout = new Timer(REPORTED_TIMEOUT, 1);
            this.parser.reported.add(this.reportedHandler);
            this.broadcasts.started.add(this.broadcastStartedHandler);
            this.broadcasts.stopped.add(this.broadcastStoppedHandler);
            return;
        }// end function

        private function reportedHandler(param1:PrivateMessageReportedArguments) : void
        {
            if (param1.sender.isLoggedIn)
            {
            }
            if (!this.reportedTimeout.running)
            {
            }
            if (this.currentBroadcast)
            {
                this.reportedTimeout.start();
                this.sendScreenshot();
            }
            return;
        }// end function

        private function broadcastStartedHandler(param1:Broadcast) : void
        {
            this.currentBroadcast = CameraBroadcast(param1);
            setTimeout(this.startScreenshotTimer, INITIAL_SCREENSHOT_TIMEOUT);
            this.reportedTimeout.reset();
            return;
        }// end function

        private function broadcastStoppedHandler(param1:Broadcast) : void
        {
            this.currentBroadcast = null;
            this.stopScreenshotTimer();
            return;
        }// end function

        private function startScreenshotTimer() : void
        {
            if (this.currentBroadcast)
            {
                this.sendScreenshot();
                this.screenshotTimer.reset();
                this.screenshotTimer.start();
            }
            return;
        }// end function

        private function stopScreenshotTimer() : void
        {
            this.screenshotTimer.stop();
            return;
        }// end function

        private function screenshotTimerHandler(event:TimerEvent) : void
        {
            this.sendScreenshot();
            return;
        }// end function

        private function sendScreenshot() : void
        {
            this.service.send(this.canvas.getContainersById(this.currentBroadcast)[0]);
            return;
        }// end function

    }
}
