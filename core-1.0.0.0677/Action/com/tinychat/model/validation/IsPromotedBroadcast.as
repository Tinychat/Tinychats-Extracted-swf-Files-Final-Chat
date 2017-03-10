package com.tinychat.model.validation
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.validation.broadcast.*;
    import com.tinychat.ui.components.broadcast.lists.*;

    public class IsPromotedBroadcast extends IsBroadcaster
    {
        private var canvas:RoomBroadcastCanvas;

        public function IsPromotedBroadcast(param1:RoomBroadcastCanvasBroadcasts, param2:RoomBroadcastCanvas)
        {
            super(param1);
            this.canvas = param2;
            return;
        }// end function

        override public function isValid(param1:Identity) : Boolean
        {
            if (super.isValid(param1))
            {
                super.isValid(param1);
            }
            if (this.canvas.selectedItem)
            {
            }
            return this.canvas.selectedItem.id == param1.id;
        }// end function

    }
}
