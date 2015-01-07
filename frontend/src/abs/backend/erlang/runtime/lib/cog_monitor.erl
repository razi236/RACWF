%%This file is licensed under the terms of the Modified BSD License.

%%This is a callback for the eventstream and manages sets of active and idle cogs, and reports back if all cogs are idle

-module(cog_monitor).
-behaviour(gen_event).

-export([waitfor/0]).
-export([init/1,handle_event/2,handle_call/2,terminate/2,handle_info/2,code_change/3]).

%% - main=this
%% - active=cogs with running process
%% - idle=idle cogs
%% - clock_waiting={P,Cog,Min,Max}: processes with their cog waiting
%%   for simulated time to advance, with minimum and maximum waiting
%%   time.  Ordered by ascending maximum waiting time (head of list =
%%   MTE [Maximum Time Elapse]).
%% - timer=timeout callback before terminating program
%%
%% Simulation ends when no cog is active or waiting for the clock.
-record(state,{main,active,idle,clock_waiting,timer}).
%%External function

%% Waits until all cogs are idle
waitfor()->
    receive
        wait_done ->
            ok
    end.    

%% Behaviour callbacks

%%The callback gets as parameter the pid of the runtime process, which waits for all cogs to be idle
init([Main])->
    {ok,#state{main=Main,active=gb_sets:empty(),idle=gb_sets:empty(),clock_waiting=[]}}.

handle_event({cog,Cog,active},State=#state{active=A,idle=I,timer=T})->
    A1=gb_sets:add_element(Cog,A),
    I1=gb_sets:del_element(Cog,I),
    cancel(T),
    {ok,State#state{active=A1,idle=I1,timer=undefined}};
handle_event({cog,Cog,idle},State=#state{active=A,idle=I})->
    A1=gb_sets:del_element(Cog,A),
    I1=gb_sets:add_element(Cog,I),
    case gb_sets:is_empty(A1) of
        true->
            {ok, handle_no_active(State#state{active=A1,idle=I1})};
        false->
            {ok,State#state{active=A1,idle=I1}}
    end;
handle_event({cog,Cog,die},State=#state{active=A,idle=I})->
    A1=gb_sets:del_element(Cog,A),
    I1=gb_sets:del_element(Cog,I),
    case gb_sets:is_empty(A1) of
        true->
            {ok, handle_no_active(State#state{active=A1,idle=I1})};
        false->
            {ok,State#state{active=A1,idle=I1}}
    end;
handle_event({task,P,Cog,clock_waiting,Min,Max}, State=#state{clock_waiting=C}) ->
    C1=lists:keymerge(2,C,[{Min,Max,P,Cog}]),
    {ok,State#state{clock_waiting=C1}};
handle_event(_,State)->
    {ok,State}.

%%Unused
handle_call(_,_State)->
    {not_supported_call}.


handle_info(M,_State)->
    {not_supported_msg,M}.

terminate(Arg,_State)->
    {error,Arg}.

code_change(_OldVsn,_State,_Extra)->
    {not_supported}.

%%Private
cancel(undefined)->
    ok;
cancel(TRef)->
    {ok,cancel}=timer:cancel(TRef).

handle_no_active(State=#state{main=M,clock_waiting=C,timer=T}) ->
    case C of
        [] ->
            {ok,T1} = case T of
                          undefined -> timer:send_after(1000,M,wait_done);
                          _ -> {ok,T}
                      end,
            State#state{timer=T1};
        [{_, MTE, _, _} | _] ->
            C2=lists:filtermap(
                 fun({Min, Max, Task, Cog}) ->
                         case cmp:le(Min, MTE) of
                             true ->
                                 Task ! clock_finished,
                                 false;
                             false -> 
                                 {true, {rationals:fast_sub(rationals:to_r(Min),
                                                            rationals:to_r(MTE)), 
                                         rationals:fast_sub(rationals:to_r(Max),
                                                            rationals:to_r(MTE)),
                                         Task, Cog}} end end,
                 C),
            State#state{clock_waiting=C2}
    end .
