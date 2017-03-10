package com.tinychat.controller.commands.menuoption
{
    import com.tinychat.controller.commands.broadcast.media.signals.*;
    import com.tinychat.controller.commands.gifts.signals.*;
    import com.tinychat.controller.commands.settings.signals.*;
    import com.tinychat.controller.commands.trial.signals.*;
    import com.tinychat.controller.commands.user.signals.*;
    import com.tinychat.controller.commands.userinfo.signals.*;
    import com.tinychat.controller.commands.utils.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.media.*;
    import com.tinychat.model.menuoption.*;
    import com.tinychat.model.menuoption.media.*;
    import com.tinychat.model.menuoption.mqtt.*;
    import org.robotlegs.mvcs.*;

    public class MenuOptionSelectedCommand extends Command
    {
        public var option:MenuOption;
        public var identity:Identity;
        public var dispatchSignal:DispatchSignal;
        public var openUpgradeUrl:OpenUpgradeUrl;

        public function MenuOptionSelectedCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            switch(true)
            {
                case this._is(BanUserMenuOption):
                {
                    this.dispatchSignal.dispatch(ConfirmBan, [this.identity]);
                    break;
                }
                case this._is(CloseUserBroadcastMenuOption):
                case this._is(CloseMediaBroadcastMenuOption):
                {
                    this.dispatchSignal.dispatch(CloseBroadcast, [this.identity]);
                    break;
                }
                case this._is(HideBroadcastMenuOption):
                {
                    this.dispatchSignal.dispatch(HideBroadcast, [this.identity]);
                    break;
                }
                case this._is(IgnoreUserMenuOption):
                {
                    this.dispatchSignal.dispatch(IgnoreUser, [this.identity, true]);
                    break;
                }
                case this._is(SocialNetworkInviteUserMenuOption):
                {
                    if (this.identity is UserIdentity)
                    {
                        this.dispatchSignal.dispatch(InviteUser, [this.identity as UserIdentity]);
                    }
                    break;
                }
                case this._is(MqttBlockUserMenuOption):
                {
                    this.dispatchSignal.dispatch(MqttBlockUser, [this.identity, true]);
                    break;
                }
                case this._is(MqttUnblockUserMenuOption):
                {
                    this.dispatchSignal.dispatch(MqttBlockUser, [this.identity, false]);
                    break;
                }
                case this._is(TinychatMessageUserMenuOption):
                case this._is(SocialNetworkMessageUserMenuOption):
                {
                    this.dispatchSignal.dispatch(PrivateChatWithUser, [this.identity]);
                    break;
                }
                case this._is(PauseMediaMenuOption):
                {
                    this.dispatchSignal.dispatch(PauseMediaBroadcast, [this.identity as MediaBroadcast]);
                    break;
                }
                case this._is(PlayMediaMenuOption):
                {
                    this.dispatchSignal.dispatch(PlayMediaBroadcast, [this.identity as MediaBroadcast]);
                    break;
                }
                case this._is(ProfileUserMenuOption):
                {
                    this.dispatchSignal.dispatch(RequestUserinfo, [this.identity]);
                    break;
                }
                case this._is(FollowUserMenuOption):
                {
                    this.dispatchSignal.dispatch(FollowMember, [this.identity]);
                    break;
                }
                case this._is(DemoteBroadcastMenuOption):
                case this._is(PromoteBroadcastMenuOption):
                {
                    this.dispatchSignal.dispatch(PromoteUser, [this.identity]);
                    break;
                }
                case this._is(ReportUserMenuOption):
                {
                    this.dispatchSignal.dispatch(ConfirmReportUser, [this.identity]);
                    break;
                }
                case this._is(ShowBroadcastMenuOption):
                {
                    this.dispatchSignal.dispatch(ShowBroadcast, [this.identity]);
                    break;
                }
                case this._is(UnignoreUserMenuOption):
                {
                    this.dispatchSignal.dispatch(IgnoreUser, [this.identity, false]);
                    break;
                }
                case this._is(GiftUserMenuOption):
                {
                    this.dispatchSignal.dispatch(RequestGift, [this.identity]);
                    break;
                }
                case this._is(UpgradeUserMenuOption):
                {
                    this.openUpgradeUrl.dispatch();
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        private function _is(param1:Class) : Boolean
        {
            return this.option is param1;
        }// end function

    }
}
