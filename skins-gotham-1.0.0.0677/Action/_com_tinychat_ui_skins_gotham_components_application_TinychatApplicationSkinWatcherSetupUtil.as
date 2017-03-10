package 
{
    import com.tinychat.ui.skins.gotham.components.application.*;
    import mx.binding.*;
    import mx.core.*;

    public class _com_tinychat_ui_skins_gotham_components_application_TinychatApplicationSkinWatcherSetupUtil extends Object implements IWatcherSetupUtil2
    {

        public function _com_tinychat_ui_skins_gotham_components_application_TinychatApplicationSkinWatcherSetupUtil()
        {
            return;
        }// end function

        public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
        {
            param5[4] = new PropertyWatcher("fadeConnectingScreen", {propertyChange:true}, [param4[8]], param2);
            param5[0] = new PropertyWatcher("application", null, [param4[0]], param2);
            param5[1] = new PropertyWatcher("connectingScreen", {propertyChange:true}, [param4[1], param4[2], param4[4]], param2);
            param5[2] = new PropertyWatcher("modal", {propertyChange:true}, [param4[3], param4[5], param4[6]], param2);
            param5[4].updateParent(param1);
            param5[0].updateParent(param1);
            param5[1].updateParent(param1);
            param5[2].updateParent(param1);
            return;
        }// end function

        public static function init(param1:IFlexModuleFactory) : void
        {
            TinychatApplicationSkin.watcherSetupUtil = new _com_tinychat_ui_skins_gotham_components_application_TinychatApplicationSkinWatcherSetupUtil;
            return;
        }// end function

    }
}
