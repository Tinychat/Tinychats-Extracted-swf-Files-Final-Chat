package com.tinychat.ui.skins.gotham.components.loadingindicators
{
    import com.tinychat.ui.components.preloader.*;
    import flash.display.*;
    import flash.events.*;
    import org.osflash.signals.*;
    import spark.core.*;

    public class Pupil extends SpriteVisualElement implements LoadingIndicator
    {
        private const PupilPreloaderBytes:Class;
        private var pupilLoader:EmbeddedSwfLoader;
        private var pupil:MovieClip;
        private var _loaded:Signal;
        private var _fadeCompleted:Signal;
        private var _isLoaded:Boolean;

        public function Pupil()
        {
            this.PupilPreloaderBytes = Pupil_PupilPreloaderBytes;
            this.width = 100;
            this.height = 82;
            this.addEventListener("addedToStage", this.___Pupil_SpriteVisualElement1_addedToStage);
            this.addEventListener("removedFromStage", this.___Pupil_SpriteVisualElement1_removedFromStage);
            return;
        }// end function

        public function get loaded() : ISignal
        {
            if (!this._loaded)
            {
                this._loaded = new Signal();
            }
            return this._loaded;
        }// end function

        public function get fadeCompleted() : ISignal
        {
            if (!this._fadeCompleted)
            {
                this._fadeCompleted = new Signal();
            }
            return this._fadeCompleted;
        }// end function

        public function get isLoaded() : Boolean
        {
            return this._isLoaded;
        }// end function

        public function fade() : void
        {
            if (this.pupil)
            {
                this.pupil.addEventListener(Event.COMPLETE, this.fadeCompleteHandler);
                this.pupil.fade();
            }
            return;
        }// end function

        public function start() : void
        {
            if (this.pupil)
            {
                this.pupil.start();
            }
            return;
        }// end function

        private function addedToStageHandler() : void
        {
            if (!this.pupilLoader)
            {
                this.pupilLoader = new EmbeddedSwfLoader(new this.PupilPreloaderBytes());
                this.pupilLoader.addEventListener(Event.COMPLETE, this.loaderCompleteHandler);
            }
            addChild(this.pupilLoader);
            if (this.pupil)
            {
                this.pupil.start();
            }
            return;
        }// end function

        private function removedFromStageHandler() : void
        {
            if (this.pupilLoader)
            {
                removeChild(this.pupilLoader);
            }
            return;
        }// end function

        private function loaderCompleteHandler(event:Event) : void
        {
            this.pupilLoader.removeEventListener(Event.COMPLETE, this.loaderCompleteHandler);
            this.pupilLoader.x = 0;
            this.pupilLoader.y = 0;
            this.pupil = MovieClip(this.pupilLoader.content);
            this.start();
            this._isLoaded = true;
            this._loaded.dispatch();
            return;
        }// end function

        private function fadeCompleteHandler(event:Event) : void
        {
            this.pupil.removeEventListener(Event.COMPLETE, this.fadeCompleteHandler);
            this._fadeCompleted.dispatch();
            return;
        }// end function

        public function ___Pupil_SpriteVisualElement1_addedToStage(event:Event) : void
        {
            this.addedToStageHandler();
            return;
        }// end function

        public function ___Pupil_SpriteVisualElement1_removedFromStage(event:Event) : void
        {
            this.removedFromStageHandler();
            return;
        }// end function

    }
}
