package com.tinychat.ui.skins.gotham.components.social.effects.video
{
    import com.tinychat.ui.components.social.effects.video.*;
    import com.tinychat.ui.components.trial.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.supportClasses.*;

    public class VideoFiltersViewSkin extends Skin implements IStateClient2
    {
        private var _529516634trialOverlay:TrialOverlay;
        private var _1376003138videoFiltersList:VideoFiltersList;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:VideoFiltersView;

        public function VideoFiltersViewSkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._VideoFiltersViewSkin_VideoFiltersList1_i()];
            this.currentState = "normal";
            var _loc_1:* = new DeferredInstanceFromFunction(this._VideoFiltersViewSkin_TrialOverlay1_i);
            states = [new State({name:"normal", overrides:[]}), new State({name:"trial", overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["videoFiltersList"]})]})];
            return;
        }// end function

        override public function set moduleFactory(param1:IFlexModuleFactory) : void
        {
            super.moduleFactory = param1;
            if (this.__moduleFactoryInitialized)
            {
                return;
            }
            this.__moduleFactoryInitialized = true;
            return;
        }// end function

        override public function initialize() : void
        {
            super.initialize();
            return;
        }// end function

        private function _VideoFiltersViewSkin_VideoFiltersList1_i() : VideoFiltersList
        {
            var _loc_1:* = new VideoFiltersList();
            _loc_1.percentWidth = 100;
            _loc_1.percentHeight = 100;
            _loc_1.id = "videoFiltersList";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.videoFiltersList = _loc_1;
            BindingManager.executeBindings(this, "videoFiltersList", this.videoFiltersList);
            return _loc_1;
        }// end function

        private function _VideoFiltersViewSkin_TrialOverlay1_i() : TrialOverlay
        {
            var _loc_1:* = new TrialOverlay();
            _loc_1.percentWidth = 100;
            _loc_1.percentHeight = 100;
            _loc_1.styleName = "trialOverlay";
            _loc_1.id = "trialOverlay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.trialOverlay = _loc_1;
            BindingManager.executeBindings(this, "trialOverlay", this.trialOverlay);
            return _loc_1;
        }// end function

        public function get trialOverlay() : TrialOverlay
        {
            return this._529516634trialOverlay;
        }// end function

        public function set trialOverlay(param1:TrialOverlay) : void
        {
            var _loc_2:* = this._529516634trialOverlay;
            if (_loc_2 !== param1)
            {
                this._529516634trialOverlay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "trialOverlay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get videoFiltersList() : VideoFiltersList
        {
            return this._1376003138videoFiltersList;
        }// end function

        public function set videoFiltersList(param1:VideoFiltersList) : void
        {
            var _loc_2:* = this._1376003138videoFiltersList;
            if (_loc_2 !== param1)
            {
                this._1376003138videoFiltersList = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "videoFiltersList", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : VideoFiltersView
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:VideoFiltersView) : void
        {
            var _loc_2:* = this._213507019hostComponent;
            if (_loc_2 !== param1)
            {
                this._213507019hostComponent = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hostComponent", _loc_2, param1));
                }
            }
            return;
        }// end function

    }
}
