package mx.controls.scrollClasses
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.ui.*;
    import flash.utils.*;
    import mx.controls.*;
    import mx.core.*;
    import mx.events.*;
    import mx.styles.*;

    public class ScrollBar extends UIComponent
    {
        var upArrow:Button;
        var downArrow:Button;
        var scrollTrack:Button;
        var scrollThumb:ScrollThumb;
        var _minWidth:Number = 16;
        var _minHeight:Number = 32;
        var isScrolling:Boolean;
        private var trackScrollTimer:Timer;
        private var trackScrollRepeatDirection:int;
        private var trackScrolling:Boolean = false;
        private var trackPosition:Number;
        var oldPosition:Number;
        private var _direction:String = "vertical";
        private var _lineScrollSize:Number = 1;
        private var _maxScrollPosition:Number = 0;
        private var _minScrollPosition:Number = 0;
        private var _pageSize:Number = 0;
        private var _pageScrollSize:Number = 0;
        private var _scrollPosition:Number = 0;
        static const VERSION:String = "4.6.0.23201";
        public static const THICKNESS:Number = 16;

        public function ScrollBar()
        {
            return;
        }// end function

        override public function set doubleClickEnabled(value:Boolean) : void
        {
            return;
        }// end function

        override public function set enabled(value:Boolean) : void
        {
            super.enabled = value;
            invalidateDisplayList();
            return;
        }// end function

        public function get direction() : String
        {
            return this._direction;
        }// end function

        public function set direction(value:String) : void
        {
            this._direction = value;
            invalidateSize();
            invalidateDisplayList();
            dispatchEvent(new Event("directionChanged"));
            return;
        }// end function

        protected function get downArrowStyleFilters() : Object
        {
            return null;
        }// end function

        function get lineMinusDetail() : String
        {
            return this.direction == ScrollBarDirection.VERTICAL ? (ScrollEventDetail.LINE_UP) : (ScrollEventDetail.LINE_LEFT);
        }// end function

        function get linePlusDetail() : String
        {
            return this.direction == ScrollBarDirection.VERTICAL ? (ScrollEventDetail.LINE_DOWN) : (ScrollEventDetail.LINE_RIGHT);
        }// end function

        public function get lineScrollSize() : Number
        {
            return this._lineScrollSize;
        }// end function

        public function set lineScrollSize(value:Number) : void
        {
            this._lineScrollSize = value;
            return;
        }// end function

        private function get maxDetail() : String
        {
            return this.direction == ScrollBarDirection.VERTICAL ? (ScrollEventDetail.AT_BOTTOM) : (ScrollEventDetail.AT_RIGHT);
        }// end function

        public function get maxScrollPosition() : Number
        {
            return this._maxScrollPosition;
        }// end function

        public function set maxScrollPosition(value:Number) : void
        {
            this._maxScrollPosition = value;
            invalidateDisplayList();
            return;
        }// end function

        private function get minDetail() : String
        {
            return this.direction == ScrollBarDirection.VERTICAL ? (ScrollEventDetail.AT_TOP) : (ScrollEventDetail.AT_LEFT);
        }// end function

        public function get minScrollPosition() : Number
        {
            return this._minScrollPosition;
        }// end function

        public function set minScrollPosition(value:Number) : void
        {
            this._minScrollPosition = value;
            invalidateDisplayList();
            return;
        }// end function

        function get pageMinusDetail() : String
        {
            return this.direction == ScrollBarDirection.VERTICAL ? (ScrollEventDetail.PAGE_UP) : (ScrollEventDetail.PAGE_LEFT);
        }// end function

        function get pagePlusDetail() : String
        {
            return this.direction == ScrollBarDirection.VERTICAL ? (ScrollEventDetail.PAGE_DOWN) : (ScrollEventDetail.PAGE_RIGHT);
        }// end function

        public function get pageSize() : Number
        {
            return this._pageSize;
        }// end function

        public function set pageSize(value:Number) : void
        {
            this._pageSize = value;
            return;
        }// end function

        public function get pageScrollSize() : Number
        {
            return this._pageScrollSize;
        }// end function

        public function set pageScrollSize(value:Number) : void
        {
            this._pageScrollSize = value;
            return;
        }// end function

        public function get scrollPosition() : Number
        {
            return this._scrollPosition;
        }// end function

        public function set scrollPosition(value:Number) : void
        {
            var _loc_2:Number = NaN;
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            this._scrollPosition = value;
            if (this.scrollThumb)
            {
                if (!cacheAsBitmap)
                {
                    var _loc_5:Boolean = true;
                    this.scrollThumb.cacheHeuristic = true;
                    cacheHeuristic = _loc_5;
                }
                if (!this.isScrolling)
                {
                    value = Math.min(value, this.maxScrollPosition);
                    value = Math.max(value, this.minScrollPosition);
                    _loc_2 = this.maxScrollPosition - this.minScrollPosition;
                    if (_loc_2 != 0)
                    {
                    }
                    _loc_3 = isNaN(_loc_2) ? (0) : ((value - this.minScrollPosition) * (this.trackHeight - this.scrollThumb.height) / _loc_2 + this.trackY);
                    _loc_4 = (this.virtualWidth - this.scrollThumb.width) / 2 + getStyle("thumbOffset");
                    this.scrollThumb.move(Math.round(_loc_4), Math.round(_loc_3));
                }
            }
            return;
        }// end function

        protected function get thumbStyleFilters() : Object
        {
            return null;
        }// end function

        private function get trackHeight() : Number
        {
            return this.virtualHeight - (this.upArrow.getExplicitOrMeasuredHeight() + this.downArrow.getExplicitOrMeasuredHeight());
        }// end function

        private function get trackY() : Number
        {
            return this.upArrow.getExplicitOrMeasuredHeight();
        }// end function

        protected function get upArrowStyleFilters() : Object
        {
            return null;
        }// end function

        function get virtualHeight() : Number
        {
            return unscaledHeight;
        }// end function

        function get virtualWidth() : Number
        {
            return unscaledWidth;
        }// end function

        override protected function createChildren() : void
        {
            super.createChildren();
            if (!this.scrollTrack)
            {
                this.scrollTrack = new Button();
                this.scrollTrack.focusEnabled = false;
                this.scrollTrack.tabEnabled = false;
                this.scrollTrack.skinName = "trackSkin";
                this.scrollTrack.upSkinName = "trackUpSkin";
                this.scrollTrack.overSkinName = "trackOverSkin";
                this.scrollTrack.downSkinName = "trackDownSkin";
                this.scrollTrack.disabledSkinName = "trackDisabledSkin";
                if (this.scrollTrack is ISimpleStyleClient)
                {
                    ISimpleStyleClient(this.scrollTrack).styleName = this;
                }
                addChild(this.scrollTrack);
                this.scrollTrack.validateProperties();
            }
            if (!this.upArrow)
            {
                this.upArrow = new Button();
                this.upArrow.enabled = false;
                this.upArrow.autoRepeat = true;
                this.upArrow.focusEnabled = false;
                this.upArrow.tabEnabled = false;
                this.upArrow.upSkinName = "upArrowUpSkin";
                this.upArrow.overSkinName = "upArrowOverSkin";
                this.upArrow.downSkinName = "upArrowDownSkin";
                this.upArrow.disabledSkinName = "upArrowDisabledSkin";
                this.upArrow.skinName = "upArrowSkin";
                this.upArrow.upIconName = "";
                this.upArrow.overIconName = "";
                this.upArrow.downIconName = "";
                this.upArrow.disabledIconName = "";
                addChild(this.upArrow);
                this.upArrow.styleName = new StyleProxy(this, this.upArrowStyleFilters);
                this.upArrow.validateProperties();
                this.upArrow.addEventListener(FlexEvent.BUTTON_DOWN, this.upArrow_buttonDownHandler);
            }
            if (!this.downArrow)
            {
                this.downArrow = new Button();
                this.downArrow.enabled = false;
                this.downArrow.autoRepeat = true;
                this.downArrow.focusEnabled = false;
                this.downArrow.tabEnabled = false;
                this.downArrow.upSkinName = "downArrowUpSkin";
                this.downArrow.overSkinName = "downArrowOverSkin";
                this.downArrow.downSkinName = "downArrowDownSkin";
                this.downArrow.disabledSkinName = "downArrowDisabledSkin";
                this.downArrow.skinName = "downArrowSkin";
                this.downArrow.upIconName = "";
                this.downArrow.overIconName = "";
                this.downArrow.downIconName = "";
                this.downArrow.disabledIconName = "";
                addChild(this.downArrow);
                this.downArrow.styleName = new StyleProxy(this, this.downArrowStyleFilters);
                this.downArrow.validateProperties();
                this.downArrow.addEventListener(FlexEvent.BUTTON_DOWN, this.downArrow_buttonDownHandler);
            }
            return;
        }// end function

        override protected function measure() : void
        {
            super.measure();
            this.upArrow.validateSize();
            this.downArrow.validateSize();
            this.scrollTrack.validateSize();
            this._minWidth = this.scrollThumb ? (this.scrollThumb.getExplicitOrMeasuredWidth()) : (0);
            this._minWidth = Math.max(this.scrollTrack.getExplicitOrMeasuredWidth(), this.upArrow.getExplicitOrMeasuredWidth(), this.downArrow.getExplicitOrMeasuredWidth(), this._minWidth);
            this._minHeight = this.upArrow.getExplicitOrMeasuredHeight() + this.downArrow.getExplicitOrMeasuredHeight();
            return;
        }// end function

        override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number) : void
        {
            if ($height == 1)
            {
                return;
            }
            if (!this.upArrow)
            {
                return;
            }
            super.updateDisplayList(unscaledWidth, unscaledHeight);
            if (cacheAsBitmap)
            {
                cacheHeuristic = false;
                if (this.scrollThumb)
                {
                    this.scrollThumb.cacheHeuristic = false;
                }
            }
            this.upArrow.setActualSize(this.upArrow.getExplicitOrMeasuredWidth(), this.upArrow.getExplicitOrMeasuredHeight());
            this.upArrow.move((this.virtualWidth - this.upArrow.width) / 2, 0);
            this.scrollTrack.setActualSize(this.scrollTrack.getExplicitOrMeasuredWidth(), this.virtualHeight);
            this.scrollTrack.x = (this.virtualWidth - this.scrollTrack.width) / 2;
            this.scrollTrack.y = 0;
            this.downArrow.setActualSize(this.downArrow.getExplicitOrMeasuredWidth(), this.downArrow.getExplicitOrMeasuredHeight());
            this.downArrow.move((this.virtualWidth - this.downArrow.width) / 2, this.virtualHeight - this.downArrow.getExplicitOrMeasuredHeight());
            this.setScrollProperties(this.pageSize, this.minScrollPosition, this.maxScrollPosition, this._pageScrollSize);
            this.scrollPosition = this._scrollPosition;
            return;
        }// end function

        public function setScrollProperties(pageSize:Number, minScrollPosition:Number, maxScrollPosition:Number, pageScrollSize:Number = 0) : void
        {
            var _loc_5:Number = NaN;
            this.pageSize = pageSize;
            this._pageScrollSize = pageScrollSize > 0 ? (pageScrollSize) : (pageSize);
            this.minScrollPosition = Math.max(minScrollPosition, 0);
            this.maxScrollPosition = Math.max(maxScrollPosition, 0);
            this._scrollPosition = Math.max(this.minScrollPosition, this._scrollPosition);
            this._scrollPosition = Math.min(this.maxScrollPosition, this._scrollPosition);
            if (this.maxScrollPosition - this.minScrollPosition > 0)
            {
            }
            if (enabled)
            {
                this.upArrow.enabled = true;
                this.downArrow.enabled = true;
                this.scrollTrack.enabled = true;
                addEventListener(MouseEvent.MOUSE_DOWN, this.scrollTrack_mouseDownHandler);
                addEventListener(MouseEvent.MOUSE_OVER, this.scrollTrack_mouseOverHandler);
                addEventListener(MouseEvent.MOUSE_OUT, this.scrollTrack_mouseOutHandler);
                if (!this.scrollThumb)
                {
                    this.scrollThumb = new ScrollThumb();
                    this.scrollThumb.focusEnabled = false;
                    this.scrollThumb.tabEnabled = false;
                    addChildAt(this.scrollThumb, getChildIndex(this.downArrow));
                    this.scrollThumb.styleName = new StyleProxy(this, this.thumbStyleFilters);
                    this.scrollThumb.upSkinName = "thumbUpSkin";
                    this.scrollThumb.overSkinName = "thumbOverSkin";
                    this.scrollThumb.downSkinName = "thumbDownSkin";
                    this.scrollThumb.iconName = "thumbIcon";
                    this.scrollThumb.skinName = "thumbSkin";
                }
                _loc_5 = this.trackHeight < 0 ? (0) : (Math.round(pageSize / (this.maxScrollPosition - this.minScrollPosition + pageSize) * this.trackHeight));
                if (_loc_5 < this.scrollThumb.minHeight)
                {
                    if (this.trackHeight < this.scrollThumb.minHeight)
                    {
                        this.scrollThumb.visible = false;
                    }
                    else
                    {
                        _loc_5 = this.scrollThumb.minHeight;
                        this.scrollThumb.visible = true;
                        this.scrollThumb.setActualSize(this.scrollThumb.measuredWidth, this.scrollThumb.minHeight);
                    }
                }
                else
                {
                    this.scrollThumb.visible = true;
                    this.scrollThumb.setActualSize(this.scrollThumb.measuredWidth, _loc_5);
                }
                this.scrollThumb.setRange(this.upArrow.getExplicitOrMeasuredHeight() + 0, this.virtualHeight - this.downArrow.getExplicitOrMeasuredHeight() - this.scrollThumb.height, this.minScrollPosition, this.maxScrollPosition);
                this.scrollPosition = Math.max(Math.min(this.scrollPosition, this.maxScrollPosition), this.minScrollPosition);
            }
            else
            {
                this.upArrow.enabled = false;
                this.downArrow.enabled = false;
                this.scrollTrack.enabled = false;
                if (this.scrollThumb)
                {
                    this.scrollThumb.visible = false;
                }
            }
            return;
        }// end function

        function lineScroll(direction:int) : void
        {
            var _loc_4:Number = NaN;
            var _loc_5:String = null;
            var _loc_2:* = this._lineScrollSize;
            var _loc_3:* = this._scrollPosition + direction * _loc_2;
            if (_loc_3 > this.maxScrollPosition)
            {
                _loc_3 = this.maxScrollPosition;
            }
            else if (_loc_3 < this.minScrollPosition)
            {
                _loc_3 = this.minScrollPosition;
            }
            if (_loc_3 != this.scrollPosition)
            {
                _loc_4 = this.scrollPosition;
                this.scrollPosition = _loc_3;
                _loc_5 = direction < 0 ? (this.lineMinusDetail) : (this.linePlusDetail);
                this.dispatchScrollEvent(_loc_4, _loc_5);
            }
            return;
        }// end function

        function pageScroll(direction:int) : void
        {
            var _loc_4:Number = NaN;
            var _loc_5:String = null;
            var _loc_2:* = this._pageScrollSize != 0 ? (this._pageScrollSize) : (this.pageSize);
            var _loc_3:* = this._scrollPosition + direction * _loc_2;
            if (_loc_3 > this.maxScrollPosition)
            {
                _loc_3 = this.maxScrollPosition;
            }
            else if (_loc_3 < this.minScrollPosition)
            {
                _loc_3 = this.minScrollPosition;
            }
            if (_loc_3 != this.scrollPosition)
            {
                _loc_4 = this.scrollPosition;
                this.scrollPosition = _loc_3;
                _loc_5 = direction < 0 ? (this.pageMinusDetail) : (this.pagePlusDetail);
                this.dispatchScrollEvent(_loc_4, _loc_5);
            }
            return;
        }// end function

        function dispatchScrollEvent(oldPosition:Number, detail:String) : void
        {
            var _loc_3:* = new ScrollEvent(ScrollEvent.SCROLL);
            _loc_3.detail = detail;
            _loc_3.position = this.scrollPosition;
            _loc_3.delta = this.scrollPosition - oldPosition;
            _loc_3.direction = this.direction;
            dispatchEvent(_loc_3);
            return;
        }// end function

        function isScrollBarKey(key:uint) : Boolean
        {
            var _loc_2:Number = NaN;
            if (key == Keyboard.HOME)
            {
                if (this.scrollPosition != 0)
                {
                    _loc_2 = this.scrollPosition;
                    this.scrollPosition = 0;
                    this.dispatchScrollEvent(_loc_2, this.minDetail);
                }
                return true;
            }
            else if (key == Keyboard.END)
            {
                if (this.scrollPosition < this.maxScrollPosition)
                {
                    _loc_2 = this.scrollPosition;
                    this.scrollPosition = this.maxScrollPosition;
                    this.dispatchScrollEvent(_loc_2, this.maxDetail);
                }
                return true;
            }
            return false;
        }// end function

        private function upArrow_buttonDownHandler(event:FlexEvent) : void
        {
            if (isNaN(this.oldPosition))
            {
                this.oldPosition = this.scrollPosition;
            }
            this.lineScroll(-1);
            return;
        }// end function

        private function downArrow_buttonDownHandler(event:FlexEvent) : void
        {
            if (isNaN(this.oldPosition))
            {
                this.oldPosition = this.scrollPosition;
            }
            this.lineScroll(1);
            return;
        }// end function

        private function scrollTrack_mouseOverHandler(event:MouseEvent) : void
        {
            if (event.target != this)
            {
            }
            if (event.target == this.scrollTrack)
            {
            }
            if (!enabled)
            {
                return;
            }
            if (this.trackScrolling)
            {
                this.trackScrollTimer.start();
            }
            return;
        }// end function

        private function scrollTrack_mouseOutHandler(event:MouseEvent) : void
        {
            if (this.trackScrolling)
            {
            }
            if (enabled)
            {
                this.trackScrollTimer.stop();
            }
            return;
        }// end function

        private function scrollTrack_mouseDownHandler(event:MouseEvent) : void
        {
            if (event.target != this)
            {
            }
            if (event.target == this.scrollTrack)
            {
            }
            if (!enabled)
            {
                return;
            }
            this.trackScrolling = true;
            var _loc_2:* = systemManager.getSandboxRoot();
            _loc_2.addEventListener(MouseEvent.MOUSE_UP, this.scrollTrack_mouseUpHandler, true);
            _loc_2.addEventListener(MouseEvent.MOUSE_MOVE, this.scrollTrack_mouseMoveHandler, true);
            _loc_2.addEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, this.scrollTrack_mouseLeaveHandler);
            systemManager.deployMouseShields(true);
            var _loc_3:* = new Point(event.localX, event.localY);
            _loc_3 = event.target.localToGlobal(_loc_3);
            _loc_3 = globalToLocal(_loc_3);
            this.trackPosition = _loc_3.y;
            if (isNaN(this.oldPosition))
            {
                this.oldPosition = this.scrollPosition;
            }
            this.trackScrollRepeatDirection = this.scrollThumb.y + this.scrollThumb.height < _loc_3.y ? (1) : (this.scrollThumb.y > _loc_3.y ? (-1) : (0));
            this.pageScroll(this.trackScrollRepeatDirection);
            if (!this.trackScrollTimer)
            {
                this.trackScrollTimer = new Timer(getStyle("repeatDelay"), 1);
                this.trackScrollTimer.addEventListener(TimerEvent.TIMER, this.trackScrollTimerHandler);
            }
            else
            {
                this.trackScrollTimer.delay = getStyle("repeatDelay");
                this.trackScrollTimer.repeatCount = 1;
            }
            this.trackScrollTimer.start();
            return;
        }// end function

        private function trackScrollTimerHandler(event:Event) : void
        {
            if (this.trackScrollRepeatDirection == 1)
            {
                if (this.scrollThumb.y + this.scrollThumb.height > this.trackPosition)
                {
                    return;
                }
            }
            if (this.trackScrollRepeatDirection == -1)
            {
                if (this.scrollThumb.y < this.trackPosition)
                {
                    return;
                }
            }
            this.pageScroll(this.trackScrollRepeatDirection);
            if (this.trackScrollTimer)
            {
            }
            if (this.trackScrollTimer.repeatCount == 1)
            {
                this.trackScrollTimer.delay = getStyle("repeatInterval");
                this.trackScrollTimer.repeatCount = 0;
            }
            return;
        }// end function

        private function scrollTrack_mouseUpHandler(event:MouseEvent) : void
        {
            this.scrollTrack_mouseLeaveHandler(event);
            return;
        }// end function

        private function scrollTrack_mouseLeaveHandler(event:Event) : void
        {
            this.trackScrolling = false;
            var _loc_2:* = systemManager.getSandboxRoot();
            _loc_2.removeEventListener(MouseEvent.MOUSE_UP, this.scrollTrack_mouseUpHandler, true);
            _loc_2.removeEventListener(MouseEvent.MOUSE_MOVE, this.scrollTrack_mouseMoveHandler, true);
            _loc_2.removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE, this.scrollTrack_mouseLeaveHandler);
            systemManager.deployMouseShields(false);
            if (this.trackScrollTimer)
            {
                this.trackScrollTimer.reset();
            }
            if (event.target != this.scrollTrack)
            {
                return;
            }
            var _loc_3:* = this.oldPosition > this.scrollPosition ? (this.pageMinusDetail) : (this.pagePlusDetail);
            this.dispatchScrollEvent(this.oldPosition, _loc_3);
            this.oldPosition = NaN;
            return;
        }// end function

        private function scrollTrack_mouseMoveHandler(event:MouseEvent) : void
        {
            var _loc_2:Point = null;
            if (this.trackScrolling)
            {
                _loc_2 = new Point(event.stageX, event.stageY);
                _loc_2 = globalToLocal(_loc_2);
                this.trackPosition = _loc_2.y;
            }
            return;
        }// end function

    }
}
