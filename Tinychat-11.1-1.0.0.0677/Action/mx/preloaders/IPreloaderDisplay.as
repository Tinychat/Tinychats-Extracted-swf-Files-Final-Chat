package mx.preloaders
{
    import flash.display.*;

    public interface IPreloaderDisplay extends IEventDispatcher
    {

        public function IPreloaderDisplay();

        function get backgroundAlpha() : Number;

        function set backgroundAlpha(param1:Number) : void;

        function get backgroundColor() : uint;

        function set backgroundColor(param1:uint) : void;

        function get backgroundImage() : Object;

        function set backgroundImage(param1:Object) : void;

        function get backgroundSize() : String;

        function set backgroundSize(param1:String) : void;

        function set preloader(param1:Sprite) : void;

        function get stageHeight() : Number;

        function set stageHeight(param1:Number) : void;

        function get stageWidth() : Number;

        function set stageWidth(param1:Number) : void;

        function initialize() : void;

    }
}
