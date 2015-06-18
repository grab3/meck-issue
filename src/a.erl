-module(a).

-export([exported_fun/1]).

exported_fun(A) ->
    A.

-include_lib("eunit/include/eunit.hrl").

%% Works fine:
%%just_test() ->
%%    test1().

%%Problem occurs when using generator
setup_test_() ->
    [fun test1/0].

start()->
    ok.

stop(_)->
    ok.

test1() ->
ok.

