-module(user_default).
-compile(export_all).

-compile([{parse_transform, lager_transform}]).


get_types(Mod) ->
    case code:is_loaded(Mod) of
        {file,File} ->
            {ok,Core} = dialyzer_utils:get_core_from_beam(File),
            {ok, Records} = dialyzer_utils:get_record_and_type_info(Core),
            io:format("Records ~p~n~n", [Records]),
            lager:info("Records ~p", [lager:pr(Records, dialyzer_contracts)]),

            {ok, Specs, _} =                 dialyzer_utils:get_spec_info(Mod, Core, Records),
            lager:info("Specs ~p", [lager:pr(Specs, dialyzer_contracts)]),
            {Records, Specs};

        _ ->
            {error, not_found}
    end.
