-module(example2).
-compile({parse_transform, expand_records}).
-export([encode_record/1]).
 
-record(pizza, {size, toppings, price}).
 
encode_record(Rec) ->
	[RecName|Fields] = tuple_to_list(Rec),
	FieldNames = expanded_record_fields(RecName),
	lists:zip(FieldNames, Fields).


encode_record(Rec) ->
	case Rec of
		Pizza when is_record(Pizza, pizza) ->
			[{size, Pizza#pizza.size},
			 {toppings, Pizza#pizza.toppings},
			 {price, Pizza#pizza.price}];
		_ ->
			exit(wtf_do_i_do_with_this)
	end.