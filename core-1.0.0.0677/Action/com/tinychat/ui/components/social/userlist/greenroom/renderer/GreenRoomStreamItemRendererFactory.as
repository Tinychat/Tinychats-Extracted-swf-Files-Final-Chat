package com.tinychat.ui.components.social.userlist.greenroom.renderer
{
    import com.tinychat.ui.components.video.elements.*;

    public class GreenRoomStreamItemRendererFactory extends Object implements IFactory
    {
        private var streamFactory:StreamingVideoElementFactory;

        public function GreenRoomStreamItemRendererFactory(param1:StreamingVideoElementFactory)
        {
            this.streamFactory = param1;
            return;
        }// end function

        public function newInstance()
        {
            return new GreenRoomStreamItemRenderer(this.streamFactory.newInstance());
        }// end function

    }
}
