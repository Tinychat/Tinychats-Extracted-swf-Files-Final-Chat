package com.tinychat.ui.components.broadcast.containers
{
    import flash.geom.*;

    public interface BroadcastContainer extends Identity, Named, IVisualElement, IBitmapDrawable, Disposable
    {

        public function BroadcastContainer();

        function localToGlobal(param1:Point) : Point;

        function get enabled() : Boolean;

        function set enabled(param1:Boolean) : void;

    }
}
