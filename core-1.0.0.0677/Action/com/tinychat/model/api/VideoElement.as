package com.tinychat.model.api
{

    public interface VideoElement extends IVisualElement, Disposable, IBitmapDrawable
    {

        public function VideoElement();

        function get filters() : Array;

        function set filters(param1:Array) : void;

    }
}
