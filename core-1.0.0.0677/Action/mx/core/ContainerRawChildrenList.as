package mx.core
{
    import flash.display.*;
    import flash.geom.*;

    public class ContainerRawChildrenList extends Object implements IChildList
    {
        private var owner:Container;
        static const VERSION:String = "4.6.0.23201";

        public function ContainerRawChildrenList(owner:Container)
        {
            this.owner = owner;
            return;
        }// end function

        public function get numChildren() : int
        {
            return this.owner.$numChildren;
        }// end function

        public function addChild(child:DisplayObject) : DisplayObject
        {
            return this.owner.rawChildren_addChild(child);
        }// end function

        public function addChildAt(child:DisplayObject, index:int) : DisplayObject
        {
            return this.owner.rawChildren_addChildAt(child, index);
        }// end function

        public function removeChild(child:DisplayObject) : DisplayObject
        {
            return this.owner.rawChildren_removeChild(child);
        }// end function

        public function removeChildAt(index:int) : DisplayObject
        {
            return this.owner.rawChildren_removeChildAt(index);
        }// end function

        public function getChildAt(index:int) : DisplayObject
        {
            return this.owner.rawChildren_getChildAt(index);
        }// end function

        public function getChildByName(name:String) : DisplayObject
        {
            return this.owner.rawChildren_getChildByName(name);
        }// end function

        public function getChildIndex(child:DisplayObject) : int
        {
            return this.owner.rawChildren_getChildIndex(child);
        }// end function

        public function setChildIndex(child:DisplayObject, newIndex:int) : void
        {
            this.owner.rawChildren_setChildIndex(child, newIndex);
            return;
        }// end function

        public function getObjectsUnderPoint(point:Point) : Array
        {
            return this.owner.rawChildren_getObjectsUnderPoint(point);
        }// end function

        public function contains(child:DisplayObject) : Boolean
        {
            return this.owner.rawChildren_contains(child);
        }// end function

    }
}
