Definitions.
A	= [a-z][0-9a-zA-Z_]*
I	= [0-9]+
WS	= ([\000-\s]|%.*)

Rules.
\➸			:	{token,{module,TokenLine}}.
\➽			:	{token,{function,TokenLine}}.
\✓			:	{token,{'->',TokenLine}}.
\◤			:	{token,{'[',TokenLine}}.
\◥			:	{token,{']',TokenLine}}.
{A}			:   {token,{atom,TokenLine,list_to_atom(TokenChars)}}.
{I}			:	{token,{integer,TokenLine,list_to_integer(TokenChars)}}.
\➟			:	{token,{'<-',TokenLine}}.
\✈			:	{token,{'||',TokenLine}}.
\❤			:	{token,{heart,TokenLine}}.
\✂{WS}		:	{end_token,{dot,TokenLine}}.
{WS}+		:	skip_token.

Erlang code.