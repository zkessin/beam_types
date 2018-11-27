-module(user_default).
-compile(export_all).



get_types(Mod) ->
    case code:is_loaded(Mod) of
        {file,File} ->
            {ok,Core} = dialyzer_utils:get_core_from_beam(File),
            {ok, Records} = dialyzer_utils:get_record_and_type_info(Core),
            io:format("Records ~p~n~n", [Records]),
            io:format("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&~n"),
            dialyzer_utils:get_spec_info(Mod, Core, Records);
        _ ->
            {error, not_found}
    end.
