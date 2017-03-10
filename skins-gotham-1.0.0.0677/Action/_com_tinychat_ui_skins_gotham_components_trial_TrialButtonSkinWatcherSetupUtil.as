package 
{
    import com.tinychat.ui.skins.gotham.components.trial.*;
    import mx.binding.*;
    import mx.core.*;

    public class _com_tinychat_ui_skins_gotham_components_trial_TrialButtonSkinWatcherSetupUtil extends Object implements IWatcherSetupUtil2
    {

        public function _com_tinychat_ui_skins_gotham_components_trial_TrialButtonSkinWatcherSetupUtil()
        {
            return;
        }// end function

        public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
        {
            param5[0] = new PropertyWatcher("ge1", {propertyChange:true}, [param4[0]], param2);
            param5[2] = new PropertyWatcher("ge3", {propertyChange:true}, [param4[0]], param2);
            param5[1] = new PropertyWatcher("ge2", {propertyChange:true}, [param4[0]], param2);
            param5[3] = new PropertyWatcher("ge4", {propertyChange:true}, [param4[0]], param2);
            param5[4] = new PropertyWatcher("stroke", {propertyChange:true}, [param4[0]], param2);
            param5[0].updateParent(param1);
            param5[2].updateParent(param1);
            param5[1].updateParent(param1);
            param5[3].updateParent(param1);
            param5[4].updateParent(param1);
            return;
        }// end function

        public static function init(param1:IFlexModuleFactory) : void
        {
            TrialButtonSkin.watcherSetupUtil = new _com_tinychat_ui_skins_gotham_components_trial_TrialButtonSkinWatcherSetupUtil;
            return;
        }// end function

    }
}
