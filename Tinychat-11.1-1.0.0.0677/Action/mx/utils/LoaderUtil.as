package mx.utils
{
    import __AS3__.vec.*;
    import flash.display.*;
    import flash.system.*;
    import flash.utils.*;
    import mx.core.*;
    import mx.events.*;
    import mx.managers.*;

    public class LoaderUtil extends Object
    {
        static const VERSION:String = "4.6.0.23201";
        static var urlFilters:Array = [{searchString:"/[[DYNAMIC]]/", filterFunction:dynamicURLFilter}, {searchString:"/[[IMPORT]]/", filterFunction:importURLFilter}];

        public function LoaderUtil()
        {
            return;
        }// end function

        public static function normalizeURL(param1:LoaderInfo) : String
        {
            var _loc_3:int = 0;
            var _loc_4:String = null;
            var _loc_5:Function = null;
            var _loc_2:* = param1.url;
            var _loc_6:* = LoaderUtil.urlFilters.length;
            var _loc_7:uint = 0;
            while (_loc_7 < _loc_6)
            {
                
                _loc_4 = LoaderUtil.urlFilters[_loc_7].searchString;
                var _loc_8:* = _loc_2.indexOf(_loc_4);
                _loc_3 = _loc_2.indexOf(_loc_4);
                if (_loc_8 != -1)
                {
                    _loc_5 = LoaderUtil.urlFilters[_loc_7].filterFunction;
                    _loc_2 = LoaderUtil._loc_5(_loc_2, _loc_3);
                }
                _loc_7 = _loc_7 + 1;
            }
            if (isMac())
            {
                return encodeURI(_loc_2);
            }
            return _loc_2;
        }// end function

        public static function createAbsoluteURL(param1:String, param2:String) : String
        {
            var _loc_4:int = 0;
            var _loc_5:int = 0;
            var _loc_3:* = param2;
            if (param1 && !(param2.indexOf(":") > -1 || param2.indexOf("/") == 0 || param2.indexOf("\\") == 0))
            {
                var _loc_6:* = param1.indexOf("?");
                _loc_4 = param1.indexOf("?");
                if (_loc_6 != -1)
                {
                    param1 = param1.substring(0, _loc_4);
                }
                var _loc_6:* = param1.indexOf("#");
                _loc_4 = param1.indexOf("#");
                if (_loc_6 != -1)
                {
                    param1 = param1.substring(0, _loc_4);
                }
                _loc_5 = Math.max(param1.lastIndexOf("\\"), param1.lastIndexOf("/"));
                if (param2.indexOf("./") == 0)
                {
                    param2 = param2.substring(2);
                }
                else
                {
                    while (param2.indexOf("../") == 0)
                    {
                        
                        param2 = param2.substring(3);
                        _loc_5 = Math.max(param1.lastIndexOf("\\", (_loc_5 - 1)), param1.lastIndexOf("/", (_loc_5 - 1)));
                    }
                }
                if (_loc_5 != -1)
                {
                    _loc_3 = param1.substr(0, (_loc_5 + 1)) + param2;
                }
            }
            return _loc_3;
        }// end function

        static function processRequiredRSLs(param1:IFlexModuleFactory, param2:Array) : Array
        {
            var _loc_12:int = 0;
            var _loc_13:int = 0;
            var _loc_14:Array = null;
            var _loc_15:int = 0;
            var _loc_3:Array = [];
            var _loc_4:* = SystemManagerGlobals.topLevelSystemManagers[0];
            var _loc_5:* = SystemManagerGlobals.topLevelSystemManagers[0];
            var _loc_6:IFlexModuleFactory = null;
            var _loc_7:* = new Dictionary();
            var _loc_8:int = 0;
            var _loc_9:* = new Dictionary();
            var _loc_10:int = 0;
            var _loc_11:Array = null;
            while (_loc_5 != param1)
            {
                
                _loc_12 = param2.length;
                _loc_13 = 0;
                while (_loc_13 < _loc_12)
                {
                    
                    _loc_14 = param2[_loc_13];
                    if (!_loc_7[_loc_14])
                    {
                        if (isRSLLoaded(_loc_5, _loc_14[0].digest))
                        {
                            _loc_7[_loc_14] = 1;
                            _loc_8++;
                            if (_loc_5 != _loc_4)
                            {
                                _loc_15 = _loc_3.indexOf(_loc_14);
                                if (_loc_15 != -1)
                                {
                                    _loc_3.splice(_loc_15, 1);
                                }
                            }
                        }
                        else if (_loc_3.indexOf(_loc_14) == -1)
                        {
                            _loc_3.push(_loc_14);
                        }
                    }
                    if (!_loc_7[_loc_14] && _loc_9[_loc_14] == null)
                    {
                        if (!_loc_6 && RSLData(_loc_14[0]).applicationDomainTarget == ApplicationDomainTarget.PARENT)
                        {
                            _loc_6 = getParentModuleFactory(param1);
                        }
                        if (resolveApplicationDomainTarget(_loc_14, param1, _loc_5, _loc_6, _loc_4))
                        {
                            _loc_9[_loc_14] = 1;
                            _loc_10++;
                        }
                    }
                    _loc_13++;
                }
                if (_loc_8 + _loc_10 >= param2.length)
                {
                    break;
                }
                if (!_loc_11)
                {
                    _loc_11 = [param1];
                    _loc_5 = param1;
                    while (_loc_5 != _loc_4)
                    {
                        
                        _loc_5 = getParentModuleFactory(_loc_5);
                        if (!_loc_5)
                        {
                            break;
                        }
                        if (_loc_5 != _loc_4)
                        {
                            _loc_11.push(_loc_5);
                        }
                        if (!_loc_6)
                        {
                            _loc_6 = _loc_5;
                        }
                    }
                }
                _loc_5 = _loc_11.pop();
            }
            return _loc_3;
        }// end function

        static function isLocal(param1:String) : Boolean
        {
            return param1.indexOf("file:") == 0 || param1.indexOf(":") == 1;
        }// end function

        static function OSToPlayerURI(param1:String, param2:Boolean) : String
        {
            var _loc_3:int = 0;
            var _loc_4:int = 0;
            var _loc_7:int = 0;
            var _loc_5:* = param1;
            var _loc_8:* = param1.indexOf("?");
            _loc_3 = param1.indexOf("?");
            if (_loc_8 != -1)
            {
                _loc_5 = _loc_5.substring(0, _loc_3);
            }
            var _loc_8:* = _loc_5.indexOf("#");
            _loc_4 = _loc_5.indexOf("#");
            if (_loc_8 != -1)
            {
                _loc_5 = _loc_5.substring(0, _loc_4);
            }
            try
            {
                _loc_5 = decodeURI(_loc_5);
            }
            catch (e:Error)
            {
            }
            var _loc_6:String = null;
            if (_loc_3 != -1 || _loc_4 != -1)
            {
                _loc_7 = _loc_3;
                if (_loc_3 == -1 || _loc_4 != -1 && _loc_4 < _loc_3)
                {
                    _loc_7 = _loc_4;
                }
                _loc_6 = param1.substr(_loc_7);
            }
            if (param2 && Capabilities.playerType == "ActiveX")
            {
                if (_loc_6)
                {
                    return _loc_5 + _loc_6;
                }
                return _loc_5;
            }
            if (_loc_6)
            {
                return encodeURI(_loc_5) + _loc_6;
            }
            return encodeURI(_loc_5);
        }// end function

        private static function getParentModuleFactory(param1:IFlexModuleFactory) : IFlexModuleFactory
        {
            var _loc_2:* = new Request(Request.GET_PARENT_FLEX_MODULE_FACTORY_REQUEST);
            DisplayObject(param1).dispatchEvent(_loc_2);
            return _loc_2.value as IFlexModuleFactory;
        }// end function

        private static function resolveApplicationDomainTarget(param1:Array, param2:IFlexModuleFactory, param3:IFlexModuleFactory, param4:IFlexModuleFactory, param5:IFlexModuleFactory) : Boolean
        {
            var _loc_6:Boolean = false;
            var _loc_7:IFlexModuleFactory = null;
            var _loc_8:* = param1[0].applicationDomainTarget;
            if (isLoadedIntoTopLevelApplicationDomain(param2))
            {
                _loc_7 = param5;
            }
            else if (_loc_8 == ApplicationDomainTarget.DEFAULT)
            {
                if (hasPlaceholderRSL(param3, param1[0].digest))
                {
                    _loc_7 = param3;
                }
            }
            else if (_loc_8 == ApplicationDomainTarget.TOP_LEVEL)
            {
                _loc_7 = param5;
            }
            else if (_loc_8 == ApplicationDomainTarget.CURRENT)
            {
                _loc_6 = true;
            }
            else if (_loc_8 == ApplicationDomainTarget.PARENT)
            {
                _loc_7 = param4;
            }
            else
            {
                _loc_6 = true;
            }
            if (_loc_6 || _loc_7)
            {
                if (_loc_7)
                {
                    updateRSLModuleFactory(param1, _loc_7);
                }
                return true;
            }
            return false;
        }// end function

        private static function isRSLLoaded(param1:IFlexModuleFactory, param2:String) : Boolean
        {
            var _loc_4:Vector.<RSLData> = null;
            var _loc_5:int = 0;
            var _loc_6:int = 0;
            var _loc_3:* = param1.preloadedRSLs;
            if (_loc_3)
            {
                for each (_loc_4 in _loc_3)
                {
                    
                    _loc_5 = _loc_4.length;
                    _loc_6 = 0;
                    while (_loc_6 < _loc_5)
                    {
                        
                        if (_loc_4[_loc_6].digest == param2)
                        {
                            return true;
                        }
                        _loc_6++;
                    }
                }
            }
            return false;
        }// end function

        private static function hasPlaceholderRSL(param1:IFlexModuleFactory, param2:String) : Boolean
        {
            var _loc_4:int = 0;
            var _loc_5:int = 0;
            var _loc_6:Object = null;
            var _loc_7:int = 0;
            var _loc_8:int = 0;
            var _loc_3:* = param1.info()["placeholderRsls"];
            if (_loc_3)
            {
                _loc_4 = _loc_3.length;
                _loc_5 = 0;
                while (_loc_5 < _loc_4)
                {
                    
                    _loc_6 = _loc_3[_loc_5];
                    _loc_7 = _loc_6.length;
                    _loc_8 = 0;
                    while (_loc_8 < _loc_7)
                    {
                        
                        if (_loc_6[_loc_8].digest == param2)
                        {
                            return true;
                        }
                        _loc_8++;
                    }
                    _loc_5++;
                }
            }
            return false;
        }// end function

        private static function isLoadedIntoTopLevelApplicationDomain(param1:IFlexModuleFactory) : Boolean
        {
            var _loc_2:DisplayObject = null;
            var _loc_3:LoaderInfo = null;
            if (param1 is DisplayObject)
            {
                _loc_2 = DisplayObject(param1);
                _loc_3 = _loc_2.loaderInfo;
                if (_loc_3 && _loc_3.applicationDomain && _loc_3.applicationDomain.parentDomain == null)
                {
                    return true;
                }
            }
            return false;
        }// end function

        private static function updateRSLModuleFactory(param1:Array, param2:IFlexModuleFactory) : void
        {
            var _loc_3:* = param1.length;
            var _loc_4:int = 0;
            while (_loc_4 < _loc_3)
            {
                
                param1[_loc_4].moduleFactory = param2;
                _loc_4++;
            }
            return;
        }// end function

        private static function isMac() : Boolean
        {
            return Capabilities.os.substring(0, 3) == "Mac";
        }// end function

        private static function dynamicURLFilter(param1:String, param2:int) : String
        {
            return param1.substring(0, param2);
        }// end function

        private static function importURLFilter(param1:String, param2:int) : String
        {
            var _loc_3:* = param1.indexOf("://");
            return param1.substring(0, _loc_3 + 3) + param1.substring(param2 + 12);
        }// end function

    }
}
