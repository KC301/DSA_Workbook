two_sum_map(Nums, Target) ->
    two_sum_map(Nums, Target, #{}, 0).

two_sum_map([], _Target, _Map, _Idx) -> [];
two_sum_map([H|T], Target, Map, Idx) ->
    Complement = Target - H,
    case maps:get(Complement, Map, undefined) of
        undefined ->
            two_sum_map(T, Target, maps:put(H, Idx, Map), Idx + 1);
        FoundIdx ->
            [FoundIdx, Idx]
    end.