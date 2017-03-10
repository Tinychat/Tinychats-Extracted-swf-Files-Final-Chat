package com.tinychat.ui.context.popupmenu
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.soundcloud.*;
    import com.tinychat.model.youtube.*;
    import flash.display.*;
    import org.robotlegs.core.*;
    import org.robotlegs.utilities.modular.core.*;

    public class TinychatPopupMenuContextFactory extends Object implements PopupMenuContextFactory
    {

        public function TinychatPopupMenuContextFactory()
        {
            return;
        }// end function

        public function newInstance(param1:Identity, param2:DisplayObjectContainer, param3:IInjector) : IModuleContext
        {
            switch(true)
            {
                case param1 is StreamBroadcast:
                {
                    return new StreamBroadcastPopupMenuContext(param2, param3, param1 as StreamBroadcast);
                }
                case param1 is SoundCloudBroadcast:
                {
                    return new SoundCloudBroadcastPopupMenuContext(param2, param3, param1 as SoundCloudBroadcast);
                }
                case param1 is YouTubeBroadcast:
                {
                    return new YouTubeBroadcastPopupMenuContext(param2, param3, param1 as YouTubeBroadcast);
                }
                default:
                {
                    break;
                }
            }
            return null;
        }// end function

    }
}
