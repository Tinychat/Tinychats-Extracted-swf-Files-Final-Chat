package com.tinychat.ui.skins.gotham.components.youtube
{
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.primitives.*;
    import spark.skins.*;

    public class YouTubeShuffleButtonSkin extends SparkButtonSkin implements IStateClient2
    {
        private var _1919293257iconDisplay2:BitmapImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _embed_mxml__images_icons_playlist_shuffle_png_757184047:Class;

        public function YouTubeShuffleButtonSkin()
        {
            this._embed_mxml__images_icons_playlist_shuffle_png_757184047 = YouTubeShuffleButtonSkin__embed_mxml__images_icons_playlist_shuffle_png_757184047;
            mx_internal::_document = this;
            this.minWidth = 20;
            this.minHeight = 20;
            this.mxmlContent = [this._YouTubeShuffleButtonSkin_Rect1_c(), this._YouTubeShuffleButtonSkin_BitmapImage1_i()];
            this.currentState = "up";
            states = [new State({name:"up", overrides:[]}), new State({name:"over", stateGroups:["overStates"], overrides:[new SetProperty().initializeFromObject({target:"iconDisplay2", name:"alpha", value:0.6})]}), new State({name:"down", stateGroups:["downStates"], overrides:[]}), new State({name:"disabled", stateGroups:["disabledStates"], overrides:[new SetProperty().initializeFromObject({name:"alpha", value:0.5})]}), new State({name:"upAndSelected", stateGroups:["selectedUpStates", "selectedStates"], overrides:[new SetProperty().initializeFromObject({target:"iconDisplay2", name:"alpha", value:1})]}), new State({name:"overAndSelected", stateGroups:["overStates", "selectedStates"], overrides:[new SetProperty().initializeFromObject({target:"iconDisplay2", name:"alpha", value:0.9})]}), new State({name:"downAndSelected", stateGroups:["downStates", "selectedStates"], overrides:[new SetProperty().initializeFromObject({target:"iconDisplay2", name:"alpha", value:1})]}), new State({name:"disabledAndSelected", stateGroups:["disabledStates", "selectedUpStates", "selectedStates"], overrides:[new SetProperty().initializeFromObject({name:"alpha", value:0.5})]})];
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

        private function _YouTubeShuffleButtonSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._YouTubeShuffleButtonSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _YouTubeShuffleButtonSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.alpha = 0;
            _loc_1.color = 255;
            return _loc_1;
        }// end function

        private function _YouTubeShuffleButtonSkin_BitmapImage1_i() : BitmapImage
        {
            var _loc_1:* = new BitmapImage();
            _loc_1.width = 24;
            _loc_1.height = 20;
            _loc_1.alpha = 0.5;
            _loc_1.source = this._embed_mxml__images_icons_playlist_shuffle_png_757184047;
            _loc_1.initialized(this, "iconDisplay2");
            this.iconDisplay2 = _loc_1;
            BindingManager.executeBindings(this, "iconDisplay2", this.iconDisplay2);
            return _loc_1;
        }// end function

        public function get iconDisplay2() : BitmapImage
        {
            return this._1919293257iconDisplay2;
        }// end function

        public function set iconDisplay2(param1:BitmapImage) : void
        {
            var _loc_2:* = this._1919293257iconDisplay2;
            if (_loc_2 !== param1)
            {
                this._1919293257iconDisplay2 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconDisplay2", _loc_2, param1));
                }
            }
            return;
        }// end function

    }
}
