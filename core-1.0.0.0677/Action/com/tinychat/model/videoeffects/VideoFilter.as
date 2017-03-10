package com.tinychat.model.videoeffects
{
    import flash.display.*;

    public class VideoFilter extends Object implements Identity, Named
    {
        private var _name:String;
        private var _id:String;
        private var shaderClass:Class;
        private var update:Function;
        private static var idLookup:Object = {};
        public static const BLUE:VideoFilter = new VideoFilter(BLUE, "blue", "Blue", Shaders.BLUE);
        public static const BLUR:VideoFilter = new VideoFilter(BLUR, "blur", "Blur", Shaders.BLUR, @%@function ()@%@1@%@);
        public static const BULGE:VideoFilter = new VideoFilter(BULGE, "bulge", "Bulge", Shaders.BULGE, @%@function ()@%@2@%@);
        public static const CIRCLE_SPLASH:VideoFilter = new VideoFilter(CIRCLE_SPLASH, "circlesplash", "Circle Splash", Shaders.CIRCLE_SPLASH, @%@function ()@%@3@%@);
        public static const GRAYSCALE:VideoFilter = new VideoFilter(GRAYSCALE, "grayscale", "Grayscale", Shaders.GRAYSCALE);
        public static const GREEN:VideoFilter = new VideoFilter(GREEN, "green", "Green", Shaders.GREEN);
        public static const KALEIDOSCOPE:VideoFilter = new VideoFilter(KALEIDOSCOPE, "kaleidoscope", "Kaleidoscope", Shaders.KALEIDOSCOPE, @%@function ()@%@4@%@);
        public static const MERCATOR:VideoFilter = new VideoFilter(MERCATOR, "mercator", "Mercator", Shaders.MERCATOR, @%@function ()@%@5@%@);
        public static const NEGATIVE:VideoFilter = new VideoFilter(NEGATIVE, "negative", "Negative", Shaders.NEGATIVE);
        public static const OUTLINE:VideoFilter = new VideoFilter(OUTLINE, "outline", "Outline", Shaders.OUTLINE, @%@function ()@%@6@%@);
        public static const PINCH:VideoFilter = new VideoFilter(PINCH, "pinch", "Pinch", Shaders.WAVE, @%@function ()@%@7@%@);
        public static const PIXELATE:VideoFilter = new VideoFilter(PIXELATE, "pixelate", "Pixelate", Shaders.PIXELATE, @%@function ()@%@8@%@);
        public static const POSTER:VideoFilter = new VideoFilter(POSTER, "poster", "Poster", Shaders.POSTER);
        public static const POSTERIZE:VideoFilter = new VideoFilter(POSTERIZE, "posterize", "Posterize", Shaders.POSTERIZE, @%@function ()@%@9@%@);
        public static const RED:VideoFilter = new VideoFilter(RED, "red", "Red", Shaders.RED);
        public static const RADIAL_CALEIDOSCOPE:VideoFilter = new VideoFilter(RADIAL_CALEIDOSCOPE, "radialcaleidoscope", "Radial Caleidoscope", Shaders.RADIAL_CALEIDOSCOPE, @%@function ()@%@10@%@);
        public static const SCAN_LINE:VideoFilter = new VideoFilter(SCAN_LINE, "scanline", "Scanline", Shaders.SCANLINE);
        public static const SEPIA:VideoFilter = new VideoFilter(SEPIA, "sepia", "Sepia", Shaders.SEPIA);
        public static const SHARPEN:VideoFilter = new VideoFilter(SHARPEN, "sharpen", "Sharpen", Shaders.SHARPEN, @%@function ()@%@11@%@);
        public static const SMUDGE:VideoFilter = new VideoFilter(SMUDGE, "smudge", "Smudge", Shaders.SMUDGE, @%@function ()@%@12@%@);
        public static const SPHERE:VideoFilter = new VideoFilter(SPHERE, "sphere", "Sphere", Shaders.SPHERIZE, @%@function ()@%@13@%@);
        public static const TUBE_VIEW:VideoFilter = new VideoFilter(TUBE_VIEW, "tubeview", "Tube View", Shaders.TUBE_VIEW, @%@function ()@%@14@%@);
        public static const TWIRL:VideoFilter = new VideoFilter(TWIRL, "twirl", "Twirl", Shaders.TWIRL, @%@function ()@%@15@%@);
        public static const VINTAGE:VideoFilter = new VideoFilter(VINTAGE, "vintage", "Vintage", Shaders.VINTAGE);

        public function VideoFilter(param1:VideoFilter, param2:String, param3:String, param4:Class, param5:Function = null)
        {
            this._name = param3;
            this._id = param2;
            this.shaderClass = param4;
            this.update = param5;
            idLookup[param2] = this;
            return;
        }// end function

        public function get id() : String
        {
            return this._id;
        }// end function

        public function get name() : String
        {
            return this._name;
        }// end function

        public function createFilter() : AdvancedShaderFilter
        {
            return new AdvancedShaderFilter(new Shader(new this.shaderClass()), this.update);
        }// end function

        public static function fromId(param1:String) : VideoFilter
        {
            return idLookup[param1];
        }// end function

    }
}
