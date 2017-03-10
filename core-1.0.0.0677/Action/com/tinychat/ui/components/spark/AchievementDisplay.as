package com.tinychat.ui.components.spark
{
    import com.tinychat.model.api.*;
    import spark.primitives.*;

    public class AchievementDisplay extends BitmapImage
    {
        private var _achiev:Achievement;

        public function AchievementDisplay()
        {
            smooth = true;
            return;
        }// end function

        public function set achiev(param1:Achievement) : void
        {
            if (this._achiev)
            {
                this._achiev.achievementChange.remove(this.achievementChangeHandler);
                source = null;
            }
            this._achiev = param1;
            if (this._achiev)
            {
                source = this._achiev.achievement;
                param1.achievementChange.add(this.achievementChangeHandler);
            }
            return;
        }// end function

        private function achievementChangeHandler(param1:String) : void
        {
            source = param1;
            return;
        }// end function

    }
}
