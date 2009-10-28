-module(print_forms).
-export([parse_transform/2]).

parse_transform(Forms, _Options) ->
	io:format("forms: ~p~n", [Forms]),
	Forms.


