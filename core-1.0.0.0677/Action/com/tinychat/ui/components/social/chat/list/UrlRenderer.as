package com.tinychat.ui.components.social.chat.list
{
    import __AS3__.vec.*;
    import com.tinychat.model.social.chat.encoding.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.text.engine.*;
    import org.osflash.signals.*;

    public class UrlRenderer extends Object
    {
        private var encoders:Vector.<InteractiveElementEncoder>;
        private var _clicked:Signal;

        public function UrlRenderer(param1:Vector.<InteractiveElementEncoder>)
        {
            var _loc_2:InteractiveElementEncoder = null;
            this.encoders = param1;
            this._clicked = new Signal(String);
            for each (_loc_2 in param1)
            {
                
                _loc_2.addEventListener(Event.ADDED_TO_STAGE, this.createAddedHandlerWrapper(_loc_2));
                _loc_2.addEventListener(MouseEvent.CLICK, this.clickHandler);
            }
            return;
        }// end function

        public function get clicked() : ISignal
        {
            return this._clicked;
        }// end function

        private function createAddedHandlerWrapper(param1:InteractiveElementEncoder) : Function
        {
            var encoder:* = param1;
            return function (event:Event) : void
            {
                addedHandler.call(null, event, encoder);
                return;
            }// end function
            ;
        }// end function

        private function addedHandler(event:Event, param2:InteractiveElementEncoder) : void
        {
            var _loc_4:TextLineMirrorRegion = null;
            var _loc_3:* = event.target as TextLine;
            for each (_loc_4 in _loc_3.mirrorRegions)
            {
                
                if (param2.test(_loc_4.element.text))
                {
                    _loc_3.addChild(this.createUnderline(_loc_4.bounds, param2.color));
                }
            }
            return;
        }// end function

        private function createUnderline(param1:Rectangle, param2:uint) : Shape
        {
            var _loc_3:* = new Shape();
            _loc_3.graphics.lineStyle(1, param2);
            _loc_3.graphics.moveTo(0, 0);
            _loc_3.graphics.lineTo(param1.width, 0);
            _loc_3.x = param1.x;
            _loc_3.y = 2;
            return _loc_3;
        }// end function

        private function clickHandler(event:MouseEvent) : void
        {
            var _loc_3:Point = null;
            var _loc_4:TextLineMirrorRegion = null;
            var _loc_2:* = event.target as TextLine;
            if (_loc_2)
            {
                _loc_3 = _loc_2.globalToLocal(new Point(event.stageX, event.stageY));
                for each (_loc_4 in _loc_2.mirrorRegions)
                {
                    
                    if (_loc_4.bounds.containsPoint(_loc_3))
                    {
                        this._clicked.dispatch(_loc_4.element.text);
                    }
                }
            }
            return;
        }// end function

    }
}
