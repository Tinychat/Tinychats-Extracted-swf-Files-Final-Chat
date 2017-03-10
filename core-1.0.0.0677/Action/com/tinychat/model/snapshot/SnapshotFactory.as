package com.tinychat.model.snapshot
{
    import SnapshotFactory.as$863.*;
    import __AS3__.vec.*;
    import com.tinychat.ui.components.broadcast.containers.*;
    import flash.display.*;
    import flash.geom.*;

    public class SnapshotFactory extends Object
    {
        private var stage:Stage;

        public function SnapshotFactory(param1:Stage)
        {
            this.stage = param1;
            return;
        }// end function

        public function create(param1:Vector.<BroadcastContainer>) : Bitmap
        {
            var _loc_2:BitmapData = null;
            var _loc_4:BroadcastData = null;
            var _loc_5:Rectangle = null;
            var _loc_6:uint = 0;
            var _loc_7:BroadcastContainer = null;
            var _loc_8:Rectangle = null;
            var _loc_9:Point = null;
            var _loc_3:* = new Vector.<BroadcastData>;
            _loc_6 = 0;
            while (_loc_6 < param1.length)
            {
                
                _loc_7 = BroadcastContainer(param1[_loc_6]);
                _loc_4 = new BroadcastData(_loc_7);
                _loc_3.push(_loc_4);
                if (!_loc_5)
                {
                    _loc_5 = _loc_4.globalBounds;
                }
                else
                {
                    _loc_5.left = _loc_5.left > _loc_4.globalLeft ? (_loc_4.globalLeft) : (_loc_5.left);
                    _loc_5.right = _loc_5.right < _loc_4.globalRight ? (_loc_4.globalRight) : (_loc_5.right);
                    _loc_5.top = _loc_5.top > _loc_4.globalTop ? (_loc_4.globalTop) : (_loc_5.top);
                    _loc_5.bottom = _loc_5.bottom < _loc_4.globalBottom ? (_loc_4.globalBottom) : (_loc_5.bottom);
                }
                _loc_6 = _loc_6 + 1;
            }
            _loc_2 = new BitmapData(_loc_5.width, _loc_5.height, true, 0);
            _loc_6 = 0;
            while (_loc_6 < _loc_3.length)
            {
                
                _loc_4 = _loc_3[_loc_6];
                _loc_8 = _loc_4.localBounds;
                _loc_9 = new Point(_loc_4.globalX - _loc_5.x, _loc_4.globalY - _loc_5.y);
                try
                {
                    _loc_2.copyPixels(_loc_4.bitmapData, _loc_8, _loc_9);
                }
                catch (error:Error)
                {
                }
                _loc_6 = _loc_6 + 1;
            }
            return new Bitmap(_loc_2, "auto", true);
        }// end function

    }
}
