package com.tinychat.ui.layouts.video
{
    import com.tinychat.model.broadcast.layout.*;
    import spark.layouts.supportClasses.*;

    public class VideoLayoutFactory extends Object
    {

        public function VideoLayoutFactory()
        {
            return;
        }// end function

        public function newInstance(param1:BroadcastLayouts) : LayoutBase
        {
            var _loc_2:LayoutBase = null;
            var _loc_3:PromotedVideoLayout = null;
            var _loc_4:RowVideoLayout = null;
            if (param1 == BroadcastLayouts.PROMOTED)
            {
                _loc_3 = new PromotedVideoLayout();
                _loc_3.aspectRatio = 4 / 3;
                _loc_3.promotedElementGap = 10;
                _loc_3.demotedElementGap = 2;
                _loc_3.promotedElementSizeRatio = 0.7;
                _loc_2 = _loc_3;
            }
            else if (param1 == BroadcastLayouts.ROWS)
            {
                _loc_4 = new RowVideoLayout();
                _loc_4.aspectRatio = 4 / 3;
                _loc_4.gap = 2;
                _loc_2 = _loc_4;
            }
            return _loc_2;
        }// end function

    }
}
