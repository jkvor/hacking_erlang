#!/usr/local/bin/escript
%% -*- erlang -*-
%%! -pa ebin -sasl errlog_type error -boot start_sasl -noshell

main(_) ->
	Str = "
		-module(example1).
		-export([foo/0]).
		
		foo() -> \"Hello Stockholm!\".
		
		goodbye() ->
			[A || A <- lists:seq(1,10)].
			
		",

	Forms = to_forms([], Str, 0, []),
	io:format("~p~n", [Forms]),
	{ok, Mod, Bin} = compile:forms(Forms, []),
	code:load_binary(Mod, "compiled_from_string.erl", Bin),
	io:format("~s~n", [foo:hello()]),

	ok.
	
to_forms(Cont, Str, StartLoc, Acc) ->
	case erl_scan:tokens(Cont, Str, StartLoc) of
		{done, {ok, Tokens, EndLocation}, LeftOverChars} ->
			{ok, Form} = erl_parse:parse_form(Tokens),
			to_forms([], LeftOverChars, EndLocation, [Form|Acc]);
		_ ->
			lists:reverse(Acc)
	end.