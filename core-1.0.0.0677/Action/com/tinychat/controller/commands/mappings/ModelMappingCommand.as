package com.tinychat.controller.commands.mappings
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.authorization.*;
    import com.tinychat.model.broadcast.*;
    import com.tinychat.model.broadcast.base.*;
    import com.tinychat.model.broadcast.cameraquality.*;
    import com.tinychat.model.broadcast.devicelist.*;
    import com.tinychat.model.broadcast.greenroom.*;
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.model.cookie.*;
    import com.tinychat.model.flashvars.*;
    import com.tinychat.model.fullscreen.*;
    import com.tinychat.model.gifts.*;
    import com.tinychat.model.invite.facebook.*;
    import com.tinychat.model.invite.twitter.*;
    import com.tinychat.model.javascript.*;
    import com.tinychat.model.layout.*;
    import com.tinychat.model.login.*;
    import com.tinychat.model.media.*;
    import com.tinychat.model.moderator.*;
    import com.tinychat.model.parsers.fromowner.*;
    import com.tinychat.model.parsers.privatemessage.*;
    import com.tinychat.model.report.*;
    import com.tinychat.model.room.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.room.connection.calls.*;
    import com.tinychat.model.room.info.*;
    import com.tinychat.model.settings.*;
    import com.tinychat.model.snapshot.*;
    import com.tinychat.model.snapshot.facebook.*;
    import com.tinychat.model.social.chat.captcha.*;
    import com.tinychat.model.social.chat.conversation.*;
    import com.tinychat.model.social.chat.conversation.facebook.*;
    import com.tinychat.model.social.chat.conversation.mqtt.*;
    import com.tinychat.model.social.chat.conversation.tinychat.*;
    import com.tinychat.model.social.chat.message.*;
    import com.tinychat.model.social.network.facebook.*;
    import com.tinychat.model.social.network.mqtt.*;
    import com.tinychat.model.social.network.tumblr.*;
    import com.tinychat.model.social.network.twitter.*;
    import com.tinychat.model.sounds.*;
    import com.tinychat.model.trial.*;
    import com.tinychat.model.user.*;
    import com.tinychat.model.userinfo.*;
    import com.tinychat.model.utils.*;
    import com.tinychat.model.youtube.*;
    import com.tinychat.ui.components.social.userlist.greenroom.renderer.*;
    import com.tinychat.vendors.youtube.*;
    import flash.display.*;
    import flash.system.*;

    public class ModelMappingCommand extends MappingCommand
    {

        public function ModelMappingCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:* = undefined;
            injector.mapValue(Stage, contextView.stage);
            injector.mapSingleton(FlashvarsProxy);
            injector.mapSingleton(ApplicationJavascript);
            injector.mapSingleton(FlashCookieProxy);
            injector.mapSingleton(RoomUsers);
            _loc_1 = injector.mapSingleton(RoomSettingsProxy);
            injector.mapRule(RoomConnectInfo, _loc_1);
            injector.mapRule(RoomSettings, _loc_1);
            injector.mapSingleton(AutoBanner);
            injector.mapSingleton(BanListProxy);
            injector.mapSingleton(CameraCaptureProxy);
            injector.mapSingleton(ReportUsersProxy);
            injector.mapSingleton(TwitterProxy);
            injector.mapSingleton(TumblrLogin);
            injector.mapSingleton(GuestLogin);
            injector.mapSingleton(PlaylistProxy);
            injector.mapSingleton(FromOwnerParser);
            injector.mapSingleton(PrivateMessageParser);
            injector.mapSingleton(PrivateMessageSender);
            injector.mapSingleton(ApplicationSettings);
            injector.mapSingletonOf(MasterSoundControl, ApplicationVolume);
            injector.mapSingleton(RoomUserCount);
            injector.mapSingleton(MicrophoneMode);
            injector.mapSingleton(MicrophoneVolume);
            injector.mapSingleton(UserPermissions);
            injector.mapSingleton(ApplicationLayout);
            injector.mapSingleton(SnapshotFactory);
            injector.mapSingleton(FullScreenMode);
            injector.mapSingleton(TrialMode);
            injector.mapSingleton(MqttProxy);
            injector.mapSingleton(RoomBroadcastAuthorization);
            injector.mapSingleton(GreenRoomBroadcastAuthorization);
            injector.mapSingleton(FacebookGeneralInviteTemplates);
            injector.mapSingleton(FacebookSnapshotTemplates);
            injector.mapSingleton(TwitterInviteTemplates);
            injector.mapValue(FlashVersion, new FlashVersion(Capabilities.version));
            injector.mapValue(OsVersion, new OsVersion(Capabilities.os));
            injector.mapValue(ChatSoundEffect, new ChatSoundEffect(SoundEffect.POP, injector.getInstance(MasterSoundControl)));
            injector.mapValue(GiftSoundEffect, new GiftSoundEffect(SoundEffect.MAGIC, injector.getInstance(MasterSoundControl)));
            injector.mapValue(CountMessage, new CountMessage());
            _loc_1 = injector.mapSingleton(RoomConnection);
            injector.mapRule(ConnectionCallbackReceiver, _loc_1);
            injector.mapRule(ImmutableConnection, _loc_1);
            injector.mapSingleton(ApplicationConnections);
            _loc_1 = injector.mapSingleton(RoomBroadcastCanvasBroadcasts);
            injector.mapRule(Broadcasts, _loc_1);
            injector.mapSingleton(CameraList);
            injector.mapSingleton(MicrophoneList);
            injector.mapSingleton(RoomCameraBroadcasts);
            injector.mapSingleton(RoomStreamBroadcasts);
            injector.mapSingleton(RoomBroadcasts);
            injector.mapSingleton(GreenRoomBroadcasts);
            injector.mapSingleton(AllBroadcasts);
            injector.mapSingleton(RoomCameraBroadcastFactory);
            injector.mapSingleton(RoomStreamBroadcastFactory);
            injector.mapSingleton(GreenRoomCameraBroadcasts);
            injector.mapSingleton(GreenRoomStreamBroadcasts);
            injector.mapSingleton(GreenRoomCameraBroadcastFactory);
            injector.mapSingleton(GreenRoomStreamBroadcastFactory);
            injector.mapSingleton(GreenRoomStreamItemRendererFactory);
            injector.mapSingleton(YouTubePlayer);
            injector.mapSingleton(YouTubeBroadcasts);
            injector.mapSingleton(RoomCameraQuality);
            injector.mapSingleton(GreenRoomCameraQuality);
            injector.mapSingleton(PublicChat);
            injector.mapSingleton(ApplicationPrivateChats);
            injector.mapSingleton(TinychatPrivateChats);
            injector.mapSingleton(FacebookChats);
            injector.mapSingleton(MqttChats);
            injector.mapSingleton(ChatCaptcha);
            injector.mapSingleton(RoomCaptcha);
            injector.mapSingleton(UserinfoCommunicator);
            injector.mapSingleton(UserinfoSender);
            injector.mapSingleton(GiftCommunicator);
            injector.mapSingleton(PrepareGiftSender);
            injector.mapSingleton(FacebookXmppSocket);
            injector.mapSingleton(FacebookLoginProxy);
            injector.mapSingleton(FacebookFriendsProxy);
            injector.mapSingleton(FacebookPermissions);
            injector.mapSingleton(WatchActionManager);
            return;
        }// end function

    }
}
