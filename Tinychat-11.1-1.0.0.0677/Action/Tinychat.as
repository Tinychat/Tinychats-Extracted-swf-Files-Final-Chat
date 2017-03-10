package 
{
    import Tinychat.*;
    import com.tinychat.controller.context.*;
    import com.tinychat.ui.components.application.*;
    import com.tinychat.ui.skins.gotham.*;
    import com.tinychat.ui.skins.gotham.components.alerts.*;
    import com.tinychat.ui.skins.gotham.components.application.*;
    import com.tinychat.ui.skins.gotham.components.broadcast.containers.*;
    import com.tinychat.ui.skins.gotham.components.broadcast.screens.*;
    import com.tinychat.ui.skins.gotham.components.broadcast.selectors.*;
    import com.tinychat.ui.skins.gotham.components.connection.*;
    import com.tinychat.ui.skins.gotham.components.controlbar.*;
    import com.tinychat.ui.skins.gotham.components.controlbar.buttons.*;
    import com.tinychat.ui.skins.gotham.components.gifts.*;
    import com.tinychat.ui.skins.gotham.components.invite.*;
    import com.tinychat.ui.skins.gotham.components.login.*;
    import com.tinychat.ui.skins.gotham.components.login.facebook.*;
    import com.tinychat.ui.skins.gotham.components.login.tumblr.*;
    import com.tinychat.ui.skins.gotham.components.login.twitter.*;
    import com.tinychat.ui.skins.gotham.components.media.*;
    import com.tinychat.ui.skins.gotham.components.moderator.*;
    import com.tinychat.ui.skins.gotham.components.password.*;
    import com.tinychat.ui.skins.gotham.components.popupmenu.*;
    import com.tinychat.ui.skins.gotham.components.pro.*;
    import com.tinychat.ui.skins.gotham.components.settings.*;
    import com.tinychat.ui.skins.gotham.components.snapshot.*;
    import com.tinychat.ui.skins.gotham.components.social.*;
    import com.tinychat.ui.skins.gotham.components.social.buttonbar.*;
    import com.tinychat.ui.skins.gotham.components.social.chat.*;
    import com.tinychat.ui.skins.gotham.components.social.chat.list.*;
    import com.tinychat.ui.skins.gotham.components.social.chat.smileysets.*;
    import com.tinychat.ui.skins.gotham.components.social.effects.*;
    import com.tinychat.ui.skins.gotham.components.social.effects.image.*;
    import com.tinychat.ui.skins.gotham.components.social.effects.properties.*;
    import com.tinychat.ui.skins.gotham.components.social.effects.text.*;
    import com.tinychat.ui.skins.gotham.components.social.effects.video.*;
    import com.tinychat.ui.skins.gotham.components.social.userslist.*;
    import com.tinychat.ui.skins.gotham.components.social.userslist.greenroom.*;
    import com.tinychat.ui.skins.gotham.components.social.userslist.greenroom.renderer.*;
    import com.tinychat.ui.skins.gotham.components.soundcloud.*;
    import com.tinychat.ui.skins.gotham.components.spark.*;
    import com.tinychat.ui.skins.gotham.components.tooltip.*;
    import com.tinychat.ui.skins.gotham.components.trial.*;
    import com.tinychat.ui.skins.gotham.components.userinfo.*;
    import com.tinychat.ui.skins.gotham.components.video.controls.*;
    import com.tinychat.ui.skins.gotham.components.youtube.*;
    import com.tinychat.ui.skins.gotham.icons.*;
    import flash.display.*;
    import flash.system.*;
    import mx.core.*;
    import mx.events.*;
    import mx.styles.*;

    public class Tinychat extends TinychatApplication
    {
        private var __moduleFactoryInitialized:Boolean = false;
        var _Tinychat_StylesInit_done:Boolean = false;
        private var _embed_css__images_android_app_png__107650753_1329976390:Class;
        private var _embed_css__images_ios_app_png__362588579_186746408:Class;
        private var _embed_css__images_icons_pm_small_png_1671636674_1500498411:Class;
        private var _embed_css__images_icons_effects_icon_png_568549011_853931880:Class;
        private var _embed__font_HelveticaEmbedded_medium_normal_117050832:Class;
        private var _embed_css__images_icons_text_chat_small_png_795909611_1728808618:Class;
        private var _embed__font_HelveticaEmbedded_bold_normal_1139711438:Class;
        private static var _skinParts:Object = {modelessPopupFactory:true, applicationScreen:true, controlBarGroup:false, connectingScreen:true, contentGroup:false, modalPopupFactory:true};

        public function Tinychat()
        {
            this._embed_css__images_android_app_png__107650753_1329976390 = _class_embed_css__images_android_app_png__107650753_1329976390;
            this._embed_css__images_ios_app_png__362588579_186746408 = _class_embed_css__images_ios_app_png__362588579_186746408;
            this._embed_css__images_icons_pm_small_png_1671636674_1500498411 = _class_embed_css__images_icons_pm_small_png_1671636674_1500498411;
            this._embed_css__images_icons_effects_icon_png_568549011_853931880 = _class_embed_css__images_icons_effects_icon_png_568549011_853931880;
            this._embed__font_HelveticaEmbedded_medium_normal_117050832 = Tinychat__embed__font_HelveticaEmbedded_medium_normal_117050832;
            this._embed_css__images_icons_text_chat_small_png_795909611_1728808618 = _class_embed_css__images_icons_text_chat_small_png_795909611_1728808618;
            this._embed__font_HelveticaEmbedded_bold_normal_1139711438 = Tinychat__embed__font_HelveticaEmbedded_bold_normal_1139711438;
            mx_internal::_document = this;
            this.width = 725;
            this.height = 635;
            this.addEventListener("creationComplete", this.___Tinychat_TinychatApplication1_creationComplete);
            return;
        }// end function

        override public function set moduleFactory(param1:IFlexModuleFactory) : void
        {
            super.moduleFactory = param1;
            if (this.__moduleFactoryInitialized)
            {
                return;
            }
            this.__moduleFactoryInitialized = true;
            .mx_internal::_Tinychat_StylesInit();
            return;
        }// end function

        override public function initialize() : void
        {
            super.initialize();
            return;
        }// end function

        private function creationCompleteHandler() : void
        {
            Security.loadPolicyFile("https://gifts.tinychat.com/crossdomain.xml");
            new Tinychat11Dot1Context(DisplayObjectContainer(systemManager));
            return;
        }// end function

        public function ___Tinychat_TinychatApplication1_creationComplete(event:FlexEvent) : void
        {
            this.creationCompleteHandler();
            return;
        }// end function

        function _Tinychat_StylesInit() : void
        {
            var style:CSSStyleDeclaration;
            var effects:Array;
            var conditions:Array;
            var condition:CSSCondition;
            var selector:CSSSelector;
            if (mx_internal::_Tinychat_StylesInit_done)
            {
                return;
            }
            mx_internal::_Tinychat_StylesInit_done = true;
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("global", conditions, selector);
            style = styleManager.getStyleDeclaration("global");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.modalTransparencyColor = 0;
                this.fontFamily = "HelveticaEmbedded";
                this.modalTransparencyBlur = 0;
                this.modalTransparencyDuration = 0;
                this.modalTransparency = 0;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "titleWindowButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".titleWindowButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = TitleWindowButtonSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.TitleWindow", conditions, selector);
            conditions;
            condition = new CSSCondition("id", "closeButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration("spark.components.TitleWindow #closeButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = TitleWindowCloseButtonSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "operator");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".operator");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.chromeColor = 15859169;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "controlBar");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".controlBar");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 4868682;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "broadcastButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".broadcastButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 16777215;
                this.fontSize = 13;
                this.skinClass = BroadcastButtonSkin;
                this.fontWeight = "bold";
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "inviteButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".inviteButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 16777215;
                this.fontSize = 13;
                this.skinClass = InviteButtonSkin;
                this.fontWeight = "bold";
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "microphoneModeButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".microphoneModeButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 2039583;
                this.icon = MicrophoneIcon;
                this.fontSize = 13;
                this.skinClass = MicrophoneModeButtonSkin;
                this.fontWeight = "bold";
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "roulettePromoButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".roulettePromoButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 16777215;
                this.fontSize = 13;
                this.skinClass = RouletteButtonSkin;
                this.fontWeight = "bold";
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "nextButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".nextButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 16777215;
                this.fontSize = 13;
                this.skinClass = RouletteButtonSkin;
                this.fontWeight = "bold";
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "microphoneModeButton");
            conditions.push(condition);
            condition = new CSSCondition("class", "group");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".microphoneModeButton.group");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.fontSize = 15;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "nextButton");
            conditions.push(condition);
            condition = new CSSCondition("class", "group");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".nextButton.group");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.fontSize = 15;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "cameraOptionsButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".cameraOptionsButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.iconWidth = 20;
                this.icon = WebcamIcon;
                this.skinClass = FlatControlBarButtonSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "microphoneOptionsButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".microphoneOptionsButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.iconHeight = 20;
                this.icon = MicrophoneIcon;
                this.skinClass = FlatControlBarButtonSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "settingsButton");
            conditions.push(condition);
            selector = new CSSSelector("*", conditions, selector);
            conditions;
            condition = new CSSCondition("id", "openButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration("*.settingsButton #openButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.iconWidth = 18;
                this.icon = GearIcon;
                this.skinClass = FlatControlBarButtonSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "snapshotButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".snapshotButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.iconWidth = 18;
                this.icon = CameraIcon;
                this.skinClass = SnapshotButtonSkin;
                this.fontWeight = "bold";
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "applicationVolumeControl");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".applicationVolumeControl");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = ApplicationVolumeControlSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "applicationVolumeControl");
            conditions.push(condition);
            selector = new CSSSelector("*", conditions, selector);
            conditions;
            condition = new CSSCondition("class", "muteButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration("*.applicationVolumeControl .muteButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.iconHeight = 16;
                this.skinClass = FlatControlBarToggleButtonSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "youTubeButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".youTubeButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.iconWidth = 22;
                this.icon = YouTubeIcon;
                this.skinClass = FlatControlBarButtonSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "soundCloudButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".soundCloudButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.iconWidth = 26;
                this.icon = SoundCloudIcon;
                this.skinClass = FlatControlBarButtonSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "enterFullScreenButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".enterFullScreenButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.iconWidth = 22;
                this.icon = FullScreenIcon;
                this.skinClass = LabeledFlatControlBarButtonSkin;
                this.fontWeight = "bold";
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "exitFullScreenButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".exitFullScreenButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.fontSize = 18;
                this.skinClass = TitleWindowButtonSkin;
                this.fontWeight = "bold";
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "iosPromoButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".iosPromoButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.icon = _embed_css__images_ios_app_png__362588579_186746408;
                this.skinClass = PromoButtonSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "androidPromoButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".androidPromoButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.icon = _embed_css__images_android_app_png__107650753_1329976390;
                this.skinClass = PromoButtonSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "trialButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".trialButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.iconHeight = 16;
                this.color = 16777215;
                this.icon = WebcamSpeedIcon;
                this.skinClass = TrialButtonSkin;
                this.fontWeight = "bold";
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "upgradeButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".upgradeButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 16777215;
                this.skinClass = UpgradeButtonSkin;
                this.fontWeight = "bold";
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "trialOverlay");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".trialOverlay");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 16777215;
                this.fontSize = 14;
                this.skinClass = TrialOverlaySkin;
                this.fontWeight = "bold";
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "proIndicator");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".proIndicator");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.iconHeight = 18;
                this.iconWidth = 33;
                this.icon = ProBadge2;
                this.skinClass = ProIndicatorSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "extrIndicator");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".extrIndicator");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.iconHeight = 18;
                this.iconWidth = 60;
                this.icon = ExtrBadge;
                this.skinClass = ProIndicatorSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "goldIndicator");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".goldIndicator");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.iconHeight = 18;
                this.iconWidth = 44;
                this.icon = GoldBadge;
                this.skinClass = ProIndicatorSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "password");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".password");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.chromeColor = 16774131;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.password.PasswordPromptScreen", conditions, selector);
            conditions;
            condition = new CSSCondition("id", "statusLabel");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.password.PasswordPromptScreen #statusLabel");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 11802398;
                this.fontSize = 12;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "facebookButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".facebookButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = FacebookButtonSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "tumblrButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".tumblrButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = TumblrButtonSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "twitterButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".twitterButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = TwitterButtonSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.broadcast.screens.SelectionScreenBase", conditions, selector);
            conditions;
            condition = new CSSCondition("id", "selectionInfoDisplay");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.broadcast.screens.SelectionScreenBase #selectionInfoDisplay");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.fontSize = 12;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.broadcast.screens.CameraSelectionScreen", conditions, selector);
            conditions;
            condition = new CSSCondition("id", "tosInfoDisplay");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.broadcast.screens.CameraSelectionScreen #tosInfoDisplay");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 12674094;
                this.fontSize = 11;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "cameraItemRenderer");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".cameraItemRenderer");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 4211009;
                this.skinClass = CameraItemRendererSkin;
                this.fontSize = 12;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "cameraItemRenderer");
            conditions.push(condition);
            selector = new CSSSelector("*", conditions, selector);
            conditions;
            condition = new CSSCondition("id", "inactiveTextDisplay");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration("*.cameraItemRenderer #inactiveTextDisplay");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 16777215;
                this.fontSize = 12;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "vectorIconItemRenderer");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".vectorIconItemRenderer");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 4211009;
                this.skinClass = VectorIconItemRendererSkin;
                this.fontSize = 12;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "bitmapIconItemRenderer");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".bitmapIconItemRenderer");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 4211009;
                this.skinClass = BitmapIconItemRendererSkin;
                this.fontSize = 12;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "microphoneItemRenderer");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".microphoneItemRenderer");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 4211009;
                this.skinClass = MicrophoneItemRendererSkin;
                this.fontSize = 12;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "cameraItemRenderer");
            conditions.push(condition);
            condition = new CSSCondition("pseudo", "down");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".cameraItemRenderer:down");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 7171437;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "microphoneItemRenderer");
            conditions.push(condition);
            condition = new CSSCondition("pseudo", "down");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".microphoneItemRenderer:down");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 7171437;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "bitmapIconItemRenderer");
            conditions.push(condition);
            condition = new CSSCondition("pseudo", "down");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".bitmapIconItemRenderer:down");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 7171437;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "vectorIconItemRenderer");
            conditions.push(condition);
            condition = new CSSCondition("pseudo", "down");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".vectorIconItemRenderer:down");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 7171437;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.video.controls.VideoControlsOverlay", conditions, selector);
            conditions;
            condition = new CSSCondition("id", "nameDisplay");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.video.controls.VideoControlsOverlay #nameDisplay");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 16777215;
                this.fontSize = 14;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.video.controls.VideoControlsOverlay", conditions, selector);
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.popupmenu.UserPopupMenu", conditions, selector);
            conditions;
            condition = new CSSCondition("id", "openButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.video.controls.VideoControlsOverlay com.tinychat.ui.components.popupmenu.UserPopupMenu #openButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 16777215;
                this.icon = WrenchIcon;
                this.fontSize = 14;
                this.skinClass = VideoControlButtonSkin;
                this.chromeColor = 6710886;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "banButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".banButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.icon = BlockedIcon;
                this.skinClass = VideoControlButtonSkin;
                this.chromeColor = 6710886;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "privateMessageButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".privateMessageButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.icon = MessageIcon;
                this.skinClass = VideoControlButtonSkin;
                this.chromeColor = 6710886;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "toggleVideoButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".toggleVideoButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.icon = WebcamIcon;
                this.skinClass = VideoControlToggleButtonSkin;
                this.iconSelected = WebcamHiddenIcon;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "reportButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".reportButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.icon = ReportIcon;
                this.skinClass = VideoControlToggleButtonSkin;
                this.iconSelected = ReportedIcon;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "muteButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".muteButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.icon = MuteIcon;
                this.iconSelected = MutedIcon;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "greenRoomAllowButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration(".greenRoomAllowButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.icon = CheckmarkIcon;
                this.skinClass = VideoControlButtonSkin;
                this.chromeColor = 65280;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.popupmenu.UserPopupMenu", conditions, selector);
            conditions;
            condition = new CSSCondition("id", "openButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.popupmenu.UserPopupMenu #openButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = TransparentButtonSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.chat.PublicChatView", conditions, selector);
            conditions;
            condition = new CSSCondition("id", "topicDisplay");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.chat.PublicChatView #topicDisplay");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.fontSize = 14;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.chat.PublicChatView", conditions, selector);
            conditions;
            condition = new CSSCondition("id", "helpDescription");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.chat.PublicChatView #helpDescription");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.fontSize = 12;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.chat.PrivateChatView", conditions, selector);
            conditions;
            condition = new CSSCondition("id", "title");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.chat.PrivateChatView #title");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.fontSize = 14;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.chat.PrivateChatUserItemRenderer", conditions, selector);
            conditions;
            condition = new CSSCondition("id", "close");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.chat.PrivateChatUserItemRenderer #close");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = PrivateChatCloseButtonSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.media.AbstractMediaSelectionScreen", conditions, selector);
            conditions;
            condition = new CSSCondition("id", "searchButton");
            conditions.push(condition);
            selector = new CSSSelector("", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.media.AbstractMediaSelectionScreen #searchButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = MediaSearchButtonSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.application.TinychatApplication", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.application.TinychatApplication");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = TinychatApplicationSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.application.ApplicationScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.application.ApplicationScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = NormalModeApplicationScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "group");
            conditions.push(condition);
            selector = new CSSSelector("com.tinychat.ui.components.application.ApplicationScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.application.ApplicationScreen.group");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = NextModeApplicationScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.application.ConnectingScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.application.ConnectingScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = ConnectingScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "viewContainer");
            conditions.push(condition);
            selector = new CSSSelector("spark.components.SkinnableContainer", conditions, selector);
            style = styleManager.getStyleDeclaration("spark.components.SkinnableContainer.viewContainer");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = ViewContainerSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "view");
            conditions.push(condition);
            selector = new CSSSelector("spark.components.SkinnableContainer", conditions, selector);
            style = styleManager.getStyleDeclaration("spark.components.SkinnableContainer.view");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = ViewSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "controlBar");
            conditions.push(condition);
            selector = new CSSSelector("spark.components.SkinnableContainer", conditions, selector);
            style = styleManager.getStyleDeclaration("spark.components.SkinnableContainer.controlBar");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = ControlBarContainerSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.HScrollBar", conditions, selector);
            style = styleManager.getStyleDeclaration("spark.components.HScrollBar");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = HScrollBarSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.VScrollBar", conditions, selector);
            style = styleManager.getStyleDeclaration("spark.components.VScrollBar");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = VScrollBarSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.CheckBox", conditions, selector);
            style = styleManager.getStyleDeclaration("spark.components.CheckBox");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = CheckBoxSkin;
                this.fontWeight = "bold";
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.TextInput", conditions, selector);
            style = styleManager.getStyleDeclaration("spark.components.TextInput");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.focusSkin = null;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.RichEditableText", conditions, selector);
            style = styleManager.getStyleDeclaration("spark.components.RichEditableText");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.paragraphSpaceAfter = 10;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.TitleWindow", conditions, selector);
            conditions;
            selector = new CSSSelector("spark.components.RichEditableText", conditions, selector);
            style = styleManager.getStyleDeclaration("spark.components.TitleWindow spark.components.RichEditableText");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.fontWeight = "normal";
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.TextArea", conditions, selector);
            style = styleManager.getStyleDeclaration("spark.components.TextArea");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 3092271;
                this.skinClass = TextAreaSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.spark.AdvancedTextInput", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.spark.AdvancedTextInput");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.promptMessageColor = 10526880;
                this.color = 3092271;
                this.textAlign = "center";
                this.fontSize = 17;
                this.skinClass = AdvancedTextInputSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "search");
            conditions.push(condition);
            selector = new CSSSelector("com.tinychat.ui.components.spark.AdvancedTextInput", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.spark.AdvancedTextInput.search");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = SearchInputSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.DropDownList", conditions, selector);
            style = styleManager.getStyleDeclaration("spark.components.DropDownList");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 5460819;
                this.skinClass = DropDownListSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("pseudo", "over");
            conditions.push(condition);
            selector = new CSSSelector("spark.components.DropDownList", conditions, selector);
            style = styleManager.getStyleDeclaration("spark.components.DropDownList:over");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 10658466;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.spark.PopupList", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.spark.PopupList");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = PopupButtonSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.TitleWindow", conditions, selector);
            style = styleManager.getStyleDeclaration("spark.components.TitleWindow");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 4211009;
                this.fontSize = 14;
                this.lineHeight = 22;
                this.skinClass = TitleWindowSkin;
                this.fontWeight = "bold";
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.TitleWindow", conditions, selector);
            conditions;
            selector = new CSSSelector("spark.components.RichText", conditions, selector);
            style = styleManager.getStyleDeclaration("spark.components.TitleWindow spark.components.RichText");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.fontWeight = "normal";
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.TitleWindow", conditions, selector);
            conditions;
            selector = new CSSSelector("spark.components.Button", conditions, selector);
            style = styleManager.getStyleDeclaration("spark.components.TitleWindow spark.components.Button");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 16777215;
                this.skinClass = TitleWindowButtonSkin;
                this.lineHeight = 16;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.login.SocialLoginButtons", conditions, selector);
            conditions;
            selector = new CSSSelector("spark.components.Button", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.login.SocialLoginButtons spark.components.Button");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.fontSize = 16;
                this.fontWeight = "bold";
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("spark.components.TitleWindow", conditions, selector);
            conditions;
            selector = new CSSSelector("spark.components.ToggleButton", conditions, selector);
            style = styleManager.getStyleDeclaration("spark.components.TitleWindow spark.components.ToggleButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 16777215;
                this.skinClass = TitleWindowToggleButtonSkin;
                this.lineHeight = 16;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.login.SocialLoginButtons", conditions, selector);
            conditions;
            selector = new CSSSelector("spark.components.ToggleButton", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.login.SocialLoginButtons spark.components.ToggleButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.fontSize = 16;
                this.fontWeight = "bold";
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.tooltip.TinychatToolTip", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.tooltip.TinychatToolTip");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 3376817;
                this.fontSize = 11;
                this.skinClass = TinychatToolTipSkin;
                this.fontWeight = "bold";
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "errorTip");
            conditions.push(condition);
            selector = new CSSSelector("com.tinychat.ui.components.tooltip.TinychatToolTip", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.tooltip.TinychatToolTip.errorTip");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 3376817;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.spark.TitleDisplay", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.spark.TitleDisplay");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.fontSize = 15;
                this.lineHeight = 24;
                this.skinClass = TitleDisplaySkin;
                this.fontWeight = "bold";
                this.chromeColor = 15594746;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.connection.ConnectionLostScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.connection.ConnectionLostScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = ConnectionRetryScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.connection.ConnectionFailedScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.connection.ConnectionFailedScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = ConnectionRetryScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.controlbar.buttons.OpenGraphToggleToolTip", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.controlbar.buttons.OpenGraphToggleToolTip");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 16777215;
                this.fontSize = 14;
                this.skinClass = OpenGraphToggleToolTipSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.controlbar.buttons.OpenGraphPostedScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.controlbar.buttons.OpenGraphPostedScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = OpenGraphPostedScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.controlbar.buttons.OpenGraphToggleInfoScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.controlbar.buttons.OpenGraphToggleInfoScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = OpenGraphToggleInfoScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.trial.TrialPopup", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.trial.TrialPopup");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = TrialPopupSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.trial.TrialResizePopup", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.trial.TrialResizePopup");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = TrialResizePopupSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.password.RoomPasswordPrompt", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.password.RoomPasswordPrompt");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = NonCancelablePasswordPromptSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.password.BroadcastPasswordPrompt", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.password.BroadcastPasswordPrompt");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = CancelablePasswordPromptSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "group");
            conditions.push(condition);
            selector = new CSSSelector("com.tinychat.ui.components.password.BroadcastPasswordPrompt", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.password.BroadcastPasswordPrompt.group");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = NonCancelablePasswordPromptSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.login.LoginSelectorScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.login.LoginSelectorScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.fontSize = 15;
                this.skinClass = LoginSelectorScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.login.SocialLoginButtons", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.login.SocialLoginButtons");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = SocialLoginButtonsSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.login.facebook.FacebookLoginScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.login.facebook.FacebookLoginScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = FacebookLoginScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.login.twitter.TwitterLoginScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.login.twitter.TwitterLoginScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = LoginScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.login.tumblr.TumblrLoginScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.login.tumblr.TumblrLoginScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = LoginScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.login.tumblr.TumblrLoginSuccessScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.login.tumblr.TumblrLoginSuccessScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = TumblrLoginSuccessScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.login.twitter.TwitterLoginSuccessScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.login.twitter.TwitterLoginSuccessScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = TwitterLoginSuccessScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.login.NicknameSelector", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.login.NicknameSelector");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = NicknameSelectorSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.login.NicknameSelectionScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.login.NicknameSelectionScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = NicknameSelectionScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.alerts.BannedScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.alerts.BannedScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = NonInteractiveAlertSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.alerts.RoomClosedScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.alerts.RoomClosedScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = NonInteractiveAlertSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.alerts.RoomDomainBlockScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.alerts.RoomDomainBlockScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = NonInteractiveAlertSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.alerts.BroadcastBlockedScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.alerts.BroadcastBlockedScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = ConfirmOnlyAlertSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "group");
            conditions.push(condition);
            selector = new CSSSelector("com.tinychat.ui.components.alerts.BroadcastBlockedScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.alerts.BroadcastBlockedScreen.group");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = NonInteractiveAlertSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.alerts.LimitedFeatureScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.alerts.LimitedFeatureScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = LimitedFeatureScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.alerts.LimitedVideoFeatureScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.alerts.LimitedVideoFeatureScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = LimitedFeatureScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.alerts.ReportFollowScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.alerts.ReportFollowScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = ConfirmOnlyAlertSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.alerts.LinkWarningScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.alerts.LinkWarningScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = LinkWarningScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.alerts.LinkBlockedScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.alerts.LinkBlockedScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = LinkBlockedScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.alerts.NoAvailableBroadcastSlotScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.alerts.NoAvailableBroadcastSlotScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = ConfirmOnlyAlertSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.alerts.NoNextRoomScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.alerts.NoNextRoomScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = ConfirmCancelAlertSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.moderator.AutoBanWordListScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.moderator.AutoBanWordListScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = AutoBanWordListScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.moderator.TopicSelectionScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.moderator.TopicSelectionScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = TopicSelectionScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.moderator.BanListScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.moderator.BanListScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = BanListScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.moderator.ConfirmScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.moderator.ConfirmScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = ConfirmScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.broadcast.screens.BroadcastAuthorizationScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.broadcast.screens.BroadcastAuthorizationScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.fontSize = 13;
                this.skinClass = BroadcastAuthorizationScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.broadcast.screens.BroadcastAuthorizationWorkaroundScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.broadcast.screens.BroadcastAuthorizationWorkaroundScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.fontSize = 13;
                this.skinClass = BroadcastAuthorizationWorkaroundScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.broadcast.screens.CameraSelectionScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.broadcast.screens.CameraSelectionScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = CameraSelectionScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.broadcast.screens.MicrophoneSelectionScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.broadcast.screens.MicrophoneSelectionScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = MicrophoneSelectionScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.broadcast.screens.MicrophoneModeSelectionScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.broadcast.screens.MicrophoneModeSelectionScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = MicrophoneModeSelectionScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.broadcast.screens.Push2TalkOnlyNotificationScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.broadcast.screens.Push2TalkOnlyNotificationScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = Push2TalkOnlyNotificationScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.broadcast.selectors.CameraSelector", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.broadcast.selectors.CameraSelector");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = CameraSelectorSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.broadcast.selectors.MicrophoneSelector", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.broadcast.selectors.MicrophoneSelector");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = MicrophoneSelectorSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.broadcast.selectors.MicrophoneModeSelector", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.broadcast.selectors.MicrophoneModeSelector");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = MicrophoneModeSelectorSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.broadcast.containers.CameraBroadcastContainer", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.broadcast.containers.CameraBroadcastContainer");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = CameraBroadcastContainerSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.broadcast.containers.StreamBroadcastContainer", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.broadcast.containers.StreamBroadcastContainer");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = StreamBroadcastContainerSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.broadcast.containers.GreenRoomCameraBroadcastContainer", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.broadcast.containers.GreenRoomCameraBroadcastContainer");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = GreenRoomCameraBroadcastContainerSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.video.controls.VideoControlsOverlay", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.video.controls.VideoControlsOverlay");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = VideoControlsOverlaySkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.broadcast.containers.SoundCloudBroadcastContainer", conditions, selector);
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.video.controls.VideoControlsOverlay", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.broadcast.containers.SoundCloudBroadcastContainer com.tinychat.ui.components.video.controls.VideoControlsOverlay");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = SoundCloudVideoControlsOverlaySkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.broadcast.containers.YouTubeBroadcastContainer", conditions, selector);
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.video.controls.VideoControlsOverlay", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.broadcast.containers.YouTubeBroadcastContainer com.tinychat.ui.components.video.controls.VideoControlsOverlay");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = YouTubeVideoControlsOverlaySkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.sound.VolumeControl", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.sound.VolumeControl");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = VolumeControlSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.sound.HorizontalVolumeSlider", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.sound.HorizontalVolumeSlider");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = HorizontalVolumeSliderSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.video.controls.HorizontalDurationSlider", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.video.controls.HorizontalDurationSlider");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = HorizontalVolumeSliderSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.sound.VerticalVolumeSlider", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.sound.VerticalVolumeSlider");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = VerticalVolumeSliderSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.invite.InviteSelectionScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.invite.InviteSelectionScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = InviteSelectionScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.invite.NewRoomCreatedScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.invite.NewRoomCreatedScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = NewRoomCreatedScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.invite.FacebookInviteFriendScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.invite.FacebookInviteFriendScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = FacebookInviteFriendScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.invite.FacebookInviteFriendsScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.invite.FacebookInviteFriendsScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = FacebookInviteFriendsScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.buttonbar.SocialButtonBar", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.buttonbar.SocialButtonBar");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = SocialButtonBarSkin;
                this.fontWeight = "bold";
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.buttonbar.UsersListButtonBarButton", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.buttonbar.UsersListButtonBarButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.fontSize = 21;
                this.skinClass = UsersListButtonBarButtonSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.buttonbar.PublicChatListButtonBarButton", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.buttonbar.PublicChatListButtonBarButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.icon = _embed_css__images_icons_text_chat_small_png_795909611_1728808618;
                this.skinClass = MessageCountDisplayButtonBarButtonSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.buttonbar.PrivateChatListButtonBarButton", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.buttonbar.PrivateChatListButtonBarButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.icon = _embed_css__images_icons_pm_small_png_1671636674_1500498411;
                this.skinClass = MessageCountDisplayButtonBarButtonSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.buttonbar.EffectsButtonBarButton", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.buttonbar.EffectsButtonBarButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.icon = _embed_css__images_icons_effects_icon_png_568549011_853931880;
                this.skinClass = SocialButtonBarButtonSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.buttonbar.FacebookButtonBarButton", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.buttonbar.FacebookButtonBarButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.icon = FacebookF;
                this.skinClass = UserCountButtonBarButtonSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.buttonbar.GreenRoomButtonBarButton", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.buttonbar.GreenRoomButtonBarButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.icon = GreenRoomIcon;
                this.skinClass = UserCountButtonBarButtonSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.buttonbar.MqttButtonBarButton", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.buttonbar.MqttButtonBarButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.icon = TinychatEyeIconBW;
                this.skinClass = UserCountButtonBarButtonSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.userlist.TinychatUsersList", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.userlist.TinychatUsersList");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = TinychatUsersListSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.gifts.BuyGiftButton", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.gifts.BuyGiftButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = BuyGiftButtonSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.userlist.greenroom.GreenRoomUsersList", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.userlist.greenroom.GreenRoomUsersList");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 5460819;
                this.skinClass = GreenRoomUsersListSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.userlist.greenroom.renderer.GreenRoomStreamItemRenderer", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.userlist.greenroom.renderer.GreenRoomStreamItemRenderer");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = GreenRoomStreamItemRendererSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "banButton");
            conditions.push(condition);
            selector = new CSSSelector("com.tinychat.ui.components.social.userlist.greenroom.renderer.GreenRoomStreamItemRenderer", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.userlist.greenroom.renderer.GreenRoomStreamItemRenderer.banButton");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.chromeColor = 16711680;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.userlist.FacebookUsersList", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.userlist.FacebookUsersList");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = SocialNetworkUsersListSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.userlist.MqttUsersList", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.userlist.MqttUsersList");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = SocialNetworkUsersListSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.popupmenu.UserPopupMenu", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.popupmenu.UserPopupMenu");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 5460819;
                this.fontSize = 13;
                this.skinClass = UserPopupMenuSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("class", "socialContentContainer");
            conditions.push(condition);
            selector = new CSSSelector("spark.components.NavigatorContent", conditions, selector);
            style = styleManager.getStyleDeclaration("spark.components.NavigatorContent.socialContentContainer");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = SocialContentContainerSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.effects.EffectsTabBar", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.effects.EffectsTabBar");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = EffectsTabBarSkin;
                this.cornerRadius = 0;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.effects.text.TextEffectsView", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.effects.text.TextEffectsView");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = TextEffectsViewSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.effects.image.ImageEffectsView", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.effects.image.ImageEffectsView");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = ImageEffectsViewSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.effects.properties.PropertiesEffectsView", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.effects.properties.PropertiesEffectsView");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = PropertiesEffectsViewSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.chat.PublicChatView", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.chat.PublicChatView");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 5592405;
                this.skinClass = PublicChatViewSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.chat.PrivateChatView", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.chat.PrivateChatView");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 5592405;
                this.skinClass = PrivateChatViewSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.chat.ChatInput", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.chat.ChatInput");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 10855845;
                this.textAlign = "left";
                this.fontSize = 12;
                this.skinClass = ChatInputSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("pseudo", "over");
            conditions.push(condition);
            selector = new CSSSelector("com.tinychat.ui.components.social.chat.ChatInput", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.chat.ChatInput:over");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 7105644;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("pseudo", "selected");
            conditions.push(condition);
            selector = new CSSSelector("com.tinychat.ui.components.social.chat.ChatInput", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.chat.ChatInput:selected");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 5789784;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.chat.list.ChatList", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.chat.list.ChatList");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.timestampFontSize = 10;
                this.timestampColor = 11316396;
                this.messageSpacing = 3;
                this.fontSize = 13;
                this.lineHeight = 14;
                this.skinClass = ChatListSkin;
                this.smileySet = PhpbbSmileySet;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.chat.list.ChatListItemRenderer", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.chat.list.ChatListItemRenderer");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.proBadgeIcon = ProBadge;
                this.proBadgeIconWidth = 24;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.chat.list.UserPopupMenuChatList", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.chat.list.UserPopupMenuChatList");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = UserPopupMenuChatListSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.chat.PrivateChatUserButtonBar", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.chat.PrivateChatUserButtonBar");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = PrivateChatUserButtonBarSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.chat.PrivateChatUserItemRenderer", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.chat.PrivateChatUserItemRenderer");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 4874878;
                this.fontSize = 11;
                this.skinClass = PrivateChatUserItemRendererSkin;
                this.fontWeight = "bold";
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            condition = new CSSCondition("pseudo", "unreadMessages");
            conditions.push(condition);
            selector = new CSSSelector("com.tinychat.ui.components.social.chat.PrivateChatUserItemRenderer", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.chat.PrivateChatUserItemRenderer:unreadMessages");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 6576165;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.effects.video.VideoFiltersList", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.effects.video.VideoFiltersList");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.color = 5592405;
                this.skinClass = VideoFiltersListSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.social.effects.video.VideoFiltersView", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.social.effects.video.VideoFiltersView");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = VideoFiltersViewSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.snapshot.SnapshotLoadingScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.snapshot.SnapshotLoadingScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = SnapshotLoadingScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.snapshot.SnapshotShareSelectionScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.snapshot.SnapshotShareSelectionScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = SnapshotShareSelectionScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.snapshot.SnapshotFacebookShareScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.snapshot.SnapshotFacebookShareScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = SnapshotFacebookShareScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.userinfo.TinychatUserinfoScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.userinfo.TinychatUserinfoScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = TinychatUserinfoScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.gifts.TinychatGiftScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.gifts.TinychatGiftScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = TinychatGiftScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.settings.ApplicationSettingsScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.settings.ApplicationSettingsScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = ApplicationSettingsScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.media.AbstractMediaSelectionScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.media.AbstractMediaSelectionScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = MediaSelectionScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.youtube.YouTubeClipSelectionScreen", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.youtube.YouTubeClipSelectionScreen");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = YouTubeSelectionScreenSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.broadcast.containers.SoundCloudBroadcastContainer", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.broadcast.containers.SoundCloudBroadcastContainer");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = SoundCloudBroadcastContainerSkin;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.soundcloud.SoundCloudTrackSelectionScreen", conditions, selector);
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.media.MediaSelectionItemRenderer", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.soundcloud.SoundCloudTrackSelectionScreen com.tinychat.ui.components.media.MediaSelectionItemRenderer");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.defaultThumbnail = SoundCloudIcon;
                return;
            }// end function
            ;
            }
            selector;
            conditions;
            conditions;
            selector = new CSSSelector("com.tinychat.ui.components.broadcast.containers.YouTubeBroadcastContainer", conditions, selector);
            style = styleManager.getStyleDeclaration("com.tinychat.ui.components.broadcast.containers.YouTubeBroadcastContainer");
            if (!style)
            {
                style = new CSSStyleDeclaration(selector, styleManager);
            }
            if (style.factory == null)
            {
                style.factory = function () : void
            {
                this.skinClass = YouTubeBroadcastContainerSkin;
                return;
            }// end function
            ;
            }
            styleManager.initProtoChainRoots();
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
