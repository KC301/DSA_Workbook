two_sum_sorted(Nums, Target) ->
    Indexed = lists:zip(Nums, lists:seq(0, length(Nums) - 1)),
    Sorted = lists:sort(fun({A, _}, {B, _}) -> A < B end, Indexed),
    two_pointer(Sorted, Target).

two_pointer(Sorted, Target) ->
    two_pointer(Sorted, lists:reverse(Sorted), Target).

two_pointer([{LVal, LIdx}|_], [], _Target) -> [];
two_pointer([{LVal, LIdx}=L|LTail], [{RVal, RIdx}=R|RTail], Target) ->
    case LIdx =:= RIdx of
        true -> two_pointer(LTail, RTail, Target);
        false ->
            Sum = LVal + RVal,
            case Sum of
                _ when Sum =:= Target -> [LIdx, RIdx];
                _ when Sum < Target -> two_pointer(LTail, [R|RTail], Target);
                _ -> two_pointer([L|LTail], RTail, Target)
            end
    end.