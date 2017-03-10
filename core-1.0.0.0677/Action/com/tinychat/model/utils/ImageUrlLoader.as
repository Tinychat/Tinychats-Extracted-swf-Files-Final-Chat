package com.tinychat.model.utils
{
    import flash.display.*;
    import org.osflash.signals.*;

    public interface ImageUrlLoader
    {

        public function ImageUrlLoader();

        function get picture() : DisplayObject;

        function get loaded() : ISignal;

        function get isLoaded() : Boolean;

        function load(param1:String) : void;

    }
}
