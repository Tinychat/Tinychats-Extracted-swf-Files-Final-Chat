package com.tinychat.ui.components.video.controls
{
    import com.tinychat.model.api.*;
    import com.tinychat.ui.components.popupmenu.*;
    import com.tinychat.ui.components.spark.*;
    import flash.events.*;
    import org.osflash.signals.*;
    import spark.components.supportClasses.*;
    import spark.events.*;

    public class VideoControlsOverlay extends SkinnableComponent
    {
        public var nameDisplay:NameDisplay;
        public var iconAchiev:AchievementDisplay;
        public var menu:UserPopupMenu;
        private var _broadcast:RenameableUser;
        private var _menuOpenButtonLabelText:String;
        private var menuOpenButtonLabelTextChanged:Boolean;
        private var nameDisplayUserChanged:Boolean;
        private var menuUserChanged:Boolean;
        private var _menuOpenChanged:Signal;
        private static var _skinParts:Object = {iconAchiev:false, menu:false, nameDisplay:false};

        public function VideoControlsOverlay()
        {
            this._menuOpenChanged = new Signal(Boolean);
            addEventListener(Event.REMOVED_FROM_STAGE, this.removedFromStageHandler);
            return;
        }// end function

        public function get menuOpenChanged() : ISignal
        {
            return this._menuOpenChanged;
        }// end function

        public function get menuOpen() : Boolean
        {
            if (this.menu)
            {
            }
            return this.menu.isDropDownOpen;
        }// end function

        private function removedFromStageHandler(event:Event) : void
        {
            if (this.menu)
            {
                this.menu.close();
            }
            return;
        }// end function

        public function set broadcast(param1:Broadcast) : void
        {
            if (this._broadcast != param1)
            {
                this._broadcast = param1;
                this.nameDisplayUserChanged = true;
                this.menuUserChanged = true;
                if (this.iconAchiev)
                {
                    this.iconAchiev.achiev = this._broadcast as Achievement;
                }
                invalidateProperties();
            }
            return;
        }// end function

        public function set menuOpenButtonLabelText(param1:String) : void
        {
            if (this._menuOpenButtonLabelText != param1)
            {
                this._menuOpenButtonLabelText = param1;
                this.menuOpenButtonLabelTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.menuOpenButtonLabelTextChanged)
            {
            }
            if (this.menu)
            {
                this.menu.openButtonLabelText = this._menuOpenButtonLabelText;
                this.menuOpenButtonLabelTextChanged = false;
            }
            if (this.nameDisplayUserChanged)
            {
            }
            if (this.nameDisplay)
            {
                this.nameDisplay.user = this._broadcast;
                this.nameDisplayUserChanged = false;
            }
            if (this.menuUserChanged)
            {
            }
            if (this.menu)
            {
                this.menu.user = this._broadcast;
                this.menuUserChanged = false;
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.menu)
            {
                this.menu.addEventListener(DropDownEvent.OPEN, this.menuOpenHandler);
                this.menu.addEventListener(DropDownEvent.CLOSE, this.menuCloseHandler);
            }
            if (param2 == this.iconAchiev)
            {
                this.iconAchiev.achiev = this._broadcast as Achievement;
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == this.menu)
            {
                this.menu.removeEventListener(DropDownEvent.OPEN, this.menuOpenHandler);
                this.menu.removeEventListener(DropDownEvent.CLOSE, this.menuCloseHandler);
            }
            return;
        }// end function

        private function menuOpenHandler(event:DropDownEvent) : void
        {
            this._menuOpenChanged.dispatch(true);
            return;
        }// end function

        private function menuCloseHandler(event:DropDownEvent) : void
        {
            this._menuOpenChanged.dispatch(false);
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
