package com.tinychat.controller.commands.social.network.facebook
{
    import com.facebook.graph.*;
    import com.tinychat.model.social.network.facebook.*;
    import org.robotlegs.utilities.macrobot.*;

    public class FacebookInitCommand extends AsyncCommand
    {
        public static var inited:Boolean;

        public function FacebookInitCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            if (!inited)
            {
                Facebook.init(FacebookConstants.APP_ID, this.initHandler, {status:true, xfbml:true, version:FacebookConstants.APP_VERSION});
            }
            else
            {
                dispatchComplete(true);
            }
            return;
        }// end function

        private function initHandler(param1:Object, param2:Object) : void
        {
            if (!inited)
            {
            }
            if (param1)
            {
                inited = true;
                dispatchComplete(true);
            }
            else
            {
                dispatchComplete(false);
            }
            return;
        }// end function

    }
}
