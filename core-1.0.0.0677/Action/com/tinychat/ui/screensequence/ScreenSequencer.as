package com.tinychat.ui.screensequence
{
    import ScreenSequencer.as$53.*;
    import __AS3__.vec.*;
    import flash.events.*;
    import flash.utils.*;
    import mx.core.*;
    import org.osflash.signals.*;
    import org.robotlegs.core.*;

    public class ScreenSequencer extends Object
    {
        protected var target:IVisualElementContainer;
        private var injector:IInjector;
        private var screens:Vector.<SequencedScreenClass>;
        private var screenCache:Dictionary;
        private var cursor:int;
        private var goPrevious:GoPrevious;
        private var goNext:GoNext;
        private var goComplete:GoComplete;
        private var goCancel:GoCancel;
        private var isCompleted:Boolean;
        private var guardParameters:Array;
        private var _completed:Signal;
        private var _interrupted:Signal;
        private var _canceled:Signal;

        public function ScreenSequencer(param1:IInjector, param2:IVisualElementContainer)
        {
            var injector:* = param1;
            var target:* = param2;
            this.target = target;
            this.injector = injector;
            this.screens = new Vector.<>;
            this.screenCache = new Dictionary(true);
            this._completed = new Signal();
            this._interrupted = new Signal();
            this._canceled = new Signal();
            this.goPrevious = new GoPrevious();
            this.goNext = new GoNext();
            this.goComplete = new GoComplete();
            this.goCancel = new GoCancel();
            injector.mapValue(GoPrevious, this.goPrevious);
            injector.mapValue(GoNext, this.goNext);
            injector.mapValue(GoComplete, this.goComplete);
            injector.mapValue(GoCancel, this.goCancel);
            injector.mapValue(Function, function () : Boolean
            {
                return hasNext;
            }// end function
            , "hasNext");
            injector.mapValue(Function, function () : Boolean
            {
                return hasPrevious;
            }// end function
            , "hasPrevious");
            this.goComplete.addOnce(this.goCompleteHandler);
            this.goCancel.addOnce(this.goCancelHandler);
            IEventDispatcher(target).addEventListener(Event.REMOVED_FROM_STAGE, this.targetRemovedFromStageHandler);
            return;
        }// end function

        public function get completed() : ISignal
        {
            return this._completed;
        }// end function

        public function get interrupted() : ISignal
        {
            return this._interrupted;
        }// end function

        public function get canceled() : ISignal
        {
            return this._canceled;
        }// end function

        public function get currentIndex() : uint
        {
            return this.cursor;
        }// end function

        public function addScreen(param1:Class, ... args) : void
        {
            this.screens.push(new SequencedScreenClass(this.injector, param1, this.Vector.<Class>(args)));
            return;
        }// end function

        public function start() : void
        {
            if (this.screenIsApprovedAt(0))
            {
                this.moveTo(0);
            }
            else
            {
                this.moveTo(this.nextIndex);
            }
            return;
        }// end function

        public function moveTo(param1:uint) : void
        {
            if (param1 >= this.screens.length)
            {
                throw new RangeError("Screen index " + param1 + " is out of range.");
            }
            this.removeScreenAtCursor();
            this.cursor = param1;
            this.addScreenAtCursor();
            this.guardParameters = [];
            return;
        }// end function

        private function getCachedScreenAtCursor() : IVisualElement
        {
            return this.screenCache[this.screens[this.cursor]];
        }// end function

        private function addScreenAtCursor() : void
        {
            var _loc_1:* = this.getCachedScreenAtCursor();
            if (!_loc_1)
            {
                _loc_1 = this.screens[this.cursor].newInstance();
                this.screenCache[this.screens[this.cursor]] = _loc_1;
            }
            if (this.hasPrevious)
            {
                this.goPrevious.addOnce(this.goPreviousHandler);
            }
            this.goNext.addOnce(this.goNextHandler);
            this.target.addElement(_loc_1);
            return;
        }// end function

        private function removeScreenAtCursor() : void
        {
            var _loc_1:* = this.getCachedScreenAtCursor();
            if (_loc_1)
            {
                this.target.removeElement(_loc_1);
            }
            this.goPrevious.remove(this.goPreviousHandler);
            this.goNext.remove(this.goNextHandler);
            return;
        }// end function

        private function goPreviousHandler(... args) : void
        {
            this.guardParameters = args;
            this.moveTo(this.previousIndex);
            return;
        }// end function

        private function goNextHandler(... args) : void
        {
            this.guardParameters = args;
            if (!this.hasNext)
            {
                this.complete();
            }
            else
            {
                this.moveTo(this.nextIndex);
            }
            return;
        }// end function

        private function goCompleteHandler() : void
        {
            this.complete();
            return;
        }// end function

        private function goCancelHandler() : void
        {
            this._canceled.dispatch();
            this.dispose();
            return;
        }// end function

        private function get hasPrevious() : Boolean
        {
            return this.previousIndex != -1;
        }// end function

        private function get previousIndex() : int
        {
            var _loc_1:* = this.cursor - 1;
            while (_loc_1 >= 0)
            {
                
                if (this.screenIsApprovedAt(_loc_1))
                {
                    return _loc_1;
                }
                _loc_1 = _loc_1 - 1;
            }
            return -1;
        }// end function

        private function get hasNext() : Boolean
        {
            return this.nextIndex != -1;
        }// end function

        private function get nextIndex() : int
        {
            var _loc_1:* = this.cursor + 1;
            while (_loc_1 <= (this.screens.length - 1))
            {
                
                if (this.screenIsApprovedAt(_loc_1))
                {
                    return _loc_1;
                }
                _loc_1 = _loc_1 + 1;
            }
            return -1;
        }// end function

        private function screenIsApprovedAt(param1:uint) : Boolean
        {
            return this.screens[param1].linkTo(this.guardParameters);
        }// end function

        private function complete() : void
        {
            this.isCompleted = true;
            this._completed.dispatch();
            this.dispose();
            return;
        }// end function

        public function dispose() : void
        {
            if (this.target)
            {
                this.injector.unmap(GoPrevious);
                this.injector.unmap(GoNext);
                this.injector.unmap(GoComplete);
                this.injector.unmap(GoCancel);
                this.injector.unmap(Function, "hasNext");
                this.injector.unmap(Function, "hasPrevious");
                this.goPrevious.remove(this.goPreviousHandler);
                this.goNext.remove(this.goNextHandler);
                this.goComplete.remove(this.goCompleteHandler);
                this.goCancel.remove(this.goCancelHandler);
                this._interrupted.removeAll();
                this._completed.removeAll();
                IEventDispatcher(this.target).removeEventListener(Event.REMOVED_FROM_STAGE, this.targetRemovedFromStageHandler);
                this.target = null;
            }
            return;
        }// end function

        private function targetRemovedFromStageHandler(event:Event) : void
        {
            if (!this.isCompleted)
            {
                this._interrupted.dispatch();
            }
            this.dispose();
            return;
        }// end function

    }
}
