package com.facebook.graph.controls
{
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;

    public class Distractor extends Sprite
    {
        protected var fadeDuration:Number = 800;
        protected var tf:TextField;
        protected var dots:Sprite;
        protected var dotWidth:Number = 40;
        protected var dotHeight:Number = 20;
        protected var totalElapsed:Number = 0;
        protected var _text:String;

        public function Distractor()
        {
            this.configUI();
            return;
        }// end function

        public function get text() : String
        {
            return this.tf.text;
        }// end function

        public function set text(value:String) : void
        {
            this.tf.text = value;
            this.tf.width = this.tf.textWidth + 10;
            this.dots.x = this.tf.width;
            return;
        }// end function

        protected function handleAddedToStage(event:Event) : void
        {
            addEventListener(Event.ENTER_FRAME, this.onTick, false, 0, true);
            return;
        }// end function

        protected function handleRemovedFromStage(event:Event) : void
        {
            removeEventListener(Event.ENTER_FRAME, this.onTick);
            return;
        }// end function

        protected function clamp(n:Number, min:Number = 0, max:Number = 1) : Number
        {
            if (n < min)
            {
                return min;
            }
            if (n > max)
            {
                return max;
            }
            return n;
        }// end function

        protected function invCos(x:Number) : Number
        {
            return 1 - 0.5 * (Math.cos(x * Math.PI) + 1);
        }// end function

        protected function onTick(event:Event) : void
        {
            var _loc_2:Number = NaN;
            this.totalElapsed = this.totalElapsed + 20;
            this.dots.graphics.clear();
            var _loc_3:* = this.dotHeight << 0;
            var _loc_4:* = _loc_3 * 0.3 << 0;
            var _loc_5:* = Math.round(this.dotWidth / 3 * 0.6);
            var _loc_6:* = Math.round(this.dotWidth / 3 * 0.4);
            var _loc_7:* = _loc_3 - _loc_4;
            var _loc_8:int = 0;
            while (_loc_8 < 3)
            {
                
                _loc_2 = (this.totalElapsed + (3 - _loc_8) * this.fadeDuration * 0.13) % this.fadeDuration;
                _loc_2 = this.invCos(1 - this.clamp(_loc_2 / (0.6 * this.fadeDuration)));
                this.dots.graphics.lineStyle(1, 5729956, _loc_2 * 0.7 + 0.3, true);
                this.dots.graphics.beginFill(11647699, _loc_2 * 0.7 + 0.3);
                this.dots.graphics.drawRoundRect(0.5 + _loc_8 * (_loc_6 + _loc_5), 0.5 + 0.5 * (_loc_7 - _loc_2 * _loc_7), _loc_5, _loc_4 + _loc_2 * _loc_7, 2);
                this.dots.graphics.endFill();
                _loc_8 = _loc_8 + 1;
            }
            return;
        }// end function

        protected function configUI() : void
        {
            var _loc_1:* = new TextFormat("_sans", 11);
            this.tf = new TextField();
            this.tf.selectable = false;
            this.tf.defaultTextFormat = _loc_1;
            addChild(this.tf);
            this.dots = new Sprite();
            addChild(this.dots);
            this.dots.x = this.tf.width;
            addEventListener(Event.ADDED_TO_STAGE, this.handleAddedToStage, false, 0, true);
            addEventListener(Event.REMOVED_FROM_STAGE, this.handleRemovedFromStage, false, 0, true);
            return;
        }// end function

    }
}
