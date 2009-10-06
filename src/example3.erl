-module(example3).
-export([forms/1, source/1]).

forms(BeamFilePath) ->
	{ok,{_,[{abstract_code,{_,Forms}}]}} = beam_lib:chunks(BeamFilePath, [abstract_code]),
	Forms.
	
source(BeamFilePath) ->
	Forms = forms(BeamFilePath),
	erl_prettypr:format(erl_syntax:form_list(Forms)).
	
	
