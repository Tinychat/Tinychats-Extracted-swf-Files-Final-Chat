package com.tinychat.ui.components.spark
{
    import com.tinychat.model.utils.*;
    import flash.display.*;
    import flash.system.*;
    import spark.primitives.*;

    public class AdvancedBitmapImage extends BitmapImage implements ImageSourceDisplay
    {
        private var loader:DirectImageUrlLoader;
        private var context:LoaderContext;

        public function AdvancedBitmapImage()
        {
            return;
        }// end function

        override public function set source(param1:Object) : void
        {
            if (param1 is String)
            {
                if (!this.loader)
                {
                    this.loader = new DirectImageUrlLoader();
                }
                this.loader.loaded.addOnce(this.loadedHandler);
                this.loader.load(param1 as String);
            }
            else
            {
                super.source = param1;
            }
            return;
        }// end function

        private function loadedHandler(param1:DisplayObject) : void
        {
            this.loader.loaded.remove(this.loadedHandler);
            this.source = param1;
            this.loader.unload();
            return;
        }// end function

    }
}
