package com.tinychat.ui.components.broadcast.selectors
{
    import com.tinychat.model.lists.*;
    import flash.display.*;

    public interface IconFactory
    {

        public function IconFactory();

        function newInstance(param1:IconListItem) : DisplayObject;

    }
}
