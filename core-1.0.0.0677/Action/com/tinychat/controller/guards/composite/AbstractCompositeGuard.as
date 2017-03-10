package com.tinychat.controller.guards.composite
{
    import __AS3__.vec.*;
    import com.tinychat.model.guards.*;
    import org.robotlegs.core.*;

    public class AbstractCompositeGuard extends AbstractLiveGuard
    {
        protected var guards:Vector.<IGuard>;

        public function AbstractCompositeGuard(param1:Vector.<IGuard>)
        {
            this.guards = param1;
            return;
        }// end function

        override protected function enableChangeListening() : void
        {
            this.guards.forEach(function (param1:IGuard, param2:int, param3:Vector.<IGuard>) : void
            {
                if (param1 is LiveGuard)
                {
                    LiveGuard(param1).addChangeListener(changeHandler);
                }
                return;
            }// end function
            );
            return;
        }// end function

        override protected function disableChangeListening() : void
        {
            this.guards.forEach(function (param1:IGuard, param2:int, param3:Vector.<IGuard>) : void
            {
                if (param1 is LiveGuard)
                {
                    LiveGuard(param1).removeChangeListener(changeHandler);
                }
                return;
            }// end function
            );
            return;
        }// end function

        private function changeHandler(param1:Boolean) : void
        {
            triggerChange();
            return;
        }// end function

    }
}
