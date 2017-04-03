-module(new).

-export([init/3]).
-export([content_types_provided/2,content_types_accepted/2]).
-export([get_html/2, from_text/2, allowed_methods/2]).

init(_, _Req, _Opts) ->
	{upgrade, protocol, cowboy_rest}.
allowed_methods(Req, State) ->
	{[<<"GET">>, <<"POST">>], Req, State}.

content_types_provided(Req, State) ->
	{[{{<<"text">>, <<"html">>, '*'}, get_html}], Req, State}.

get_html(Req, State) ->
	io:format("hi"),
	{<<"<html><body>This is REST!</body></html>">>, Req, State}.

content_types_accepted(Req, State) ->
	{[{{<<"text">>, <<"plain">>}, from_text}],Req, State}.
from_text(Req, State) ->
	{ok, Req3} = cowboy_req:reply(200, [{<<"content-type">>, <<"text/plain">>}],<<"body">>, Req),
	{ok, Req3, State}.
