package com.tinychat.ui.components.broadcast.containers
{
    import com.tinychat.model.api.*;
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.components.video.controls.*;
    import com.tinychat.ui.context.broadcast.containers.*;
    import flash.events.*;
    import org.robotlegs.core.*;
    import org.robotlegs.utilities.modular.core.*;
    import spark.components.*;

    public class AbstractBroadcastContainer extends SkinnableContainer implements Disposable, IModule, BroadcastContainer
    {
        public var nameDisplay:NameDisplay;
        public var videoControlsOverlay:VideoControlsOverlay;
        protected var context:IModuleContext;
        protected var injector:IInjector;
        protected var mouseIsOver:Boolean;
        protected var _broadcast:Broadcast;
        private var nameChanged:Boolean;
        static const STATE_NORMAL:String = "normal";
        static const STATE_OVER:String = "over";
        private static var _skinParts:Object = {nameDisplay:false, videoControlsOverlay:false, contentGroup:false};

        public function AbstractBroadcastContainer(param1:Broadcast)
        {
            this.broadcast = param1;
            addEventListener(MouseEvent.ROLL_OVER, this.rollOverHandler);
            addEventListener(MouseEvent.ROLL_OUT, this.rollOutHandler);
            return;
        }// end function

        override public function get id() : String
        {
            return this._broadcast ? (this._broadcast.id) : ("");
        }// end function

        override public function get name() : String
        {
            return this._broadcast ? (this._broadcast.name) : ("");
        }// end function

        public function set parentInjector(param1:IInjector) : void
        {
            this.injector = param1;
            this.createContext();
            return;
        }// end function

        public function dispose() : void
        {
            if (this.context)
            {
                this.context.dispose();
            }
            this.injector = null;
            this.context = null;
            this.broadcast = null;
            return;
        }// end function

        protected function get broadcast() : Broadcast
        {
            return this._broadcast;
        }// end function

        protected function set broadcast(param1:Broadcast) : void
        {
            if (this._broadcast != param1)
            {
                this._broadcast = param1;
                this.nameChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        protected function createContext() : void
        {
            this.context = new BroadcastContainerContext(this, this.injector, this.broadcast);
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.nameChanged)
            {
            }
            if (this.nameDisplay)
            {
                this.nameDisplay.user = this._broadcast;
                this.nameChanged = false;
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.videoControlsOverlay)
            {
                this.videoControlsOverlay.broadcast = this.broadcast;
                this.videoControlsOverlay.menuOpenChanged.add(this.menuOpenChangedHandler);
            }
            else if (param2 == this.nameDisplay)
            {
                this.nameDisplay.user = this.broadcast;
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == this.videoControlsOverlay)
            {
                this.videoControlsOverlay.broadcast = null;
                this.videoControlsOverlay.menuOpenChanged.remove(this.menuOpenChangedHandler);
            }
            else if (param2 == this.nameDisplay)
            {
                this.nameDisplay.user = null;
            }
            return;
        }// end function

        override protected function getCurrentSkinState() : String
        {
            if (this.isOverState)
            {
                return STATE_OVER;
            }
            return STATE_NORMAL;
        }// end function

        protected function get isOverState() : Boolean
        {
            if (!this.mouseIsOver)
            {
            }
            return this.menuIsOpen;
        }// end function

        protected function get menuIsOpen() : Boolean
        {
            if (this.videoControlsOverlay)
            {
            }
            return this.videoControlsOverlay.menuOpen;
        }// end function

        protected function rollOverHandler(event:MouseEvent) : void
        {
            if (!this.mouseIsOver)
            {
                this.mouseIsOver = true;
                invalidateSkinState();
            }
            return;
        }// end function

        protected function rollOutHandler(event:MouseEvent) : void
        {
            if (this.mouseIsOver)
            {
                this.mouseIsOver = false;
                invalidateSkinState();
            }
            return;
        }// end function

        private function menuOpenChangedHandler(param1:Boolean) : void
        {
            invalidateSkinState();
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
