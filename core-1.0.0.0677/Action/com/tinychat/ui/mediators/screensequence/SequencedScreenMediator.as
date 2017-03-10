package com.tinychat.ui.mediators.screensequence
{
    import com.tinychat.ui.screensequence.*;
    import org.robotlegs.mvcs.*;

    public class SequencedScreenMediator extends Mediator implements ISequencedScreenMediator
    {
        private var _goPrevious:GoPrevious;
        private var _goNext:GoNext;
        private var _complete:GoComplete;
        private var _cancel:GoCancel;
        private var _hasPreviousFunction:Function;
        private var _hasNextFunction:Function;

        public function SequencedScreenMediator()
        {
            return;
        }// end function

        public function set goPrevious(param1:GoPrevious) : void
        {
            this._goPrevious = param1;
            return;
        }// end function

        public function set goNext(param1:GoNext) : void
        {
            this._goNext = param1;
            return;
        }// end function

        public function set complete(param1:GoComplete) : void
        {
            this._complete = param1;
            return;
        }// end function

        public function set cancel(param1:GoCancel) : void
        {
            this._cancel = param1;
            return;
        }// end function

        public function set hasPreviousFunction(param1:Function) : void
        {
            this._hasPreviousFunction = param1;
            return;
        }// end function

        public function set hasNextFunction(param1:Function) : void
        {
            this._hasNextFunction = param1;
            return;
        }// end function

        public function get hasPrevious() : Boolean
        {
            return this._hasPreviousFunction.call();
        }// end function

        public function get hasNext() : Boolean
        {
            return this._hasNextFunction.call();
        }// end function

        protected function dispatchGoPrevious(... args) : void
        {
            this._goPrevious.dispatch.apply(null, args);
            return;
        }// end function

        protected function dispatchGoNext(... args) : void
        {
            this._goNext.dispatch.apply(null, args);
            return;
        }// end function

        protected function dispatchComplete() : void
        {
            this._complete.dispatch();
            return;
        }// end function

        protected function dispatchCanceled() : void
        {
            this._cancel.dispatch();
            return;
        }// end function

    }
}
