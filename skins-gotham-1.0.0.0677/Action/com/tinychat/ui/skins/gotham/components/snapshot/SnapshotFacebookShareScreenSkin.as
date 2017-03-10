package com.tinychat.ui.skins.gotham.components.snapshot
{
    import com.tinychat.ui.components.snapshot.*;
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.components.url.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.primitives.*;

    public class SnapshotFacebookShareScreenSkin extends Skin implements IBindingClient
    {
        private var _951117504confirm:Button;
        private var _284874180snapshot:BitmapImage;
        private var _1893287094titleDisplay:TitleDisplay;
        private var _993593141urlField:UrlDisplay;
        private var _677880599urlFieldLabel:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:SnapshotFacebookShareScreen;
        private static const MAX_WIDTH:Number = 510;
        private static const MAX_HEIGHT:Number = 250;
        private static const SNAPSHOT_PADDING:Number = 15;
        private static const MAX_SNAPSHOT_WIDTH:Number = 480;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function SnapshotFacebookShareScreenSkin()
        {
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            var bindings:* = this._SnapshotFacebookShareScreenSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_snapshot_SnapshotFacebookShareScreenSkinWatcherSetupUtil");
                var _loc_2:* = watcherSetupUtilClass;
                _loc_2.watcherSetupUtilClass["init"](null);
            }
            _watcherSetupUtil.setup(this, function (param1:String)
            {
                return target[param1];
            }// end function
            , function (param1:String)
            {
                return [param1];
            }// end function
            , bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.mxmlContent = [this._SnapshotFacebookShareScreenSkin_VGroup1_c()];
            var i:uint;
            while (i < bindings.length)
            {
                
                Binding(bindings[i]).execute();
                i = (i + 1);
            }
            return;
        }// end function

        override public function set moduleFactory(param1:IFlexModuleFactory) : void
        {
            super.moduleFactory = param1;
            if (this.__moduleFactoryInitialized)
            {
                return;
            }
            this.__moduleFactoryInitialized = true;
            return;
        }// end function

        override public function initialize() : void
        {
            super.initialize();
            return;
        }// end function

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            var _loc_3:Object = null;
            var _loc_4:Number = NaN;
            super.updateDisplayList(param1, param2);
            if (this.snapshot)
            {
            }
            if (this.snapshot.source)
            {
                _loc_3 = this.snapshot.source;
                if (_loc_3.width > MAX_SNAPSHOT_WIDTH)
                {
                    _loc_4 = _loc_3.width / _loc_3.height;
                    this.snapshot.width = MAX_SNAPSHOT_WIDTH;
                    this.snapshot.height = this.snapshot.width / _loc_4;
                }
                else if (_loc_3.height > MAX_HEIGHT)
                {
                    _loc_4 = _loc_3.width / _loc_3.height;
                    this.snapshot.height = MAX_HEIGHT;
                    this.snapshot.width = this.snapshot.height * _loc_4;
                }
                else
                {
                    this.snapshot.width = _loc_3.width;
                    this.snapshot.height = _loc_3.height;
                }
            }
            return;
        }// end function

        private function _SnapshotFacebookShareScreenSkin_VGroup1_c() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 15;
            _loc_1.gap = 15;
            _loc_1.horizontalAlign = "contentJustify";
            _loc_1.mxmlContent = [this._SnapshotFacebookShareScreenSkin_Group1_c(), this._SnapshotFacebookShareScreenSkin_VGroup2_c()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _SnapshotFacebookShareScreenSkin_Group1_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.percentWidth = 100;
            _loc_1.mxmlContent = [this._SnapshotFacebookShareScreenSkin_TitleDisplay1_i(), this._SnapshotFacebookShareScreenSkin_Group2_c()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _SnapshotFacebookShareScreenSkin_TitleDisplay1_i() : TitleDisplay
        {
            var _loc_1:* = new TitleDisplay();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.id = "titleDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.titleDisplay = _loc_1;
            BindingManager.executeBindings(this, "titleDisplay", this.titleDisplay);
            return _loc_1;
        }// end function

        private function _SnapshotFacebookShareScreenSkin_Group2_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 15;
            _loc_1.right = 15;
            _loc_1.top = 55;
            _loc_1.bottom = 15;
            _loc_1.mxmlContent = [this._SnapshotFacebookShareScreenSkin_BitmapImage1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _SnapshotFacebookShareScreenSkin_BitmapImage1_i() : BitmapImage
        {
            var _loc_1:* = new BitmapImage();
            _loc_1.smooth = true;
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 0;
            _loc_1.initialized(this, "snapshot");
            this.snapshot = _loc_1;
            BindingManager.executeBindings(this, "snapshot", this.snapshot);
            return _loc_1;
        }// end function

        private function _SnapshotFacebookShareScreenSkin_VGroup2_c() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.paddingLeft = 15;
            _loc_1.paddingRight = 15;
            _loc_1.gap = 5;
            _loc_1.horizontalAlign = "center";
            _loc_1.mxmlContent = [this._SnapshotFacebookShareScreenSkin_Label1_i(), this._SnapshotFacebookShareScreenSkin_UrlDisplay1_i(), this._SnapshotFacebookShareScreenSkin_Group3_c()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _SnapshotFacebookShareScreenSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.percentWidth = 100;
            _loc_1.minWidth = 0;
            _loc_1.setStyle("textAlign", "center");
            _loc_1.id = "urlFieldLabel";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.urlFieldLabel = _loc_1;
            BindingManager.executeBindings(this, "urlFieldLabel", this.urlFieldLabel);
            return _loc_1;
        }// end function

        private function _SnapshotFacebookShareScreenSkin_UrlDisplay1_i() : UrlDisplay
        {
            var _loc_1:* = new UrlDisplay();
            _loc_1.percentWidth = 100;
            _loc_1.setStyle("skinClass", SnapshotUrlDisplaySkin);
            _loc_1.id = "urlField";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.urlField = _loc_1;
            BindingManager.executeBindings(this, "urlField", this.urlField);
            return _loc_1;
        }// end function

        private function _SnapshotFacebookShareScreenSkin_Group3_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.percentWidth = 100;
            _loc_1.minHeight = 45;
            _loc_1.mxmlContent = [this._SnapshotFacebookShareScreenSkin_Button1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _SnapshotFacebookShareScreenSkin_Button1_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.width = 120;
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 0;
            _loc_1.id = "confirm";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.confirm = _loc_1;
            BindingManager.executeBindings(this, "confirm", this.confirm);
            return _loc_1;
        }// end function

        private function _SnapshotFacebookShareScreenSkin_bindingsSetup() : Array
        {
            var result:Array;
            result[0] = new Binding(this, function () : Number
            {
                return MAX_WIDTH;
            }// end function
            , null, "this.width");
            return result;
        }// end function

        public function get confirm() : Button
        {
            return this._951117504confirm;
        }// end function

        public function set confirm(param1:Button) : void
        {
            var _loc_2:* = this._951117504confirm;
            if (_loc_2 !== param1)
            {
                this._951117504confirm = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confirm", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get snapshot() : BitmapImage
        {
            return this._284874180snapshot;
        }// end function

        public function set snapshot(param1:BitmapImage) : void
        {
            var _loc_2:* = this._284874180snapshot;
            if (_loc_2 !== param1)
            {
                this._284874180snapshot = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "snapshot", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get titleDisplay() : TitleDisplay
        {
            return this._1893287094titleDisplay;
        }// end function

        public function set titleDisplay(param1:TitleDisplay) : void
        {
            var _loc_2:* = this._1893287094titleDisplay;
            if (_loc_2 !== param1)
            {
                this._1893287094titleDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get urlField() : UrlDisplay
        {
            return this._993593141urlField;
        }// end function

        public function set urlField(param1:UrlDisplay) : void
        {
            var _loc_2:* = this._993593141urlField;
            if (_loc_2 !== param1)
            {
                this._993593141urlField = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "urlField", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get urlFieldLabel() : Label
        {
            return this._677880599urlFieldLabel;
        }// end function

        public function set urlFieldLabel(param1:Label) : void
        {
            var _loc_2:* = this._677880599urlFieldLabel;
            if (_loc_2 !== param1)
            {
                this._677880599urlFieldLabel = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "urlFieldLabel", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : SnapshotFacebookShareScreen
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:SnapshotFacebookShareScreen) : void
        {
            var _loc_2:* = this._213507019hostComponent;
            if (_loc_2 !== param1)
            {
                this._213507019hostComponent = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hostComponent", _loc_2, param1));
                }
            }
            return;
        }// end function

        public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
        {
            _watcherSetupUtil = param1;
            return;
        }// end function

    }
}
