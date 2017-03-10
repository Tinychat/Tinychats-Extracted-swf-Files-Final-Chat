package 
{
    import __AS3__.vec.*;
    import com.tinychat.ui.components.preloader.*;
    import flash.display.*;
    import flash.system.*;
    import flash.utils.*;
    import mx.core.*;
    import mx.events.*;
    import mx.managers.*;

    public class _Tinychat_mx_managers_SystemManager extends SystemManager implements IFlexModuleFactory, ISWFContext
    {
        private var _info:Object;
        private var _preloadedRSLs:Dictionary;
        private var _allowDomainParameters:Vector.<Array>;
        private var _allowInsecureDomainParameters:Vector.<Array>;

        public function _Tinychat_mx_managers_SystemManager()
        {
            return;
        }// end function

        override public function callInContext(param1:Function, param2:Object, param3:Array, param4:Boolean = true)
        {
            if (param4)
            {
                return param1.apply(param2, param3);
            }
            param1.apply(param2, param3);
            return;
        }// end function

        override public function create(... args) : Object
        {
            if (args.length > 0 && !(args[0] is String))
            {
                return super.create.apply(this, args);
            }
            args = args.length == 0 ? ("Tinychat") : (String(args[0]));
            var _loc_3:* = Class(getDefinitionByName(args));
            if (!_loc_3)
            {
                return null;
            }
            var _loc_4:* = new _loc_3;
            if (new _loc_3 is IFlexModule)
            {
                IFlexModule(_loc_4).moduleFactory = this;
            }
            if (args.length == 0)
            {
                Singleton.registerClass("mx.core::IEmbeddedFontRegistry", Class(getDefinitionByName("mx.core::EmbeddedFontRegistry")));
                EmbeddedFontRegistry.registerFonts(this.info()["fonts"], this);
            }
            return _loc_4;
        }// end function

        override public function info() : Object
        {
            if (!this._info)
            {
                this._info = {cdRsls:[[new RSLData("http://fpdownload.adobe.com/pub/swz/flex/4.6.0.23201/framework_4.6.0.23201.swz", "http://fpdownload.adobe.com/pub/swz/crossdomain.xml", "abd49354324081cebb8f60184cf5fee81f0f9298e64dbec968c96d68fe16c437", "SHA-256", true, true, "default"), new RSLData("framework_4.6.0.23201.swz", "", "abd49354324081cebb8f60184cf5fee81f0f9298e64dbec968c96d68fe16c437", "SHA-256", true, true, "default")], [new RSLData("http://fpdownload.adobe.com/pub/swz/tlf/2.0.0.232/textLayout_2.0.0.232.swz", "http://fpdownload.adobe.com/pub/swz/crossdomain.xml", "8f903698240fe799f61eeda8595181137b996156bb176da70ad6f41645c64c74", "SHA-256", true, true, "default"), new RSLData("textLayout_2.0.0.232.swz", "", "8f903698240fe799f61eeda8595181137b996156bb176da70ad6f41645c64c74", "SHA-256", true, true, "default")], [new RSLData("http://fpdownload.adobe.com/pub/swz/flex/4.6.0.23201/spark_4.6.0.23201.swz", "http://fpdownload.adobe.com/pub/swz/crossdomain.xml", "4bae91dbaef0ceec0fce5505d96ddea865edbfc14dd96e89fb54de12f58432eb", "SHA-256", true, true, "default"), new RSLData("spark_4.6.0.23201.swz", "", "4bae91dbaef0ceec0fce5505d96ddea865edbfc14dd96e89fb54de12f58432eb", "SHA-256", true, true, "default")], [new RSLData("http://fpdownload.adobe.com/pub/swz/flex/4.6.0.23201/sparkskins_4.6.0.23201.swz", "http://fpdownload.adobe.com/pub/swz/crossdomain.xml", "84d36bdf5e2577bfb0b8ce6a12a8646bb1aadddd24c92e5c12d157d44ad7ce61", "SHA-256", true, true, "default"), new RSLData("sparkskins_4.6.0.23201.swz", "", "84d36bdf5e2577bfb0b8ce6a12a8646bb1aadddd24c92e5c12d157d44ad7ce61", "SHA-256", true, true, "default")], [new RSLData("http://fpdownload.adobe.com/pub/swz/flex/4.6.0.23201/osmf_1.0.0.16316.swz", "http://fpdownload.adobe.com/pub/swz/crossdomain.xml", "b63185fca5d2bdbb568593f2bf232e87e5a20a7ea2ce2e26671d159838d598ed", "SHA-256", true, true, "default"), new RSLData("osmf_1.0.0.16316.swz", "", "b63185fca5d2bdbb568593f2bf232e87e5a20a7ea2ce2e26671d159838d598ed", "SHA-256", true, true, "default")], [new RSLData("http://fpdownload.adobe.com/pub/swz/flex/4.6.0.23201/mx_4.6.0.23201.swz", "http://fpdownload.adobe.com/pub/swz/crossdomain.xml", "d888aee0ce49f58a35c32eb138edd00f0d6b9fae68b78d7eb83932c09ef0b6f1", "SHA-256", true, true, "default"), new RSLData("mx_4.6.0.23201.swz", "", "d888aee0ce49f58a35c32eb138edd00f0d6b9fae68b78d7eb83932c09ef0b6f1", "SHA-256", true, true, "default")], [new RSLData("core-1.0.0.0677.swf", "", "e3dd81d5f2c068fc4c0eaa1edd37f8edc89714ee5992d56e1082d0edcaa8f9e8", "SHA-256", false, true, "default")], [new RSLData("aec-1.0.0.0677.swf", "", "0753dac39e197ceb8888f9c11e0f4555dafaf188f4a7d5e7299de4833963d343", "SHA-256", false, true, "default")], [new RSLData("skins-gotham-1.0.0.0677.swf", "", "c98b0180b4549b89913482451f499ccd92c30b2ebb28b09f2e2314425b070283", "SHA-256", false, true, "default")]], compiledLocales:["en_US"], compiledResourceBundleNames:["SharedResources", "ToolTipBundle", "collections", "components", "controls", "core", "effects", "formatters", "layout", "skins", "sparkEffects", "styles", "textLayout", "validators"], creationComplete:"creationCompleteHandler()", currentDomain:ApplicationDomain.currentDomain, fonts:{HelveticaEmbedded:{regular:true, bold:true, italic:false, boldItalic:false}}, height:"635", mainClassName:"Tinychat", mixins:["_Tinychat_FlexInit", "_Tinychat_Styles", "mx.managers.systemClasses.ActiveWindowManager"], placeholderRsls:[[new RSLData("http://fpdownload.adobe.com/pub/swz/flex/4.6.0.23201/rpc_4.6.0.23201.swz", "http://fpdownload.adobe.com/pub/swz/crossdomain.xml", "98eeca3e014a0fa3c4c613006bdcea12da3beace6a8c9eccdde2e07cb486bab5", "SHA-256", true, true, "default"), new RSLData("rpc_4.6.0.23201.swz", "", "98eeca3e014a0fa3c4c613006bdcea12da3beace6a8c9eccdde2e07cb486bab5", "SHA-256", true, true, "default")], [new RSLData("http://fpdownload.adobe.com/pub/swz/flex/4.6.0.23201/charts_4.6.0.23201.swz", "http://fpdownload.adobe.com/pub/swz/crossdomain.xml", "b07e6a4389510e372fc066449e5bcca0f689a3c5e51b5aae55e4a0eeae7f80a6", "SHA-256", true, true, "default"), new RSLData("charts_4.6.0.23201.swz", "", "b07e6a4389510e372fc066449e5bcca0f689a3c5e51b5aae55e4a0eeae7f80a6", "SHA-256", true, true, "default")], [new RSLData("http://fpdownload.adobe.com/pub/swz/flex/4.6.0.23201/spark_dmv_4.6.0.23201.swz", "http://fpdownload.adobe.com/pub/swz/crossdomain.xml", "d38dbc462676d679b79eb7d46887d34b5b33dfe9065751946ea104fd387ec69c", "SHA-256", true, true, "default"), new RSLData("spark_dmv_4.6.0.23201.swz", "", "d38dbc462676d679b79eb7d46887d34b5b33dfe9065751946ea104fd387ec69c", "SHA-256", true, true, "default")], [new RSLData("http://fpdownload.adobe.com/pub/swz/flex/4.6.0.23201/advancedgrids_4.6.0.23201.swz", "http://fpdownload.adobe.com/pub/swz/crossdomain.xml", "529c81ac00092e51dcd0016be8ba25f6d54c55dd9a3a94f9a67d25a3d1ea6015", "SHA-256", true, true, "default"), new RSLData("advancedgrids_4.6.0.23201.swz", "", "529c81ac00092e51dcd0016be8ba25f6d54c55dd9a3a94f9a67d25a3d1ea6015", "SHA-256", true, true, "default")]], preloader:PupilPreloader, width:"725"};
            }
            return this._info;
        }// end function

        override public function get preloadedRSLs() : Dictionary
        {
            if (this._preloadedRSLs == null)
            {
                this._preloadedRSLs = new Dictionary(true);
            }
            return this._preloadedRSLs;
        }// end function

        override public function allowDomain(... args) : void
        {
            args = null;
            Security.allowDomain.apply(null, args);
            for (args in this._preloadedRSLs)
            {
                
                if (args.content && "allowDomainInRSL" in args.content)
                {
                    args.content["allowDomainInRSL"].apply(null, args);
                }
            }
            if (!this._allowDomainParameters)
            {
                this._allowDomainParameters = new Vector.<Array>;
            }
            this._allowDomainParameters.push(args);
            addEventListener(RSLEvent.RSL_ADD_PRELOADED, this.addPreloadedRSLHandler, false, 50);
            return;
        }// end function

        override public function allowInsecureDomain(... args) : void
        {
            args = null;
            Security.allowInsecureDomain.apply(null, args);
            for (args in this._preloadedRSLs)
            {
                
                if (args.content && "allowInsecureDomainInRSL" in args.content)
                {
                    args.content["allowInsecureDomainInRSL"].apply(null, args);
                }
            }
            if (!this._allowInsecureDomainParameters)
            {
                this._allowInsecureDomainParameters = new Vector.<Array>;
            }
            this._allowInsecureDomainParameters.push(args);
            addEventListener(RSLEvent.RSL_ADD_PRELOADED, this.addPreloadedRSLHandler, false, 50);
            return;
        }// end function

        private function addPreloadedRSLHandler(event:RSLEvent) : void
        {
            var _loc_3:Array = null;
            var _loc_2:* = event.loaderInfo;
            if (!_loc_2 || !_loc_2.content)
            {
                return;
            }
            if (allowDomainsInNewRSLs && this._allowDomainParameters)
            {
                for each (_loc_3 in this._allowDomainParameters)
                {
                    
                    if ("allowDomainInRSL" in _loc_2.content)
                    {
                        _loc_2.content["allowDomainInRSL"].apply(null, _loc_3);
                    }
                }
            }
            if (allowInsecureDomainsInNewRSLs && this._allowInsecureDomainParameters)
            {
                for each (_loc_3 in this._allowInsecureDomainParameters)
                {
                    
                    if ("allowInsecureDomainInRSL" in _loc_2.content)
                    {
                        _loc_2.content["allowInsecureDomainInRSL"].apply(null, _loc_3);
                    }
                }
            }
            return;
        }// end function

    }
}
