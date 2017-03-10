package com.tinychat.ui.skins.gotham.components.video.controls
{
    import com.tinychat.model.utils.math.*;
    import flash.display.*;
    import flash.geom.*;
    import spark.core.*;

    public class AudioActivityBar extends SpriteVisualElement implements AudioActivityIndicator
    {
        private var _level:Number;
        private var _levelGap:Number;
        private var gradientMatrix:Matrix;
        private var border:Shape;
        private var shade:Shape;
        private var drawX:Number;
        private var drawY:Number;
        private var drawWidth:Number;
        private var drawHeight:Number;
        private static const BORDER_WEIGHT:Number = 2;

        public function AudioActivityBar()
        {
            this._level = 0;
            this._levelGap = 3;
            this.drawWidth = 0;
            this.drawHeight = 0;
            this.gradientMatrix = new Matrix();
            this.shade = new Shape();
            this.border = new Shape();
            addChild(this.shade);
            addChild(this.border);
            return;
        }// end function

        public function set level(param1:Number) : void
        {
            if (this._level != param1)
            {
                this._level = param1;
                this.drawShade();
            }
            return;
        }// end function

        public function get levelGap() : Number
        {
            return this._levelGap;
        }// end function

        public function set levelGap(param1:Number) : void
        {
            if (this._levelGap != param1)
            {
                this._levelGap = param1;
                this.drawBorder();
                this.drawShade();
            }
            return;
        }// end function

        public function sizeToNearestLevel(param1:Number, param2:Number) : void
        {
            if (this.isHorizontal)
            {
                param1 = nearestMultipleOf(param1, this._levelGap + BORDER_WEIGHT) - this._levelGap;
            }
            else
            {
                param2 = nearestMultipleOf(param2, this._levelGap + BORDER_WEIGHT) - this._levelGap;
            }
            this.width = param1;
            this.height = param2;
            return;
        }// end function

        override public function setLayoutBoundsSize(param1:Number, param2:Number, param3:Boolean = true) : void
        {
            super.setLayoutBoundsSize(param1, param2, param3);
            this.drawWidth = isNaN(param1) ? (getPreferredBoundsWidth()) : (param1);
            this.drawHeight = isNaN(param2) ? (getPreferredBoundsHeight()) : (param2);
            this.drawX = BORDER_WEIGHT / 2;
            this.drawY = BORDER_WEIGHT / 2;
            this.drawWidth = this.drawWidth - BORDER_WEIGHT;
            this.drawHeight = this.drawHeight - BORDER_WEIGHT;
            this.drawBar();
            this.drawShade();
            this.drawBorder();
            return;
        }// end function

        private function get borderSpacing() : uint
        {
            return BORDER_WEIGHT + this._levelGap;
        }// end function

        private function drawBar() : void
        {
            var _loc_1:Number = NaN;
            if (this.isHorizontal)
            {
                _loc_1 = Math.PI * 2;
            }
            else
            {
                _loc_1 = Math.PI * (3 / 2);
            }
            this.gradientMatrix.createGradientBox(this.drawWidth, this.drawHeight, _loc_1, 0, 0);
            graphics.clear();
            this.shade.graphics.lineStyle();
            graphics.beginGradientFill(GradientType.LINEAR, [8379220, 12907604, 16184403, 16752689, 15933993], [1, 1, 1, 1, 1], [0, 64, 128, 192, 255], this.gradientMatrix);
            graphics.drawRect(this.drawX, this.drawY, this.drawWidth, this.drawHeight);
            graphics.endFill();
            return;
        }// end function

        private function drawBorder() : void
        {
            var fromX:Number;
            var fromY:Number;
            var moreRoomToDraw:Function;
            this.border.graphics.clear();
            this.border.graphics.lineStyle(BORDER_WEIGHT, 1529994);
            this.border.graphics.drawRect(this.drawX, this.drawY, this.drawWidth, this.drawHeight);
            this.border.graphics.endFill();
            fromX = this.drawX;
            fromY = this.drawY;
            var toX:* = this.drawX;
            var toY:* = this.drawY;
            if (this.isHorizontal)
            {
                fromY = this.drawY;
                toY = this.drawHeight;
                moreRoomToDraw = function () : Boolean
            {
                return fromX < drawWidth - borderSpacing;
            }// end function
            ;
            }
            else
            {
                fromX = this.drawX;
                toX = this.drawWidth;
                moreRoomToDraw = function () : Boolean
            {
                return fromY < drawHeight - borderSpacing;
            }// end function
            ;
            }
            do
            {
                
                if (this.isHorizontal)
                {
                    fromX = fromX + this.borderSpacing;
                    toX = toX + this.borderSpacing;
                }
                else
                {
                    fromY = fromY + this.borderSpacing;
                    toY = toY + this.borderSpacing;
                }
                this.border.graphics.moveTo(fromX, fromY);
                this.border.graphics.lineTo(toX, toY);
            }while (this.moreRoomToDraw())
            return;
        }// end function

        private function drawShade() : void
        {
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            var _loc_1:* = this.drawX;
            var _loc_2:* = this.drawY;
            if (this.isHorizontal)
            {
                _loc_1 = this.drawWidth;
                _loc_3 = -this.drawWidth + nearestMultipleOf(this._level * this.drawWidth, this.borderSpacing);
                _loc_4 = this.drawHeight;
            }
            else
            {
                _loc_3 = this.drawWidth;
                _loc_4 = this.drawHeight - nearestMultipleOf(this._level * this.drawHeight, this.borderSpacing);
            }
            this.shade.graphics.clear();
            this.shade.graphics.lineStyle();
            this.shade.graphics.beginFill(0, 0.5);
            this.shade.graphics.drawRect(_loc_1, _loc_2, _loc_3, _loc_4);
            this.shade.graphics.endFill();
            return;
        }// end function

        private function get isHorizontal() : Boolean
        {
            return width > height;
        }// end function

    }
}
