package com.tinychat.ui.mediators.popupmenu
{
    import com.tinychat.model.menuoption.*;
    import com.tinychat.model.menuoption.media.*;
    import com.tinychat.ui.components.popupmenu.*;

    public class SoundCloudBroadcastPopupMenuMediator extends UserPopupMenuMediatorBase
    {
        public var close:CloseMediaBroadcastMenuOption;
        public var editableDuration:EditableDurationMediaBroadcastMenuOption;
        public var pause:PauseMediaMenuOption;
        public var play:PlayMediaMenuOption;
        public var readOnlyDuration:ReadOnlyDurationMediaBroadcastMenuOption;
        public var volume:VolumeBroadcastMenuOption;

        public function SoundCloudBroadcastPopupMenuMediator(param1:UserPopupMenu)
        {
            super(param1);
            return;
        }// end function

        override protected function get menuOptions() : Array
        {
            return [this.close, this.editableDuration, this.pause, this.play, this.readOnlyDuration, this.volume];
        }// end function

    }
}
