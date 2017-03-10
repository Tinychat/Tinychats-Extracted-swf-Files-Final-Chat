package com.tinychat.controller.commands.social.network.facebook
{
    import com.tinychat.model.javascript.*;
    import org.robotlegs.utilities.macrobot.*;

    public class LoadFacebookLibraryCommand extends AsyncCommand
    {
        public var javascript:ApplicationJavascript;
        private static var initialized:Boolean;

        public function LoadFacebookLibraryCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            if (!initialized)
            {
                this.javascript.facebookLibraryLoaded.addOnce(this.facebookLibraryLoaded);
                this.javascript.loadFacebookLibrary();
            }
            else
            {
                dispatchComplete(true);
            }
            return;
        }// end function

        private function facebookLibraryLoaded(param1:Boolean) : void
        {
            if (param1)
            {
                initialized = true;
            }
            dispatchComplete(param1);
            return;
        }// end function

    }
}
