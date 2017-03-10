package com.tinychat.ui.components.video.elements
{
    import com.tinychat.model.videoeffects.*;
    import flash.geom.*;
    import flash.media.*;
    import flash.net.*;
    import spark.core.*;

    public class SoftwareVideoElement extends SpriteVisualElement implements CameraVideoElement, Disposable
    {
        private var video:Video;
        private var originalVideoTransform:Matrix;
        private var _rotate90CW:Boolean;
        private var _rotate270CW:Boolean;

        public function SoftwareVideoElement()
        {
            this.video = new Video();
            this.video.smoothing = true;
            addChild(this.video);
            this.originalVideoTransform = this.video.transform.matrix;
            return;
        }// end function

        public function set rotate90CW(param1:Boolean) : void
        {
            if (this._rotate90CW != param1)
            {
                this._rotate90CW = param1;
                this.updateVideoLayout();
            }
            return;
        }// end function

        public function set rotate270CW(param1:Boolean) : void
        {
            if (this._rotate270CW != param1)
            {
                this._rotate270CW = param1;
                this.updateVideoLayout();
            }
            return;
        }// end function

        public function attachCamera(param1:Camera) : void
        {
            this.video.attachCamera(param1);
            return;
        }// end function

        public function detachCamera() : void
        {
            this.video.attachCamera(null);
            return;
        }// end function

        public function attachNetStream(param1:NetStream) : void
        {
            this.video.attachNetStream(param1);
            return;
        }// end function

        public function detachNetStream() : void
        {
            this.video.attachNetStream(null);
            return;
        }// end function

        public function updateVideoLayout() : void
        {
            var _loc_1:AdvancedShaderFilter = null;
            var _loc_2:Number = NaN;
            var _loc_3:Matrix = null;
            var _loc_4:Number = NaN;
            var _loc_5:Number = NaN;
            if (this.video)
            {
            }
            if (width > 0)
            {
            }
            if (height > 0)
            {
                _loc_3 = this.originalVideoTransform.clone();
                this.video.transform.matrix = _loc_3;
                if (!this._rotate90CW)
                {
                }
                _loc_2 = this._rotate270CW ? (height / 320) : (width / 320);
                _loc_3.scale(_loc_2, _loc_2);
                _loc_4 = 240 * _loc_2;
                _loc_5 = 240 * _loc_2;
                if (this._rotate90CW)
                {
                    _loc_3.rotate(90 * (Math.PI / 180));
                    _loc_3.translate(_loc_4 + (width - _loc_4) / 2, 0);
                }
                if (this._rotate270CW)
                {
                    _loc_3.rotate(-90 * (Math.PI / 180));
                    _loc_3.translate((width - _loc_5) / 2, height);
                }
                this.video.transform.matrix = _loc_3;
            }
            for each (_loc_1 in filters)
            {
                
                _loc_1.update(width, height);
            }
            return;
        }// end function

        public function clear() : void
        {
            this.video.clear();
            return;
        }// end function

        public function dispose() : void
        {
            this.video = null;
            return;
        }// end function

        override public function setLayoutBoundsSize(param1:Number, param2:Number, param3:Boolean = true) : void
        {
            super.setLayoutBoundsSize(param1, param2, param3);
            this.updateVideoLayout();
            return;
        }// end function

    }
}
