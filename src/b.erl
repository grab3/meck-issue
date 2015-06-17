-module(b).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

b_test_() ->
    {setup,
     fun() ->
             ok = meck:new(a,[no_link, passthrough, no_history]),
             FunC = fun(_) -> ok end,
             ok = meck:expect(a,exported_fun, FunC)
     end,
     fun(_) -> 
             meck:unload(a)
     end,
     fun(_) ->
	     [
              ?_assert(true)
	     ]
     end
    }.

-endif.
