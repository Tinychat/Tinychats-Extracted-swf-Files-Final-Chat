package 
{
    import com.tinychat.ui.skins.gotham.components.loadingindicators.*;
    import mx.binding.*;
    import mx.core.*;

    public class _com_tinychat_ui_skins_gotham_components_loadingindicators_AjaxLoaderWatcherSetupUtil extends Object implements IWatcherSetupUtil2
    {

        public function _com_tinychat_ui_skins_gotham_components_loadingindicators_AjaxLoaderWatcherSetupUtil()
        {
            return;
        }// end function

        public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
        {
            param5[0] = new PropertyWatcher("ajaxLoader", {propertyChange:true}, [param4[0]], param2);
            param5[0].updateParent(param1);
            return;
        }// end function

        public static function init(param1:IFlexModuleFactory) : void
        {
            AjaxLoader.watcherSetupUtil = new _com_tinychat_ui_skins_gotham_components_loadingindicators_AjaxLoaderWatcherSetupUtil;
            return;
        }// end function

    }
}
