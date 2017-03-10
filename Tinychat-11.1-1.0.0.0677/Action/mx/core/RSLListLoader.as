package mx.core
{
    import flash.events.*;

    public class RSLListLoader extends Object
    {
        private var currentIndex:int = 0;
        private var rslList:Array;
        private var chainedProgressHandler:Function;
        private var chainedCompleteHandler:Function;
        private var chainedIOErrorHandler:Function;
        private var chainedSecurityErrorHandler:Function;
        private var chainedRSLErrorHandler:Function;
        static const VERSION:String = "4.6.0.23201";

        public function RSLListLoader(param1:Array)
        {
            this.rslList = [];
            this.rslList = param1;
            return;
        }// end function

        public function load(param1:Function, param2:Function, param3:Function, param4:Function, param5:Function) : void
        {
            this.chainedProgressHandler = param1;
            this.chainedCompleteHandler = param2;
            this.chainedIOErrorHandler = param3;
            this.chainedSecurityErrorHandler = param4;
            this.chainedRSLErrorHandler = param5;
            this.currentIndex = -1;
            this.loadNext();
            return;
        }// end function

        private function loadNext() : void
        {
            if (!this.isDone())
            {
                var _loc_1:String = this;
                var _loc_2:* = this.currentIndex + 1;
                _loc_1.currentIndex = _loc_2;
                if (this.currentIndex < this.rslList.length)
                {
                    this.rslList[this.currentIndex].load(this.chainedProgressHandler, this.listCompleteHandler, this.listIOErrorHandler, this.listSecurityErrorHandler, this.chainedRSLErrorHandler);
                }
            }
            return;
        }// end function

        public function getItem(param1:int) : RSLItem
        {
            if (param1 < 0 || param1 >= this.rslList.length)
            {
                return null;
            }
            return this.rslList[param1];
        }// end function

        public function getIndex() : int
        {
            return this.currentIndex;
        }// end function

        public function getItemCount() : int
        {
            return this.rslList.length;
        }// end function

        public function isDone() : Boolean
        {
            return this.currentIndex >= this.rslList.length;
        }// end function

        private function listCompleteHandler(event:Event) : void
        {
            if (this.chainedCompleteHandler != null)
            {
                this.chainedCompleteHandler(event);
            }
            this.loadNext();
            return;
        }// end function

        private function listIOErrorHandler(event:Event) : void
        {
            if (this.chainedIOErrorHandler != null)
            {
                this.chainedIOErrorHandler(event);
            }
            return;
        }// end function

        private function listSecurityErrorHandler(event:Event) : void
        {
            if (this.chainedSecurityErrorHandler != null)
            {
                this.chainedSecurityErrorHandler(event);
            }
            return;
        }// end function

    }
}
