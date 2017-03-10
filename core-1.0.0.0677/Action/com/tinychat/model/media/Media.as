package com.tinychat.model.media
{

    public interface Media extends Identity
    {

        public function Media();

        function get title() : String;

        function get thumbnailUrl() : String;

    }
}
