package com.tinychat.ui.components.social.chat.list
{
    import flash.display.*;
    import flash.geom.*;
    import flash.text.engine.*;

    public class TextLineSelection extends Object
    {
        private var canvas:Sprite;
        private var beginLine:TextLine;
        private var beginLinePosition:Point;
        private var beginLineSelectionIndex:int;
        private var endLine:TextLine;
        private var endLinePosition:Point;
        private var endLineSelectionIndex:int;
        private var topLineRect:Rectangle;
        private var bottomLineRect:Rectangle;
        private var _hasSelection:Boolean;
        private var _selectingDownwards:Boolean;
        private var _selectingParalellLines:Boolean;

        public function TextLineSelection(param1:Sprite)
        {
            this.canvas = param1;
            return;
        }// end function

        public function clear() : void
        {
            this.graphics.clear();
            this.beginLine = null;
            this.endLine = null;
            this.topLineRect = null;
            this.bottomLineRect = null;
            this._hasSelection = false;
            this._selectingDownwards = true;
            this._selectingParalellLines = false;
            return;
        }// end function

        public function get hasSelection() : Boolean
        {
            return this._hasSelection;
        }// end function

        public function fromPoint(param1:TextLine, param2:Point) : void
        {
            this.clear();
            this.beginLine = param1;
            this.beginLineSelectionIndex = Math.max(0, param1.getAtomIndexAtPoint(param2.x, param2.y));
            this.beginLinePosition = this.globalToLocal(param1.parent.localToGlobal(new Point(param1.x, param1.y)));
            return;
        }// end function

        public function toPoint(param1:TextLine, param2:Point) : void
        {
            var _loc_3:* = param1.getAtomIndexAtPoint(param2.x, param2.y);
            var _loc_4:* = _loc_3;
            if (_loc_3 == -1)
            {
                return;
            }
            this.storeEndLineAndDraw(param1, _loc_4);
            return;
        }// end function

        public function toBeginningOf(param1:TextLine) : void
        {
            this.storeEndLineAndDraw(param1, 0);
            return;
        }// end function

        public function toEndOf(param1:TextLine) : void
        {
            this.storeEndLineAndDraw(param1, (param1.rawTextLength - 1));
            return;
        }// end function

        public function get beginLineSelectedText() : String
        {
            if (this.beginLine == this.endLine)
            {
                return this.getSingleLineSelectedText();
            }
            if (!this.selectingDownwards)
            {
                return this.getLineSelectedText(this.beginLine, 0, this.beginLineSelectionIndex);
            }
            return this.getLineSelectedText(this.beginLine, this.beginLineSelectionIndex, (this.beginLine.rawTextLength - 1));
        }// end function

        public function get endLineSelectedText() : String
        {
            if (this.beginLine == this.endLine)
            {
                return this.getSingleLineSelectedText();
            }
            if (!this.selectingDownwards)
            {
                return this.getLineSelectedText(this.endLine, this.endLineSelectionIndex, (this.endLine.rawTextLength - 1));
            }
            return this.getLineSelectedText(this.endLine, 0, this.endLineSelectionIndex);
        }// end function

        private function getSingleLineSelectedText() : String
        {
            if (this.beginLineSelectionIndex > this.endLineSelectionIndex)
            {
                return this.getLineSelectedText(this.beginLine, this.endLineSelectionIndex, this.beginLineSelectionIndex);
            }
            return this.getLineSelectedText(this.beginLine, this.beginLineSelectionIndex, this.endLineSelectionIndex);
        }// end function

        private function getLineSelectedText(param1:TextLine, param2:int, param3:int) : String
        {
            return param1.textBlock.content.rawText.substr(param1.textBlockBeginIndex + param2, param3 - param2 + 1);
        }// end function

        private function storeEndLineAndDraw(param1:TextLine, param2:int) : void
        {
            this.endLine = param1;
            this.endLineSelectionIndex = param2;
            this.endLinePosition = this.globalToLocal(param1.parent.localToGlobal(new Point(param1.x, param1.y)));
            this.beginDraw();
            return;
        }// end function

        private function beginDraw() : void
        {
            if (this.beginLine)
            {
            }
            if (this.beginLinePosition)
            {
            }
            if (this.endLine)
            {
            }
            if (this.endLinePosition)
            {
                this.graphics.clear();
                this.graphics.beginFill(22015, 0.25);
                if (this.beginLinePosition.equals(this.endLinePosition))
                {
                    this.drawSingleLine();
                }
                else
                {
                    this.drawMultipleLines();
                }
            }
            return;
        }// end function

        private function endDraw() : void
        {
            this.graphics.endFill();
            this._hasSelection = true;
            return;
        }// end function

        private function drawSingleLine() : void
        {
            var _loc_1:Rectangle = null;
            if (this.beginLineSelectionIndex > this.endLineSelectionIndex)
            {
                _loc_1 = this.getLineBounds(this.beginLine, this.endLineSelectionIndex, this.beginLineSelectionIndex, this.beginLinePosition);
            }
            else
            {
                _loc_1 = this.getLineBounds(this.beginLine, this.beginLineSelectionIndex, this.endLineSelectionIndex, this.beginLinePosition);
            }
            this.graphics.drawRect(_loc_1.x, _loc_1.y, _loc_1.width, _loc_1.height);
            this.endDraw();
            return;
        }// end function

        private function drawMultipleLines() : void
        {
            this.selectingParalellLines = this.beginLinePosition.y == this.endLinePosition.y;
            if (!this.selectingParalellLines)
            {
            }
            if (this.endLinePosition.y < this.beginLinePosition.y)
            {
                if (this.selectingParalellLines)
                {
                }
            }
            this.selectingDownwards = this.endLinePosition.x >= this.beginLinePosition.x;
            if (!this.selectingDownwards)
            {
                if (this.selectingParalellLines)
                {
                    this.topLineRect = this.getLineBounds(this.endLine, this.endLineSelectionIndex, (this.endLine.rawTextLength - 1), this.endLinePosition);
                    if (!this.bottomLineRect)
                    {
                        this.bottomLineRect = this.getLineBounds(this.beginLine, 0, this.beginLineSelectionIndex, this.beginLinePosition);
                    }
                }
                else
                {
                    this.topLineRect = this.getLineBoundsToEnd(this.endLine, this.endLineSelectionIndex, this.endLinePosition);
                    if (!this.bottomLineRect)
                    {
                        this.bottomLineRect = this.getLineBoundsFromBeginning(this.beginLine, this.beginLineSelectionIndex, this.beginLinePosition);
                    }
                }
            }
            else if (this.selectingParalellLines)
            {
                if (!this.topLineRect)
                {
                    this.topLineRect = this.getLineBounds(this.beginLine, this.beginLineSelectionIndex, (this.beginLine.rawTextLength - 1), this.beginLinePosition);
                }
                this.bottomLineRect = this.getLineBounds(this.endLine, 0, this.endLineSelectionIndex, this.endLinePosition);
            }
            else
            {
                if (!this.topLineRect)
                {
                    this.topLineRect = this.getLineBoundsToEnd(this.beginLine, this.beginLineSelectionIndex, this.beginLinePosition);
                }
                this.bottomLineRect = this.getLineBoundsFromBeginning(this.endLine, this.endLineSelectionIndex, this.endLinePosition);
            }
            this.graphics.drawRect(this.topLineRect.x, this.topLineRect.y, this.topLineRect.width, this.topLineRect.height);
            this.graphics.drawRect(this.bottomLineRect.x, this.bottomLineRect.y, this.bottomLineRect.width, this.bottomLineRect.height);
            if (Math.abs(this.topLineRect.bottom - this.bottomLineRect.top) > this.topLineRect.height)
            {
                this.graphics.drawRect(0, this.topLineRect.bottom, this.canvas.width, this.bottomLineRect.top - this.topLineRect.bottom);
            }
            else
            {
                if (this.selectingParalellLines)
                {
                }
                if (!this.topLineRect.intersects(this.bottomLineRect))
                {
                    this.graphics.drawRect(this.topLineRect.right, this.topLineRect.y, this.bottomLineRect.left - this.topLineRect.right, this.topLineRect.height);
                }
            }
            this.endDraw();
            return;
        }// end function

        private function get selectingDownwards() : Boolean
        {
            return this._selectingDownwards;
        }// end function

        private function set selectingDownwards(param1:Boolean) : void
        {
            if (this._selectingDownwards != param1)
            {
                this._selectingDownwards = param1;
                this.clearRectCache();
            }
            return;
        }// end function

        private function get selectingParalellLines() : Boolean
        {
            return this._selectingParalellLines;
        }// end function

        private function set selectingParalellLines(param1:Boolean) : void
        {
            if (this._selectingParalellLines != param1)
            {
                this._selectingParalellLines = param1;
                this.clearRectCache();
            }
            return;
        }// end function

        private function clearRectCache() : void
        {
            this.topLineRect = null;
            this.bottomLineRect = null;
            return;
        }// end function

        private function getLineBounds(param1:TextLine, param2:int, param3:int, param4:Point) : Rectangle
        {
            var _loc_5:Rectangle = null;
            _loc_5 = param1.getAtomBounds(param2).union(param1.getAtomBounds(param3));
            _loc_5.x = _loc_5.x + param4.x;
            _loc_5.y = _loc_5.y + param4.y;
            return _loc_5;
        }// end function

        private function getLineBoundsFromBeginning(param1:TextLine, param2:int, param3:Point) : Rectangle
        {
            var _loc_4:Rectangle = null;
            _loc_4 = param1.getAtomBounds(param2);
            _loc_4.left = 0;
            _loc_4.width = _loc_4.width + param3.x;
            _loc_4.y = _loc_4.y + param3.y;
            return _loc_4;
        }// end function

        private function getLineBoundsToEnd(param1:TextLine, param2:int, param3:Point) : Rectangle
        {
            var _loc_4:Rectangle = null;
            _loc_4 = param1.getAtomBounds(param2);
            _loc_4.x = _loc_4.x + param3.x;
            _loc_4.y = _loc_4.y + param3.y;
            _loc_4.right = this.canvas.width;
            return _loc_4;
        }// end function

        private function get graphics() : Graphics
        {
            return this.canvas.graphics;
        }// end function

        private function globalToLocal(param1:Point) : Point
        {
            return this.canvas.globalToLocal(param1);
        }// end function

    }
}
