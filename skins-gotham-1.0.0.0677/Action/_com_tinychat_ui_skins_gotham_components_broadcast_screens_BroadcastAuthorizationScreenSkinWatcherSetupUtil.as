package 
{
    import com.tinychat.ui.skins.gotham.components.broadcast.screens.*;
    import mx.binding.*;
    import mx.core.*;

    public class _com_tinychat_ui_skins_gotham_components_broadcast_screens_BroadcastAuthorizationScreenSkinWatcherSetupUtil extends Object implements IWatcherSetupUtil2
    {

        public function _com_tinychat_ui_skins_gotham_components_broadcast_screens_BroadcastAuthorizationScreenSkinWatcherSetupUtil()
        {
            return;
        }// end function

        public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
        {
            param5[1] = new PropertyWatcher("arrowClose", {propertyChange:true}, [param4[1]], param2);
            param5[0] = new PropertyWatcher("power", {propertyChange:true}, [param4[0], param4[2]], param2);
            param5[1].updateParent(param1);
            param5[0].updateParent(param1);
            return;
        }// end function

        public static function init(param1:IFlexModuleFactory) : void
        {
            BroadcastAuthorizationScreenSkin.watcherSetupUtil = new _com_tinychat_ui_skins_gotham_components_broadcast_screens_BroadcastAuthorizationScreenSkinWatcherSetupUtil;
            return;
        }// end function

    }
}
