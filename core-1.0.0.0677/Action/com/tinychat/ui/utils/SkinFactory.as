package com.tinychat.ui.utils
{
    import mx.core.*;

    public class SkinFactory extends ClassFactory implements IFactory
    {
        private var skinClass:Class;

        public function SkinFactory(param1:Class, param2:Class)
        {
            super(param1);
            this.skinClass = param2;
            return;
        }// end function

        override public function newInstance()
        {
            var _loc_1:* = super.newInstance();
            _loc_1.setStyle("skinClass", this.skinClass);
            return _loc_1;
        }// end function

    }
}
