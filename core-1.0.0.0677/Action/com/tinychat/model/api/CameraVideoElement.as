package com.tinychat.model.api
{

    public interface CameraVideoElement extends StreamingVideoElement, CameraAttachable, CameraDetachable
    {

        public function CameraVideoElement();

        function clear() : void;

    }
}
