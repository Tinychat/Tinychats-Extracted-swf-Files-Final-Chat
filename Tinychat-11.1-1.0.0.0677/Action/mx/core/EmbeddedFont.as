package mx.core
{

    public class EmbeddedFont extends Object
    {
        private var _bold:Boolean;
        private var _fontName:String;
        private var _fontStyle:String;
        private var _italic:Boolean;
        static const VERSION:String = "4.6.0.23201";
        private static var noEmbeddedFonts:Boolean;
        private static var _embeddedFontRegistry:IEmbeddedFontRegistry;

        public function EmbeddedFont(param1:String, param2:Boolean, param3:Boolean)
        {
            this.initialize(param1, param2, param3);
            return;
        }// end function

        public function get bold() : Boolean
        {
            return this._bold;
        }// end function

        public function get fontName() : String
        {
            return this._fontName;
        }// end function

        public function get fontStyle() : String
        {
            return this._fontStyle;
        }// end function

        public function get italic() : Boolean
        {
            return this._italic;
        }// end function

        public function initialize(param1:String, param2:Boolean, param3:Boolean) : void
        {
            this._bold = param2;
            this._italic = param3;
            this._fontName = param1;
            this._fontStyle = embeddedFontRegistry.getFontStyle(param2, param3);
            return;
        }// end function

        private static function get embeddedFontRegistry() : IEmbeddedFontRegistry
        {
            if (!_embeddedFontRegistry && !noEmbeddedFonts)
            {
                try
                {
                    _embeddedFontRegistry = IEmbeddedFontRegistry(Singleton.getInstance("mx.core::IEmbeddedFontRegistry"));
                }
                catch (e:Error)
                {
                    noEmbeddedFonts = true;
                }
            }
            return _embeddedFontRegistry;
        }// end function

    }
}
