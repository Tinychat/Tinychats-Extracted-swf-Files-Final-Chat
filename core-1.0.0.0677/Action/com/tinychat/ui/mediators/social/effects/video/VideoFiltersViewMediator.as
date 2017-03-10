package com.tinychat.ui.mediators.social.effects.video
{
    import com.tinychat.controller.commands.effect.signal.*;
    import com.tinychat.controller.guards.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.videoeffects.*;
    import com.tinychat.ui.components.social.effects.video.*;
    import org.robotlegs.mvcs.*;

    public class VideoFiltersViewMediator extends Mediator
    {
        public var view:VideoFiltersView;
        public var isPaidUser:IsPaidUserGuard;
        public var videoFilterSelected:VideoFilterSelected;

        public function VideoFiltersViewMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.trialMode = !this.isPaidUser.approve();
            this.view.filterSelected.add(this.filterSelectedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            super.onRemove();
            this.view.filterSelected.remove(this.filterSelectedHandler);
            return;
        }// end function

        private function filterSelectedHandler(param1:Identity, param2:VideoFilter = null) : void
        {
            this.videoFilterSelected.dispatch(param1, param2);
            return;
        }// end function

    }
}
