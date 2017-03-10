package com.tinychat.controller.context
{
    import com.tinychat.model.api.*;
    import com.tinychat.ui.components.sound.*;
    import com.tinychat.ui.mediators.controlbar.buttons.*;
    import com.tinychat.ui.mediators.sound.*;
    import flash.display.*;
    import org.robotlegs.core.*;
    import org.robotlegs.utilities.modular.mvcs.*;
    import spark.components.supportClasses.*;

    public class ApplicationVolumeControlContext extends ModuleContext
    {

        public function ApplicationVolumeControlContext(param1:DisplayObjectContainer, param2:IInjector)
        {
            super(param1, true, param2);
            return;
        }// end function

        override public function dispose() : void
        {
            mediatorMap.removeMediatorByView(contextView);
            super.dispose();
            return;
        }// end function

        override protected function mapInjections() : void
        {
            super.mapInjections();
            injector.mapValue(SoundControl, injector.getInstance(MasterSoundControl));
            mediatorMap.mapView(MuteButton, ApplicationMuteButtonMediator);
            mediatorMap.mapView(VerticalVolumeSlider, VolumeSliderMediator, SliderBase);
            return;
        }// end function

    }
}
