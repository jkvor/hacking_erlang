#!/usr/bin/env escript
%% -*- erlang -*-
%%! -pa ebin -sasl errlog_type error -boot start_sasl

main(_) ->
	{ok, Bin} = file:read_file("src/example"),
	Forms = scan_parse([], binary_to_list(Bin), 0, []),
	io:format("forms ~p~n", [Forms]),
	ok.
	
scan_parse(Cont, Str, StartLoc, Acc) ->
	case erl_scan:tokens(Cont, Str, StartLoc) of
		{done, {ok, Tokens, EndLoc}, LeftOverChars} ->
			io:format("tokens ~p~n", [Tokens]),
			{ok, Form} = example:parse(Tokens),
			scan_parse([], LeftOverChars, EndLoc, [Form|Acc]);
		{done, {eof, EndLocation}, LeftOverChars} ->
			ok;
		{done, {error, ErrorInfo, EndLocation}, LeftOverChars} ->
			ok;
		{more, Cont1} ->
			io:format("more ~p for ~p~n", [Cont1, Str]),
			lists:reverse(Acc)
	end.
