package 
{
    import com.tinychat.ui.skins.gotham.components.controlbar.buttons.*;
    import mx.binding.*;
    import mx.core.*;

    public class _com_tinychat_ui_skins_gotham_components_controlbar_buttons_FlatControlBarButtonSkinWatcherSetupUtil extends Object implements IWatcherSetupUtil2
    {

        public function _com_tinychat_ui_skins_gotham_components_controlbar_buttons_FlatControlBarButtonSkinWatcherSetupUtil()
        {
            return;
        }// end function

        public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
        {
            param5[1] = new PropertyWatcher("gradient2", {propertyChange:true}, [param4[0]], param2);
            param5[0] = new PropertyWatcher("gradient1", {propertyChange:true}, [param4[0]], param2);
            param5[1].updateParent(param1);
            param5[0].updateParent(param1);
            return;
        }// end function

        public static function init(param1:IFlexModuleFactory) : void
        {
            FlatControlBarButtonSkin.watcherSetupUtil = new _com_tinychat_ui_skins_gotham_components_controlbar_buttons_FlatControlBarButtonSkinWatcherSetupUtil;
            return;
        }// end function

    }
}
