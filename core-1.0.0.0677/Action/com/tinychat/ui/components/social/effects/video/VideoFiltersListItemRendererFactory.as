package com.tinychat.ui.components.social.effects.video
{
    import com.tinychat.ui.components.video.elements.*;

    public class VideoFiltersListItemRendererFactory extends Object implements IFactory
    {
        private var cameraFactory:CameraVideoElementFactory;

        public function VideoFiltersListItemRendererFactory(param1:CameraVideoElementFactory)
        {
            this.cameraFactory = param1;
            return;
        }// end function

        public function newInstance()
        {
            return new VideoFiltersListItemRenderer(this.cameraFactory.newInstance());
        }// end function

    }
}
