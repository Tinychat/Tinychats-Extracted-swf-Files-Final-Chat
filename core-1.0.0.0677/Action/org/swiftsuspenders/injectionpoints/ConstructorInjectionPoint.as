package org.swiftsuspenders.injectionpoints
{
    import flash.utils.*;
    import org.swiftsuspenders.*;

    public class ConstructorInjectionPoint extends MethodInjectionPoint
    {

        public function ConstructorInjectionPoint(node:XML, clazz:Class, injector:Injector)
        {
            var node:* = node;
            var clazz:* = clazz;
            var injector:* = injector;
            var _loc_6:int = 0;
            var _loc_7:* = node.parameter;
            var _loc_5:* = new XMLList("");
            for each (_loc_8 in _loc_7)
            {
                
                var _loc_9:* = _loc_8;
                with (_loc_8)
                {
                    if (@type == "*")
                    {
                        _loc_5[_loc_6] = _loc_8;
                    }
                }
            }
            if (_loc_5.length() == node.parameter.@type.length())
            {
                this.createDummyInstance(node, clazz);
            }
            super(node, injector);
            return;
        }// end function

        override public function applyInjection(target:Object, injector:Injector) : Object
        {
            var _loc_3:* = gatherParameterValues(target, injector);
            switch(_loc_3.length)
            {
                case 0:
                {
                    return new target;
                }
                case 1:
                {
                    return new target(_loc_3[0]);
                }
                case 2:
                {
                    return new target(_loc_3[0], _loc_3[1]);
                }
                case 3:
                {
                    return new target(_loc_3[0], _loc_3[1], _loc_3[2]);
                }
                case 4:
                {
                    return new target(_loc_3[0], _loc_3[1], _loc_3[2], _loc_3[3]);
                }
                case 5:
                {
                    return new target(_loc_3[0], _loc_3[1], _loc_3[2], _loc_3[3], _loc_3[4]);
                }
                case 6:
                {
                    return new target(_loc_3[0], _loc_3[1], _loc_3[2], _loc_3[3], _loc_3[4], _loc_3[5]);
                }
                case 7:
                {
                    return new target(_loc_3[0], _loc_3[1], _loc_3[2], _loc_3[3], _loc_3[4], _loc_3[5], _loc_3[6]);
                }
                case 8:
                {
                    return new target(_loc_3[0], _loc_3[1], _loc_3[2], _loc_3[3], _loc_3[4], _loc_3[5], _loc_3[6], _loc_3[7]);
                }
                case 9:
                {
                    return new target(_loc_3[0], _loc_3[1], _loc_3[2], _loc_3[3], _loc_3[4], _loc_3[5], _loc_3[6], _loc_3[7], _loc_3[8]);
                }
                case 10:
                {
                    return new target(_loc_3[0], _loc_3[1], _loc_3[2], _loc_3[3], _loc_3[4], _loc_3[5], _loc_3[6], _loc_3[7], _loc_3[8], _loc_3[9]);
                }
                default:
                {
                    break;
                }
            }
            return null;
        }// end function

        override protected function initializeInjection(node:XML, injector:Injector) : void
        {
            var nameArgs:XMLList;
            var node:* = node;
            var injector:* = injector;
            var _loc_5:int = 0;
            var _loc_8:int = 0;
            var _loc_9:* = node.parent().metadata;
            var _loc_7:* = new XMLList("");
            for each (_loc_10 in _loc_9)
            {
                
                var _loc_11:* = _loc_10;
                with (_loc_10)
                {
                    if (@name == "Inject")
                    {
                        _loc_7[_loc_8] = _loc_10;
                    }
                }
            }
            var _loc_6:* = _loc_7.arg;
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
            methodName = "constructor";
            gatherParameters(node, nameArgs, injector);
            return;
        }// end function

        private function createDummyInstance(constructorNode:XML, clazz:Class) : void
        {
            var constructorNode:* = constructorNode;
            var clazz:* = clazz;
            try
            {
                switch(constructorNode.children().length())
                {
                    case 0:
                    {
                        new clazz;
                        break;
                    }
                    case 1:
                    {
                        new clazz(null);
                        break;
                    }
                    case 2:
                    {
                        new clazz(null, null);
                        break;
                    }
                    case 3:
                    {
                        new clazz(null, null, null);
                        break;
                    }
                    case 4:
                    {
                        new clazz(null, null, null, null);
                        break;
                    }
                    case 5:
                    {
                        new clazz(null, null, null, null, null);
                        break;
                    }
                    case 6:
                    {
                        new clazz(null, null, null, null, null, null);
                        break;
                    }
                    case 7:
                    {
                        new clazz(null, null, null, null, null, null, null);
                        break;
                    }
                    case 8:
                    {
                        new clazz(null, null, null, null, null, null, null, null);
                        break;
                    }
                    case 9:
                    {
                        new clazz(null, null, null, null, null, null, null, null, null);
                        break;
                    }
                    case 10:
                    {
                        new clazz(null, null, null, null, null, null, null, null, null, null);
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }
            }
            catch (error:Error)
            {
                trace(error);
            }
            constructorNode.setChildren(describeType(clazz).factory.constructor[0].children());
            return;
        }// end function

    }
}
