package com.tinychat.ui.components.application
{
    import com.adobe.popup.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.model.room.info.*;
    import com.tinychat.ui.components.alerts.*;
    import com.tinychat.ui.components.connection.*;
    import com.tinychat.ui.components.invite.*;
    import com.tinychat.ui.components.moderator.*;
    import com.tinychat.ui.components.password.*;
    import com.tinychat.ui.components.popup.*;
    import com.tinychat.ui.components.settings.*;
    import com.tinychat.ui.components.soundcloud.*;
    import com.tinychat.ui.components.trial.*;
    import com.tinychat.ui.components.userinfo.*;
    import com.tinychat.ui.components.youtube.*;
    import mx.core.*;
    import spark.components.*;

    public class TinychatApplication extends Application
    {
        public var applicationScreen:ApplicationScreen;
        public var connectingScreen:IVisualElement;
        public var modalPopupFactory:PopUpFactory;
        public var modelessPopupFactory:IFactory;
        private var modalPopup:ModalPopup;
        private var modelessPopups:ModelessPopups;
        private var _applicationState:State;
        private var _applicationMode:RoomType;
        private static const STATE_NORMAL:String = "normal";
        private static const STATE_CONNECTING:String = "connecting";
        private static const STATE_CONNECTING_AND_LOADING:String = "connectingAndLoading";
        private static const STATE_MODAL:String = "modal";
        private static const STATE_MODAL_AND_LOADING:String = "modalAndLoading";
        private static const CONNECTING_STATES:Array = [State.START, State.CONNECTING, State.LOADING_ROOM_INFO];
        private static const MODAL_STATES:Array = [State.AUTHENTICATING_ROOM_BROADCAST, State.AUTHENTICATING_GREENROOM_BROADCAST];
        private static var _skinParts:Object = {modelessPopupFactory:true, applicationScreen:true, modalPopupFactory:true, controlBarGroup:false, connectingScreen:true, contentGroup:false};

        public function TinychatApplication()
        {
            this.modelessPopups = new ModelessPopups(this.modelessFactoryFunction);
            this._applicationState = State.CONNECTING;
            return;
        }// end function

        public function set applicationState(param1:State) : void
        {
            if (this._applicationState != param1)
            {
                this._applicationState = param1;
                this.stateChangeHandler();
                invalidateSkinState();
            }
            return;
        }// end function

        public function set applicationMode(param1:RoomType) : void
        {
            if (this._applicationMode != param1)
            {
                this._applicationMode = param1;
                this.updateModalStyleName();
                invalidateSkinState();
            }
            return;
        }// end function

        public function openModalPopup(param1:Object, param2:Boolean) : void
        {
            if (this.modalPopup)
            {
                this.modalPopup.open(param1, param2);
                invalidateSkinState();
            }
            return;
        }// end function

        public function set modalPopupCloseable(param1:Boolean) : void
        {
            if (this.modalPopup)
            {
                this.modalPopup.closeable = param1;
            }
            return;
        }// end function

        public function openModelessPopup(param1:Object) : void
        {
            this.modelessPopups.open(param1);
            return;
        }// end function

        public function closeModelessPopup(param1:Object) : void
        {
            this.modelessPopups.close(param1);
            return;
        }// end function

        override protected function getCurrentSkinState() : String
        {
            var _loc_1:String = null;
            if (this.modalPopup)
            {
            }
            if (!this.modalPopup.isOpen)
            {
            }
            if (MODAL_STATES.indexOf(this._applicationState) != -1)
            {
                _loc_1 = STATE_MODAL;
            }
            else if (CONNECTING_STATES.indexOf(this._applicationState) != -1)
            {
                _loc_1 = STATE_CONNECTING;
            }
            else
            {
                _loc_1 = STATE_NORMAL;
            }
            if (!this._applicationMode)
            {
                _loc_1 = _loc_1 + "AndLoading";
            }
            return _loc_1;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.modalPopupFactory)
            {
                this.modalPopup = new ModalPopup(this.modalPopupFactory);
                this.updateModalStyleName();
            }
            else if (param2 == this.applicationScreen)
            {
                this.applicationScreen.styleName = this._applicationMode.toString();
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == this.modalPopupFactory)
            {
                this.modalPopup = null;
            }
            return;
        }// end function

        override protected function stateChanged(param1:String, param2:String, param3:Boolean) : void
        {
            super.stateChanged(param1, param2, param3);
            if (this.applicationScreen)
            {
                this.applicationScreen.mouseChildren = param2 == STATE_NORMAL ? (true) : (false);
            }
            if (stage)
            {
            }
            if (param2 != STATE_NORMAL)
            {
                stage.focus = null;
            }
            return;
        }// end function

        private function closeModalPopup() : void
        {
            if (this.modalPopup)
            {
                this.modalPopup.close();
                invalidateSkinState();
            }
            return;
        }// end function

        private function modelessFactoryFunction() : PopUpFactory
        {
            return PopUpFactory(createDynamicPartInstance("modelessPopupFactory"));
        }// end function

        private function updateModalStyleName() : void
        {
            this.modalPopup.styleName = this._applicationMode ? (this._applicationMode.toString()) : ("");
            return;
        }// end function

        private function stateChangeHandler() : void
        {
            switch(this._applicationState)
            {
                case State.APPLICATION:
                case State.CONNECTING:
                case State.LOADING_ROOM_INFO:
                {
                    this.closeModalPopup();
                    break;
                }
                case State.APPLICATION_SETTINGS:
                {
                    this.openModalPopup(ApplicationSettingsScreen, true);
                    break;
                }
                case State.AUTO_BAN_WORD_LIST:
                {
                    this.openModalPopup(AutoBanWordListScreen, true);
                    break;
                }
                case State.BAN_LIST:
                {
                    this.openModalPopup(BanListScreen, true);
                    break;
                }
                case State.BANNED:
                {
                    this.openModalPopup(BannedScreen, false);
                    break;
                }
                case State.BROADCAST_BLOCKED:
                {
                    this.openModalPopup(BroadcastBlockedScreen, false);
                    break;
                }
                case State.CONFIRMING_USER_BAN:
                {
                    this.openModalPopup(ConfirmBanScreen, false);
                    break;
                }
                case State.CONFIRMING_USER_FOLLOW:
                {
                    this.openModalPopup(ConfirmFollowScreen, false);
                    break;
                }
                case State.REPORT_USER_FOLLOW:
                {
                    this.openModalPopup(ReportFollowScreen, false);
                    break;
                }
                case State.CONFIRMING_USER_REPORT:
                {
                    this.openModalPopup(ConfirmReportUserScreen, false);
                    break;
                }
                case State.CONNECTION_ATTEMPT_FAILED:
                {
                    this.openModalPopup(ConnectionFailedScreen, false);
                    break;
                }
                case State.CONNECTION_LOST:
                {
                    this.openModalPopup(ConnectionLostScreen, false);
                    break;
                }
                case State.DOMAIN_BLOCKED:
                {
                    this.openModalPopup(RoomDomainBlockScreen, false);
                    break;
                }
                case State.INVITING_FACEBOOK_FRIEND:
                {
                    this.openModalPopup(FacebookInviteFriendScreen, true);
                    break;
                }
                case State.LIMITED_FEATURE:
                {
                    this.openModalPopup(LimitedFeatureScreen, true);
                    break;
                }
                case State.LIMITED_VIDEO_FEATURE:
                {
                    this.openModalPopup(LimitedVideoFeatureScreen, true);
                    break;
                }
                case State.TRIAL_RESIZE_VIDEO:
                {
                    this.openModalPopup(TrialResizePopup, true);
                    break;
                }
                case State.LINK_BLOCKED:
                {
                    this.openModalPopup(LinkBlockedScreen, true);
                    break;
                }
                case State.LINK_WARNING:
                {
                    this.openModalPopup(LinkWarningScreen, true);
                    break;
                }
                case State.NO_AVAILABLE_BROADCAST_SLOT:
                {
                    this.openModalPopup(NoAvailableBroadcastSlotScreen, this._applicationMode != RoomType.GROUP);
                    break;
                }
                case State.NO_NEXT_ROOM:
                {
                    this.openModalPopup(NoNextRoomScreen, true);
                    break;
                }
                case State.PROMPTING_BROADCAST_PASSWORD:
                {
                    this.openModalPopup(BroadcastPasswordPrompt, false);
                    break;
                }
                case State.PROMPTING_ROOM_PASSWORD:
                {
                    this.openModalPopup(RoomPasswordPrompt, false);
                    break;
                }
                case State.ROOM_CLOSED:
                {
                    this.openModalPopup(RoomClosedScreen, false);
                    break;
                }
                case State.SELECTING_SOUNDCLOUD_TRACK:
                {
                    this.openModalPopup(SoundCloudTrackSelectionScreen, true);
                    break;
                }
                case State.SELECTING_YOUTUBE_CLIP:
                {
                    this.openModalPopup(YouTubeClipSelectionScreen, true);
                    break;
                }
                case State.TRIAL_POPUP:
                {
                    this.openModalPopup(TrialPopup, true);
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
