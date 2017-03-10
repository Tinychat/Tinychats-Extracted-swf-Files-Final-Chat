package mx.core
{
    import flash.system.*;
    import flash.text.*;
    import flash.text.engine.*;
    import flash.utils.*;
    import mx.managers.*;
    import mx.resources.*;

    public class EmbeddedFontRegistry extends Object implements IEmbeddedFontRegistry
    {
        private var _resourceManager:IResourceManager;
        static const VERSION:String = "4.6.0.23201";
        private static var fonts:Object = {};
        private static var cachedFontsForObjects:Dictionary = new Dictionary(true);
        private static var instance:IEmbeddedFontRegistry;
        private static var staticTextFormat:TextFormat = new TextFormat();
        private static var flaggedObjects:Dictionary = new Dictionary(true);

        public function EmbeddedFontRegistry()
        {
            return;
        }// end function

        private function get resourceManager() : IResourceManager
        {
            if (!this._resourceManager)
            {
                this._resourceManager = ResourceManager.getInstance();
            }
            return this._resourceManager;
        }// end function

        public function getFontStyle(param1:Boolean, param2:Boolean) : String
        {
            var _loc_3:* = FontStyle.REGULAR;
            if (param1 && param2)
            {
                _loc_3 = FontStyle.BOLD_ITALIC;
            }
            else if (param1)
            {
                _loc_3 = FontStyle.BOLD;
            }
            else if (param2)
            {
                _loc_3 = FontStyle.ITALIC;
            }
            return _loc_3;
        }// end function

        public function registerFont(param1:EmbeddedFont, param2:IFlexModuleFactory) : void
        {
            var _loc_3:* = createFontKey(param1);
            var _loc_4:* = fonts[_loc_3];
            if (!fonts[_loc_3])
            {
                _loc_4 = new Dictionary(true);
                fonts[_loc_3] = _loc_4;
            }
            _loc_4[param2] = 1;
            return;
        }// end function

        public function deregisterFont(param1:EmbeddedFont, param2:IFlexModuleFactory) : void
        {
            var _loc_5:int = 0;
            var _loc_6:Object = null;
            var _loc_3:* = createFontKey(param1);
            var _loc_4:* = fonts[_loc_3];
            if (fonts[_loc_3] != null)
            {
                delete _loc_4[param2];
                _loc_5 = 0;
                for (_loc_6 in _loc_4)
                {
                    
                    _loc_5++;
                }
                if (_loc_5 == 0)
                {
                    delete fonts[_loc_3];
                }
            }
            return;
        }// end function

        public function isFontRegistered(param1:EmbeddedFont, param2:IFlexModuleFactory) : Boolean
        {
            var _loc_3:* = createFontKey(param1);
            var _loc_4:* = fonts[_loc_3];
            return fonts[_loc_3] && _loc_4[param2] == 1;
        }// end function

        public function getFonts() : Array
        {
            var _loc_2:String = null;
            var _loc_1:Array = [];
            for (_loc_2 in fonts)
            {
                
                _loc_1.push(createEmbeddedFont(_loc_2));
            }
            return _loc_1;
        }// end function

        public function getAssociatedModuleFactory(param1:String, param2:Boolean, param3:Boolean, param4:Object, param5:IFlexModuleFactory, param6:ISystemManager, param7 = ) : IFlexModuleFactory
        {
            var _loc_8:EmbeddedFont = null;
            var _loc_9:IFlexModuleFactory = null;
            var _loc_11:int = 0;
            var _loc_12:Object = null;
            var _loc_13:Boolean = false;
            var _loc_14:String = null;
            _loc_8 = cachedFontsForObjects[param4];
            if (!_loc_8)
            {
                _loc_8 = new EmbeddedFont(param1, param2, param3);
                cachedFontsForObjects[param4] = _loc_8;
            }
            else if (_loc_8.fontName != param1 || _loc_8.bold != param2 || _loc_8.italic != param3)
            {
                _loc_8 = new EmbeddedFont(param1, param2, param3);
                cachedFontsForObjects[param4] = _loc_8;
            }
            var _loc_10:* = fonts[createFontKey(_loc_8)];
            if (fonts[createFontKey(_loc_8)])
            {
                _loc_11 = _loc_10[param5];
                if (_loc_11)
                {
                    _loc_9 = param5;
                }
                else
                {
                    for (_loc_12 in _loc_10)
                    {
                        
                        _loc_9 = _loc_12 as IFlexModuleFactory;
                        break;
                    }
                }
            }
            if (!_loc_9 && param6)
            {
                staticTextFormat.font = param1;
                staticTextFormat.bold = param2;
                staticTextFormat.italic = param3;
                if (param6.isFontFaceEmbedded(staticTextFormat))
                {
                    _loc_9 = param6;
                }
            }
            if (_loc_9 && param7 != undefined && Capabilities.isDebugger)
            {
                _loc_13 = param7 ? (_loc_9.callInContext(FontDescription.isFontCompatible, null, [param1, param2 ? ("bold") : ("normal"), param3 ? ("italic") : ("normal")])) : (_loc_9.callInContext(TextField.isFontCompatible, null, [param1, this.getFontStyle(param2, param3)]));
                if (!_loc_13)
                {
                    if (!flaggedObjects[param4])
                    {
                        _loc_14 = getQualifiedClassName(param4);
                        _loc_14 = _loc_14 + ("name" in param4 && param4.name != null ? (" (" + param4.name + ") ") : (""));
                        trace(this.resourceManager.getString("core", "fontIncompatible", [param1, _loc_14, param7]));
                        flaggedObjects[param4] = true;
                    }
                }
            }
            return _loc_9;
        }// end function

        public static function getInstance() : IEmbeddedFontRegistry
        {
            if (!instance)
            {
                instance = new EmbeddedFontRegistry;
            }
            return instance;
        }// end function

        private static function createFontKey(param1:EmbeddedFont) : String
        {
            return param1.fontName + param1.fontStyle;
        }// end function

        private static function createEmbeddedFont(param1:String) : EmbeddedFont
        {
            var _loc_2:String = null;
            var _loc_3:Boolean = false;
            var _loc_4:Boolean = false;
            var _loc_5:* = endsWith(param1, FontStyle.REGULAR);
            if (endsWith(param1, FontStyle.REGULAR) > 0)
            {
                _loc_2 = param1.substring(0, _loc_5);
                return new EmbeddedFont(_loc_2, false, false);
            }
            _loc_5 = endsWith(param1, FontStyle.BOLD);
            if (_loc_5 > 0)
            {
                _loc_2 = param1.substring(0, _loc_5);
                return new EmbeddedFont(_loc_2, true, false);
            }
            _loc_5 = endsWith(param1, FontStyle.BOLD_ITALIC);
            if (_loc_5 > 0)
            {
                _loc_2 = param1.substring(0, _loc_5);
                return new EmbeddedFont(_loc_2, true, true);
            }
            _loc_5 = endsWith(param1, FontStyle.ITALIC);
            if (_loc_5 > 0)
            {
                _loc_2 = param1.substring(0, _loc_5);
                return new EmbeddedFont(_loc_2, false, true);
            }
            return new EmbeddedFont("", false, false);
        }// end function

        private static function endsWith(param1:String, param2:String) : int
        {
            var _loc_3:* = param1.lastIndexOf(param2);
            if (_loc_3 > 0 && _loc_3 + param2.length == param1.length)
            {
                return _loc_3;
            }
            return -1;
        }// end function

        public static function registerFonts(param1:Object, param2:IFlexModuleFactory) : void
        {
            var fontRegistry:IEmbeddedFontRegistry;
            var f:Object;
            var fontObj:Object;
            var fieldIter:String;
            var bold:Boolean;
            var italic:Boolean;
            var fonts:* = param1;
            var moduleFactory:* = param2;
            try
            {
                fontRegistry = IEmbeddedFontRegistry(Singleton.getInstance("mx.core::IEmbeddedFontRegistry"));
            }
            catch (e:Error)
            {
                Singleton.registerClass("mx.core::IEmbeddedFontRegistry", EmbeddedFontRegistry);
                fontRegistry = IEmbeddedFontRegistry(Singleton.getInstance("mx.core::IEmbeddedFontRegistry"));
            }
            var _loc_4:int = 0;
            var _loc_5:* = fonts;
            while (_loc_5 in _loc_4)
            {
                
                f = _loc_5[_loc_4];
                fontObj = fonts[f];
                var _loc_6:int = 0;
                var _loc_7:* = fontObj;
                while (_loc_7 in _loc_6)
                {
                    
                    fieldIter = _loc_7[_loc_6];
                    if (fontObj[fieldIter] == false)
                    {
                        continue;
                    }
                    if (fieldIter == "regular")
                    {
                        bold;
                        italic;
                    }
                    else if (fieldIter == "boldItalic")
                    {
                        bold;
                        italic;
                    }
                    else if (fieldIter == "bold")
                    {
                        bold;
                        italic;
                    }
                    else if (fieldIter == "italic")
                    {
                        bold;
                        italic;
                    }
                    fontRegistry.registerFont(new EmbeddedFont(String(f), bold, italic), moduleFactory);
                }
            }
            return;
        }// end function

    }
}
