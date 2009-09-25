#!/usr/bin/env escript
%% -*- erlang -*-
%%! -pa ebin -sasl errlog_type error -boot start_sasl

main(_) ->
	{ok, Bin} = file:read_file("src/example"),
	Forms = scan_parse([], binary_to_list(Bin), 0, []),
	io:format("forms ~p~n", [Forms]),
	%{ok, Mod, Bin} = compile:forms(Forms, []),
	%code:load_binary(Mod, "example_parser.erl", Bin),
	ok.
	
scan_parse(Cont, Str, StartLoc, Acc) ->
	case example_scanner:tokens(Cont, Str, StartLoc) of
		{done, {ok, Tokens, EndLoc}, LeftOverChars} ->
			io:format("tokens ~p~n", [Tokens]),
			{ok, Form} = example_parser:parse(Tokens),
			scan_parse([], LeftOverChars, EndLoc, [Form|Acc]);
		{done, {eof, EndLocation}, LeftOverChars} ->
			ok;
		{done, {error, ErrorInfo, EndLocation}, LeftOverChars} ->
			io:format("~p~n", [{error, ErrorInfo, EndLocation}]),
			ok;
		{more, Cont1} ->
			lists:reverse(Acc)
	end.

%% Σ Ψ Ω
%% G	= [\x3A3-\x3A9]+