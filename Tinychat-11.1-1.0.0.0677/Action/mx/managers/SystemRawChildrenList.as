package mx.managers
{
    import flash.display.*;
    import flash.geom.*;

    public class SystemRawChildrenList extends Object implements IChildList
    {
        private var owner:SystemManager;
        static const VERSION:String = "4.6.0.23201";

        public function SystemRawChildrenList(param1:SystemManager)
        {
            this.owner = param1;
            return;
        }// end function

        public function get numChildren() : int
        {
            return this.owner.$numChildren;
        }// end function

        public function getChildAt(param1:int) : DisplayObject
        {
            return this.owner.rawChildren_getChildAt(param1);
        }// end function

        public function addChild(param1:DisplayObject) : DisplayObject
        {
            return this.owner.rawChildren_addChild(param1);
        }// end function

        public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
        {
            return this.owner.rawChildren_addChildAt(param1, param2);
        }// end function

        public function removeChild(param1:DisplayObject) : DisplayObject
        {
            return this.owner.rawChildren_removeChild(param1);
        }// end function

        public function removeChildAt(param1:int) : DisplayObject
        {
            return this.owner.rawChildren_removeChildAt(param1);
        }// end function

        public function getChildByName(param1:String) : DisplayObject
        {
            return this.owner.rawChildren_getChildByName(param1);
        }// end function

        public function getChildIndex(param1:DisplayObject) : int
        {
            return this.owner.rawChildren_getChildIndex(param1);
        }// end function

        public function setChildIndex(param1:DisplayObject, param2:int) : void
        {
            this.owner.rawChildren_setChildIndex(param1, param2);
            return;
        }// end function

        public function getObjectsUnderPoint(param1:Point) : Array
        {
            return this.owner.rawChildren_getObjectsUnderPoint(param1);
        }// end function

        public function contains(param1:DisplayObject) : Boolean
        {
            return this.owner.rawChildren_contains(param1);
        }// end function

    }
}
