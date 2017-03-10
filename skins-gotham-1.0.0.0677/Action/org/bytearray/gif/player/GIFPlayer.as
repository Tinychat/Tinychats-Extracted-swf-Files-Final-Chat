package org.bytearray.gif.player
{
    import flash.display.*;
    import flash.errors.*;
    import flash.events.*;
    import flash.net.*;
    import flash.utils.*;
    import org.bytearray.gif.decoder.*;
    import org.bytearray.gif.errors.*;
    import org.bytearray.gif.events.*;
    import org.bytearray.gif.frames.*;

    public class GIFPlayer extends Bitmap
    {
        private var urlLoader:URLLoader;
        private var gifDecoder:GIFDecoder;
        private var aFrames:Array;
        private var myTimer:Timer;
        private var iInc:int;
        private var iIndex:int;
        private var auto:Boolean;
        private var arrayLng:uint;

        public function GIFPlayer(pAutoPlay:Boolean = true)
        {
            this.auto = pAutoPlay;
            var _loc_2:int = 0;
            this.iInc = 0;
            this.iIndex = _loc_2;
            this.myTimer = new Timer(0, 0);
            this.aFrames = new Array();
            this.urlLoader = new URLLoader();
            this.urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
            this.urlLoader.addEventListener(Event.COMPLETE, this.onComplete);
            this.urlLoader.addEventListener(IOErrorEvent.IO_ERROR, this.onIOError);
            this.myTimer.addEventListener(TimerEvent.TIMER, this.update);
            this.gifDecoder = new GIFDecoder();
            return;
        }// end function

        private function onIOError(event:IOErrorEvent) : void
        {
            dispatchEvent(event);
            return;
        }// end function

        private function onComplete(event:Event) : void
        {
            this.readStream(event.target.data);
            return;
        }// end function

        private function readStream(pBytes:ByteArray) : void
        {
            var lng:int;
            var i:int;
            var pBytes:* = pBytes;
            var gifStream:* = pBytes;
            this.aFrames = new Array();
            this.iInc = 0;
            try
            {
                this.gifDecoder.read(gifStream);
                lng = this.gifDecoder.getFrameCount();
                i;
                while (i < lng)
                {
                    
                    this.aFrames[int(i)] = this.gifDecoder.getFrame(i);
                    i = (i + 1);
                }
                this.arrayLng = this.aFrames.length;
                if (this.auto)
                {
                    this.play();
                }
                else
                {
                    this.gotoAndStop(1);
                }
                dispatchEvent(new GIFPlayerEvent(GIFPlayerEvent.COMPLETE, this.aFrames[0].bitmapData.rect));
            }
            catch (e:ScriptTimeoutError)
            {
                dispatchEvent(new TimeoutEvent(TimeoutEvent.TIME_OUT));
                ;
            }
            catch (e:FileTypeError)
            {
                dispatchEvent(new FileTypeEvent(FileTypeEvent.INVALID));
                ;
            }
            catch (e:Error)
            {
                throw new Error("An unknown error occured, make sure the GIF file contains at least one frame\nNumber of frames : " + aFrames.length);
            }
            return;
        }// end function

        private function update(event:TimerEvent) : void
        {
            var _loc_3:String = this;
            _loc_3.iInc = this.iInc + 1;
            var _loc_3:* = this.iInc++ % this.arrayLng;
            this.iIndex = this.iInc++ % this.arrayLng;
            var _loc_2:* = this.aFrames[int(_loc_3)].delay;
            event.target.delay = _loc_2 > 0 ? (_loc_2) : (100);
            switch(this.gifDecoder.disposeValue)
            {
                case 1:
                {
                    if (!this.iIndex)
                    {
                        bitmapData = this.aFrames[0].bitmapData.clone();
                    }
                    bitmapData.draw(this.aFrames[this.iIndex].bitmapData);
                    break;
                }
                case 2:
                {
                    bitmapData = this.aFrames[this.iIndex].bitmapData;
                    break;
                }
                default:
                {
                    break;
                }
            }
            dispatchEvent(new FrameEvent(FrameEvent.FRAME_RENDERED, this.aFrames[this.iIndex]));
            return;
        }// end function

        private function concat(pIndex:int) : int
        {
            bitmapData.lock();
            var _loc_2:int = 0;
            while (_loc_2 < pIndex)
            {
                
                bitmapData.draw(this.aFrames[_loc_2].bitmapData);
                _loc_2 = _loc_2 + 1;
            }
            bitmapData.unlock();
            return _loc_2;
        }// end function

        public function load(pRequest:URLRequest) : void
        {
            this.stop();
            this.urlLoader.load(pRequest);
            return;
        }// end function

        public function loadBytes(pBytes:ByteArray) : void
        {
            this.readStream(pBytes);
            return;
        }// end function

        public function play() : void
        {
            if (this.aFrames.length > 0)
            {
                if (!this.myTimer.running)
                {
                    this.myTimer.start();
                }
            }
            else
            {
                throw new Error("Nothing to play");
            }
            return;
        }// end function

        public function stop() : void
        {
            if (this.myTimer.running)
            {
                this.myTimer.stop();
            }
            return;
        }// end function

        public function get currentFrame() : int
        {
            return (this.iIndex + 1);
        }// end function

        public function get totalFrames() : int
        {
            return this.aFrames.length;
        }// end function

        public function get loopCount() : int
        {
            return this.gifDecoder.getLoopCount();
        }// end function

        public function get autoPlay() : Boolean
        {
            return this.auto;
        }// end function

        public function get frames() : Array
        {
            return this.aFrames;
        }// end function

        public function gotoAndStop(pFrame:int) : void
        {
            if (pFrame >= 1)
            {
            }
            if (pFrame <= this.aFrames.length)
            {
                if (pFrame == this.currentFrame)
                {
                    return;
                }
                var _loc_2:* = int((int(pFrame) - 1));
                this.iInc = int((int(pFrame) - 1));
                this.iIndex = _loc_2;
                switch(this.gifDecoder.disposeValue)
                {
                    case 1:
                    {
                        bitmapData = this.aFrames[0].bitmapData.clone();
                        bitmapData.draw(this.aFrames[this.concat(this.iInc)].bitmapData);
                        break;
                    }
                    case 2:
                    {
                        bitmapData = this.aFrames[this.iInc].bitmapData;
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }
                if (this.myTimer.running)
                {
                    this.myTimer.stop();
                }
            }
            else
            {
                throw new RangeError("Frame out of range, please specify a frame between 1 and " + this.aFrames.length);
            }
            return;
        }// end function

        public function gotoAndPlay(pFrame:int) : void
        {
            if (pFrame >= 1)
            {
            }
            if (pFrame <= this.aFrames.length)
            {
                if (pFrame == this.currentFrame)
                {
                    return;
                }
                var _loc_2:* = int((int(pFrame) - 1));
                this.iInc = int((int(pFrame) - 1));
                this.iIndex = _loc_2;
                switch(this.gifDecoder.disposeValue)
                {
                    case 1:
                    {
                        bitmapData = this.aFrames[0].bitmapData.clone();
                        bitmapData.draw(this.aFrames[this.concat(this.iInc)].bitmapData);
                        break;
                    }
                    case 2:
                    {
                        bitmapData = this.aFrames[this.iInc].bitmapData;
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }
                if (!this.myTimer.running)
                {
                    this.myTimer.start();
                }
            }
            else
            {
                throw new RangeError("Frame out of range, please specify a frame between 1 and " + this.aFrames.length);
            }
            return;
        }// end function

        public function getFrame(pFrame:int) : GIFFrame
        {
            var _loc_2:GIFFrame = null;
            if (pFrame >= 1)
            {
            }
            if (pFrame <= this.aFrames.length)
            {
                _loc_2 = this.aFrames[(pFrame - 1)];
            }
            else
            {
                throw new RangeError("Frame out of range, please specify a frame between 1 and " + this.aFrames.length);
            }
            return _loc_2;
        }// end function

        public function getDelay(pFrame:int) : int
        {
            var _loc_2:int = 0;
            if (pFrame >= 1)
            {
            }
            if (pFrame <= this.aFrames.length)
            {
                _loc_2 = this.aFrames[(pFrame - 1)].delay;
            }
            else
            {
                throw new RangeError("Frame out of range, please specify a frame between 1 and " + this.aFrames.length);
            }
            return _loc_2;
        }// end function

        public function dispose() : void
        {
            this.stop();
            var _loc_1:* = this.aFrames.length;
            var _loc_2:int = 0;
            while (_loc_2 < _loc_1)
            {
                
                this.aFrames[int(_loc_2)].bitmapData.dispose();
                _loc_2 = _loc_2 + 1;
            }
            return;
        }// end function

    }
}
