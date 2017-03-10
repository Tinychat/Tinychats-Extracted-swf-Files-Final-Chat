package 
{
    import com.tinychat.ui.skins.gotham.components.social.buttonbar.*;
    import mx.binding.*;
    import mx.core.*;

    public class _com_tinychat_ui_skins_gotham_components_social_buttonbar_UserCountButtonBarButtonSkinWatcherSetupUtil extends Object implements IWatcherSetupUtil2
    {

        public function _com_tinychat_ui_skins_gotham_components_social_buttonbar_UserCountButtonBarButtonSkinWatcherSetupUtil()
        {
            return;
        }// end function

        public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
        {
            param5[6] = new PropertyWatcher("selectionIndicator", {propertyChange:true}, [param4[1]], param2);
            param5[3] = new PropertyWatcher("line4", {propertyChange:true}, [param4[0]], param2);
            param5[5] = new PropertyWatcher("gradient2", {propertyChange:true}, [param4[0]], param2);
            param5[4] = new PropertyWatcher("gradient1", {propertyChange:true}, [param4[0]], param2);
            param5[2] = new PropertyWatcher("line3", {propertyChange:true}, [param4[0]], param2);
            param5[1] = new PropertyWatcher("line2", {propertyChange:true}, [param4[0]], param2);
            param5[0] = new PropertyWatcher("line1", {propertyChange:true}, [param4[0]], param2);
            param5[6].updateParent(param1);
            param5[3].updateParent(param1);
            param5[5].updateParent(param1);
            param5[4].updateParent(param1);
            param5[2].updateParent(param1);
            param5[1].updateParent(param1);
            param5[0].updateParent(param1);
            return;
        }// end function

        public static function init(param1:IFlexModuleFactory) : void
        {
            UserCountButtonBarButtonSkin.watcherSetupUtil = new _com_tinychat_ui_skins_gotham_components_social_buttonbar_UserCountButtonBarButtonSkinWatcherSetupUtil;
            return;
        }// end function

    }
}
