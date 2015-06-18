-module(b).

-include_lib("eunit/include/eunit.hrl").

b_test_() ->
    {setup,
     fun() ->
             ct:pal("Calling setup"),
             ok = meck:new(a,[no_link, passthrough, no_history]),
             Fun = fun(_) -> ok end,
             ok = meck:expect(a,exported_fun, Fun)
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
