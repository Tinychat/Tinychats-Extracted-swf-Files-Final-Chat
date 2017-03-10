package com.tinychat.model.lists
{
    import mx.events.*;

    public class SelectableNamedListItem extends NamedListItem implements Selectable
    {
        private var _selected:Boolean;

        public function SelectableNamedListItem(param1:String)
        {
            super(param1);
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
                dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE, false, false, PropertyChangeEventKind.UPDATE, "selected", !param1, param1, this));
            }
            return;
        }// end function

    }
}
