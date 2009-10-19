-module(example4).
-export([compile_and_load/1]).

compile_and_load(Path) ->
	{ok, Bin} = file:read_file(Path),
	[Form|Forms] = scan_parse([], binary_to_list(Bin), 0, []),
	Forms1  = [Form,{attribute,1,compile,export_all}|Forms],
	{ok, Mod, Bin1} = compile:forms(Forms1, []),
	code:load_binary(Mod, [], Bin1).
	
scan_parse(Cont, Str, StartLoc, Acc) ->
	case example_scanner:tokens(Cont, Str, StartLoc) of
		{done, {ok, Tokens, EndLoc}, LeftOverChars} ->
			{ok, Form} = example_parser:parse(Tokens),
			scan_parse([], LeftOverChars, EndLoc, [Form|Acc]);
		_ ->
			lists:reverse(Acc)
	end.