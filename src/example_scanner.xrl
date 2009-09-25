Definitions.

A = [a-zA-Z0-9].

Rules.

\( :
  {token,{atom,TokenLine,'('}}.

\) :
  {token,{atom,TokenLine,')'}}.

{A}+ :
  {token,{atom,TokenLine,list_to_atom(TokenChars)}}.

Erlang code.