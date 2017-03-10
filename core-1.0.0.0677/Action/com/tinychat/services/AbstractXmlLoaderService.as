package com.tinychat.services
{
    import flash.errors.*;

    public class AbstractXmlLoaderService extends AbstractUrlLoaderService
    {

        public function AbstractXmlLoaderService(param1:String)
        {
            super(param1);
            return;
        }// end function

        protected function parse(param1:XML)
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
                result = this.parse(XML(data));
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
