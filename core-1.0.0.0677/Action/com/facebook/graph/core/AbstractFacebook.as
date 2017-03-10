package com.facebook.graph.core
{
    import com.facebook.graph.data.*;
    import com.facebook.graph.net.*;
    import com.facebook.graph.utils.*;
    import flash.net.*;
    import flash.utils.*;

    public class AbstractFacebook extends Object
    {
        protected var session:FacebookSession;
        protected var authResponse:FacebookAuthResponse;
        protected var oauth2:Boolean;
        protected var openRequests:Dictionary;
        protected var resultHash:Dictionary;
        protected var locale:String;
        protected var parserHash:Dictionary;

        public function AbstractFacebook() : void
        {
            this.openRequests = new Dictionary();
            this.resultHash = new Dictionary(true);
            this.parserHash = new Dictionary();
            return;
        }// end function

        protected function get accessToken() : String
        {
            if (this.oauth2)
            {
            }
            if (this.authResponse == null)
            {
            }
            if (this.session != null)
            {
                return this.oauth2 ? (this.authResponse.accessToken) : (this.session.accessToken);
            }
            else
            {
                return null;
            }
        }// end function

        protected function api(method:String, callback:Function = null, params = null, requestMethod:String = "GET") : void
        {
            method = method.indexOf("/") != 0 ? ("/" + method) : (method);
            if (this.accessToken)
            {
                if (params == null)
                {
                    params = {};
                }
                if (params.access_token == null)
                {
                    params.access_token = this.accessToken;
                }
            }
            var _loc_5:* = new FacebookRequest();
            if (this.locale)
            {
                params.locale = this.locale;
            }
            this.openRequests[_loc_5] = callback;
            _loc_5.call(FacebookURLDefaults.GRAPH_URL + method, requestMethod, this.handleRequestLoad, params);
            return;
        }// end function

        protected function uploadVideo(method:String, callback:Function = null, params = null) : void
        {
            method = method.indexOf("/") != 0 ? ("/" + method) : (method);
            if (this.accessToken)
            {
                if (params == null)
                {
                    params = {};
                }
                if (params.access_token == null)
                {
                    params.access_token = this.accessToken;
                }
            }
            var _loc_4:* = new FacebookRequest();
            if (this.locale)
            {
                params.locale = this.locale;
            }
            this.openRequests[_loc_4] = callback;
            _loc_4.call(FacebookURLDefaults.VIDEO_URL + method, "POST", this.handleRequestLoad, params);
            return;
        }// end function

        protected function pagingCall(url:String, callback:Function) : FacebookRequest
        {
            var _loc_3:* = new FacebookRequest();
            this.openRequests[_loc_3] = callback;
            _loc_3.callURL(this.handleRequestLoad, url, this.locale);
            return _loc_3;
        }// end function

        protected function getRawResult(data:Object) : Object
        {
            return this.resultHash[data];
        }// end function

        protected function nextPage(data:Object, callback:Function = null) : FacebookRequest
        {
            var _loc_3:FacebookRequest = null;
            var _loc_4:* = this.getRawResult(data);
            if (_loc_4)
            {
            }
            if (_loc_4.paging)
            {
            }
            if (_loc_4.paging.next)
            {
                _loc_3 = this.pagingCall(_loc_4.paging.next, callback);
            }
            else if (callback != null)
            {
                this.callback(null, "no page");
            }
            return _loc_3;
        }// end function

        protected function previousPage(data:Object, callback:Function = null) : FacebookRequest
        {
            var _loc_3:FacebookRequest = null;
            var _loc_4:* = this.getRawResult(data);
            if (_loc_4)
            {
            }
            if (_loc_4.paging)
            {
            }
            if (_loc_4.paging.previous)
            {
                _loc_3 = this.pagingCall(_loc_4.paging.previous, callback);
            }
            else if (callback != null)
            {
                this.callback(null, "no page");
            }
            return _loc_3;
        }// end function

        protected function handleRequestLoad(target:FacebookRequest) : void
        {
            var _loc_3:Object = null;
            var _loc_4:IResultParser = null;
            var _loc_2:* = this.openRequests[target];
            if (_loc_2 === null)
            {
                delete this.openRequests[target];
            }
            if (target.success)
            {
                _loc_3 = "data" in target.data ? (target.data.data) : (target.data);
                this.resultHash[_loc_3] = target.data;
                if (_loc_3.hasOwnProperty("error_code"))
                {
                    this._loc_2(null, _loc_3);
                }
                else
                {
                    if (this.parserHash[target] is IResultParser)
                    {
                        _loc_4 = this.parserHash[target] as IResultParser;
                        _loc_3 = _loc_4.parse(_loc_3);
                        this.parserHash[target] = null;
                        delete this.parserHash[target];
                    }
                    this._loc_2(_loc_3, null);
                }
            }
            else
            {
                this._loc_2(null, target.data);
            }
            delete this.openRequests[target];
            return;
        }// end function

        protected function callRestAPI(methodName:String, callback:Function = null, values = null, requestMethod:String = "GET") : void
        {
            var _loc_6:IResultParser = null;
            if (values == null)
            {
                values = {};
            }
            values.format = "json";
            if (this.accessToken)
            {
                values.access_token = this.accessToken;
            }
            if (this.locale)
            {
                values.locale = this.locale;
            }
            var _loc_5:* = new FacebookRequest();
            this.openRequests[_loc_5] = callback;
            if (this.parserHash[values["queries"]] is IResultParser)
            {
                _loc_6 = this.parserHash[values["queries"]] as IResultParser;
                this.parserHash[values["queries"]] = null;
                delete this.parserHash[values["queries"]];
                this.parserHash[_loc_5] = _loc_6;
            }
            _loc_5.call(FacebookURLDefaults.API_URL + "/method/" + methodName, requestMethod, this.handleRequestLoad, values);
            return;
        }// end function

        protected function fqlQuery(query:String, callback:Function = null, values:Object = null) : void
        {
            var _loc_4:String = null;
            for (_loc_4 in values)
            {
                
                query = query.replace(new RegExp("\\{" + _loc_4 + "\\}", "g"), values[_loc_4]);
            }
            this.callRestAPI("fql.query", callback, {query:query});
            return;
        }// end function

        protected function fqlMultiQuery(queries:FQLMultiQuery, callback:Function = null, parser:IResultParser = null) : void
        {
            this.parserHash[queries.toString()] = parser != null ? (parser) : (new FQLMultiQueryParser());
            this.callRestAPI("fql.multiquery", callback, {queries:queries.toString()});
            return;
        }// end function

        protected function batchRequest(batch:Batch, callback:Function = null) : void
        {
            var _loc_3:FacebookBatchRequest = null;
            if (this.accessToken)
            {
                _loc_3 = new FacebookBatchRequest(batch, callback);
                this.resultHash[_loc_3] = true;
                _loc_3.call(this.accessToken);
            }
            return;
        }// end function

        protected function deleteObject(method:String, callback:Function = null) : void
        {
            var _loc_3:Object = {method:"delete"};
            this.api(method, callback, _loc_3, URLRequestMethod.POST);
            return;
        }// end function

        protected function getImageUrl(id:String, type:String = null) : String
        {
            return FacebookURLDefaults.GRAPH_URL + "/" + id + "/picture" + (type != null ? ("?type=" + type) : (""));
        }// end function

    }
}
