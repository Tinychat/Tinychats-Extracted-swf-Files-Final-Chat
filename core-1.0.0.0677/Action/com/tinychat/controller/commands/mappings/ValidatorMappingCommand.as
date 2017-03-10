package com.tinychat.controller.commands.mappings
{
    import com.tinychat.model.validation.*;
    import com.tinychat.model.validation.broadcast.*;
    import com.tinychat.model.validation.chat.*;
    import com.tinychat.model.validation.media.*;
    import com.tinychat.model.validation.mqtt.*;
    import com.tinychat.model.validation.user.*;

    public class ValidatorMappingCommand extends MappingCommand
    {

        public function ValidatorMappingCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            injector.mapSingleton(IsARoomUser);
            injector.mapSingleton(IsBroadcaster);
            injector.mapSingleton(IsntBroadcaster);
            injector.mapSingleton(BroadcastIsHidden);
            injector.mapSingleton(BroadcastIsntHidden);
            injector.mapSingleton(IsIgnored);
            injector.mapSingleton(IsntIgnored);
            injector.mapSingleton(IsPromotedBroadcast);
            injector.mapSingleton(IsntPromotedBroadcast);
            injector.mapSingleton(MoreThanOneBroadcast);
            injector.mapSingleton(IsOperator);
            injector.mapSingleton(IsBannableUser);
            injector.mapSingleton(IsntCurrentUser);
            injector.mapSingleton(IsLoggedIn);
            injector.mapSingleton(ReceivePublicTinychatMessageFrom);
            injector.mapSingleton(ReceivePrivateTinychatMessageFrom);
            injector.mapSingleton(IsMediaModerator);
            injector.mapSingleton(IsBlocked);
            injector.mapSingleton(IsntBlocked);
            return;
        }// end function

    }
}
