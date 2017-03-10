package com.tinychat.ui.components.social.effects.video
{
    import com.tinychat.model.api.*;
    import com.tinychat.ui.components.broadcast.containers.*;

    public class VideoFiltersListItemRenderer extends CameraBroadcastContainer implements IItemRenderer
    {
        private var _selected:Boolean;
        private var _itemIndex:int;
        private static const STATE_SELECTED:String = "selected";
        private static var _skinParts:Object = {volumeControl:false, nameDisplay:false, contentGroup:false, iconAchiev:false, proIndicator:false, audioActivityIndicator:false, videoControlsOverlay:false};

        public function VideoFiltersListItemRenderer(param1:CameraVideoElement)
        {
            super(null, param1);
            return;
        }// end function

        public function get data() : Object
        {
            return broadcast;
        }// end function

        public function set data(param1:Object) : void
        {
            if (broadcast != param1)
            {
                com.tinychat.ui.components.broadcast.containers:CameraBroadcastContainer::broadcast = param1 as Broadcast;
            }
            return;
        }// end function

        public function get selected() : Boolean
        {
            return this._selected;
        }// end function

        public function set selected(param1:Boolean) : void
        {
            if (this._selected != param1)
            {
                this._selected = param1;
                invalidateSkinState();
            }
            return;
        }// end function

        override protected function getCurrentSkinState() : String
        {
            if (this._selected)
            {
                return STATE_SELECTED;
            }
            return super.getCurrentSkinState();
        }// end function

        public function get dragging() : Boolean
        {
            return false;
        }// end function

        public function set dragging(param1:Boolean) : void
        {
            return;
        }// end function

        public function get itemIndex() : int
        {
            return this._itemIndex;
        }// end function

        public function set itemIndex(param1:int) : void
        {
            this._itemIndex = param1;
            return;
        }// end function

        public function get label() : String
        {
            return "";
        }// end function

        public function set label(param1:String) : void
        {
            return;
        }// end function

        public function get showsCaret() : Boolean
        {
            return false;
        }// end function

        public function set showsCaret(param1:Boolean) : void
        {
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
