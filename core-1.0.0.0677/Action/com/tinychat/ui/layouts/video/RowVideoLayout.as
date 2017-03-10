package com.tinychat.ui.layouts.video
{
    import __AS3__.vec.*;
    import com.tinychat.ui.layouts.*;
    import mx.core.*;
    import spark.layouts.supportClasses.*;

    public class RowVideoLayout extends LayoutBase
    {
        protected var _gap:Number;
        protected var _aspectRatio:Number;
        protected var algorithm:RowVideoLayoutAlgorithm;

        public function RowVideoLayout()
        {
            this._aspectRatio = 1;
            this._gap = 0;
            return;
        }// end function

        public function set aspectRatio(param1:Number) : void
        {
            this._aspectRatio = param1;
            return;
        }// end function

        public function set gap(param1:Number) : void
        {
            this._gap = param1;
            return;
        }// end function

        override public function updateDisplayList(param1:Number, param2:Number) : void
        {
            if (target.numElements == 0)
            {
                return;
            }
            if (!this.algorithm)
            {
                this.algorithm = new RowVideoLayoutAlgorithm(param1, param2, 0, 0, this._gap, this._aspectRatio);
            }
            else
            {
                this.algorithm.updateVariables(param1, param2, 0, 0, this._gap, this._aspectRatio);
            }
            this.algorithm.layoutElements(this.elements);
            return;
        }// end function

        private function get elements() : Vector.<Layoutable>
        {
            var _loc_3:IVisualElement = null;
            var _loc_1:* = new Vector.<Layoutable>;
            var _loc_2:uint = 0;
            while (_loc_2 < target.numElements)
            {
                
                _loc_3 = target.getElementAt(_loc_2);
                if (_loc_3.includeInLayout)
                {
                    _loc_1.push(new IVisualElementLayoutable(_loc_3));
                }
                _loc_2 = _loc_2 + 1;
            }
            return _loc_1;
        }// end function

    }
}
