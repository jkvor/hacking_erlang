## Hacking Erlang through preprocessing presentation for EUC 2009

The preprocessing step in Erlang code compilation is largely undocumented, but very powerful. The language can be extended to include custom guards, syntax and constructs. Included in the talk are the following:

* Dynamic compilation with the erl_scan, erl_parse, epp and compile modules
* Reverse engineering compiled BEAM code into forms
* Preprocessing vs macros
* The parse_transform compile directive and example usages like:
	* adding helper functions into modules that take advantage of record definitions that aren't available at runtime
	* performing data integrity checks by expanding custom guards into additional function clauses
* Example usages of the custom_guards, dynamic_compile and excavator projects in production environments at EA

### Breakdown of Erlang compilation steps


* scan source file into tokens (erl_scan)
* parse tokens into forms (erl_parse)
* compile forms into byte code (compile)


#### overview of forms structures

#### parse_transform and custom_guards

#### example of manual compilation process and dynamic_compile module

#### reverse engineering byte code


* code:get_object_code/1, erl_pp
* erlang_protobuffs


### Meta programming

#### Making custom parsers with Yecc


* LFE
* Django Template Language


#### abstract code manipulation


* recless
* excavator
