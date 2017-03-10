package com.tinychat.services
{
    import by.blooddy.crypto.serialization.*;
    import flash.errors.*;

    public class AbstractJsonLoaderService extends AbstractUrlLoaderService
    {

        public function AbstractJsonLoaderService(param1:String)
        {
            super(param1);
            return;
        }// end function

        protected function parse(param1:Object)
        {
            throw new IllegalOperationError("Must be overridden in sub-class.");
        }// end function

        protected function finish(param1) : void
        {
            throw new IllegalOperationError("Must be overridden in sub-class.");
        }// end function

        override protected function successHandler(param1:Object) : void
        {
            var result:*;
            var data:* = param1;
            try
            {
                result = JSON.decode(data as String);
                result = this.parse(result as Object);
            }
            catch (error:Error)
            {
                failureHandler(error.message);
                return;
            }
            this.finish(result);
            return;
        }// end function

    }
}
