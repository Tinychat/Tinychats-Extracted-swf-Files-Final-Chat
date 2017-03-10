package com.tinychat.model.utils.url
{

    public class Url extends Object
    {
        private var _protocol:String;
        private var _hostname:String;
        private var _port:String;
        private var _path:String;
        private var _query:QueryParameters;
        private var _hash:String;
        private var _cacheBust:Boolean;

        public function Url(param1:String = "", param2:Boolean = true)
        {
            this.cacheBust = param2;
            this.parse(param1);
            return;
        }// end function

        public function get base() : String
        {
            return this.protocol ? (this.protocol + "//" + (this.host ? (this.host + "/") : (""))) : ("");
        }// end function

        public function get cacheBust() : Boolean
        {
            return this._cacheBust;
        }// end function

        public function set cacheBust(param1:Boolean) : void
        {
            this._cacheBust = param1;
            return;
        }// end function

        public function get hash() : String
        {
            return this._hash;
        }// end function

        public function set hash(param1:String) : void
        {
            this._hash = param1.replace("#", "");
            return;
        }// end function

        public function get href() : String
        {
            var _loc_1:* = this.base;
            if (this.path)
            {
                _loc_1 = _loc_1 + this.path;
            }
            if (this.base)
            {
                if (this.query)
                {
                    _loc_1 = _loc_1 + ("?" + this.query);
                }
                if (this.cacheBust)
                {
                    _loc_1 = _loc_1 + (this.query != "" ? ("&") : ("?"));
                    _loc_1 = _loc_1 + Math.random();
                }
                if (this.hash)
                {
                    _loc_1 = _loc_1 + ("#" + this.hash);
                }
            }
            return _loc_1;
        }// end function

        public function set href(param1:String) : void
        {
            this.parse(param1);
            return;
        }// end function

        public function get host() : String
        {
            var _loc_1:* = this._hostname;
            _loc_1 = _loc_1 + (this._port ? (":" + this._port) : (""));
            return _loc_1;
        }// end function

        public function set host(param1:String) : void
        {
            if (param1.indexOf(":") >= 0)
            {
                this._hostname = param1.substring(0, param1.indexOf(":"));
                this._port = param1.substring((param1.indexOf(":") + 1), param1.length);
            }
            else
            {
                this._hostname = param1;
                this._port = "";
            }
            return;
        }// end function

        public function get hostname() : String
        {
            return this._hostname;
        }// end function

        public function set hostname(param1:String) : void
        {
            this._hostname = param1;
            return;
        }// end function

        public function get topLevelDomain() : String
        {
            return this.hostname.substr((this.hostname.lastIndexOf(".") + 1));
        }// end function

        public function get domain() : String
        {
            var _loc_1:* = this.hostname.substring(0, this.hostname.lastIndexOf("."));
            return _loc_1.substr((_loc_1.lastIndexOf(".") + 1));
        }// end function

        public function get path() : String
        {
            return this._path;
        }// end function

        public function set path(param1:String) : void
        {
            this._path = param1;
            return;
        }// end function

        public function get parameters() : QueryParameters
        {
            return this._query;
        }// end function

        public function get port() : String
        {
            return this._port;
        }// end function

        public function set port(param1:String) : void
        {
            this._port = param1;
            return;
        }// end function

        public function get protocol() : String
        {
            return this._protocol;
        }// end function

        public function set protocol(param1:String) : void
        {
            this._protocol = param1;
            return;
        }// end function

        public function get query() : String
        {
            return this._query.queryString;
        }// end function

        public function set query(param1:String) : void
        {
            this._query.queryString = param1.replace("?", "");
            return;
        }// end function

        public function addPath(param1:String) : void
        {
            if (param1)
            {
                if (this._path)
                {
                }
                if (this._path.charAt((this._path.length - 1)) != "/")
                {
                    this._path = this._path + "/";
                }
                this._path = this._path + param1;
            }
            return;
        }// end function

        public function addPaths(... args) : void
        {
            args = null;
            for (args in args)
            {
                
                this.addPath(args[args]);
            }
            return;
        }// end function

        public function valueOf() : Object
        {
            return this.href;
        }// end function

        public function toString() : String
        {
            return this.href;
        }// end function

        protected function parse(param1:String) : void
        {
            var _loc_2:* = param1.split("//");
            if (_loc_2.length > 1)
            {
                this._protocol = _loc_2.shift();
                _loc_2 = _loc_2[0].split("/");
                this.host = _loc_2.shift();
            }
            else
            {
                this.protocol = "";
                this.host = "";
            }
            var _loc_3:* = _loc_2.join("/");
            if (_loc_3.indexOf("?") >= 0)
            {
                if (_loc_3.indexOf("#") >= 0)
                {
                    if (_loc_3.indexOf("?") < _loc_3.indexOf("#"))
                    {
                        this._path = _loc_3.substring(0, _loc_3.indexOf("?"));
                        this._query = new QueryParameters(_loc_3.substring((_loc_3.indexOf("?") + 1), _loc_3.indexOf("#")));
                        this._hash = _loc_3.substring((_loc_3.indexOf("#") + 1), _loc_3.length);
                    }
                    else
                    {
                        this._path = _loc_3.substring(0, _loc_3.indexOf("#"));
                        this._query = new QueryParameters(_loc_3.substring((_loc_3.indexOf("#") + 1), _loc_3.length).replace("?", ""));
                        this._hash = "";
                    }
                }
                else
                {
                    this._path = _loc_3.substring(0, _loc_3.indexOf("?"));
                    this._query = new QueryParameters(_loc_3.substring((_loc_3.indexOf("?") + 1), _loc_3.length));
                    this._hash = "";
                }
            }
            else if (_loc_3.indexOf("#") >= 0)
            {
                this._path = _loc_3.substring(0, _loc_3.indexOf("#"));
                this._query = new QueryParameters();
                this._hash = _loc_3.substring((_loc_3.indexOf("#") + 1), _loc_3.length);
            }
            else
            {
                this._path = _loc_3.substring(0, _loc_3.length);
                this._query = new QueryParameters();
                this._hash = "";
            }
            return;
        }// end function

    }
}
