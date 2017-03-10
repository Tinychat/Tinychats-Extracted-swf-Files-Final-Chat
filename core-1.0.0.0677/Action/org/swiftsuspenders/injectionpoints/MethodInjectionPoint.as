package org.swiftsuspenders.injectionpoints
{
    import flash.utils.*;
    import org.swiftsuspenders.*;

    public class MethodInjectionPoint extends InjectionPoint
    {
        protected var methodName:String;
        protected var m_injectionConfigs:Array;
        protected var requiredParameters:int = 0;

        public function MethodInjectionPoint(node:XML, injector:Injector)
        {
            super(node, injector);
            return;
        }// end function

        override public function applyInjection(target:Object, injector:Injector) : Object
        {
            var _loc_3:* = this.gatherParameterValues(target, injector);
            var _loc_4:* = target[this.methodName];
            _loc_4.apply(target, _loc_3);
            return target;
        }// end function

        override protected function initializeInjection(node:XML, injector:Injector) : void
        {
            var nameArgs:XMLList;
            var methodNode:XML;
            var node:* = node;
            var injector:* = injector;
            var _loc_5:int = 0;
            var _loc_6:* = node.arg;
            var _loc_4:* = new XMLList("");
            for each (_loc_7 in _loc_6)
            {
                
                var _loc_8:* = _loc_7;
                with (_loc_7)
                {
                    if (@key == "name")
                    {
                        _loc_4[_loc_5] = _loc_7;
                    }
                }
            }
            nameArgs = _loc_4;
            methodNode = node.parent();
            this.methodName = methodNode.@name.toString();
            this.gatherParameters(methodNode, nameArgs, injector);
            return;
        }// end function

        protected function gatherParameters(methodNode:XML, nameArgs:XMLList, injector:Injector) : void
        {
            var _loc_5:XML = null;
            var _loc_6:String = null;
            var _loc_7:String = null;
            var _loc_8:Class = null;
            this.m_injectionConfigs = [];
            var _loc_4:int = 0;
            for each (_loc_5 in methodNode.parameter)
            {
                
                _loc_6 = "";
                if (nameArgs[_loc_4])
                {
                    _loc_6 = nameArgs[_loc_4].@value.toString();
                }
                _loc_7 = _loc_5.@type.toString();
                if (_loc_7 == "*")
                {
                    if (_loc_5.@optional.toString() == "false")
                    {
                        throw new Error("Error in method definition of injectee. Required " + "parameters can\'t have type \"*\".");
                    }
                    _loc_7 = null;
                }
                else
                {
                    _loc_8 = Class(injector.getApplicationDomain().getDefinition(_loc_7));
                }
                this.m_injectionConfigs.push(injector.getMapping(_loc_8, _loc_6));
                if (_loc_5.@optional.toString() == "false")
                {
                    var _loc_11:String = this;
                    var _loc_12:* = this.requiredParameters + 1;
                    _loc_11.requiredParameters = _loc_12;
                }
                _loc_4 = _loc_4 + 1;
            }
            return;
        }// end function

        protected function gatherParameterValues(target:Object, injector:Injector) : Array
        {
            var _loc_6:InjectionConfig = null;
            var _loc_7:Object = null;
            var _loc_3:Array = [];
            var _loc_4:* = this.m_injectionConfigs.length;
            var _loc_5:int = 0;
            while (_loc_5 < _loc_4)
            {
                
                _loc_6 = this.m_injectionConfigs[_loc_5];
                _loc_7 = _loc_6.getResponse(injector);
                if (_loc_7 == null)
                {
                    if (_loc_5 >= this.requiredParameters)
                    {
                        break;
                    }
                    throw new InjectorError("Injector is missing a rule to handle injection into target " + target + ". Target dependency: " + getQualifiedClassName(_loc_6.request) + ", method: " + this.methodName + ", parameter: " + (_loc_5 + 1));
                }
                _loc_3[_loc_5] = _loc_7;
                _loc_5 = _loc_5 + 1;
            }
            return _loc_3;
        }// end function

    }
}
