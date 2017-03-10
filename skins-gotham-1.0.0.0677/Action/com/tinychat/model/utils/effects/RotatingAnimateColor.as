package com.tinychat.model.utils.effects
{
    import __AS3__.vec.*;
    import flash.events.*;
    import flash.utils.*;
    import mx.states.*;
    import mx.utils.*;
    import spark.effects.*;

    public class RotatingAnimateColor extends Object
    {
        private var targets:Array;
        private var delay:Number;
        private var hueDelta:Number;
        private var states:Array;
        private var effects:Vector.<AnimateColor>;
        private var timer:Timer;

        public function RotatingAnimateColor(param1:Array, param2:Number, param3:Number, param4:Array)
        {
            this.targets = param1;
            this.delay = param2;
            this.hueDelta = param3;
            this.states = param4;
            return;
        }// end function

        public function play() : void
        {
            if (!this.effects)
            {
                this.effects = new Vector.<AnimateColor>;
                this.targets.forEach(function (param1:Object, param2:int, param3:Array) : void
            {
                var _loc_4:* = new AnimateColor(param1);
                _loc_4.duration = 1000;
                _loc_4.colorTo = param1.color;
                effects.push(_loc_4);
                return;
            }// end function
            );
            }
            if (!this.timer)
            {
                this.timer = new Timer(5000);
            }
            this.timer.addEventListener(TimerEvent.TIMER, this.timerHandler);
            this.timer.start();
            return;
        }// end function

        public function stop() : void
        {
            this.timer.removeEventListener(TimerEvent.TIMER, this.timerHandler);
            this.timer.stop();
            return;
        }// end function

        private function timerHandler(event:TimerEvent) : void
        {
            var event:* = event;
            this.effects.forEach(function (param1:AnimateColor, param2:int, param3:Vector.<AnimateColor>) : void
            {
                var _loc_4:* = param1.target;
                param1.colorFrom = _loc_4.color;
                param1.colorTo = increaseHueBy(param1.colorTo, 60);
                param1.play();
                return;
            }// end function
            );
            this.states.forEach(function (param1:State, param2:int, param3:Array) : void
            {
                var state:* = param1;
                var index:* = param2;
                var array:* = param3;
                state.overrides.forEach(function (param1:SetProperty, param2:int, param3:Array) : void
                {
                    if (param1.name == "color")
                    {
                        param1.value = increaseHueBy(param1.value, 60);
                    }
                    return;
                }// end function
                );
                return;
            }// end function
            );
            return;
        }// end function

        private function increaseHueBy(param1:uint, param2:Number) : uint
        {
            var _loc_3:* = HSBColor.convertRGBtoHSB(param1);
            return HSBColor.convertHSBtoRGB(_loc_3.hue + param2, _loc_3.saturation, _loc_3.brightness);
        }// end function

    }
}
