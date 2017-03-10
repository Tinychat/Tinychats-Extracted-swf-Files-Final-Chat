package com.tinychat.ui.mediators.trial
{
    import com.tinychat.controller.guards.*;
    import com.tinychat.controller.guards.composite.*;
    import com.tinychat.ui.components.trial.*;
    import org.robotlegs.mvcs.*;

    public class TrialButtonBarMediator extends Mediator
    {
        public var view:TrialButtonBar;
        public var hasBroadcasters:RoomHasBroadcastersGuard;
        public var subjectToTrial:SubjectToTrialGuard;
        private var visibleGuard:AllOfGuards;

        public function TrialButtonBarMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.visibleGuard = new AllOfGuards(this.hasBroadcasters, this.subjectToTrial);
            this.visibleGuard.addChangeListener(this.visibleGuardChangeHandler);
            this.visibleGuardChangeHandler(this.visibleGuard.approve());
            return;
        }// end function

        override public function onRemove() : void
        {
            super.onRemove();
            this.visibleGuard.removeChangeListener(this.visibleGuardChangeHandler);
            return;
        }// end function

        private function visibleGuardChangeHandler(param1:Boolean) : void
        {
            this.view.visible = param1;
            this.view.includeInLayout = param1;
            return;
        }// end function

    }
}
