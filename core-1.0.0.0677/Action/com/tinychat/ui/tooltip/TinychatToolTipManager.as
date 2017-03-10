package com.tinychat.ui.tooltip
{
    import com.tinychat.ui.components.tooltip.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import mx.core.*;
    import mx.events.*;
    import mx.managers.*;
    import mx.resources.*;
    import mx.styles.*;

    public class TinychatToolTipManager extends ToolTipManagerImpl implements IToolTipManager2
    {
        private var toolTipText:String;
        private var color:uint;
        private var chromeColor:uint;
        private var styleName:String;
        private var placement:String;
        private var customShowDelay:String;
        private var remainOnClick:Boolean;
        private static var _instance:IToolTipManager2;
        private static const DEFAULT_TOOLTIP_DELAY:uint = 500;

        public function TinychatToolTipManager()
        {
            if (_instance)
            {
                throw new Error("Instance already exists.");
            }
            return;
        }// end function

        override function targetChanged() : void
        {
            if (currentText)
            {
            }
            if (currentText != "")
            {
                this.parseResources();
                showDelay = this.customShowDelay ? (uint(this.customShowDelay)) : (DEFAULT_TOOLTIP_DELAY);
            }
            else
            {
                showDelay = DEFAULT_TOOLTIP_DELAY;
                this.remainOnClick = false;
            }
            super.targetChanged();
            return;
        }// end function

        override function systemManager_mouseDownHandler(event:MouseEvent) : void
        {
            if (this.remainOnClick)
            {
                return;
            }
            super.systemManager_mouseDownHandler(event);
            return;
        }// end function

        override function initializeTip() : void
        {
            if (isError)
            {
            }
            if (currentToolTip is IStyleClient)
            {
                IStyleClient(currentToolTip).setStyle("styleName", "errorTip");
            }
            if (currentToolTip is IToolTip)
            {
                this.assignResourcesToToolTip();
            }
            sizeTip(currentToolTip);
            if (currentToolTip is IStyleClient)
            {
                if (showEffect)
                {
                    IStyleClient(currentToolTip).setStyle("showEffect", showEffect);
                }
                if (hideEffect)
                {
                    IStyleClient(currentToolTip).setStyle("hideEffect", hideEffect);
                }
            }
            if (!showEffect)
            {
            }
            if (hideEffect)
            {
                currentToolTip.addEventListener(EffectEvent.EFFECT_END, effectEndHandler);
            }
            return;
        }// end function

        override function positionTip() : void
        {
            var _loc_1:Number = NaN;
            var _loc_2:Number = NaN;
            var _loc_10:Boolean = false;
            var _loc_11:Boolean = false;
            var _loc_3:* = currentToolTip.screen.width;
            var _loc_4:* = currentToolTip.screen.height;
            var _loc_5:* = currentTarget.localToGlobal(new Point(0, 0));
            var _loc_6:* = currentTarget.width;
            var _loc_7:* = currentTarget.height;
            var _loc_8:* = currentToolTip.width;
            var _loc_9:* = currentToolTip.height;
            var _loc_12:* = IStyleClient(currentToolTip).getStyle("placement");
            if (_loc_12 != "topLeft")
            {
            }
            if (_loc_12 != "bottomLeft")
            {
            }
            if (_loc_5.x + _loc_6 * 0.75 + _loc_8 > _loc_3)
            {
                _loc_10 = true;
            }
            if (_loc_12 != "topLeft")
            {
            }
            if (_loc_12 != "topRight")
            {
            }
            if (_loc_5.y + _loc_7 / 2 + _loc_9 > _loc_4)
            {
                _loc_11 = true;
            }
            if (_loc_10)
            {
            }
            if (_loc_11)
            {
                IStyleClient(currentToolTip).setStyle("placement", "topLeft");
                _loc_1 = _loc_5.x - (_loc_8 - 20) + _loc_6 / 2;
                _loc_2 = _loc_5.y - _loc_9 * 1.25;
            }
            else
            {
                if (_loc_10)
                {
                }
                if (!_loc_11)
                {
                    IStyleClient(currentToolTip).setStyle("placement", "bottomLeft");
                    _loc_1 = _loc_5.x - _loc_8 + _loc_6 * 0.75;
                    _loc_2 = _loc_5.y + _loc_7 * 0.75;
                }
                else
                {
                    if (!_loc_10)
                    {
                    }
                    if (_loc_11)
                    {
                        IStyleClient(currentToolTip).setStyle("placement", "topRight");
                        _loc_1 = _loc_5.x + _loc_6 * 0.9 - 25;
                        _loc_2 = _loc_5.y + _loc_7 * 0.25;
                    }
                    else
                    {
                        IStyleClient(currentToolTip).setStyle("placement", "bottomRight");
                        _loc_1 = _loc_5.x + _loc_6 * 0.9 - 25;
                        _loc_2 = _loc_5.y + _loc_7 * 0.75;
                    }
                }
            }
            var _loc_13:* = new Point(_loc_1, _loc_2);
            var _loc_14:* = getSystemManager(currentTarget);
            _loc_13 = DisplayObject(_loc_14).localToGlobal(_loc_13);
            _loc_13 = DisplayObject(_loc_14.getSandboxRoot()).globalToLocal(_loc_13);
            _loc_1 = _loc_13.x;
            _loc_2 = _loc_13.y;
            currentToolTip.move(_loc_1, _loc_2);
            return;
        }// end function

        protected function parseResources() : void
        {
            var _loc_4:String = null;
            var _loc_1:String = "tooltip";
            if (isError)
            {
                _loc_1 = "errortip";
            }
            var _loc_2:* = currentText.split(".");
            var _loc_3:* = ResourceManager.getInstance().localeChain[0];
            if (ResourceManager.getInstance().getResourceBundle(_loc_3, _loc_2[0]) != null)
            {
                _loc_4 = _loc_2[0];
            }
            var _loc_5:String = "default";
            if (_loc_2.length > 1)
            {
                _loc_5 = _loc_2[1];
            }
            var _loc_6:* = _loc_1 + "." + _loc_5;
            this.toolTipText = ResourceManager.getInstance().getString(_loc_4, _loc_6 + ".text");
            this.color = ResourceManager.getInstance().getUint(_loc_4, _loc_6 + ".color");
            this.chromeColor = ResourceManager.getInstance().getUint(_loc_4, _loc_6 + ".chromeColor");
            this.styleName = ResourceManager.getInstance().getString(_loc_4, _loc_6 + ".styleName");
            this.placement = ResourceManager.getInstance().getString(_loc_4, _loc_6 + ".placement");
            this.customShowDelay = ResourceManager.getInstance().getString(_loc_4, _loc_6 + ".showDelay");
            this.remainOnClick = ResourceManager.getInstance().getBoolean(_loc_4, _loc_6 + ".remainOnClick");
            return;
        }// end function

        protected function assignResourcesToToolTip() : void
        {
            if (!currentToolTip)
            {
                return;
            }
            currentToolTip.text = this.toolTipText ? (this.toolTipText) : (currentText);
            if (this.color)
            {
                IStyleClient(currentToolTip).setStyle("color", this.color);
            }
            if (this.chromeColor)
            {
                IStyleClient(currentToolTip).setStyle("chromeColor", this.chromeColor);
            }
            if (this.styleName)
            {
                IStyleClient(currentToolTip).mx.styles:ISimpleStyleClient::styleName = this.styleName;
            }
            if (this.placement)
            {
                IStyleClient(currentToolTip).setStyle("placement", this.placement);
            }
            return;
        }// end function

        public static function getInstance() : IToolTipManager2
        {
            if (!_instance)
            {
                _instance = new TinychatToolTipManager;
            }
            _instance.toolTipClass = TinychatToolTip;
            return _instance;
        }// end function

        public static function createToolTip(param1:String, param2:Number, param3:Number, param4:String = null, param5:IUIComponent = null) : IToolTip
        {
            return _instance.createToolTip(param1, param2, param3, param4, param5);
        }// end function

        public static function destroyToolTip(param1:IToolTip) : void
        {
            _instance.destroyToolTip(param1);
            return;
        }// end function

    }
}
