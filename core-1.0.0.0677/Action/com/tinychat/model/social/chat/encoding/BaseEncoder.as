package com.tinychat.model.social.chat.encoding
{
    import flash.errors.*;
    import flash.events.*;
    import flash.text.engine.*;

    public class BaseEncoder extends Object implements ElementEncoder
    {
        private var _formatFactory:FontFormatFactory;
        private var cursor:MouseCursor;
        protected var dispatcher:EventDispatcher;

        public function BaseEncoder(param1:FontFormatFactory, param2:MouseCursor)
        {
            this._formatFactory = param1;
            this.cursor = param2;
            this.dispatcher = new EventDispatcher();
            return;
        }// end function

        public function get family() : String
        {
            return this._formatFactory.family;
        }// end function

        public function set family(param1:String) : void
        {
            this._formatFactory.family = param1;
            return;
        }// end function

        public function get size() : Number
        {
            return this._formatFactory.size;
        }// end function

        public function set size(param1:Number) : void
        {
            this._formatFactory.size = param1;
            return;
        }// end function

        public function get color() : uint
        {
            return this._formatFactory.color;
        }// end function

        public function set color(param1:uint) : void
        {
            this._formatFactory.color = param1;
            return;
        }// end function

        public function get weight() : String
        {
            return this._formatFactory.weight;
        }// end function

        public function set weight(param1:String) : void
        {
            this._formatFactory.weight = param1;
            return;
        }// end function

        public function get splitter()
        {
            throw new IllegalOperationError("Must be over-ridden in subclass.");
        }// end function

        final public function encode(param1:String) : ContentElement
        {
            var _loc_2:* = this.createContentElement(param1);
            _loc_2.eventMirror = this.dispatcher;
            this.cursor.dispatcher = this.dispatcher;
            return _loc_2;
        }// end function

        public function test(param1:String) : Boolean
        {
            throw new IllegalOperationError("Must be over-ridden in subclass.");
        }// end function

        protected function get format() : ElementFormat
        {
            return this._formatFactory.format;
        }// end function

        protected function createContentElement(param1:String) : ContentElement
        {
            throw new IllegalOperationError("Must be over-ridden in subclass.");
        }// end function

    }
}
