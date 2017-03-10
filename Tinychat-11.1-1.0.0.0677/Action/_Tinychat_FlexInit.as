package 
{
    import flash.net.*;
    import flash.system.*;
    import mx.accessibility.*;
    import mx.collections.*;
    import mx.core.*;
    import mx.effects.*;
    import mx.managers.systemClasses.*;
    import mx.styles.*;
    import mx.utils.*;
    import spark.accessibility.*;

    public class _Tinychat_FlexInit extends Object
    {

        public function _Tinychat_FlexInit()
        {
            return;
        }// end function

        public static function init(param1:IFlexModuleFactory) : void
        {
            var styleManager:IStyleManager2;
            var fbs:* = param1;
            new ChildManager(fbs);
            styleManager = new StyleManagerImpl(fbs);
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("addedEffect", "added");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("completeEffect", "complete");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("creationCompleteEffect", "creationComplete");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("focusInEffect", "focusIn");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("focusOutEffect", "focusOut");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("hideEffect", "hide");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("mouseDownEffect", "mouseDown");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("mouseUpEffect", "mouseUp");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("moveEffect", "move");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("removedEffect", "removed");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("resizeEffect", "resize");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("rollOutEffect", "rollOut");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("rollOverEffect", "rollOver");
            var _loc_3:* = EffectManager;
            _loc_3.mx_internal::registerEffectTrigger("showEffect", "show");
            if (Capabilities.hasAccessibility)
            {
                ListBaseAccImpl.enableAccessibility();
                ButtonBarBaseAccImpl.enableAccessibility();
                UIComponentAccProps.enableAccessibility();
                ListAccImpl.enableAccessibility();
                ButtonAccImpl.enableAccessibility();
                TitleWindowAccImpl.enableAccessibility();
                TextBaseAccImpl.enableAccessibility();
                DropDownListBaseAccImpl.enableAccessibility();
                ButtonBaseAccImpl.enableAccessibility();
                ToggleButtonAccImpl.enableAccessibility();
                SliderBaseAccImpl.enableAccessibility();
                PanelAccImpl.enableAccessibility();
                TabBarAccImpl.enableAccessibility();
                RichEditableTextAccImpl.enableAccessibility();
                CheckBoxAccImpl.enableAccessibility();
                ColorPickerAccImpl.enableAccessibility();
                ComboBaseAccImpl.enableAccessibility();
            }
            try
            {
                if (getClassByAlias("flex.messaging.io.ArrayCollection") != ArrayCollection)
                {
                    registerClassAlias("flex.messaging.io.ArrayCollection", ArrayCollection);
                }
            }
            catch (e:Error)
            {
                registerClassAlias("flex.messaging.io.ArrayCollection", ArrayCollection);
                try
                {
                }
                if (getClassByAlias("flex.messaging.io.ArrayList") != ArrayList)
                {
                    registerClassAlias("flex.messaging.io.ArrayList", ArrayList);
                }
            }
            catch (e:Error)
            {
                registerClassAlias("flex.messaging.io.ArrayList", ArrayList);
                try
                {
                }
                if (getClassByAlias("flex.messaging.io.ObjectProxy") != ObjectProxy)
                {
                    registerClassAlias("flex.messaging.io.ObjectProxy", ObjectProxy);
                }
            }
            catch (e:Error)
            {
                registerClassAlias("flex.messaging.io.ObjectProxy", ObjectProxy);
            }
            var styleNames:Array;
            var i:int;
            while (i < styleNames.length)
            {
                
                styleManager.registerInheritingStyle(styleNames[i]);
                i = (i + 1);
            }
            return;
        }// end function

    }
}
