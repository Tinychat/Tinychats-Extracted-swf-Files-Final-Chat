package com.tinychat.ui.mediators.social.effects.video
{
    import com.tinychat.controller.commands.effect.signal.*;
    import com.tinychat.controller.guards.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.videoeffects.*;
    import com.tinychat.ui.components.social.effects.video.*;
    import mx.collections.*;
    import org.robotlegs.mvcs.*;

    public class VideoFiltersListMediator extends Mediator
    {
        public var view:VideoFiltersList;
        public var broadcasts:RoomCameraBroadcasts;
        public var factory:VideoFiltersListItemRendererFactory;
        public var isBroadcastingVideo:IsBroadcastingVideoGuard;
        public var selected:VideoFilterSelected;
        private var filters:ArrayList;

        public function VideoFiltersListMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.itemRenderer = this.factory;
            this.isBroadcastingVideo.addChangeListener(this.broadcastingVideoChange);
            this.broadcastingVideoChange(this.isBroadcastingVideo.approve());
            return;
        }// end function

        override public function onRemove() : void
        {
            this.view.dispose();
            if (this.filters)
            {
                this.filters.removeAll();
            }
            this.isBroadcastingVideo.removeChangeListener(this.broadcastingVideoChange);
            return;
        }// end function

        public function broadcastingVideoChange(param1:Boolean) : void
        {
            var _loc_2:CameraBroadcast = null;
            var _loc_3:VideoFilter = null;
            if (param1)
            {
                _loc_2 = CameraBroadcast(this.broadcasts.all[0]);
                _loc_3 = _loc_2.videoFilter;
                if (!this.filters)
                {
                    this.populateFilters();
                }
                this.view.broadcast = _loc_2;
                this.view.dataProvider = this.filters;
                this.view.selectedItem = _loc_3;
            }
            else if (this.filters)
            {
                this.filters.removeAll();
                this.filters = null;
            }
            return;
        }// end function

        private function populateFilters() : void
        {
            this.filters = new ArrayList([VideoFilter.BLUE, VideoFilter.BLUR, VideoFilter.BULGE, VideoFilter.CIRCLE_SPLASH, VideoFilter.GRAYSCALE, VideoFilter.GREEN, VideoFilter.KALEIDOSCOPE, VideoFilter.MERCATOR, VideoFilter.NEGATIVE, VideoFilter.OUTLINE, VideoFilter.PIXELATE, VideoFilter.PINCH, VideoFilter.POSTER, VideoFilter.POSTERIZE, VideoFilter.RADIAL_CALEIDOSCOPE, VideoFilter.RED, VideoFilter.SCAN_LINE, VideoFilter.SEPIA, VideoFilter.SHARPEN, VideoFilter.SMUDGE, VideoFilter.SPHERE, VideoFilter.TUBE_VIEW, VideoFilter.TWIRL, VideoFilter.VINTAGE]);
            return;
        }// end function

    }
}
