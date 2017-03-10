package com.tinychat.controller.commands.mappings
{
    import com.tinychat.ui.components.video.elements.*;

    public class SoftwareVideoMappingCommand extends MappingCommand
    {

        public function SoftwareVideoMappingCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            injector.mapValue(CameraVideoElementFactory, new CameraVideoElementFactory(SoftwareVideoElement));
            injector.mapValue(StreamingVideoElementFactory, new StreamingVideoElementFactory(SoftwareVideoElement));
            return;
        }// end function

    }
}
