package com.adobe.net
{

    public class URI extends Object
    {
        protected var _path:String = "";
        protected var _relative:Boolean = false;
        protected var _fragment:String = "";
        protected var _username:String = "";
        protected var _nonHierarchical:String = "";
        protected var _authority:String = "";
        protected var _query:String = "";
        protected var _scheme:String = "";
        protected var _port:String = "";
        protected var _password:String = "";
        protected var _valid:Boolean = false;
        static const URIqueryPartExcludedBitmap:URIEncodingBitmap = new URIEncodingBitmap(URIqueryPartEscape);
        static const URIbaselineExcludedBitmap:URIEncodingBitmap = new URIEncodingBitmap(URIbaselineEscape);
        public static const EQUAL:int = 2;
        public static const URIqueryEscape:String = URImustEscape + "#";
        static const URIauthorityExcludedBitmap:URIEncodingBitmap = URIbaselineExcludedBitmap;
        public static const PARENT:int = 3;
        static const URIqueryExcludedBitmap:URIEncodingBitmap = new URIEncodingBitmap(URIqueryEscape);
        public static const URImustEscape:String = " %";
        static const URIportExludedBitmap:URIEncodingBitmap = URIbaselineExcludedBitmap;
        public static const URIpathEscape:String = URImustEscape + "?#";
        static const URIfragmentExcludedBitmap:URIEncodingBitmap = URIqueryExcludedBitmap;
        public static const UNKNOWN_SCHEME:String = "unknown";
        static const URIuserpassExcludedBitmap:URIEncodingBitmap = URIbaselineExcludedBitmap;
        static var _resolver:IURIResolver = null;
        static const URInonHierexcludedBitmap:URIEncodingBitmap = new URIEncodingBitmap(URInonHierEscape);
        static const URIschemeExcludedBitmap:URIEncodingBitmap = URIbaselineExcludedBitmap;
        public static const URIqueryPartEscape:String = URImustEscape + "#&=";
        static const URIpathExcludedBitmap:URIEncodingBitmap = new URIEncodingBitmap(URIpathEscape);
        public static const URIbaselineEscape:String = URImustEscape + ":?#/@";
        public static const URInonHierEscape:String = URImustEscape + "?#/";
        public static const CHILD:int = 1;
        public static const NOT_RELATED:int = 0;

        public function URI(uri:String = null) : void
        {
            if (uri == null)
            {
                this.initialize();
            }
            else
            {
                this.constructURI(uri);
            }
            return;
        }// end function

        public function set queryRaw(queryStr:String) : void
        {
            this._query = queryStr;
            return;
        }// end function

        public function get port() : String
        {
            return URI.unescapeChars(this._port);
        }// end function

        public function set port(portStr:String) : void
        {
            this._port = URI.escapeChars(portStr);
            this.hierState = true;
            return;
        }// end function

        public function getCommonParent(uri:URI, caseSensitive:Boolean = true) : URI
        {
            var _loc_6:String = null;
            var _loc_7:String = null;
            var _loc_3:* = URI.resolve(this);
            var _loc_4:* = URI.resolve(uri);
            if (_loc_3.isAbsolute())
            {
            }
            if (_loc_4.isAbsolute())
            {
            }
            if (_loc_3.isHierarchical() != false)
            {
            }
            if (_loc_4.isHierarchical() == false)
            {
                return null;
            }
            var _loc_5:* = _loc_3.getRelation(_loc_4);
            if (_loc_5 == URI.NOT_RELATED)
            {
                return null;
            }
            _loc_3.chdir(".");
            _loc_4.chdir(".");
            do
            {
                
                _loc_5 = _loc_3.getRelation(_loc_4, caseSensitive);
                if (_loc_5 != URI.EQUAL)
                {
                }
                if (_loc_5 == URI.PARENT)
                {
                    break;
                }
                _loc_6 = _loc_3.toString();
                _loc_3.chdir("..");
                _loc_7 = _loc_3.toString();
            }while (_loc_6 != _loc_7)
            return _loc_3;
        }// end function

        public function get nonHierarchical() : String
        {
            return URI.unescapeChars(this._nonHierarchical);
        }// end function

        protected function set hierState(state:Boolean) : void
        {
            if (state)
            {
                this._nonHierarchical = "";
                if (this._scheme != "")
                {
                }
                if (this._scheme == UNKNOWN_SCHEME)
                {
                    this._relative = true;
                }
                else
                {
                    this._relative = false;
                }
                if (this._authority.length == 0)
                {
                }
                if (this._path.length == 0)
                {
                    this._valid = false;
                }
                else
                {
                    this._valid = true;
                }
            }
            else
            {
                this._authority = "";
                this._username = "";
                this._password = "";
                this._port = "";
                this._path = "";
                this._relative = false;
                if (this._scheme != "")
                {
                }
                if (this._scheme == UNKNOWN_SCHEME)
                {
                    this._valid = false;
                }
                else
                {
                    this._valid = true;
                }
            }
            return;
        }// end function

        public function setQueryValue(name:String, value:String) : void
        {
            var _loc_3:Object = null;
            _loc_3 = this.getQueryByMap();
            _loc_3[name] = value;
            this.setQueryByMap(_loc_3);
            return;
        }// end function

        public function getFilename(minusExtension:Boolean = false) : String
        {
            var _loc_3:String = null;
            var _loc_4:int = 0;
            if (this.isDirectory())
            {
                return String("");
            }
            var _loc_2:* = this.path;
            _loc_4 = _loc_2.lastIndexOf("/");
            if (_loc_4 != -1)
            {
                _loc_3 = _loc_2.substr((_loc_4 + 1));
            }
            else
            {
                _loc_3 = _loc_2;
            }
            if (minusExtension)
            {
                _loc_4 = _loc_3.lastIndexOf(".");
                if (_loc_4 != -1)
                {
                    _loc_3 = _loc_3.substr(0, _loc_4);
                }
            }
            return _loc_3;
        }// end function

        public function set authority(authorityStr:String) : void
        {
            authorityStr = authorityStr.toLowerCase();
            this._authority = URI.fastEscapeChars(authorityStr, URI.URIauthorityExcludedBitmap);
            this.hierState = true;
            return;
        }// end function

        protected function initialize() : void
        {
            this._valid = false;
            this._relative = false;
            this._scheme = UNKNOWN_SCHEME;
            this._authority = "";
            this._username = "";
            this._password = "";
            this._port = "";
            this._path = "";
            this._query = "";
            this._fragment = "";
            this._nonHierarchical = "";
            return;
        }// end function

        public function getQueryByMap() : Object
        {
            var _loc_1:String = null;
            var _loc_2:String = null;
            var _loc_3:Array = null;
            var _loc_4:Array = null;
            var _loc_5:String = null;
            var _loc_6:String = null;
            var _loc_7:int = 0;
            var _loc_8:* = new Object();
            _loc_1 = this._query;
            _loc_3 = _loc_1.split("&");
            for each (_loc_2 in _loc_3)
            {
                
                if (_loc_2.length == 0)
                {
                    continue;
                }
                _loc_4 = _loc_2.split("=");
                if (_loc_4.length > 0)
                {
                    _loc_5 = _loc_4[0];
                }
                else
                {
                    continue;
                }
                if (_loc_4.length > 1)
                {
                    _loc_6 = _loc_4[1];
                }
                else
                {
                    _loc_6 = "";
                }
                _loc_5 = queryPartUnescape(_loc_5);
                _loc_6 = queryPartUnescape(_loc_6);
                _loc_8[_loc_5] = _loc_6;
            }
            return _loc_8;
        }// end function

        protected function constructURI(uri:String) : Boolean
        {
            if (!this.parseURI(uri))
            {
                this._valid = false;
            }
            return this.isValid();
        }// end function

        public function isRelative() : Boolean
        {
            return this._relative;
        }// end function

        public function getExtension(minusDot:Boolean = false) : String
        {
            var _loc_3:String = null;
            var _loc_4:int = 0;
            var _loc_2:* = this.getFilename();
            if (_loc_2 == "")
            {
                return String("");
            }
            _loc_4 = _loc_2.lastIndexOf(".");
            if (_loc_4 != -1)
            {
            }
            if (_loc_4 == 0)
            {
                return String("");
            }
            _loc_3 = _loc_2.substr(_loc_4);
            if (minusDot)
            {
            }
            if (_loc_3.charAt(0) == ".")
            {
                _loc_3 = _loc_3.substr(1);
            }
            return _loc_3;
        }// end function

        public function get password() : String
        {
            return URI.unescapeChars(this._password);
        }// end function

        public function setParts(schemeStr:String, authorityStr:String, portStr:String, pathStr:String, queryStr:String, fragmentStr:String) : void
        {
            this.scheme = schemeStr;
            this.authority = authorityStr;
            this.port = portStr;
            this.path = pathStr;
            this.query = queryStr;
            this.fragment = fragmentStr;
            this.hierState = true;
            return;
        }// end function

        public function set query(queryStr:String) : void
        {
            this._query = URI.fastEscapeChars(queryStr, URI.URIqueryExcludedBitmap);
            return;
        }// end function

        public function set fragment(fragmentStr:String) : void
        {
            this._fragment = URI.fastEscapeChars(fragmentStr, URIfragmentExcludedBitmap);
            return;
        }// end function

        public function get path() : String
        {
            return URI.unescapeChars(this._path);
        }// end function

        public function setQueryByMap(map:Object) : void
        {
            var _loc_2:String = null;
            var _loc_3:String = null;
            var _loc_4:String = null;
            var _loc_6:String = null;
            var _loc_7:String = null;
            var _loc_5:String = "";
            for (_loc_2 in map)
            {
                
                _loc_3 = _loc_2;
                _loc_4 = map[_loc_2];
                if (_loc_4 == null)
                {
                    _loc_4 = "";
                }
                _loc_3 = queryPartEscape(_loc_3);
                _loc_4 = queryPartEscape(_loc_4);
                _loc_6 = _loc_3;
                if (_loc_4.length > 0)
                {
                    _loc_6 = _loc_6 + "=";
                    _loc_6 = _loc_6 + _loc_4;
                }
                if (_loc_5.length != 0)
                {
                    _loc_5 = _loc_5 + "&";
                }
                _loc_5 = _loc_5 + _loc_6;
            }
            this._query = _loc_5;
            return;
        }// end function

        public function makeAbsoluteURI(base_uri:URI) : Boolean
        {
            if (!this.isAbsolute())
            {
                this.isAbsolute();
            }
            if (base_uri.isRelative())
            {
                return false;
            }
            var _loc_2:* = new URI();
            _loc_2.copyURI(base_uri);
            if (_loc_2.chdir(this.toString()) == false)
            {
                return false;
            }
            this.copyURI(_loc_2);
            return true;
        }// end function

        public function chdir(reference:String, escape:Boolean = false) : Boolean
        {
            var _loc_3:URI = null;
            var _loc_5:String = null;
            var _loc_6:String = null;
            var _loc_7:Array = null;
            var _loc_8:Array = null;
            var _loc_14:String = null;
            var _loc_15:int = 0;
            var _loc_17:String = null;
            var _loc_4:* = reference;
            if (escape)
            {
                _loc_4 = URI.escapeChars(reference);
            }
            if (_loc_4 == "")
            {
                return true;
            }
            if (_loc_4.substr(0, 2) == "//")
            {
                _loc_17 = this.scheme + ":" + _loc_4;
                return this.constructURI(_loc_17);
            }
            if (_loc_4.charAt(0) == "?")
            {
                _loc_4 = "./" + _loc_4;
            }
            _loc_3 = new URI(_loc_4);
            if (!_loc_3.isAbsolute())
            {
                _loc_3.isAbsolute();
            }
            if (_loc_3.isHierarchical() == false)
            {
                this.copyURI(_loc_3);
                return true;
            }
            var _loc_9:Boolean = false;
            var _loc_10:Boolean = false;
            var _loc_11:Boolean = false;
            var _loc_12:Boolean = false;
            var _loc_13:Boolean = false;
            _loc_5 = this.path;
            _loc_6 = _loc_3.path;
            if (_loc_5.length > 0)
            {
                _loc_7 = _loc_5.split("/");
            }
            else
            {
                _loc_7 = new Array();
            }
            if (_loc_6.length > 0)
            {
                _loc_8 = _loc_6.split("/");
            }
            else
            {
                _loc_8 = new Array();
            }
            if (_loc_7.length > 0)
            {
            }
            if (_loc_7[0] == "")
            {
                _loc_11 = true;
                _loc_7.shift();
            }
            if (_loc_7.length > 0)
            {
            }
            if (_loc_7[(_loc_7.length - 1)] == "")
            {
                _loc_9 = true;
                _loc_7.pop();
            }
            if (_loc_8.length > 0)
            {
            }
            if (_loc_8[0] == "")
            {
                _loc_12 = true;
                _loc_8.shift();
            }
            if (_loc_8.length > 0)
            {
            }
            if (_loc_8[(_loc_8.length - 1)] == "")
            {
                _loc_10 = true;
                _loc_8.pop();
            }
            if (_loc_12)
            {
                this.path = _loc_3.path;
                this.queryRaw = _loc_3.queryRaw;
                this.fragment = _loc_3.fragment;
                return true;
            }
            if (_loc_8.length == 0)
            {
            }
            if (_loc_3.query == "")
            {
                this.fragment = _loc_3.fragment;
                return true;
            }
            if (_loc_9 == false)
            {
            }
            if (_loc_7.length > 0)
            {
                _loc_7.pop();
            }
            this.queryRaw = _loc_3.queryRaw;
            this.fragment = _loc_3.fragment;
            _loc_7 = _loc_7.concat(_loc_8);
            _loc_15 = 0;
            while (_loc_15 < _loc_7.length)
            {
                
                _loc_14 = _loc_7[_loc_15];
                _loc_13 = false;
                if (_loc_14 == ".")
                {
                    _loc_7.splice(_loc_15, 1);
                    _loc_15 = _loc_15 - 1;
                    _loc_13 = true;
                }
                else if (_loc_14 == "..")
                {
                    if (_loc_15 >= 1)
                    {
                        if (_loc_7[(_loc_15 - 1)] == "..")
                        {
                        }
                        else
                        {
                            _loc_7.splice((_loc_15 - 1), 2);
                            _loc_15 = _loc_15 - 2;
                        }
                    }
                    else if (this.isRelative())
                    {
                    }
                    else
                    {
                        _loc_7.splice(_loc_15, 1);
                        _loc_15 = _loc_15 - 1;
                    }
                    _loc_13 = true;
                }
                _loc_15 = _loc_15 + 1;
            }
            var _loc_16:String = "";
            if (!_loc_10)
            {
            }
            _loc_10 = _loc_13;
            _loc_16 = this.joinPath(_loc_7, _loc_11, _loc_10);
            this.path = _loc_16;
            return true;
        }// end function

        public function get scheme() : String
        {
            return URI.unescapeChars(this._scheme);
        }// end function

        public function makeRelativeURI(base_uri:URI, caseSensitive:Boolean = true) : Boolean
        {
            var _loc_4:Array = null;
            var _loc_5:Array = null;
            var _loc_7:String = null;
            var _loc_8:String = null;
            var _loc_9:String = null;
            var _loc_13:int = 0;
            var _loc_3:* = new URI();
            _loc_3.copyURI(base_uri);
            var _loc_6:* = new Array();
            var _loc_10:* = this.path;
            var _loc_11:* = this.queryRaw;
            var _loc_12:* = this.fragment;
            var _loc_14:Boolean = false;
            var _loc_15:Boolean = false;
            if (this.isRelative())
            {
                return true;
            }
            if (_loc_3.isRelative())
            {
                return false;
            }
            if (this.isOfType(base_uri.scheme) != false)
            {
            }
            if (this.authority != base_uri.authority)
            {
                return false;
            }
            _loc_15 = this.isDirectory();
            _loc_3.chdir(".");
            _loc_4 = _loc_10.split("/");
            _loc_5 = _loc_3.path.split("/");
            if (_loc_4.length > 0)
            {
            }
            if (_loc_4[0] == "")
            {
                _loc_4.shift();
            }
            if (_loc_4.length > 0)
            {
            }
            if (_loc_4[(_loc_4.length - 1)] == "")
            {
                _loc_15 = true;
                _loc_4.pop();
            }
            if (_loc_5.length > 0)
            {
            }
            if (_loc_5[0] == "")
            {
                _loc_5.shift();
            }
            if (_loc_5.length > 0)
            {
            }
            if (_loc_5[(_loc_5.length - 1)] == "")
            {
                _loc_5.pop();
            }
            while (_loc_5.length > 0)
            {
                
                if (_loc_4.length == 0)
                {
                    break;
                }
                _loc_7 = _loc_4[0];
                _loc_8 = _loc_5[0];
                if (compareStr(_loc_7, _loc_8, caseSensitive))
                {
                    _loc_4.shift();
                    _loc_5.shift();
                    continue;
                }
                break;
            }
            var _loc_16:String = "..";
            _loc_13 = 0;
            while (_loc_13 < _loc_5.length)
            {
                
                _loc_6.push(_loc_16);
                _loc_13 = _loc_13 + 1;
            }
            _loc_6 = _loc_6.concat(_loc_4);
            _loc_9 = this.joinPath(_loc_6, false, _loc_15);
            if (_loc_9.length == 0)
            {
                _loc_9 = "./";
            }
            this.setParts("", "", "", _loc_9, _loc_11, _loc_12);
            return true;
        }// end function

        public function set password(passwordStr:String) : void
        {
            this._password = URI.fastEscapeChars(passwordStr, URI.URIuserpassExcludedBitmap);
            this.hierState = true;
            return;
        }// end function

        public function toDisplayString() : String
        {
            return this.toStringInternal(true);
        }// end function

        protected function parseURI(uri:String) : Boolean
        {
            var _loc_3:int = 0;
            var _loc_4:int = 0;
            var _loc_2:* = uri;
            this.initialize();
            _loc_3 = _loc_2.indexOf("#");
            if (_loc_3 != -1)
            {
                if (_loc_2.length > (_loc_3 + 1))
                {
                    this._fragment = _loc_2.substr((_loc_3 + 1), _loc_2.length - (_loc_3 + 1));
                }
                _loc_2 = _loc_2.substr(0, _loc_3);
            }
            _loc_3 = _loc_2.indexOf("?");
            if (_loc_3 != -1)
            {
                if (_loc_2.length > (_loc_3 + 1))
                {
                    this._query = _loc_2.substr((_loc_3 + 1), _loc_2.length - (_loc_3 + 1));
                }
                _loc_2 = _loc_2.substr(0, _loc_3);
            }
            _loc_3 = _loc_2.search(":");
            _loc_4 = _loc_2.search("/");
            var _loc_5:* = _loc_3 != -1;
            var _loc_6:* = _loc_4 != -1;
            if (_loc_6)
            {
            }
            var _loc_7:* = _loc_3 < _loc_4;
            if (_loc_5)
            {
            }
            if (_loc_7)
            {
                this._scheme = _loc_2.substr(0, _loc_3);
                this._scheme = this._scheme.toLowerCase();
                _loc_2 = _loc_2.substr((_loc_3 + 1));
                if (_loc_2.substr(0, 2) == "//")
                {
                    this._nonHierarchical = "";
                    _loc_2 = _loc_2.substr(2, _loc_2.length - 2);
                }
                else
                {
                    this._nonHierarchical = _loc_2;
                    var _loc_8:* = this.validateURI();
                    this._valid = this.validateURI();
                    if (_loc_8 == false)
                    {
                        this.initialize();
                    }
                    return this.isValid();
                }
            }
            else
            {
                this._scheme = "";
                this._relative = true;
                this._nonHierarchical = "";
            }
            if (this.isRelative())
            {
                this._authority = "";
                this._port = "";
                this._path = _loc_2;
            }
            else
            {
                if (_loc_2.substr(0, 2) == "//")
                {
                    while (_loc_2.charAt(0) == "/")
                    {
                        
                        _loc_2 = _loc_2.substr(1, (_loc_2.length - 1));
                    }
                }
                _loc_3 = _loc_2.search("/");
                if (_loc_3 == -1)
                {
                    this._authority = _loc_2;
                    this._path = "";
                }
                else
                {
                    this._authority = _loc_2.substr(0, _loc_3);
                    this._path = _loc_2.substr(_loc_3, _loc_2.length - _loc_3);
                }
                _loc_3 = this._authority.search("@");
                if (_loc_3 != -1)
                {
                    this._username = this._authority.substr(0, _loc_3);
                    this._authority = this._authority.substr((_loc_3 + 1));
                    _loc_3 = this._username.search(":");
                    if (_loc_3 != -1)
                    {
                        this._password = this._username.substring((_loc_3 + 1), this._username.length);
                        this._username = this._username.substr(0, _loc_3);
                    }
                    else
                    {
                        this._password = "";
                    }
                }
                else
                {
                    this._username = "";
                    this._password = "";
                }
                _loc_3 = this._authority.search(":");
                if (_loc_3 != -1)
                {
                    this._port = this._authority.substring((_loc_3 + 1), this._authority.length);
                    this._authority = this._authority.substr(0, _loc_3);
                }
                else
                {
                    this._port = "";
                }
                this._authority = this._authority.toLowerCase();
            }
            var _loc_8:* = this.validateURI();
            this._valid = this.validateURI();
            if (_loc_8 == false)
            {
                this.initialize();
            }
            return this.isValid();
        }// end function

        public function set username(usernameStr:String) : void
        {
            this._username = URI.fastEscapeChars(usernameStr, URI.URIuserpassExcludedBitmap);
            this.hierState = true;
            return;
        }// end function

        public function copyURI(uri:URI) : void
        {
            this._scheme = uri._scheme;
            this._authority = uri._authority;
            this._username = uri._username;
            this._password = uri._password;
            this._port = uri._port;
            this._path = uri._path;
            this._query = uri._query;
            this._fragment = uri._fragment;
            this._nonHierarchical = uri._nonHierarchical;
            this._valid = uri._valid;
            this._relative = uri._relative;
            return;
        }// end function

        public function isAbsolute() : Boolean
        {
            return !this._relative;
        }// end function

        protected function get hierState() : Boolean
        {
            return this._nonHierarchical.length == 0;
        }// end function

        public function get queryRaw() : String
        {
            return this._query;
        }// end function

        public function get query() : String
        {
            return URI.unescapeChars(this._query);
        }// end function

        public function set scheme(schemeStr:String) : void
        {
            var _loc_2:* = schemeStr.toLowerCase();
            this._scheme = URI.fastEscapeChars(_loc_2, URI.URIschemeExcludedBitmap);
            return;
        }// end function

        public function forceEscape() : void
        {
            this.scheme = this.scheme;
            this.setQueryByMap(this.getQueryByMap());
            this.fragment = this.fragment;
            if (this.isHierarchical())
            {
                this.authority = this.authority;
                this.path = this.path;
                this.port = this.port;
                this.username = this.username;
                this.password = this.password;
            }
            else
            {
                this.nonHierarchical = this.nonHierarchical;
            }
            return;
        }// end function

        public function getDefaultPort() : String
        {
            if (this._scheme == "http")
            {
                return String("80");
            }
            if (this._scheme == "ftp")
            {
                return String("21");
            }
            if (this._scheme == "file")
            {
                return String("");
            }
            if (this._scheme == "sftp")
            {
                return String("22");
            }
            return String("");
        }// end function

        public function get fragment() : String
        {
            return URI.unescapeChars(this._fragment);
        }// end function

        public function set path(pathStr:String) : void
        {
            this._path = URI.fastEscapeChars(pathStr, URI.URIpathExcludedBitmap);
            if (this._scheme == UNKNOWN_SCHEME)
            {
                this._scheme = "";
            }
            this.hierState = true;
            return;
        }// end function

        public function get authority() : String
        {
            return URI.unescapeChars(this._authority);
        }// end function

        public function isHierarchical() : Boolean
        {
            return this.hierState;
        }// end function

        protected function toStringInternal(forDisplay:Boolean) : String
        {
            var _loc_2:String = "";
            var _loc_3:String = "";
            if (this.isHierarchical() == false)
            {
                _loc_2 = _loc_2 + (forDisplay ? (this.scheme) : (this._scheme));
                _loc_2 = _loc_2 + ":";
                _loc_2 = _loc_2 + (forDisplay ? (this.nonHierarchical) : (this._nonHierarchical));
            }
            else
            {
                if (this.isRelative() == false)
                {
                    if (this._scheme.length != 0)
                    {
                        _loc_3 = forDisplay ? (this.scheme) : (this._scheme);
                        _loc_2 = _loc_2 + (_loc_3 + ":");
                    }
                    if (this._authority.length == 0)
                    {
                    }
                    if (this.isOfType("file"))
                    {
                        _loc_2 = _loc_2 + "//";
                        if (this._username.length != 0)
                        {
                            _loc_3 = forDisplay ? (this.username) : (this._username);
                            _loc_2 = _loc_2 + _loc_3;
                            if (this._password.length != 0)
                            {
                                _loc_3 = forDisplay ? (this.password) : (this._password);
                                _loc_2 = _loc_2 + (":" + _loc_3);
                            }
                            _loc_2 = _loc_2 + "@";
                        }
                        _loc_3 = forDisplay ? (this.authority) : (this._authority);
                        _loc_2 = _loc_2 + _loc_3;
                        if (this.port.length != 0)
                        {
                            _loc_2 = _loc_2 + (":" + this.port);
                        }
                    }
                }
                _loc_3 = forDisplay ? (this.path) : (this._path);
                _loc_2 = _loc_2 + _loc_3;
            }
            if (this._query.length != 0)
            {
                _loc_3 = forDisplay ? (this.query) : (this._query);
                _loc_2 = _loc_2 + ("?" + _loc_3);
            }
            if (this.fragment.length != 0)
            {
                _loc_3 = forDisplay ? (this.fragment) : (this._fragment);
                _loc_2 = _loc_2 + ("#" + _loc_3);
            }
            return _loc_2;
        }// end function

        public function get username() : String
        {
            return URI.unescapeChars(this._username);
        }// end function

        public function unknownToURI(unknown:String, defaultScheme:String = "http") : Boolean
        {
            var _loc_3:String = null;
            var _loc_5:String = null;
            if (unknown.length == 0)
            {
                this.initialize();
                return false;
            }
            unknown = unknown.replace(/\\/g, "/");
            if (unknown.length >= 2)
            {
                _loc_3 = unknown.substr(0, 2);
                if (_loc_3 == "//")
                {
                    unknown = defaultScheme + ":" + unknown;
                }
            }
            if (unknown.length >= 3)
            {
                _loc_3 = unknown.substr(0, 3);
                if (_loc_3 == "://")
                {
                    unknown = defaultScheme + unknown;
                }
            }
            var _loc_4:* = new URI(unknown);
            if (_loc_4.isHierarchical() == false)
            {
                if (_loc_4.scheme == UNKNOWN_SCHEME)
                {
                    this.initialize();
                    return false;
                }
                this.copyURI(_loc_4);
                this.forceEscape();
                return true;
            }
            else
            {
                if (_loc_4.scheme != UNKNOWN_SCHEME)
                {
                }
                if (_loc_4.scheme.length > 0)
                {
                    if (_loc_4.authority.length <= 0)
                    {
                    }
                    if (_loc_4.scheme == "file")
                    {
                        this.copyURI(_loc_4);
                        this.forceEscape();
                        return true;
                    }
                    if (_loc_4.authority.length == 0)
                    {
                    }
                    if (_loc_4.path.length == 0)
                    {
                        this.setParts(_loc_4.scheme, "", "", "", "", "");
                        return false;
                    }
                }
                else
                {
                    _loc_5 = _loc_4.path;
                    if (_loc_5 != "..")
                    {
                    }
                    if (_loc_5 != ".")
                    {
                        if (_loc_5.length >= 3)
                        {
                        }
                    }
                    if (_loc_5.substr(0, 3) != "../")
                    {
                        if (_loc_5.length >= 2)
                        {
                        }
                    }
                    if (_loc_5.substr(0, 2) == "./")
                    {
                        this.copyURI(_loc_4);
                        this.forceEscape();
                        return true;
                    }
                }
            }
            _loc_4 = new URI(defaultScheme + "://" + unknown);
            if (_loc_4.scheme.length > 0)
            {
            }
            if (_loc_4.authority.length > 0)
            {
                this.copyURI(_loc_4);
                this.forceEscape();
                return true;
            }
            this.initialize();
            return false;
        }// end function

        public function isDirectory() : Boolean
        {
            if (this._path.length == 0)
            {
                return false;
            }
            return this._path.charAt((this.path.length - 1)) == "/";
        }// end function

        protected function verifyAlpha(str:String) : Boolean
        {
            var _loc_3:int = 0;
            var _loc_2:* = /[^a-z]/;
            str = str.toLowerCase();
            _loc_3 = str.search(_loc_2);
            if (_loc_3 == -1)
            {
                return true;
            }
            return false;
        }// end function

        public function isOfFileType(extension:String) : Boolean
        {
            var _loc_2:String = null;
            var _loc_3:int = 0;
            _loc_3 = extension.lastIndexOf(".");
            if (_loc_3 != -1)
            {
                extension = extension.substr((_loc_3 + 1));
            }
            _loc_2 = this.getExtension(true);
            if (_loc_2 == "")
            {
                return false;
            }
            if (compareStr(_loc_2, extension, false) == 0)
            {
                return true;
            }
            return false;
        }// end function

        public function set nonHierarchical(nonHier:String) : void
        {
            this._nonHierarchical = URI.fastEscapeChars(nonHier, URInonHierexcludedBitmap);
            this.hierState = false;
            return;
        }// end function

        protected function joinPath(parts:Array, isAbs:Boolean, isDir:Boolean) : String
        {
            var _loc_5:int = 0;
            var _loc_4:String = "";
            _loc_5 = 0;
            while (_loc_5 < parts.length)
            {
                
                if (_loc_4.length > 0)
                {
                    _loc_4 = _loc_4 + "/";
                }
                _loc_4 = _loc_4 + parts[_loc_5];
                _loc_5 = _loc_5 + 1;
            }
            if (isDir)
            {
            }
            if (_loc_4.length > 0)
            {
                _loc_4 = _loc_4 + "/";
            }
            if (isAbs)
            {
                _loc_4 = "/" + _loc_4;
            }
            return _loc_4;
        }// end function

        public function isValid() : Boolean
        {
            return this._valid;
        }// end function

        public function toString() : String
        {
            if (this == null)
            {
                return "";
            }
            return this.toStringInternal(false);
        }// end function

        protected function validateURI() : Boolean
        {
            if (this.isAbsolute())
            {
                if (this._scheme.length > 1)
                {
                }
                if (this._scheme == UNKNOWN_SCHEME)
                {
                    return false;
                }
                if (this.verifyAlpha(this._scheme) == false)
                {
                    return false;
                }
            }
            if (this.hierState)
            {
                if (this._path.search("\\") != -1)
                {
                    return false;
                }
                if (this.isRelative() == false)
                {
                }
                if (this._scheme == UNKNOWN_SCHEME)
                {
                    return false;
                }
            }
            else if (this._nonHierarchical.search("\\") != -1)
            {
                return false;
            }
            return true;
        }// end function

        public function getRelation(uri:URI, caseSensitive:Boolean = true) : int
        {
            var _loc_9:Array = null;
            var _loc_10:Array = null;
            var _loc_11:String = null;
            var _loc_12:String = null;
            var _loc_13:int = 0;
            var _loc_3:* = URI.resolve(this);
            var _loc_4:* = URI.resolve(uri);
            if (!_loc_3.isRelative())
            {
                _loc_3.isRelative();
            }
            if (_loc_4.isRelative())
            {
                return URI.NOT_RELATED;
            }
            if (_loc_3.isHierarchical() != false)
            {
            }
            if (_loc_4.isHierarchical() == false)
            {
                if (_loc_3.isHierarchical() == false)
                {
                }
                if (_loc_4.isHierarchical() != true)
                {
                    if (_loc_3.isHierarchical() == true)
                    {
                    }
                }
                if (_loc_4.isHierarchical() == false)
                {
                    return URI.NOT_RELATED;
                }
                if (_loc_3.scheme != _loc_4.scheme)
                {
                    return URI.NOT_RELATED;
                }
                if (_loc_3.nonHierarchical != _loc_4.nonHierarchical)
                {
                    return URI.NOT_RELATED;
                }
                return URI.EQUAL;
            }
            if (_loc_3.scheme != _loc_4.scheme)
            {
                return URI.NOT_RELATED;
            }
            if (_loc_3.authority != _loc_4.authority)
            {
                return URI.NOT_RELATED;
            }
            var _loc_5:* = _loc_3.port;
            var _loc_6:* = _loc_4.port;
            if (_loc_5 == "")
            {
                _loc_5 = _loc_3.getDefaultPort();
            }
            if (_loc_6 == "")
            {
                _loc_6 = _loc_4.getDefaultPort();
            }
            if (_loc_5 != _loc_6)
            {
                return URI.NOT_RELATED;
            }
            if (compareStr(_loc_3.path, _loc_4.path, caseSensitive))
            {
                return URI.EQUAL;
            }
            var _loc_7:* = _loc_3.path;
            var _loc_8:* = _loc_4.path;
            if (_loc_7 != "/")
            {
            }
            if (_loc_8 == "/")
            {
                if (_loc_7 != "")
                {
                }
            }
            if (_loc_8 == "")
            {
                return URI.EQUAL;
            }
            _loc_9 = _loc_7.split("/");
            _loc_10 = _loc_8.split("/");
            if (_loc_9.length > _loc_10.length)
            {
                _loc_12 = _loc_10[(_loc_10.length - 1)];
                if (_loc_12.length > 0)
                {
                    return URI.NOT_RELATED;
                }
                _loc_10.pop();
                _loc_13 = 0;
                while (_loc_13 < _loc_10.length)
                {
                    
                    _loc_11 = _loc_9[_loc_13];
                    _loc_12 = _loc_10[_loc_13];
                    if (compareStr(_loc_11, _loc_12, caseSensitive) == false)
                    {
                        return URI.NOT_RELATED;
                    }
                    _loc_13 = _loc_13 + 1;
                }
                return URI.CHILD;
            }
            else if (_loc_9.length < _loc_10.length)
            {
                _loc_11 = _loc_9[(_loc_9.length - 1)];
                if (_loc_11.length > 0)
                {
                    return URI.NOT_RELATED;
                }
                _loc_9.pop();
                _loc_13 = 0;
                while (_loc_13 < _loc_9.length)
                {
                    
                    _loc_11 = _loc_9[_loc_13];
                    _loc_12 = _loc_10[_loc_13];
                    if (compareStr(_loc_11, _loc_12, caseSensitive) == false)
                    {
                        return URI.NOT_RELATED;
                    }
                    _loc_13 = _loc_13 + 1;
                }
                return URI.PARENT;
            }
            else
            {
                return URI.NOT_RELATED;
            }
        }// end function

        public function isOfType(scheme:String) : Boolean
        {
            scheme = scheme.toLowerCase();
            return this._scheme == scheme;
        }// end function

        public function getQueryValue(name:String) : String
        {
            var _loc_2:Object = null;
            var _loc_3:String = null;
            var _loc_4:String = null;
            _loc_2 = this.getQueryByMap();
            for (_loc_3 in _loc_2)
            {
                
                if (_loc_3 == name)
                {
                    _loc_4 = _loc_2[_loc_3];
                    return _loc_4;
                }
            }
            return new String("");
        }// end function

        public static function get resolver() : IURIResolver
        {
            return _resolver;
        }// end function

        static function compareStr(str1:String, str2:String, sensitive:Boolean = true) : Boolean
        {
            if (sensitive == false)
            {
                str1 = str1.toLowerCase();
                str2 = str2.toLowerCase();
            }
            return str1 == str2;
        }// end function

        public static function set resolver(resolver:IURIResolver) : void
        {
            _resolver = resolver;
            return;
        }// end function

        public static function unescapeChars(escaped:String) : String
        {
            var _loc_2:String = null;
            _loc_2 = decodeURIComponent(escaped);
            return _loc_2;
        }// end function

        public static function queryPartEscape(unescaped:String) : String
        {
            var _loc_2:* = unescaped;
            _loc_2 = URI.fastEscapeChars(unescaped, URI.URIqueryPartExcludedBitmap);
            return _loc_2;
        }// end function

        public static function escapeChars(unescaped:String) : String
        {
            return fastEscapeChars(unescaped, URI.URIbaselineExcludedBitmap);
        }// end function

        public static function fastEscapeChars(unescaped:String, bitmap:URIEncodingBitmap) : String
        {
            var _loc_4:String = null;
            var _loc_5:int = 0;
            var _loc_6:int = 0;
            var _loc_3:String = "";
            _loc_6 = 0;
            while (_loc_6 < unescaped.length)
            {
                
                _loc_4 = unescaped.charAt(_loc_6);
                _loc_5 = bitmap.ShouldEscape(_loc_4);
                if (_loc_5)
                {
                    _loc_4 = _loc_5.toString(16);
                    if (_loc_4.length == 1)
                    {
                        _loc_4 = "0" + _loc_4;
                    }
                    _loc_4 = "%" + _loc_4;
                    _loc_4 = _loc_4.toUpperCase();
                }
                _loc_3 = _loc_3 + _loc_4;
                _loc_6 = _loc_6 + 1;
            }
            return _loc_3;
        }// end function

        public static function queryPartUnescape(escaped:String) : String
        {
            var _loc_2:* = escaped;
            _loc_2 = unescapeChars(_loc_2);
            return _loc_2;
        }// end function

        static function resolve(uri:URI) : URI
        {
            var _loc_2:* = new URI;
            _loc_2.copyURI(uri);
            if (_resolver != null)
            {
                return _resolver.com.adobe.net:IURIResolver::resolve(_loc_2);
            }
            return _loc_2;
        }// end function

    }
}
