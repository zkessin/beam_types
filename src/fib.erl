-module(fib).
-export([fib/1]).


-type color():: red | green | blue.
-record(state, {count :: integer(), color :: color()}).
-type state() :: #state{}.

-spec(fib(pos_integer()) -> pos_integer()).
fib(1) ->
    1;
fib(2) ->
    2;
fib(N)  ->
    fib(N - 1) + fib(N - 2).
