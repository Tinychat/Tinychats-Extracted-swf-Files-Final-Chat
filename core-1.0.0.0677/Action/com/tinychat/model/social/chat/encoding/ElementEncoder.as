package com.tinychat.model.social.chat.encoding
{
    import flash.text.engine.*;

    public interface ElementEncoder extends FontSettings
    {

        public function ElementEncoder();

        function get splitter();

        function encode(param1:String) : ContentElement;

        function test(param1:String) : Boolean;

    }
}
