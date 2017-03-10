package com.tinychat.ui.mediators.popupmenu
{
    import com.tinychat.model.menuoption.*;
    import com.tinychat.model.menuoption.media.*;
    import com.tinychat.ui.components.popupmenu.*;

    public class YouTubeBroadcastPopupMenuMediator extends UserPopupMenuMediatorBase
    {
        public var close:CloseMediaBroadcastMenuOption;
        public var editableDuration:EditableDurationMediaBroadcastMenuOption;
        public var hide:HideBroadcastMenuOption;
        public var pause:PauseMediaMenuOption;
        public var play:PlayMediaMenuOption;
        public var readOnlyDuration:ReadOnlyDurationMediaBroadcastMenuOption;
        public var show:ShowBroadcastMenuOption;
        public var volume:VolumeBroadcastMenuOption;
        public var promote:PromoteBroadcastMenuOption;
        public var demote:DemoteBroadcastMenuOption;

        public function YouTubeBroadcastPopupMenuMediator(param1:UserPopupMenu)
        {
            super(param1);
            return;
        }// end function

        override protected function get menuOptions() : Array
        {
            return [this.close, this.demote, this.editableDuration, this.hide, this.pause, this.play, this.promote, this.readOnlyDuration, this.show, this.volume];
        }// end function

    }
}
