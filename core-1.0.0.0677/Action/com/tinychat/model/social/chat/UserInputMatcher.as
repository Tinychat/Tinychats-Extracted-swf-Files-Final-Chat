package com.tinychat.model.social.chat
{
    import com.tinychat.model.user.*;

    public class UserInputMatcher extends Object
    {
        private static const actionPattern:RegExp = /(\/[a-z1-9]+)\s?([\w-$\[\]]+)?\s?(.+)*/;

        public function UserInputMatcher()
        {
            return;
        }// end function

        public static function match(param1:String) : InputMatch
        {
            var _loc_2:InputMatch = null;
            var _loc_3:Object = null;
            var _loc_4:String = null;
            var _loc_5:String = null;
            var _loc_6:String = null;
            if (param1.charAt(0) == "/")
            {
                _loc_3 = actionPattern.exec(param1);
                if (_loc_3)
                {
                }
                if (_loc_3.length > 1)
                {
                    _loc_4 = _loc_3[1];
                    _loc_5 = _loc_3[2];
                    _loc_6 = _loc_3[3];
                    if (isCommand(_loc_4, UserAction.ALLOW_BROADCAST))
                    {
                        _loc_2 = createMatch(UserAction.ALLOW_BROADCAST, [_loc_5]);
                    }
                    else if (isCommand(_loc_4, UserAction.BAN))
                    {
                        _loc_2 = createMatch(UserAction.BAN, [_loc_5]);
                    }
                    else if (isCommand(_loc_4, UserAction.BANLIST))
                    {
                        _loc_2 = createMatch(UserAction.BANLIST);
                    }
                    else if (isCommand(_loc_4, UserAction.CLOSE))
                    {
                        _loc_2 = createMatch(UserAction.CLOSE, [_loc_5]);
                    }
                    else if (isCommand(_loc_4, UserAction.FORGIVE))
                    {
                        _loc_2 = createMatch(UserAction.FORGIVE, [_loc_5]);
                    }
                    else if (isCommand(_loc_4, UserAction.HELP))
                    {
                        _loc_2 = createMatch(UserAction.HELP);
                    }
                    else if (isCommand(_loc_4, UserAction.IGNORE))
                    {
                        _loc_2 = createMatch(UserAction.IGNORE, [_loc_5]);
                    }
                    else if (isCommand(_loc_4, UserAction.PRIVATE_CHAT))
                    {
                        _loc_2 = createMatch(UserAction.PRIVATE_CHAT, [_loc_5, _loc_6]);
                    }
                    else if (isCommand(_loc_4, UserAction.MUTE))
                    {
                        _loc_2 = createMatch(UserAction.MUTE);
                    }
                    else if (isCommand(_loc_4, UserAction.NICK))
                    {
                        _loc_2 = createMatch(UserAction.NICK, [_loc_5]);
                    }
                    else if (isCommand(_loc_4, UserAction.OPER))
                    {
                        _loc_2 = createMatch(UserAction.OPER, [_loc_5]);
                    }
                    else if (isCommand(_loc_4, UserAction.PUSH2TALK))
                    {
                        _loc_2 = createMatch(UserAction.PUSH2TALK);
                    }
                    else if (isCommand(_loc_4, UserAction.REPORTED))
                    {
                        _loc_2 = createMatch(UserAction.REPORTED);
                    }
                    else if (isCommand(_loc_4, UserAction.MEDIA_BROADCAST_CLOSED))
                    {
                        _loc_2 = createMatch(UserAction.MEDIA_BROADCAST_CLOSED, [_loc_5]);
                    }
                    else if (isCommand(_loc_4, UserAction.MEDIA_BROADCAST_PAUSED))
                    {
                        _loc_2 = createMatch(UserAction.MEDIA_BROADCAST_PAUSED, [_loc_5]);
                    }
                    else if (isCommand(_loc_4, UserAction.MEDIA_BROADCAST_PLAYED))
                    {
                        _loc_2 = createMatch(UserAction.MEDIA_BROADCAST_PLAYED, [_loc_5, _loc_6]);
                    }
                    else if (isCommand(_loc_4, UserAction.MEDIA_BROADCAST_SOUGHT))
                    {
                        _loc_2 = createMatch(UserAction.MEDIA_BROADCAST_SOUGHT, [_loc_5, _loc_6]);
                    }
                    else if (isCommand(_loc_4, UserAction.MEDIA_BROADCAST_STARTED))
                    {
                        _loc_2 = createMatch(UserAction.MEDIA_BROADCAST_STARTED, [_loc_5].concat(_loc_6.split(" ")));
                    }
                    else if (isCommand(_loc_4, UserAction.MEDIA_BROADCAST_STARTED_PAUSED))
                    {
                        _loc_2 = createMatch(UserAction.MEDIA_BROADCAST_STARTED_PAUSED, [_loc_5].concat(_loc_6.split(" ")));
                    }
                    else if (isCommand(_loc_4, UserAction.UNIGNORE))
                    {
                        _loc_2 = createMatch(UserAction.UNIGNORE, [_loc_5]);
                    }
                    else if (isCommand(_loc_4, UserAction.USERINFO))
                    {
                        _loc_2 = createMatch(UserAction.USERINFO, [_loc_5]);
                    }
                    else if (isCommand(_loc_4, UserAction.VERSION))
                    {
                        _loc_2 = createMatch(UserAction.VERSION);
                    }
                    else if (isCommand(_loc_4, UserAction.VIDEO_FILTER))
                    {
                        _loc_2 = createMatch(UserAction.VIDEO_FILTER, [_loc_5]);
                    }
                }
            }
            else
            {
                _loc_2 = createMatch(UserAction.PUBLIC_CHAT, [param1]);
            }
            return matchIsValid(_loc_2) ? (_loc_2) : (createMatch(UserAction.INVALID));
        }// end function

        private static function isCommand(param1:String, param2:UserAction) : Boolean
        {
            return param1 == param2.input;
        }// end function

        private static function createMatch(param1:UserAction, param2:Array = null) : InputMatch
        {
            return new InputMatch(param1, param2);
        }// end function

        private static function matchIsValid(param1:InputMatch) : Boolean
        {
            var _loc_2:uint = 0;
            if (param1)
            {
                if (param1.args)
                {
                }
            }
            if (param1.args.length < param1.type.requiredArgCount)
            {
                return false;
            }
            _loc_2 = 0;
            while (_loc_2 < param1.type.requiredArgCount)
            {
                
                if (param1.args[_loc_2])
                {
                }
                if (param1.args[_loc_2] == "")
                {
                    return false;
                }
                _loc_2 = _loc_2 + 1;
            }
            return true;
        }// end function

    }
}
