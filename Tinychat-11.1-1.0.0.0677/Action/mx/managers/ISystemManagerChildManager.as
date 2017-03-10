package mx.managers
{
    import flash.display.*;

    public interface ISystemManagerChildManager
    {

        public function ISystemManagerChildManager();

        function addingChild(param1:DisplayObject) : void;

        function childAdded(param1:DisplayObject) : void;

        function childRemoved(param1:DisplayObject) : void;

        function removingChild(param1:DisplayObject) : void;

        function initializeTopLevelWindow(param1:Number, param2:Number) : void;

    }
}
