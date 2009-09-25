-module(example).
-export([load/1]).

load(Path) ->
	{ok, Bin} = file:read_file(Path),
	[Form|Forms] = scan_parse([], binary_to_list(Bin), 0, []),
	Forms1  = [Form,{attribute,1,compile,export_all}|Forms],
	%io:format("forms ~p~n", [Forms1]),
	{ok, Mod, Bin1} = compile:forms(Forms1, []),
	code:load_binary(Mod, "example_parser.erl", Bin1).
	
scan_parse(Cont, Str, StartLoc, Acc) ->
	case example_scanner:tokens(Cont, Str, StartLoc) of
		{done, {ok, Tokens, EndLoc}, LeftOverChars} ->
			%io:format("tokens ~p~n", [Tokens]),
			{ok, Form} = example_parser:parse(Tokens),
			scan_parse([], LeftOverChars, EndLoc, [Form|Acc]);
		{done, {eof, _EndLocation}, _LeftOverChars} ->
			[];
		{done, {error, ErrorInfo, EndLocation}, _LeftOverChars} ->
			io:format("~p~n", [{error, ErrorInfo, EndLocation}]),
			[];
		{more, _Cont1} ->
			lists:reverse(Acc)
	end.

%% Σ Ψ Ω
%% G	= [\x3A3-\x3A9]+
%% ➸ dingbats ✂ 
%%  ◤ ➊ ➟ ➒➒ ✈ ❤ ◥ ✂ 