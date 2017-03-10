package com.tinychat.ui.components.social.chat
{
    import com.tinychat.ui.context.social.*;
    import flash.events.*;
    import org.robotlegs.core.*;
    import org.robotlegs.utilities.modular.core.*;
    import spark.components.supportClasses.*;

    public class PublicChatView extends ChatViewBase
    {
        public var helpDescription:TextBase;
        public var topicDisplay:TextBase;
        private var _parentInjector:IInjector;
        private var context:IModuleContext;
        private static var _skinParts:Object = {helpDescription:false, chatInput:true, topicDisplay:false, chatList:true};

        public function PublicChatView()
        {
            return;
        }// end function

        public function set parentInjector(param1:IInjector) : void
        {
            this._parentInjector = param1;
            return;
        }// end function

        override protected function get inputEnabled() : Boolean
        {
            return true;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == chatList)
            {
                addEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
                addEventListener(Event.REMOVED_FROM_STAGE, this.removedFromStageHandler);
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == chatList)
            {
                removeEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
                removeEventListener(Event.REMOVED_FROM_STAGE, this.removedFromStageHandler);
            }
            return;
        }// end function

        protected function addedToStageHandler(event:Event) : void
        {
            this.createContext();
            return;
        }// end function

        protected function removedFromStageHandler(event:Event) : void
        {
            if (this.context)
            {
                this.context.dispose();
            }
            this.context = null;
            return;
        }// end function

        protected function createContext() : void
        {
            if (this._parentInjector)
            {
            }
            if (chatList)
            {
                this.context = new TinychatPrivateChatViewContext(this, this._parentInjector, chatList.userPopupMenu);
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
