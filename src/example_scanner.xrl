Definitions.
A	= [a-z][0-9a-zA-Z_]*
WS	= ([\000-\s]|%.*)

Rules.
\(		:	{token,{'(',TokenLine}}.
\)		:	{token,{')',TokenLine}}.
{A}		:	{token,{atom,TokenLine,list_to_atom(TokenChars)}}.
\Δ		:	{token,{atom,TokenLine,delta}}.
\Θ		:	{token,{atom,TokenLine,theta}}.
\Σ		:	{token,{atom,TokenLine,sigma}}.
\Ω		:	{token,{atom,TokenLine,omega}}.
\.{WS}	:	{end_token,{dot,TokenLine}}.
{WS}+	:	skip_token.

Erlang code.