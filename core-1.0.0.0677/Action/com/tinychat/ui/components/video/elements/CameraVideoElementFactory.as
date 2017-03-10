package com.tinychat.ui.components.video.elements
{

    dynamic public class CameraVideoElementFactory extends Object implements IFactory
    {
        private var clazz:Class;

        public function CameraVideoElementFactory(param1:Class)
        {
            this.clazz = param1;
            return;
        }// end function

        public function newInstance()
        {
            return new this.clazz();
        }// end function

    }
}
