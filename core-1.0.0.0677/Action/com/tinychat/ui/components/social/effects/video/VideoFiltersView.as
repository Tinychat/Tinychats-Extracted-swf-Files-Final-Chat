package com.tinychat.ui.components.social.effects.video
{
    import com.tinychat.controller.commands.effect.signal.*;
    import com.tinychat.ui.components.trial.*;
    import flash.events.*;
    import org.osflash.signals.*;
    import spark.components.supportClasses.*;

    public class VideoFiltersView extends SkinnableComponent
    {
        public var videoFiltersList:VideoFiltersList;
        public var trialOverlay:TrialOverlay;
        private var _trialMode:Boolean;
        private var showTrialOverlay:Boolean;
        private var _filterSelected:VideoFilterSelected;
        private static var STATE_NORMAL:String = "normal";
        private static var STATE_TRIAL:String = "trial";
        private static var _skinParts:Object = {videoFiltersList:true, trialOverlay:true};

        public function VideoFiltersView()
        {
            this._filterSelected = new VideoFilterSelected();
            return;
        }// end function

        public function set trialMode(param1:Boolean) : void
        {
            this._trialMode = param1;
            return;
        }// end function

        public function get filterSelected() : ISignal
        {
            return this._filterSelected;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.videoFiltersList)
            {
                this.videoFiltersList.addEventListener(Event.CHANGE, this.videoFiltersListChangeHandler);
            }
            else if (param2 == this.trialOverlay)
            {
                this.trialOverlay.canceled.add(this.trialOverlayCanceledHandler);
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == this.videoFiltersList)
            {
                this.videoFiltersList.removeEventListener(Event.CHANGE, this.videoFiltersListChangeHandler);
            }
            else if (param2 == this.trialOverlay)
            {
                this.trialOverlay.canceled.remove(this.trialOverlayCanceledHandler);
            }
            return;
        }// end function

        override protected function getCurrentSkinState() : String
        {
            if (this.showTrialOverlay)
            {
                return STATE_TRIAL;
            }
            return STATE_NORMAL;
        }// end function

        private function videoFiltersListChangeHandler(event:Event) : void
        {
            if (this._trialMode)
            {
                this.showTrialOverlay = true;
                invalidateSkinState();
            }
            else
            {
                this._filterSelected.dispatch(this.videoFiltersList.broadcast, this.videoFiltersList.selectedItem);
            }
            return;
        }// end function

        private function trialOverlayCanceledHandler() : void
        {
            this.showTrialOverlay = false;
            invalidateSkinState();
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
