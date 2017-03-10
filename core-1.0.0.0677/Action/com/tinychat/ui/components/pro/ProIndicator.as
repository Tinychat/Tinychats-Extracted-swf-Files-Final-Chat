package com.tinychat.ui.components.pro
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.business.*;
    import com.tinychat.ui.components.spark.*;

    public class ProIndicator extends IconButton
    {
        private var _user:ProableUser;
        private static var _skinParts:Object = {labelDisplay:false, iconDisplay:false, labelDisplay2:false, iconDisplay2:false};

        public function ProIndicator()
        {
            this.updateVisibility(Roles.FREE);
            return;
        }// end function

        public function set user(param1:ProableUser) : void
        {
            if (this._user != param1)
            {
                if (this._user)
                {
                    this._user.proChange.remove(this.updateVisibility);
                }
                this._user = param1;
                this.updateVisibility(this._user ? (this._user.pro) : (Roles.FREE));
                if (this._user)
                {
                    this._user.proChange.add(this.updateVisibility);
                }
            }
            return;
        }// end function

        private function updateVisibility(param1:uint) : void
        {
            if (Roles.isPro(param1))
            {
                visible = true;
                includeInLayout = true;
                styleName = "proIndicator";
                return;
            }
            if (Roles.isExtreme(param1))
            {
                visible = true;
                includeInLayout = true;
                styleName = "extrIndicator";
                return;
            }
            if (Roles.isGold(param1))
            {
                visible = true;
                includeInLayout = true;
                styleName = "goldIndicator";
                return;
            }
            visible = false;
            includeInLayout = false;
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
