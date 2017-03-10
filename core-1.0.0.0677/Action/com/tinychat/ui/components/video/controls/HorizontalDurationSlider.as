package com.tinychat.ui.components.video.controls
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.monitor.*;
    import flash.events.*;
    import mx.events.*;
    import org.osflash.signals.*;
    import spark.components.*;
    import spark.events.*;

    public class HorizontalDurationSlider extends HSlider
    {
        private var monitor:DurationMonitor;
        private var _source:Timed;
        private var sourceChanged:Boolean;
        private var scrubbing:Boolean;
        private var _changed:Signal;
        private static var _skinParts:Object = {dataTip:false, track:false, thumb:false};

        public function HorizontalDurationSlider()
        {
            minimum = 0;
            stepSize = 1000;
            this._changed = new Signal();
            addEventListener(Event.CHANGE, this.changeHandler);
            addEventListener(FlexEvent.CHANGE_END, this.changeEndHandler);
            addEventListener(TrackBaseEvent.THUMB_DRAG, this.thumbDragHandler);
            addEventListener(TrackBaseEvent.THUMB_RELEASE, this.thumbReleaseHandler);
            return;
        }// end function

        public function get changed() : ISignal
        {
            return this._changed;
        }// end function

        public function set source(param1:Timed) : void
        {
            if (this._source != param1)
            {
                if (this.monitor)
                {
                    this.monitor.stopActivityPolling();
                }
                this._source = param1;
                this.sourceChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            if (this.sourceChanged)
            {
                if (this._source)
                {
                    if (!this.monitor)
                    {
                        this.monitor = new DurationMonitor(this._source);
                    }
                    else
                    {
                        this.monitor.source = this._source;
                    }
                    this.monitor.startActivityPolling(1000, this.monitorActivityHandler);
                    this.updateValue();
                }
                this.sourceChanged = false;
            }
            super.commitProperties();
            return;
        }// end function

        private function updateValue() : void
        {
            value = this._source.currentTime;
            maximum = this._source.duration;
            return;
        }// end function

        private function changeHandler(event:Event) : void
        {
            if (this.scrubbing)
            {
                this.updateSource();
            }
            return;
        }// end function

        private function changeEndHandler(event:FlexEvent) : void
        {
            this.updateSource();
            return;
        }// end function

        private function updateSource() : void
        {
            if (this._source)
            {
                this._source.seekTo(pendingValue, this.scrubbing);
                if (!this.scrubbing)
                {
                    this._changed.dispatch(pendingValue);
                }
            }
            return;
        }// end function

        private function thumbDragHandler(event:TrackBaseEvent) : void
        {
            this.scrubbing = true;
            return;
        }// end function

        private function thumbReleaseHandler(event:TrackBaseEvent) : void
        {
            this.scrubbing = false;
            return;
        }// end function

        private function monitorActivityHandler(param1:Number) : void
        {
            if (!this.scrubbing)
            {
                this.updateValue();
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
