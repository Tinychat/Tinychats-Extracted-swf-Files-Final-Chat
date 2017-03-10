package 
{
    import mx.core.*;
    import mx.skins.halo.*;
    import mx.skins.spark.*;
    import mx.styles.*;
    import mx.utils.*;
    import spark.components.supportClasses.*;
    import spark.skins.spark.*;

    public class _Tinychat_Styles extends Object
    {
        private static var _embed_css_Assets_swf_1381150305_mx_skins_cursor_DragReject_411207781:Class = _class_embed_css_Assets_swf_1381150305_mx_skins_cursor_DragReject_411207781;
        private static var _embed_css_Assets_swf_1381150305_mx_skins_cursor_DragMove_1076332333:Class = _class_embed_css_Assets_swf_1381150305_mx_skins_cursor_DragMove_1076332333;
        private static var _embed_css_Assets_swf_1381150305_mx_skins_cursor_BusyCursor_757865319:Class = _class_embed_css_Assets_swf_1381150305_mx_skins_cursor_BusyCursor_757865319;
        private static var _embed_css_Assets_swf_1381150305_mx_skins_cursor_DragLink_1076306758:Class = _class_embed_css_Assets_swf_1381150305_mx_skins_cursor_DragLink_1076306758;
        private static var _embed_css_Assets_swf_1381150305_mx_skins_cursor_DragCopy_1076044753:Class = _class_embed_css_Assets_swf_1381150305_mx_skins_cursor_DragCopy_1076044753;
        private static var _embed_css_Assets_swf_1381150305___brokenImage_388196271:Class = _class_embed_css_Assets_swf_1381150305___brokenImage_388196271;

        public function _Tinychat_Styles()
        {
            return;
        }// end function

        public static function init(param1:IFlexModuleFactory) : void
        {
            var style:CSSStyleDeclaration;
            var effects:Array;
            var mergedStyle:CSSStyleDeclaration;
            var fbs:* = param1;
            var styleManager:* = fbs.getImplementation("mx.styles::IStyleManager2") as IStyleManager2;
            var conditions:Array;
            var condition:CSSCondition;
            var selector:CSSSelector;
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("mx.controls.Button", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.Button");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.horizontalGap = 2;
                this.textAlign = "center";
                this.paddingRight = 6;
                this.skin = ButtonSkin;
                this.labelVerticalOffset = 1;
                this.verticalGap = 2;
                this.paddingLeft = 6;
                this.emphasizedSkin = DefaultButtonSkin;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("mx.controls.ColorPicker", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.ColorPicker");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.skin = ColorPickerSkin;
                this.swatchBorderSize = 0;
                this.fontSize = 11;
                this.verticalGap = 0;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("mx.controls.ComboBase", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.ComboBase");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.borderSkin = BorderSkin;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("mx.core.Container", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("mx.core.Container");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.borderSkin = ContainerBorderSkin;
                this.borderStyle = "none";
                this.cornerRadius = 0;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "dateFieldPopup");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration(".dateFieldPopup");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.borderThickness = 1;
                this.backgroundColor = 16777215;
                this.dropShadowVisible = true;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "errorTip");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration(".errorTip");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.borderColor = 13510953;
                this.paddingBottom = 4;
                this.color = 16777215;
                this.paddingRight = 4;
                this.fontSize = 10;
                this.paddingTop = 4;
                this.borderStyle = "errorTipRight";
                this.shadowColor = 0;
                this.paddingLeft = 4;
                this.fontWeight = "bold";
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "headerDragProxyStyle");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration(".headerDragProxyStyle");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.fontWeight = "bold";
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "swatchPanelTextField");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration(".swatchPanelTextField");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.highlightColor = 12897484;
                this.backgroundColor = 16777215;
                this.borderColor = 14015965;
                this.borderCapColor = 9542041;
                this.buttonColor = 7305079;
                this.shadowCapColor = 14015965;
                this.paddingRight = 5;
                this.borderStyle = "inset";
                this.paddingLeft = 5;
                this.shadowColor = 14015965;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "todayStyle");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration(".todayStyle");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.color = 0;
                this.textAlign = "center";
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "weekDayStyle");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration(".weekDayStyle");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.textAlign = "center";
                this.fontWeight = "bold";
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "windowStatus");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration(".windowStatus");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.color = 6710886;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "windowStyles");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration(".windowStyles");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.fontWeight = "bold";
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("global", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("global");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.paragraphStartIndent = 0;
                this.shadowDistance = 2;
                this.breakOpportunity = "auto";
                this.kerning = "default";
                this.selectionDuration = 250;
                this.leading = 2;
                this.paddingRight = 0;
                this.rollOverOpenDelay = 200;
                this.liveDragging = true;
                this.slideDuration = 300;
                this.iconPlacement = "left";
                this.textFieldClass = UITextField;
                this.layoutDirection = "ltr";
                this.borderStyle = "inset";
                this.ligatureLevel = "common";
                this.repeatDelay = 500;
                this.dropShadowColor = 0;
                this.shadowColor = 15658734;
                this.verticalAlign = "top";
                this.interactionMode = "mouse";
                this.dominantBaseline = "auto";
                this.focusAlpha = 0.55;
                this.fontSharpness = 0;
                this.justificationStyle = "auto";
                this.whiteSpaceCollapse = "collapse";
                this.textDecoration = "none";
                this.fontStyle = "normal";
                this.shadowDirection = "center";
                this.version = "4.0.0";
                this.horizontalScrollPolicy = "auto";
                this.digitWidth = "default";
                this.indicatorGap = 14;
                this.lineBreak = "toFit";
                this.borderCapColor = 9542041;
                this.focusColor = 7385838;
                this.themeColor = 7385838;
                this.fontSize = 12;
                this.textAlignLast = "start";
                this.paddingLeft = 0;
                this.selectionDisabledColor = 14540253;
                this.trackingRight = 0;
                this.smoothScrolling = true;
                this.showErrorSkin = true;
                this.useRollOver = true;
                this.unfocusedTextSelectionColor = 15263976;
                this.backgroundAlpha = 1;
                this.baselineShift = 0;
                this.textAlpha = 1;
                this.verticalGap = 6;
                this.closeDuration = 50;
                this.disabledAlpha = 0.5;
                this.fillColor = 16777215;
                this.roundedBottomCorners = true;
                this.highlightAlphas = [0.3, 0];
                this.horizontalAlign = "left";
                this.verticalGridLines = true;
                this.textRotation = "auto";
                this.dropShadowVisible = false;
                this.backgroundSize = "auto";
                this.horizontalGridLines = false;
                this.tabStops = null;
                this.softKeyboardEffectDuration = 150;
                this.firstBaselineOffset = "auto";
                this.focusRoundedCorners = "tl tr bl br";
                this.lineThrough = false;
                this.focusSkin = HaloFocusRect;
                this.focusedTextSelectionColor = 11060974;
                this.symbolColor = 0;
                this.borderAlpha = 1;
                this.filled = true;
                this.openDuration = 1;
                this.disabledColor = 11187123;
                this.alignmentBaseline = "useDominantBaseline";
                this.modalTransparencyColor = 14540253;
                this.embedFonts = false;
                this.modalTransparencyDuration = 100;
                this.modalTransparency = 0.5;
                this.backgroundImageFillMode = "scale";
                this.lineHeight = "120%";
                this.typographicCase = "default";
                this.borderColor = 6908265;
                this.fontAntiAliasType = "advanced";
                this.selectionColor = 11060974;
                this.cffHinting = "horizontalStem";
                this.contentBackgroundAlpha = 1;
                this.cornerRadius = 2;
                this.borderThickness = 1;
                this.fontFamily = "Arial";
                this.indentation = 17;
                this.paddingBottom = 0;
                this.digitCase = "default";
                this.repeatInterval = 35;
                this.textSelectedColor = 0;
                this.paragraphEndIndent = 0;
                this.disabledIconColor = 10066329;
                this.fontWeight = "normal";
                this.borderVisible = true;
                this.focusBlendMode = "normal";
                this.textAlign = "start";
                this.accentColor = 39423;
                this.shadowCapColor = 14015965;
                this.contentBackgroundColor = 16777215;
                this.fontLookup = "embeddedCFF";
                this.chromeColor = 13421772;
                this.columnGap = 20;
                this.focusThickness = 2;
                this.verticalGridLineColor = 14015965;
                this.blockProgression = "tb";
                this.textRollOverColor = 0;
                this.fillAlphas = [0.6, 0.4, 0.75, 0.65];
                this.horizontalGridLineColor = 16250871;
                this.strokeWidth = 1;
                this.fontGridFitType = "pixel";
                this.errorColor = 16646144;
                this.paragraphSpaceAfter = 0;
                this.justificationRule = "auto";
                this.borderSides = "left top right bottom";
                this.color = 0;
                this.buttonColor = 7305079;
                this.fillColors = [16777215, 13421772, 16777215, 15658734];
                this.paragraphSpaceBefore = 0;
                this.locale = "en";
                this.textIndent = 0;
                this.fontThickness = 0;
                this.renderingMode = "cff";
                this.textJustify = "interWord";
                this.fullScreenHideControlsDelay = 3000;
                this.columnWidth = "auto";
                this.paddingTop = 0;
                this.direction = "ltr";
                this.fixedThumbSize = false;
                this.caretColor = 92159;
                this.letterSpacing = 0;
                this.borderWeight = 1;
                this.columnCount = "auto";
                this.bevel = true;
                this.verticalScrollPolicy = "auto";
                this.trackingLeft = 0;
                this.horizontalGap = 8;
                this.rollOverColor = 13556719;
                this.modalTransparencyBlur = 3;
                this.stroked = false;
                this.iconColor = 1118481;
                this.inactiveTextSelectionColor = 15263976;
                this.leadingModel = "auto";
                this.showErrorTip = true;
                this.autoThumbVisibility = true;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("mx.managers.DragManager", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("mx.managers.DragManager");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.linkCursor = _embed_css_Assets_swf_1381150305_mx_skins_cursor_DragLink_1076306758;
                this.rejectCursor = _embed_css_Assets_swf_1381150305_mx_skins_cursor_DragReject_411207781;
                this.copyCursor = _embed_css_Assets_swf_1381150305_mx_skins_cursor_DragCopy_1076044753;
                this.moveCursor = _embed_css_Assets_swf_1381150305_mx_skins_cursor_DragMove_1076332333;
                this.defaultDragImageSkin = DefaultDragImage;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("mx.controls.Image", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.Image");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.layoutDirection = "ltr";
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("mx.controls.scrollClasses.ScrollBar", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.scrollClasses.ScrollBar");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.thumbSkin = ScrollBarThumbSkin;
                this.paddingBottom = 0;
                this.thumbOffset = 0;
                this.paddingRight = 0;
                this.trackSkin = ScrollBarTrackSkin;
                this.downArrowSkin = ScrollBarDownButtonSkin;
                this.upArrowSkin = ScrollBarUpButtonSkin;
                this.paddingTop = 0;
                this.paddingLeft = 0;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("mx.controls.colorPickerClasses.SwatchPanel", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.colorPickerClasses.SwatchPanel");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.previewHeight = 22;
                this.backgroundColor = 15066855;
                this.borderColor = 10856878;
                this.paddingRight = 5;
                this.swatchBorderSize = 1;
                this.columnCount = 20;
                this.swatchHighlightSize = 1;
                this.textFieldWidth = 72;
                this.verticalGap = 0;
                this.swatchGridBackgroundColor = 0;
                this.swatchBorderColor = 0;
                this.previewWidth = 45;
                this.swatchHeight = 12;
                this.highlightColor = 16777215;
                this.horizontalGap = 0;
                this.paddingBottom = 5;
                this.textFieldStyleName = "swatchPanelTextField";
                this.swatchGridBorderSize = 0;
                this.swatchWidth = 12;
                this.fontSize = 11;
                this.paddingTop = 4;
                this.swatchHighlightColor = 16777215;
                this.paddingLeft = 5;
                this.shadowColor = 5068126;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("mx.controls.SWFLoader", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.SWFLoader");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.brokenImageBorderSkin = BrokenImageBorderSkin;
                this.brokenImageSkin = _embed_css_Assets_swf_1381150305___brokenImage_388196271;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "textAreaVScrollBarStyle");
            conditions.push(condition);
            selector = new CSSSelector("mx.controls.HScrollBar", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.HScrollBar.textAreaVScrollBarStyle");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "textAreaHScrollBarStyle");
            conditions.push(condition);
            selector = new CSSSelector("mx.controls.VScrollBar", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.VScrollBar.textAreaHScrollBarStyle");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("mx.controls.TextInput", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.TextInput");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.paddingRight = 2;
                this.paddingTop = 2;
                this.borderSkin = TextInputBorderSkin;
                this.paddingLeft = 2;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("mx.managers.CursorManager", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("mx.managers.CursorManager");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.busyCursor = BusyCursor;
                this.busyCursorBackground = _embed_css_Assets_swf_1381150305_mx_skins_cursor_BusyCursor_757865319;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("mx.controls.ToolTip", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("mx.controls.ToolTip");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.backgroundColor = 16777164;
                this.borderColor = 9542041;
                this.paddingBottom = 2;
                this.paddingRight = 4;
                this.backgroundAlpha = 0.95;
                this.fontSize = 10;
                this.paddingTop = 2;
                this.borderSkin = ToolTipBorder;
                this.borderStyle = "toolTip";
                this.paddingLeft = 4;
                this.cornerRadius = 2;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.Application", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.Application");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.backgroundColor = 16777215;
                this.skinClass = ApplicationSkin;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.Button", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.Button");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.skinClass = ButtonSkin;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "emphasized");
            conditions.push(condition);
            selector = new CSSSelector("spark.components.Button", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.Button.emphasized");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.skinClass = DefaultButtonSkin;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.CheckBox", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.CheckBox");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.skinClass = CheckBoxSkin;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.DropDownList", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.DropDownList");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.dropShadowVisible = true;
                this.skinClass = DropDownListSkin;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.HScrollBar", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.HScrollBar");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.skinClass = HScrollBarSkin;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.HSlider", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.HSlider");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.skinClass = HSliderSkin;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.Image", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.Image");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.showErrorSkin = false;
                this.enableLoadingState = false;
                this.smoothingQuality = "default";
                this.skinClass = ImageSkin;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.List", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.List");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.dropIndicatorSkin = ListDropIndicator;
                this.skinClass = ListSkin;
                this.dragIndicatorClass = ListItemDragProxy;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.Panel", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.Panel");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.backgroundColor = 16777215;
                this.borderColor = 0;
                this.dropShadowVisible = true;
                this.skinClass = PanelSkin;
                this.borderAlpha = 0.5;
                this.cornerRadius = 0;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.RichEditableText", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.RichEditableText");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.layoutDirection = "ltr";
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.Scroller", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.Scroller");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.skinClass = ScrollerSkin;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.SkinnableDataContainer", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.SkinnableDataContainer");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.skinClass = SkinnableDataContainerSkin;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.supportClasses.SkinnableComponent", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.supportClasses.SkinnableComponent");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.errorSkin = ErrorSkin;
                this.focusSkin = FocusSkin;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.SkinnableContainer", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.SkinnableContainer");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.skinClass = SkinnableContainerSkin;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("pseudo", "normalWithPrompt");
            conditions.push(condition);
            selector = new CSSSelector("spark.components.supportClasses.SkinnableTextBase", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.supportClasses.SkinnableTextBase:normalWithPrompt");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.color = 12237498;
                this.fontStyle = "italic";
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("pseudo", "disabledWithPrompt");
            conditions.push(condition);
            selector = new CSSSelector("spark.components.supportClasses.SkinnableTextBase", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.supportClasses.SkinnableTextBase:disabledWithPrompt");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.color = 12237498;
                this.fontStyle = "italic";
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.TabBar", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.TabBar");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.skinClass = TabBarSkin;
                this.cornerRadius = 4;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.supportClasses.TextBase", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.supportClasses.TextBase");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.layoutDirection = "ltr";
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.TextArea", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.TextArea");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.paddingBottom = 3;
                this.paddingRight = 3;
                this.skinClass = TextAreaSkin;
                this.paddingTop = 5;
                this.paddingLeft = 3;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.TextInput", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.TextInput");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.paddingBottom = 3;
                this.paddingRight = 3;
                this.skinClass = TextInputSkin;
                this.paddingTop = 5;
                this.paddingLeft = 3;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.TitleWindow", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.TitleWindow");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.borderColor = 0;
                this.dropShadowVisible = true;
                this.skinClass = TitleWindowSkin;
                this.borderAlpha = 0.8;
                this.cornerRadius = 0;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.ToggleButton", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.ToggleButton");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.skinClass = ToggleButtonSkin;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.VScrollBar", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.VScrollBar");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.skinClass = VScrollBarSkin;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.VSlider", conditions, selector);
            mergedStyle = styleManager.getMergedStyleDeclaration("spark.components.VSlider");
            style = new CSSStyleDeclaration(selector, styleManager, mergedStyle == null);
            if (style.defaultFactory == null)
            {
                style.defaultFactory = function () : void
            {
                this.skinClass = VSliderSkin;
                return;
            }// end function
            ;
            }
            if (mergedStyle != null && (mergedStyle.defaultFactory == null || ObjectUtil.compare(new style.defaultFactory(), new mergedStyle.defaultFactory())))
            {
                styleManager.setStyleDeclaration(mx_internal::selectorString, style, false);
            }
            return;
        }// end function

    }
}
