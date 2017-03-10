package com.tinychat.ui.components.youtube
{
    import com.tinychat.ui.components.media.*;
    import flash.display.*;
    import flash.events.*;
    import mx.binding.utils.*;
    import mx.core.*;
    import mx.managers.*;
    import spark.components.*;
    import spark.utils.*;

    public class YouTubeSelectionItemRenderer extends MediaSelectionItemRenderer
    {
        public var addButton:ToggleButton;
        public var thumbnailGroup:UIComponent;
        public var myWatcher:ChangeWatcher;
        private var _currentState:String;
        public var globeImage:Class;
        private static var _skinParts:Object = {iconDisplay:false, thumbnailDisplayContainer:true, addButton:true, thumbnailGroup:true, thumbnailDisplay:true, labelDisplay:false, defaultThumbnailDisplay:true};

        public function YouTubeSelectionItemRenderer()
        {
            this.globeImage = YouTubeSelectionItemRenderer_globeImage;
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == thumbnailDisplayContainer)
            {
                thumbnailDisplayContainer.addEventListener(MouseEvent.MOUSE_DOWN, this.mouseDownHandler);
                thumbnailDisplayContainer.addEventListener(MouseEvent.MOUSE_UP, this.mouseUpHandler);
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == thumbnailDisplayContainer)
            {
                thumbnailDisplayContainer.removeEventListener(MouseEvent.MOUSE_DOWN, this.mouseDownHandler);
                thumbnailDisplayContainer.removeEventListener(MouseEvent.MOUSE_UP, this.mouseUpHandler);
                thumbnailDisplayContainer.removeEventListener(MouseEvent.MOUSE_MOVE, this.mouseMoveHandler);
            }
            return;
        }// end function

        private function mouseDownHandler(event:MouseEvent) : void
        {
            if (media)
            {
            }
            if (media["index"])
            {
            }
            if (media["index"] == -1)
            {
                thumbnailDisplayContainer.addEventListener(MouseEvent.MOUSE_MOVE, this.mouseMoveHandler);
            }
            return;
        }// end function

        private function mouseUpHandler(event:MouseEvent) : void
        {
            thumbnailDisplayContainer.removeEventListener(MouseEvent.MOUSE_MOVE, this.mouseMoveHandler);
            return;
        }// end function

        private function mouseMoveHandler(event:MouseEvent) : void
        {
            thumbnailDisplayContainer.removeEventListener(MouseEvent.MOUSE_MOVE, this.mouseMoveHandler);
            var _loc_2:* = new DragSource();
            _loc_2.addData(media, "itemsByIndex");
            var _loc_3:* = BitmapUtil.getSnapshot(this.thumbnailGroup);
            var _loc_4:* = new Image();
            _loc_4.source = new Bitmap(_loc_3);
            DragManager.doDrag(thumbnailDisplayContainer, _loc_2, event, _loc_4);
            return;
        }// end function

        override public function set data(param1:Object) : void
        {
            super.data = param1;
            if (media)
            {
            }
            if (param1)
            {
            }
            if ("index" in param1)
            {
                this.myWatcher = ChangeWatcher.watch(param1, "index", this.watcherListener);
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            this.updateChangeWatcher();
            return;
        }// end function

        override protected function stateChanged(param1:String, param2:String, param3:Boolean) : void
        {
            super.stateChanged(param1, param2, param3);
            this._currentState = param2;
            invalidateProperties();
            return;
        }// end function

        private function watcherListener(event:Event) : void
        {
            invalidateProperties();
            return;
        }// end function

        private function updateChangeWatcher() : void
        {
            var _loc_1:Boolean = false;
            if (this.addButton)
            {
            }
            if (media)
            {
            }
            if (media["index"])
            {
                _loc_1 = media["index"] != -1;
                this.addButton.selected = _loc_1;
                if (!_loc_1)
                {
                }
                if (this._currentState != "over")
                {
                }
                if (this._currentState != "down")
                {
                }
                if (this._currentState != "overAndSelected")
                {
                }
                this.addButton.visible = this._currentState == "downAndSelected";
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
