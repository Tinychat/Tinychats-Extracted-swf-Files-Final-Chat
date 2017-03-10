package mx.core
{
    import flash.events.*;
    import flash.system.*;
    import mx.events.*;
    import mx.resources.*;

    public class ResourceModuleRSLItem extends RSLItem
    {
        private var appDomain:ApplicationDomain;
        static const VERSION:String = "4.6.0.23201";
        public static var resourceManager:IResourceManager;

        public function ResourceModuleRSLItem(param1:String, param2:ApplicationDomain)
        {
            super(param1);
            this.appDomain = param2;
            return;
        }// end function

        override public function load(param1:Function, param2:Function, param3:Function, param4:Function, param5:Function) : void
        {
            var _loc_7:Class = null;
            chainedProgressHandler = param1;
            chainedCompleteHandler = param2;
            chainedIOErrorHandler = param3;
            chainedSecurityErrorHandler = param4;
            chainedRSLErrorHandler = param5;
            if (!resourceManager)
            {
                if (this.appDomain.hasDefinition("mx.resources::ResourceManager"))
                {
                    _loc_7 = Class(this.appDomain.getDefinition("mx.resources::ResourceManager"));
                    var _loc_8:* = _loc_7;
                    resourceManager = IResourceManager(_loc_8._loc_7["getInstance"]());
                }
                else
                {
                    return;
                }
            }
            var _loc_6:* = resourceManager.loadResourceModule(url);
            resourceManager.loadResourceModule(url).addEventListener(ResourceEvent.PROGRESS, itemProgressHandler);
            _loc_6.addEventListener(ResourceEvent.COMPLETE, itemCompleteHandler);
            _loc_6.addEventListener(ResourceEvent.ERROR, this.resourceErrorHandler);
            return;
        }// end function

        private function resourceErrorHandler(event:ResourceEvent) : void
        {
            var _loc_2:* = new IOErrorEvent(IOErrorEvent.IO_ERROR);
            _loc_2.text = event.errorText;
            super.itemErrorHandler(_loc_2);
            return;
        }// end function

    }
}
