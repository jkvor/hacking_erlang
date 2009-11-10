-module(example2).
-compile({parse_transform, expand_records}).
-export([record_to_proplist/1]).
 
-record(pizza, {size, toppings, price}).
 
record_to_proplist(Rec) when is_tuple(Rec) ->
	[RecName|Fields] = tuple_to_list(Rec),
	FieldNames = expanded_record_fields(RecName),
	lists:zip(FieldNames, Fields).

% record_to_proplist(Rec) when is_tuple(Rec) ->
% 	case Rec of
% 		Pizza when is_record(Pizza, pizza) ->
% 			[{size, Pizza#pizza.size},
% 			 {toppings, Pizza#pizza.toppings},
% 			 {price, Pizza#pizza.price}];
% 		_ ->
% 			exit(wtf_do_i_do_with_this)
% 	end.
