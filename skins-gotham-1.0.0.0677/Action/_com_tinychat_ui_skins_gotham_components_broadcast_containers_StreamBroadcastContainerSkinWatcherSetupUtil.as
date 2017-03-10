package 
{
    import com.tinychat.ui.skins.gotham.components.broadcast.containers.*;
    import mx.binding.*;
    import mx.core.*;

    public class _com_tinychat_ui_skins_gotham_components_broadcast_containers_StreamBroadcastContainerSkinWatcherSetupUtil extends Object implements IWatcherSetupUtil2
    {

        public function _com_tinychat_ui_skins_gotham_components_broadcast_containers_StreamBroadcastContainerSkinWatcherSetupUtil()
        {
            return;
        }// end function

        public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
        {
            param5[0] = new PropertyWatcher("border", {propertyChange:true}, [param4[0]], param2);
            param5[1] = new PropertyWatcher("videoControlsOverlay", {propertyChange:true}, [param4[0]], param2);
            param5[0].updateParent(param1);
            param5[1].updateParent(param1);
            return;
        }// end function

        public static function init(param1:IFlexModuleFactory) : void
        {
            StreamBroadcastContainerSkin.watcherSetupUtil = new _com_tinychat_ui_skins_gotham_components_broadcast_containers_StreamBroadcastContainerSkinWatcherSetupUtil;
            return;
        }// end function

    }
}
