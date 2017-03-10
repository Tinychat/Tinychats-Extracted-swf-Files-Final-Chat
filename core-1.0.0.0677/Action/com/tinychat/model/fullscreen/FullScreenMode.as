package com.tinychat.model.fullscreen
{
    import com.tinychat.model.layout.*;
    import flash.display.*;
    import flash.events.*;

    public class FullScreenMode extends Object
    {
        private var stage:Stage;
        private var layout:ApplicationLayout;
        private var _toggled:Boolean;
        private var previousApplicationLayout:ApplicationLayoutState;

        public function FullScreenMode(param1:Stage, param2:ApplicationLayout)
        {
            this.stage = param1;
            this.layout = param2;
            param1.addEventListener(FullScreenEvent.FULL_SCREEN, this.fullScreenHandler);
            return;
        }// end function

        public function set toggled(param1:Boolean) : void
        {
            if (this._toggled != param1)
            {
                this._toggled = param1;
                this.update();
            }
            return;
        }// end function

        private function update() : void
        {
            if (this._toggled)
            {
                this.previousApplicationLayout = this.layout.currentState;
                this.layout.currentState = ApplicationLayoutState.VIDEO_ONLY;
                try
                {
                    this.state = "fullScreenInteractive";
                }
                catch (error:Error)
                {
                    try
                    {
                        state = StageDisplayState.FULL_SCREEN;
                    }
                    catch (error:Error)
                    {
                        state = StageDisplayState.NORMAL;
                    }
                }
                else
                {
                    this.layout.currentState = this.previousApplicationLayout;
                    this.state = StageDisplayState.NORMAL;
                }
                return;
        }// end function

        private function set state(param1:String) : void
        {
            this.stage.displayState = param1;
            return;
        }// end function

        private function fullScreenHandler(event:FullScreenEvent) : void
        {
            this.toggled = event.fullScreen;
            return;
        }// end function

    }
}
