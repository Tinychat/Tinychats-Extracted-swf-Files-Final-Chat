package com.tinychat.model.settings
{
    import com.tinychat.model.cookie.*;
    import org.osflash.signals.*;

    public class OpenGraphShareApplicationSetting extends AbstractFlashCookieApplicationSetting
    {
        private var _changed:Signal;

        public function OpenGraphShareApplicationSetting(param1:FlashCookieProxy, param2:String)
        {
            this._changed = new Signal(Boolean);
            super(param1, param2);
            return;
        }// end function

        public function get changed() : ISignal
        {
            return this._changed;
        }// end function

        override public function get value() : Object
        {
            return flashCookie.openGraphShareEnabled;
        }// end function

        override public function set value(param1:Object) : void
        {
            if (param1 is Boolean)
            {
            }
            if (this.value != param1)
            {
                flashCookie.openGraphShareEnabled = param1;
                this._changed.dispatch(param1);
            }
            return;
        }// end function

    }
}
