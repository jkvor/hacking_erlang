Nonterminals element module_declaration function_declaration function_body comprehension.
Terminals atom integer heart module function '[' ']' '->' '<-' '||'.
Rootsymbol element.
element -> module_declaration : '$1'.
element -> function_declaration : '$1'.
module_declaration -> module atom : {attribute,line_of('$2'),module,value_of('$2')}.
function_declaration -> function atom '->' function_body : {function,line_of('$2'),value_of('$2'),0,[{clause,line_of('$2'),[],[],'$4'}]}.
function_body -> comprehension : ['$1'].
comprehension -> '[' ']' : nil.
comprehension -> '[' integer '<-' integer '||' heart ']' :
	{lc,line_of('$2'),{var,line_of('$2'),'A'},[{generate,line_of('$2'),{var,line_of('$2'),'A'},
	{call,line_of('$2'),{remote,line_of('$2'),{atom,line_of('$2'),lists},{atom,line_of('$2'),seq}},['$2','$4']}}]}.
Endsymbol dot.

Erlang code.
value_of(Token) ->
    element(3, Token).
line_of(Token) ->
    element(2, Token).