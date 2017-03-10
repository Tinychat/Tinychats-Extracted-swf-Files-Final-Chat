package com.tinychat.model.youtube
{
    import flash.events.*;
    import mx.events.*;

    public class YouTubeClip extends Object implements Media, IEventDispatcher
    {
        private var _id:String;
        private var _title:String;
        private var _thumbnailUrl:String;
        private var _largeThumbnailUrl:String;
        private var _100346066index:int = -1;
        private var _bindingEventDispatcher:EventDispatcher;

        public function YouTubeClip(param1:String, param2:String, param3:String, param4:String)
        {
            this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
            this._id = param1;
            this._title = param2;
            this._thumbnailUrl = param4;
            this._largeThumbnailUrl = param3;
            return;
        }// end function

        public function get id() : String
        {
            return this._id;
        }// end function

        public function get title() : String
        {
            return this._title;
        }// end function

        public function get thumbnailUrl() : String
        {
            return this._thumbnailUrl;
        }// end function

        public function get largeThumbnailUrl() : String
        {
            return this._largeThumbnailUrl;
        }// end function

        public function toString() : String
        {
            return [this.id, this.title, this.largeThumbnailUrl, this.thumbnailUrl].toString();
        }// end function

        public function get index() : int
        {
            return this._100346066index;
        }// end function

        public function set index(param1:int) : void
        {
            var _loc_2:* = this._100346066index;
            if (_loc_2 !== param1)
            {
                this._100346066index = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "index", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
        {
            this._bindingEventDispatcher.addEventListener(param1, param2, param3, param4, param5);
            return;
        }// end function

        public function dispatchEvent(event:Event) : Boolean
        {
            return this._bindingEventDispatcher.dispatchEvent(event);
        }// end function

        public function hasEventListener(param1:String) : Boolean
        {
            return this._bindingEventDispatcher.hasEventListener(param1);
        }// end function

        public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
        {
            this._bindingEventDispatcher.removeEventListener(param1, param2, param3);
            return;
        }// end function

        public function willTrigger(param1:String) : Boolean
        {
            return this._bindingEventDispatcher.willTrigger(param1);
        }// end function

    }
}
