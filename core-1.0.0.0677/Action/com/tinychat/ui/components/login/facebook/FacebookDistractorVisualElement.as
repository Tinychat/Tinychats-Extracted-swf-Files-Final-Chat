package com.tinychat.ui.components.login.facebook
{
    import com.facebook.graph.controls.*;
    import spark.core.*;

    public class FacebookDistractorVisualElement extends SpriteVisualElement
    {
        private var distractor:Distractor;

        public function FacebookDistractorVisualElement()
        {
            this.distractor = new Distractor();
            addChild(this.distractor);
            this.distractor.x = -98;
            this.distractor.y = 0;
            width = 40;
            height = 20;
            return;
        }// end function

    }
}
