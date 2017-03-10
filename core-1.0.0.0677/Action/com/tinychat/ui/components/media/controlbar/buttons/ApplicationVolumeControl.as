package com.tinychat.ui.components.controlbar.buttons
{
    import com.tinychat.controller.context.*;
    import com.tinychat.ui.components.sound.*;
    import org.robotlegs.core.*;
    import org.robotlegs.utilities.modular.core.*;

    public class ApplicationVolumeControl extends VolumeControl
    {
        private var context:IModuleContext;
        private static var _skinParts:Object = {volumeSlider:true, muteButton:true};

        public function ApplicationVolumeControl()
        {
            return;
        }// end function

        public function set parentInjector(param1:IInjector) : void
        {
            this.context = new ApplicationVolumeControlContext(this, param1);
            return;
        }// end function

        public function dispose() : void
        {
            if (this.context)
            {
                this.context.dispose();
                this.context = null;
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
