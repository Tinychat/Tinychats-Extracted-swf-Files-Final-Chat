package 
{
    import com.tinychat.ui.skins.gotham.components.social.userslist.*;
    import mx.binding.*;
    import mx.core.*;

    public class _com_tinychat_ui_skins_gotham_components_social_userslist_TinychatUsersListItemRendererWatcherSetupUtil extends Object implements IWatcherSetupUtil2
    {

        public function _com_tinychat_ui_skins_gotham_components_social_userslist_TinychatUsersListItemRendererWatcherSetupUtil()
        {
            return;
        }// end function

        public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
        {
            param5[0] = new PropertyWatcher("backgroundColor", {propertyChange:true}, [param4[0]], param2);
            param5[0].updateParent(param1);
            return;
        }// end function

        public static function init(param1:IFlexModuleFactory) : void
        {
            TinychatUsersListItemRenderer.watcherSetupUtil = new _com_tinychat_ui_skins_gotham_components_social_userslist_TinychatUsersListItemRendererWatcherSetupUtil;
            return;
        }// end function

    }
}
