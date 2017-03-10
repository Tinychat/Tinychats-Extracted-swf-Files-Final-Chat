package com.tinychat.model.api
{

    public interface StreamingVideoElement extends VideoElement, StreamAttachable, StreamDetachable
    {

        public function StreamingVideoElement();

        function updateVideoLayout() : void;

        function set rotate90CW(param1:Boolean) : void;

        function set rotate270CW(param1:Boolean) : void;

    }
}
