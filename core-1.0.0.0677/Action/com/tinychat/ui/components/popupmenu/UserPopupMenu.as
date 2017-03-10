package com.tinychat.ui.components.popupmenu
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.menuoption.*;
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.context.popupmenu.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import mx.collections.*;
    import org.osflash.signals.*;
    import org.robotlegs.core.*;
    import org.robotlegs.utilities.modular.core.*;
    import spark.events.*;

    public class UserPopupMenu extends PopupList
    {
        private var context:IModuleContext;
        private var _contextFactory:PopupMenuContextFactory;
        private var injector:IInjector;
        private var _options:ListCollectionView;
        private var _user:RenameableUser;
        private var refreshedBeforeOpen:Boolean;
        private var _selected:Signal;
        private static var _skinParts:Object = {dropDown:false, dataGroup:false, dropIndicator:false, headerDisplay:false, scroller:false, openButton:true};

        public function UserPopupMenu()
        {
            labelField = "name";
            this._selected = new Signal(UserIdentity, Object);
            addEventListener(DropDownEvent.OPEN, this.dropDownOpenHandler);
            addEventListener(DropDownEvent.CLOSE, this.dropDownCloseHandler);
            return;
        }// end function

        public function get selected() : ISignal
        {
            return this._selected;
        }// end function

        public function get user() : RenameableUser
        {
            return this._user;
        }// end function

        public function set user(param1:RenameableUser) : void
        {
            if (this._user != param1)
            {
                if (this._user)
                {
                    this._user.renamed.remove(this.userRenamedHandler);
                }
                this._user = param1;
                if (this._user)
                {
                    this._user.renamed.add(this.userRenamedHandler);
                }
                this.updateHeader();
                this.refreshOptions();
            }
            return;
        }// end function

        public function set parentInjector(param1:IInjector) : void
        {
            this.injector = param1;
            return;
        }// end function

        public function set contextFactory(param1:PopupMenuContextFactory) : void
        {
            this._contextFactory = param1;
            return;
        }// end function

        public function dispose() : void
        {
            if (this.context)
            {
                this.context.dispose();
            }
            this.context = null;
            return;
        }// end function

        override public function set dataProvider(param1:IList) : void
        {
            var _loc_2:Sort = null;
            if (this._options)
            {
            }
            if (this._options.list != param1)
            {
                this._options = new ListCollectionView(param1);
                this._options.filterFunction = this.validOptionFilter;
                _loc_2 = new Sort();
                _loc_2.fields = [new SortField("name")];
                this._options.sort = _loc_2;
                this.refreshOptions();
                super.dataProvider = this._options;
            }
            return;
        }// end function

        public function open(param1:Point) : void
        {
            var _loc_2:IList = null;
            this.refreshOptions();
            this.refreshedBeforeOpen = true;
            if (this.hasOptions)
            {
                setLayoutBoundsPosition(param1.x, param1.y);
                openDropDown();
            }
            return;
        }// end function

        public function close() : void
        {
            closeDropDown(false);
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == openButton)
            {
                this.refreshOptions();
            }
            else if (param2 == dropDown)
            {
                this.createContext(dropDown as DisplayObjectContainer);
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == dropDown)
            {
                this.dispose();
            }
            return;
        }// end function

        private function createContext(param1:DisplayObjectContainer) : void
        {
            if (this._contextFactory)
            {
                this.context = this._contextFactory.newInstance(this.user, dropDown as DisplayObjectContainer, this.injector);
            }
            return;
        }// end function

        private function dropDownOpenHandler(event:DropDownEvent) : void
        {
            if (!this.refreshedBeforeOpen)
            {
                this.refreshOptions();
            }
            this.refreshedBeforeOpen = false;
            addEventListener(Event.CHANGE, this.changeHandler);
            return;
        }// end function

        private function dropDownCloseHandler(event:DropDownEvent) : void
        {
            removeEventListener(Event.CHANGE, this.changeHandler);
            return;
        }// end function

        private function get hasOptions() : Boolean
        {
            if (this._options)
            {
            }
            return this._options.length > 0;
        }// end function

        private function userRenamedHandler(param1:String, param2:String) : void
        {
            this.updateHeader();
            return;
        }// end function

        private function updateHeader() : void
        {
            headerText = this._user ? (this._user.name) : ("");
            return;
        }// end function

        private function refreshOptions() : void
        {
            if (this._options)
            {
                this._options.refresh();
            }
            openButton.enabled = this.hasOptions;
            return;
        }// end function

        private function changeHandler(event:Event) : void
        {
            this._selected.dispatch(this._user, selectedItem);
            return;
        }// end function

        private function validOptionFilter(param1:Object) : Boolean
        {
            var _loc_2:* = param1 as MenuOption;
            if (_loc_2)
            {
            }
            if (this._user)
            {
            }
            return _loc_2.isValid(this._user);
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
