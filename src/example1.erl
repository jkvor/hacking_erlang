-module(example1).
-compile({parse_transform, print_forms}).
-export([foo/0]).

foo() -> "Hello Stockholm!". 


