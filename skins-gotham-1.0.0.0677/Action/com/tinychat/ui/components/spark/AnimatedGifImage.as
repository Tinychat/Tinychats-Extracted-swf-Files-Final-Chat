package com.tinychat.ui.components.spark
{
    import flash.events.*;
    import flash.net.*;
    import flash.utils.*;
    import mx.core.*;
    import org.bytearray.gif.events.*;
    import org.bytearray.gif.player.*;
    import spark.core.*;

    public class AnimatedGifImage extends SpriteVisualElement implements ImageSourceDisplay
    {
        private var player:GIFPlayer;

        public function AnimatedGifImage()
        {
            addEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
            addEventListener(Event.REMOVED_FROM_STAGE, this.removedFromStageHandler);
            return;
        }// end function

        public function set source(param1:Object) : void
        {
            if (!this.player)
            {
                this.player = new GIFPlayer();
            }
            this.player.addEventListener(GIFPlayerEvent.COMPLETE, this.completeHandler, false, 0, true);
            if (param1 is String)
            {
                this.player.load(new URLRequest(param1 as String));
            }
            else if (param1 is Class)
            {
                param1 = new param1;
                if (!(param1 is ByteArray))
                {
                }
                if (ByteArrayAsset)
                {
                    this.player.loadBytes(param1 as ByteArray);
                }
            }
            return;
        }// end function

        private function completeHandler(event:GIFPlayerEvent) : void
        {
            this.player.removeEventListener(GIFPlayerEvent.COMPLETE, this.completeHandler);
            addChild(this.player);
            this.player.x = 0;
            this.player.y = 0;
            return;
        }// end function

        private function addedToStageHandler(event:Event) : void
        {
            if (this.player)
            {
                addChild(this.player);
            }
            return;
        }// end function

        private function removedFromStageHandler(event:Event) : void
        {
            if (this.player)
            {
                removeChild(this.player);
            }
            return;
        }// end function

    }
}
