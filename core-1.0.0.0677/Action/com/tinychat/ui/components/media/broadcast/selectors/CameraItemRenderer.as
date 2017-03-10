package com.tinychat.ui.components.broadcast.selectors
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.ui.components.video.elements.*;
    import flash.events.*;
    import flash.utils.*;
    import spark.components.*;
    import spark.components.supportClasses.*;

    public class CameraItemRenderer extends AbstractDeviceItemRenderer
    {
        public var inactiveTextDisplay:TextBase;
        public var contentGroup:Group;
        private var video:CameraVideoElement;
        private var _inactiveText:String;
        private var inactivityPoller:Timer;
        private var inactive:Boolean;
        private var inactiveTextChanged:Boolean;
        private static const STATE_WAITING:String = "waiting";
        private static const STATE_INACTIVE:String = "inactive";
        private static const INACTIVITY_TIMEOUT:uint = 5000;
        private static var _skinParts:Object = {labelDisplay:false, inactiveTextDisplay:true, iconDisplay:false, contentGroup:true};

        public function CameraItemRenderer()
        {
            super(500);
            mouseEnabled = false;
            this.video = new SoftwareVideoElement();
            this.inactivityPoller = new Timer(INACTIVITY_TIMEOUT, 1);
            this.inactivityPoller.addEventListener(TimerEvent.TIMER_COMPLETE, this.inactivityHandler);
            return;
        }// end function

        override public function set data(param1:Object) : void
        {
            if (item != param1)
            {
                if (this.cameraListItem)
                {
                    this.cameraListItem.activityChange.remove(this.activityChangeHandler);
                }
                this.video.attachCamera(null);
                super.data = param1;
            }
            return;
        }// end function

        override protected function createChildren() : void
        {
            super.createChildren();
            this.video.left = 0;
            this.video.right = 0;
            this.video.top = 0;
            this.video.bottom = 0;
            this.contentGroup.addElement(this.video);
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.inactiveTextDisplay)
            {
            }
            if (this.inactiveTextChanged)
            {
                this.inactiveTextDisplay.text = this._inactiveText;
                this.inactiveTextChanged = false;
            }
            return;
        }// end function

        override protected function getCurrentSkinState() : String
        {
            if (creationComplete)
            {
                if (this.inactivityPoller)
                {
                }
            }
            if (this.inactivityPoller.running)
            {
                return STATE_WAITING;
            }
            if (this.inactive)
            {
                return STATE_INACTIVE;
            }
            return super.getCurrentSkinState();
        }// end function

        override protected function loadDevice() : void
        {
            this.cameraListItem.activityChange.add(this.activityChangeHandler);
            this.cameraListItem.attachToVideo(this.video);
            this.inactiveText = this.cameraListItem.inactivityMessage;
            this.activityChangeHandler(this.cameraListItem.isActive);
            return;
        }// end function

        override protected function removedFromStageHandler(event:Event) : void
        {
            if (this.inactivityPoller)
            {
                this.inactivityPoller.stop();
                this.inactivityPoller.removeEventListener(TimerEvent.TIMER_COMPLETE, this.inactivityHandler);
            }
            super.removedFromStageHandler(event);
            return;
        }// end function

        private function get cameraListItem() : CameraListItem
        {
            return item as CameraListItem;
        }// end function

        private function set inactiveText(param1:String) : void
        {
            if (this._inactiveText != param1)
            {
                this._inactiveText = param1;
                this.inactiveTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        private function activityChangeHandler(param1:Boolean) : void
        {
            if (param1)
            {
                this.inactivityPoller.stop();
                this.inactive = false;
                mouseEnabled = true;
            }
            else
            {
                mouseEnabled = false;
                this.inactivityPoller.reset();
                this.inactivityPoller.start();
            }
            invalidateSkinState();
            return;
        }// end function

        private function inactivityHandler(event:TimerEvent) : void
        {
            this.inactive = true;
            this.video.clear();
            invalidateSkinState();
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
