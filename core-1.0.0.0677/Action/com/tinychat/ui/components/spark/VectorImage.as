package com.tinychat.ui.components.spark
{
    import flash.geom.*;
    import spark.components.*;
    import spark.core.*;

    public class VectorImage extends Group implements ImageSourceDisplay
    {
        private var image:SpriteVisualElement;
        private var _sourceWidth:Number;
        private var _sourceHeight:Number;
        private var _source:Object;
        private var _color:uint;
        private var colorChanged:Boolean;

        public function VectorImage()
        {
            return;
        }// end function

        public function set source(param1:Object) : void
        {
            if (this._source != param1)
            {
                this._source = param1;
                this._color = 0;
                this._sourceWidth = NaN;
                this._sourceHeight = NaN;
                if (this.image)
                {
                    removeElement(this.image);
                    this.image = null;
                }
                if (param1)
                {
                    if (param1 is Class)
                    {
                        this.image = new param1;
                    }
                    else
                    {
                        this.image = SpriteVisualElement(param1);
                    }
                    this._sourceWidth = this.image.width;
                    this._sourceHeight = this.image.height;
                    addElement(this.image);
                    if (getStyle("tintColor"))
                    {
                        this.color = getStyle("tintColor");
                    }
                    validateDisplayList();
                }
            }
            return;
        }// end function

        public function get sourceWidth() : Number
        {
            return this._sourceWidth;
        }// end function

        public function get sourceHeight() : Number
        {
            return this._sourceHeight;
        }// end function

        override public function styleChanged(param1:String) : void
        {
            super.styleChanged(param1);
            if (param1 == "tintColor")
            {
                this.color = getStyle(param1);
            }
            return;
        }// end function

        override protected function measure() : void
        {
            if (!this.image)
            {
                super.measure();
            }
            else
            {
                measuredWidth = this.image.width;
                measuredHeight = this.image.height;
                measuredMinWidth = 0;
                measuredMinHeight = 0;
            }
            return;
        }// end function

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            var _loc_3:Boolean = false;
            var _loc_4:Boolean = false;
            var _loc_5:Boolean = false;
            var _loc_6:Boolean = false;
            var _loc_7:Boolean = false;
            var _loc_8:Boolean = false;
            var _loc_9:ColorTransform = null;
            super.updateDisplayList(param1, param2);
            if (this.image)
            {
                if (!isNaN(explicitWidth))
                {
                }
                _loc_3 = isNaN(explicitHeight);
                if (isNaN(explicitWidth))
                {
                    isNaN(explicitWidth);
                }
                _loc_4 = !isNaN(explicitHeight);
                if (!isNaN(percentWidth))
                {
                }
                _loc_5 = isNaN(percentHeight);
                if (isNaN(percentWidth))
                {
                    isNaN(percentWidth);
                }
                _loc_6 = !isNaN(percentHeight);
                if (left)
                {
                }
                _loc_7 = right;
                if (top)
                {
                }
                _loc_8 = bottom;
                if (!_loc_3)
                {
                }
                if (!_loc_5)
                {
                    if (_loc_7)
                    {
                    }
                }
                if (!_loc_8)
                {
                    this.image.width = param1;
                    this.image.height = Math.round(param1 / this.widthToHeightRatio);
                }
                else
                {
                    if (!_loc_4)
                    {
                    }
                    if (!_loc_6)
                    {
                        if (_loc_8)
                        {
                        }
                    }
                    if (!_loc_7)
                    {
                        this.image.width = Math.round(param2 * this.widthToHeightRatio);
                        this.image.height = param2;
                    }
                    else
                    {
                        this.image.width = param1;
                        this.image.height = param2;
                    }
                }
                if (this.colorChanged)
                {
                    _loc_9 = new ColorTransform();
                    _loc_9.color = this._color;
                    this.image.transform.colorTransform = _loc_9;
                    this.colorChanged = false;
                }
            }
            return;
        }// end function

        private function set color(param1:uint) : void
        {
            if (this._color != param1)
            {
                this._color = param1;
                this.colorChanged = true;
                invalidateDisplayList();
            }
            return;
        }// end function

        private function get widthToHeightRatio() : Number
        {
            return this.sourceWidth / this.sourceHeight;
        }// end function

    }
}
