package com.tinychat.model.sounds
{
    import flash.media.*;

    public class SoundEffect extends Object
    {
        private var embed:Class;
        private var sound:Sound;
        private static var pop:Class = SoundEffect_pop;
        private static var magic:Class = SoundEffect_magic;
        public static const POP:SoundEffect = new SoundEffect(POP, SoundEffect.pop);
        public static const MAGIC:SoundEffect = new SoundEffect(MAGIC, SoundEffect.magic);

        public function SoundEffect(param1:SoundEffect, param2:Class)
        {
            this.embed = param2;
            return;
        }// end function

        public function play(param1:SoundTransform) : void
        {
            if (!this.sound)
            {
                this.sound = new this.embed();
            }
            this.sound.play(0, 0, param1);
            return;
        }// end function

    }
}
