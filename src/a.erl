-module(a).

-export([exported_fun/1]).

exported_fun(A) ->
    A.

-ifndef(NDEBUG).
-include_lib("eunit/include/eunit.hrl").
setup_test_() ->
    {setup, fun start/0, fun stop/1,{timeout, 10, [fun test1/0]}}.


start()->
    ok.

stop(_)->
    ok.

test1() ->
ok.

-endif.
