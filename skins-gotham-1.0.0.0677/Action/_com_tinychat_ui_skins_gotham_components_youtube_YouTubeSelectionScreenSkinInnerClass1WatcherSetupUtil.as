package 
{
    import com.tinychat.ui.skins.gotham.components.youtube.*;
    import mx.binding.*;
    import mx.core.*;

    public class _com_tinychat_ui_skins_gotham_components_youtube_YouTubeSelectionScreenSkinInnerClass1WatcherSetupUtil extends Object implements IWatcherSetupUtil2
    {

        public function _com_tinychat_ui_skins_gotham_components_youtube_YouTubeSelectionScreenSkinInnerClass1WatcherSetupUtil()
        {
            return;
        }// end function

        public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
        {
            param5[0] = new PropertyWatcher("data", {dataChange:true}, [param4[0], param4[1]], param2);
            param5[2] = new PropertyWatcher("title", null, [param4[1]], null);
            param5[1] = new PropertyWatcher("thumbnailUrl", null, [param4[0]], null);
            param5[0].updateParent(param1);
            param5[0].addChild(param5[2]);
            param5[0].addChild(param5[1]);
            return;
        }// end function

        public static function init(param1:IFlexModuleFactory) : void
        {
            YouTubeSelectionScreenSkinInnerClass1.watcherSetupUtil = new _com_tinychat_ui_skins_gotham_components_youtube_YouTubeSelectionScreenSkinInnerClass1WatcherSetupUtil;
            return;
        }// end function

    }
}
