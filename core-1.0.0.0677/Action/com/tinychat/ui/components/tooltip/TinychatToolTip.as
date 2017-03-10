package com.tinychat.ui.components.tooltip
{
    import mx.core.*;
    import mx.styles.*;
    import spark.components.*;
    import spark.components.supportClasses.*;

    public class TinychatToolTip extends SkinnableComponent implements IToolTip
    {
        public var textDisplay:TextBase;
        private var _text:String;
        private var textChanged:Boolean;
        private static var defaultStyleValuesInited:Boolean = classConstruct();
        private static var _skinParts:Object = {textDisplay:true};

        public function TinychatToolTip()
        {
            mouseEnabled = false;
            mouseChildren = false;
            maxWidth = 300;
            return;
        }// end function

        public function get text() : String
        {
            return this._text;
        }// end function

        public function set text(param1:String) : void
        {
            if (this._text != param1)
            {
                this._text = param1;
                this.textChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override public function setStyle(param1:String, param2) : void
        {
            super.setStyle(param1, param2);
            invalidateSkinState();
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.textDisplay)
            {
            }
            if (this.textChanged)
            {
                this.textDisplay.text = this._text;
                this.textChanged = false;
            }
            return;
        }// end function

        override protected function getCurrentSkinState() : String
        {
            var _loc_1:* = getStyle("placement");
            return _loc_1 == undefined ? ("bottomRight") : (_loc_1);
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

        private static function classConstruct() : Boolean
        {
            var styleDeclaration:CSSStyleDeclaration;
            var styleManager:* = Application(FlexGlobals.topLevelApplication).styleManager;
            if (!styleManager.getStyleDeclaration("com.tinychat.ui.components.tooltip.TinychatToolTip"))
            {
                styleDeclaration = new CSSStyleDeclaration();
                styleDeclaration.defaultFactory = function () : void
            {
                this.color = 3158064;
                this.fontSize = 11;
                return;
            }// end function
            ;
                styleManager.setStyleDeclaration("com.tinychat.ui.components.tooltip.TinychatToolTip", styleDeclaration, true);
            }
            return true;
        }// end function

    }
}
