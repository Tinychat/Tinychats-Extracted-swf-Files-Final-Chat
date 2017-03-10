package com.tinychat.model.social.chat.encoding
{
    import __AS3__.vec.*;

    public interface CompundElementEncoder extends FontSettings
    {

        public function CompundElementEncoder();

        function encode(param1:String) : Vector.<ContentElement>;

    }
}
