package org.swiftsuspenders.injectionpoints
{
    import org.swiftsuspenders.*;

    public class PostConstructInjectionPoint extends InjectionPoint
    {
        protected var methodName:String;
        protected var orderValue:int;

        public function PostConstructInjectionPoint(node:XML, injector:Injector)
        {
            super(node, injector);
            return;
        }// end function

        public function get order() : int
        {
            return this.orderValue;
        }// end function

        override public function applyInjection(target:Object, injector:Injector) : Object
        {
            var _loc_3:* = target;
            _loc_3.target[this.methodName]();
            return target;
        }// end function

        override protected function initializeInjection(node:XML, injector:Injector) : void
        {
            var orderArg:XMLList;
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
                    if (@key == "order")
                    {
                        _loc_4[_loc_5] = _loc_7;
                    }
                }
            }
            orderArg = _loc_4;
            methodNode = node.parent();
            this.orderValue = int(orderArg.@value);
            this.methodName = methodNode.@name.toString();
            return;
        }// end function

    }
}
