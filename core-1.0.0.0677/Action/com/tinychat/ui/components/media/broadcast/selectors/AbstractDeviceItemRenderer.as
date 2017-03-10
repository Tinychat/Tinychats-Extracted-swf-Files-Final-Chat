package com.tinychat.ui.components.broadcast.selectors
{
    import com.tinychat.model.api.*;
    import flash.errors.*;
    import flash.events.*;
    import flash.utils.*;
    import mx.events.*;
    import spark.components.*;

    public class AbstractDeviceItemRenderer extends ButtonBarButton implements IDataRenderer
    {
        protected var item:DeviceListItem;
        protected var creationComplete:Boolean;
        private var creationCompleteTimeout:Number;
        private var dataChanged:Boolean;
        private var labelChanged:Boolean;
        private static var _skinParts:Object = {labelDisplay:false, iconDisplay:false};

        public function AbstractDeviceItemRenderer(param1:Number)
        {
            this.creationCompleteTimeout = param1;
            addEventListener(Event.REMOVED_FROM_STAGE, this.removedFromStageHandler);
            addEventListener(FlexEvent.CREATION_COMPLETE, this.creationCompleteHandler);
            return;
        }// end function

        override public function get data() : Object
        {
            return this.item;
        }// end function

        override public function set data(param1:Object) : void
        {
            if (this.item != param1)
            {
                this.item = DeviceListItem(param1);
                this.dataChanged = true;
                this.labelChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            if (this.labelChanged)
            {
            }
            if (labelDisplay)
            {
                label = this.item ? (this.item.name) : ("");
                this.labelChanged = false;
            }
            if (this.dataChanged)
            {
            }
            if (this.creationComplete)
            {
                if (this.item)
                {
                }
                if (this.item.device)
                {
                    this.loadDevice();
                }
                invalidateSkinState();
                this.dataChanged = false;
            }
            super.commitProperties();
            return;
        }// end function

        protected function loadDevice() : void
        {
            throw new IllegalOperationError("Must be overriden in sub-class.");
        }// end function

        protected function removedFromStageHandler(event:Event) : void
        {
            removeEventListener(Event.REMOVED_FROM_STAGE, this.removedFromStageHandler);
            this.data = null;
            return;
        }// end function

        private function creationCompleteHandler(event:FlexEvent) : void
        {
            var event:* = event;
            removeEventListener(FlexEvent.CREATION_COMPLETE, this.creationCompleteHandler);
            setTimeout(function () : void
            {
                creationComplete = true;
                invalidateProperties();
                return;
            }// end function
            , this.creationCompleteTimeout);
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
