package mx.managers
{
    import flash.display.*;
    import flash.geom.*;

    public class SystemChildrenList extends Object implements IChildList
    {
        private var owner:SystemManager;
        private var lowerBoundReference:QName;
        private var upperBoundReference:QName;
        static const VERSION:String = "4.6.0.23201";

        public function SystemChildrenList(param1:SystemManager, param2:QName, param3:QName)
        {
            this.owner = param1;
            this.lowerBoundReference = param2;
            this.upperBoundReference = param3;
            return;
        }// end function

        public function get numChildren() : int
        {
            return this.owner[this.upperBoundReference] - this.owner[this.lowerBoundReference];
        }// end function

        public function addChild(param1:DisplayObject) : DisplayObject
        {
            this.owner.rawChildren_addChildAt(param1, this.owner[this.upperBoundReference]);
            var _loc_2:* = this.owner;
            var _loc_3:* = this.upperBoundReference;
            var _loc_4:* = this.owner[this.upperBoundReference] + 1;
            _loc_2[_loc_3] = _loc_4;
            return param1;
        }// end function

        public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
        {
            this.owner.rawChildren_addChildAt(param1, this.owner[this.lowerBoundReference] + param2);
            var _loc_3:* = this.owner;
            var _loc_4:* = this.upperBoundReference;
            var _loc_5:* = this.owner[this.upperBoundReference] + 1;
            _loc_3[_loc_4] = _loc_5;
            return param1;
        }// end function

        public function removeChild(param1:DisplayObject) : DisplayObject
        {
            var _loc_2:* = this.owner.rawChildren_getChildIndex(param1);
            if (this.owner[this.lowerBoundReference] <= _loc_2 && _loc_2 < this.owner[this.upperBoundReference])
            {
                this.owner.rawChildren_removeChild(param1);
                var _loc_3:* = this.owner;
                var _loc_4:* = this.upperBoundReference;
                var _loc_5:* = this.owner[this.upperBoundReference] - 1;
                _loc_3[_loc_4] = _loc_5;
            }
            return param1;
        }// end function

        public function removeChildAt(param1:int) : DisplayObject
        {
            var _loc_2:* = this.owner.rawChildren_removeChildAt(param1 + this.owner[this.lowerBoundReference]);
            var _loc_3:* = this.owner;
            var _loc_4:* = this.upperBoundReference;
            var _loc_5:* = this.owner[this.upperBoundReference] - 1;
            _loc_3[_loc_4] = _loc_5;
            return _loc_2;
        }// end function

        public function getChildAt(param1:int) : DisplayObject
        {
            var _loc_2:* = this.owner.rawChildren_getChildAt(this.owner[this.lowerBoundReference] + param1);
            return _loc_2;
        }// end function

        public function getChildByName(param1:String) : DisplayObject
        {
            return this.owner.rawChildren_getChildByName(param1);
        }// end function

        public function getChildIndex(param1:DisplayObject) : int
        {
            var _loc_2:* = this.owner.rawChildren_getChildIndex(param1);
            _loc_2 = _loc_2 - this.owner[this.lowerBoundReference];
            return _loc_2;
        }// end function

        public function setChildIndex(param1:DisplayObject, param2:int) : void
        {
            this.owner.rawChildren_setChildIndex(param1, this.owner[this.lowerBoundReference] + param2);
            return;
        }// end function

        public function getObjectsUnderPoint(param1:Point) : Array
        {
            return this.owner.rawChildren_getObjectsUnderPoint(param1);
        }// end function

        public function contains(param1:DisplayObject) : Boolean
        {
            var _loc_2:int = 0;
            if (param1 != this.owner && this.owner.rawChildren_contains(param1))
            {
                while (param1.parent != this.owner)
                {
                    
                    param1 = param1.parent;
                }
                _loc_2 = this.owner.rawChildren_getChildIndex(param1);
                if (_loc_2 >= this.owner[this.lowerBoundReference] && _loc_2 < this.owner[this.upperBoundReference])
                {
                    return true;
                }
            }
            return false;
        }// end function

    }
}
