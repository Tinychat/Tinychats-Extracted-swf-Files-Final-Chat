package com.tinychat.ui.skins.gotham.components.social.chat.smileysets
{
    import com.tinychat.model.social.chat.*;
    import flash.text.engine.*;
    import flash.utils.*;

    public class PhpbbSmileySet extends Object implements SmileySet
    {
        private static var smileyMap:Dictionary;
        private static const WIDTH:Number = 16;
        private static const HEIGHT:Number = 16;
        private static const confused:Class = PhpbbSmileySet_confused;
        private static const cool:Class = PhpbbSmileySet_cool;
        private static const frown:Class = PhpbbSmileySet_frown;
        private static const grin:Class = PhpbbSmileySet_grin;
        private static const neutral:Class = PhpbbSmileySet_neutral;
        private static const sad:Class = PhpbbSmileySet_sad;
        private static const smile:Class = PhpbbSmileySet_smile;
        private static const surprised:Class = PhpbbSmileySet_surprised;
        private static const tongue:Class = PhpbbSmileySet_tongue;
        private static const wink:Class = PhpbbSmileySet_wink;
        private static var _initializeSmileyMap:Boolean = initializeSmileyMap();

        public function PhpbbSmileySet()
        {
            return;
        }// end function

        public function toElement(param1:Smiley, param2:ElementFormat) : ContentElement
        {
            if (smileyMap[param1.group])
            {
                param2 = param2.clone();
                param2.dominantBaseline = TextBaseline.IDEOGRAPHIC_BOTTOM;
                return new GraphicElement(new smileyMap[param1.group], WIDTH, HEIGHT, param2);
            }
            return new TextElement(param1.toString(), param2);
        }// end function

        private static function initializeSmileyMap() : Boolean
        {
            smileyMap = new Dictionary();
            smileyMap[SmileyGroup.CONCERNED] = sad;
            smileyMap[SmileyGroup.CONFUSED] = confused;
            smileyMap[SmileyGroup.COOL] = cool;
            smileyMap[SmileyGroup.FROWN] = frown;
            smileyMap[SmileyGroup.GRIN] = grin;
            smileyMap[SmileyGroup.NEUTRAL] = neutral;
            smileyMap[SmileyGroup.SAD] = sad;
            smileyMap[SmileyGroup.SEALED] = confused;
            smileyMap[SmileyGroup.SMILE] = smile;
            smileyMap[SmileyGroup.SURPRISED] = surprised;
            smileyMap[SmileyGroup.TONGUE] = tongue;
            smileyMap[SmileyGroup.WINK] = wink;
            return true;
        }// end function

    }
}
