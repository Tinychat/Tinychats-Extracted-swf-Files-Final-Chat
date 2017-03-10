package com.tinychat.ui.components.youtube
{
    import com.tinychat.vendors.youtube.*;
    import spark.core.*;

    public class YouTubePlayerContainer extends SpriteVisualElement
    {
        private var _player:YouTubePlayer;

        public function YouTubePlayerContainer()
        {
            return;
        }// end function

        public function set player(param1:YouTubePlayer) : void
        {
            if (this._player != param1)
            {
                if (this._player)
                {
                    removeChild(this._player);
                }
                this._player = param1;
                if (this._player)
                {
                    this.updatePlayerSize();
                    addChildAt(this._player, 0);
                }
            }
            return;
        }// end function

        override public function set width(param1:Number) : void
        {
            if (width != param1)
            {
                super.width = param1;
                this.updatePlayerSize();
            }
            return;
        }// end function

        override public function set height(param1:Number) : void
        {
            if (height != param1)
            {
                super.height = param1;
                this.updatePlayerSize();
            }
            return;
        }// end function

        override public function setLayoutBoundsSize(param1:Number, param2:Number, param3:Boolean = true) : void
        {
            super.setLayoutBoundsSize(param1, param2);
            this.updatePlayerSize();
            return;
        }// end function

        private function updatePlayerSize() : void
        {
            if (this._player)
            {
                this._player.setSize(Math.max(200, width), Math.max(200, height));
            }
            return;
        }// end function

    }
}
