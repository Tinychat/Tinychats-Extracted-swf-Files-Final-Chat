package com.tinychat.model.videoeffects
{
    import spark.filters.*;

    dynamic public class AdvancedShaderFilter extends ShaderFilter
    {
        private var _update:Function;

        public function AdvancedShaderFilter(param1:Object = null, param2:Function = null)
        {
            this._update = param2;
            super(param1);
            return;
        }// end function

        public function update(param1:Number, param2:Number) : void
        {
            if (this._update != null)
            {
                this._update.call(this, param1, param2);
            }
            return;
        }// end function

    }
}
