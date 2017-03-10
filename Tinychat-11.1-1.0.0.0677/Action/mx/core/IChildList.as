package mx.core
{
    import flash.display.*;
    import flash.geom.*;

    public interface IChildList
    {

        public function IChildList();

        function get numChildren() : int;

        function addChild(param1:DisplayObject) : DisplayObject;

        function addChildAt(param1:DisplayObject, param2:int) : DisplayObject;

        function removeChild(param1:DisplayObject) : DisplayObject;

        function removeChildAt(param1:int) : DisplayObject;

        function getChildAt(param1:int) : DisplayObject;

        function getChildByName(param1:String) : DisplayObject;

        function getChildIndex(param1:DisplayObject) : int;

        function setChildIndex(param1:DisplayObject, param2:int) : void;

        function getObjectsUnderPoint(param1:Point) : Array;

        function contains(param1:DisplayObject) : Boolean;

    }
}
