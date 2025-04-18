-module(two_sum).
-export([two_sum/2]).

two_sum(Nums, Target) ->
    two_sum_loop(Nums, Target, 0).

two_sum_loop([], _Target, _I) -> [];
two_sum_loop([H|T], Target, I) ->
    case find_match(T, Target - H, I + 1) of
        {ok, J} -> [I, J];
        not_found -> two_sum_loop(T, Target, I + 1)
    end.

find_match([], _Target, _J) -> not_found;
find_match([H|T], Target, J) ->
    if H =:= Target -> {ok, J};
       true -> find_match(T, Target, J + 1)
    end.