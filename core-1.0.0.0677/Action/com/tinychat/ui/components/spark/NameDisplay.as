package com.tinychat.ui.components.spark
{
    import com.tinychat.model.api.*;
    import spark.components.*;

    public class NameDisplay extends Label
    {
        private var _user:RenameableUser;

        public function NameDisplay()
        {
            return;
        }// end function

        public function set user(param1:RenameableUser) : void
        {
            if (this._user)
            {
                this._user.renamed.remove(this.renamedHandler);
                text = "";
            }
            this._user = param1;
            if (this._user)
            {
                text = param1.name;
                param1.renamed.add(this.renamedHandler);
            }
            return;
        }// end function

        private function renamedHandler(param1:String, param2:String) : void
        {
            text = param2;
            return;
        }// end function

    }
}
