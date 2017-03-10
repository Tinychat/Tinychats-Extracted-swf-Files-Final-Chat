package com.tinychat.ui.components.social.chat.list
{
    import flash.display.*;
    import flash.geom.*;
    import flash.text.engine.*;
    import mx.collections.*;

    public class ChatMessageSelection extends Object
    {
        private var textLineSelection:TextLineSelection;
        private var beginMessageIndex:uint;
        private var endMessageIndex:uint;
        private static const lineBreak:String = "\n";

        public function ChatMessageSelection(param1:Sprite)
        {
            this.textLineSelection = new TextLineSelection(param1);
            return;
        }// end function

        public function copyUsing(param1:IList) : String
        {
            var _loc_2:String = null;
            var _loc_3:uint = 0;
            var _loc_4:uint = 0;
            var _loc_5:uint = 0;
            var _loc_6:String = null;
            var _loc_7:String = null;
            if (!this.hasSelection)
            {
                return "";
            }
            if (this.beginMessageIndex == this.endMessageIndex)
            {
                _loc_2 = this.getStringIntersect(this.textLineSelection.endLineSelectedText, this.textLineSelection.beginLineSelectedText, param1.getItemAt(this.beginMessageIndex).toString());
            }
            else if (this.beginMessageIndex == (this.endMessageIndex + 1))
            {
                _loc_2 = this.getStringStartingWith(this.textLineSelection.endLineSelectedText, param1.getItemAt(this.endMessageIndex).toString()) + lineBreak;
                _loc_2 = _loc_2 + this.getStringEndingWith(this.textLineSelection.beginLineSelectedText, param1.getItemAt(this.beginMessageIndex).toString());
            }
            else if (this.beginMessageIndex == (this.endMessageIndex - 1))
            {
                _loc_2 = this.getStringStartingWith(this.textLineSelection.beginLineSelectedText, param1.getItemAt(this.beginMessageIndex).toString()) + lineBreak;
                _loc_2 = _loc_2 + this.getStringEndingWith(this.textLineSelection.endLineSelectedText, param1.getItemAt(this.endMessageIndex).toString());
            }
            else
            {
                if (this.beginMessageIndex > this.endMessageIndex)
                {
                    _loc_4 = this.endMessageIndex;
                    _loc_5 = this.beginMessageIndex;
                    _loc_6 = this.textLineSelection.endLineSelectedText;
                    _loc_7 = this.textLineSelection.beginLineSelectedText;
                }
                else
                {
                    _loc_4 = this.beginMessageIndex;
                    _loc_5 = this.endMessageIndex;
                    _loc_6 = this.textLineSelection.beginLineSelectedText;
                    _loc_7 = this.textLineSelection.endLineSelectedText;
                }
                _loc_2 = this.getStringStartingWith(_loc_6, param1.getItemAt(_loc_4).toString()) + lineBreak;
                _loc_3 = _loc_4 + 1;
                while (_loc_3 < _loc_5)
                {
                    
                    _loc_2 = _loc_2 + (param1.getItemAt(_loc_3).toString() + lineBreak);
                    _loc_3 = _loc_3 + 1;
                }
                _loc_2 = _loc_2 + (this.getStringEndingWith(_loc_7, param1.getItemAt(_loc_5).toString()) + lineBreak);
            }
            return _loc_2;
        }// end function

        private function getStringStartingWith(param1:String, param2:String) : String
        {
            return param2.substr(param2.indexOf(param1));
        }// end function

        private function getStringEndingWith(param1:String, param2:String) : String
        {
            return param2.substring(0, param2.indexOf(param1) + param1.length);
        }// end function

        private function getStringIntersect(param1:String, param2:String, param3:String) : String
        {
            var _loc_4:* = param3.indexOf(param1);
            var _loc_5:* = param3.indexOf(param2);
            if (_loc_4 > _loc_5)
            {
                return param3.substring(_loc_5, _loc_4 + param1.length);
            }
            return param3.substring(_loc_4, _loc_5 + param2.length);
        }// end function

        public function get hasSelection() : Boolean
        {
            return this.textLineSelection.hasSelection;
        }// end function

        public function clear() : void
        {
            this.textLineSelection.clear();
            return;
        }// end function

        public function fromPoint(param1:TextLine, param2:Point, param3:uint) : void
        {
            this.beginMessageIndex = param3;
            this.textLineSelection.fromPoint(param1, param2);
            return;
        }// end function

        public function toPoint(param1:TextLine, param2:Point, param3:uint) : void
        {
            this.endMessageIndex = param3;
            this.textLineSelection.toPoint(param1, param2);
            return;
        }// end function

        public function toBeginningOf(param1:TextLine, param2:uint) : void
        {
            this.endMessageIndex = param2;
            this.textLineSelection.toBeginningOf(param1);
            return;
        }// end function

        public function toEndOf(param1:TextLine, param2:uint) : void
        {
            this.endMessageIndex = param2;
            this.textLineSelection.toEndOf(param1);
            return;
        }// end function

    }
}
