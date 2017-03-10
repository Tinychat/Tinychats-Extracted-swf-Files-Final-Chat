package com.tinychat.ui.components.broadcast.selectors
{
    import com.tinychat.model.lists.*;
    import com.tinychat.ui.components.spark.*;
    import spark.components.*;

    public class IconItemRenderer extends ButtonBarButton implements IDataRenderer
    {
        public var iconDisplay2:ImageSourceDisplay;
        public var iconFactory:IconFactory;
        private var _iconFactory:IconFactory;
        private static var _skinParts:Object = {iconFactory:true, labelDisplay:false, iconDisplay:false, iconDisplay2:true};

        public function IconItemRenderer()
        {
            return;
        }// end function

        override public function set data(param1:Object) : void
        {
            var _loc_2:IconListItem = null;
            super.data = param1;
            if (param1)
            {
                _loc_2 = IconListItem(param1);
                this.iconDisplay2.source = this.iconFactory.newInstance(_loc_2);
                enabled = _loc_2.enabled;
                labelDisplay.text = _loc_2.name;
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
