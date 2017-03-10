package com.tinychat.ui.utils
{
    import flash.display.*;
    import flash.geom.*;
    import mx.core.*;
    import mx.events.*;
    import spark.components.supportClasses.*;
    import spark.primitives.*;

    public class ElementAwareRect extends Rect
    {
        private var _elementContainer:GroupBase;
        private var _elements:Array;
        private var bitmapDataSource:Shape;
        private var bitmapData:BitmapData;

        public function ElementAwareRect()
        {
            this.bitmapDataSource = new Shape();
            return;
        }// end function

        public function set elementContainer(param1:GroupBase) : void
        {
            this._elementContainer = param1;
            this._elementContainer.addEventListener(FlexEvent.UPDATE_COMPLETE, this.elementContainerUpdateCompleteHandler, false, 0, true);
            return;
        }// end function

        public function set elements(param1:Array) : void
        {
            var _loc_2:IVisualElement = null;
            this._elements = [];
            for each (_loc_2 in param1)
            {
                
                if (_loc_2)
                {
                    this._elements.push(_loc_2);
                    _loc_2.addEventListener(FlexEvent.UPDATE_COMPLETE, this.elementUpdateCompleteHandler, false, 0, true);
                }
            }
            return;
        }// end function

        override protected function beginDraw(param1:Graphics) : void
        {
            if (this.hasElementsToDrawAround)
            {
                this.bitmapDataSource.graphics.clear();
                super.beginDraw(this.bitmapDataSource.graphics);
            }
            else
            {
                super.beginDraw(param1);
            }
            return;
        }// end function

        override protected function draw(param1:Graphics) : void
        {
            if (this.hasElementsToDrawAround)
            {
                super.draw(this.bitmapDataSource.graphics);
            }
            else
            {
                super.draw(param1);
            }
            return;
        }// end function

        override protected function endDraw(param1:Graphics) : void
        {
            var _loc_2:BitmapData = null;
            var _loc_3:Shape = null;
            var _loc_4:IVisualElement = null;
            var _loc_5:uint = 0;
            if (this.hasElementsToDrawAround)
            {
                super.endDraw(this.bitmapDataSource.graphics);
                _loc_2 = new BitmapData(width, height);
                _loc_2.draw(this.bitmapDataSource);
                _loc_3 = new Shape();
                _loc_5 = 0;
                do
                {
                    
                    _loc_4 = this._elementContainer.getElementAt(_loc_5);
                    this.eraseElementAreaFrom(_loc_2, _loc_3, _loc_4);
                    _loc_5 = _loc_5 + 1;
                    if (this._elementContainer)
                    {
                    }
                }while (_loc_5 < this._elementContainer.numElements)
                for each (_loc_4 in this._elements)
                {
                    
                    this.eraseElementAreaFrom(_loc_2, _loc_3, _loc_4);
                }
                param1.beginBitmapFill(_loc_2);
                param1.drawRect(drawX, drawY, width, height);
                param1.endFill();
            }
            else
            {
                super.endDraw(param1);
            }
            return;
        }// end function

        private function eraseElementAreaFrom(param1:BitmapData, param2:Shape, param3:IVisualElement) : void
        {
            var _loc_4:* = param3.parent.localToGlobal(new Point(param3.x, param3.y));
            var _loc_5:* = parent.globalToLocal(_loc_4);
            param2.graphics.clear();
            param2.graphics.beginFill(0);
            param2.graphics.drawRect(_loc_5.x, _loc_5.y, param3.width, param3.height);
            param2.graphics.endFill();
            param1.draw(param2, null, null, BlendMode.ERASE);
            return;
        }// end function

        private function get hasElementsToDrawAround() : Boolean
        {
            if (this._elementContainer)
            {
            }
            if (!this._elementContainer.numElements)
            {
                if (this._elements)
                {
                }
            }
            return this._elements.length > 0;
        }// end function

        private function elementContainerUpdateCompleteHandler(event:FlexEvent) : void
        {
            invalidateDisplayList();
            return;
        }// end function

        private function elementUpdateCompleteHandler(event:FlexEvent) : void
        {
            invalidateDisplayList();
            return;
        }// end function

    }
}
