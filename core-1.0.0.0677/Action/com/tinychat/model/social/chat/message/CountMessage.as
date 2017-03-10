package com.tinychat.model.social.chat.message
{
    import org.osflash.signals.*;

    public class CountMessage extends Object
    {
        private var _selected:Boolean;
        private var _selectedChanged:Signal;

        public function CountMessage()
        {
            this._selectedChanged = new Signal(Boolean);
            return;
        }// end function

        public function get selected() : Boolean
        {
            return this._selected;
        }// end function

        public function set selected(param1:Boolean) : void
        {
            if (this._selected != param1)
            {
                this._selected = param1;
                this._selectedChanged.dispatch(param1);
            }
            return;
        }// end function

        public function get selectedChanged() : ISignal
        {
            return this._selectedChanged;
        }// end function

    }
}
