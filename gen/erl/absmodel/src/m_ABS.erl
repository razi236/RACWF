-module(m_ABS).
-behaviour(application).
-include_lib("../include/abs_types.hrl").
-export([main/1]).
%% Application callbacks
-export([start/2, stop/1]).

'main'(Cog=#cog{ref=CogRef,dcobj=DC})->
    put(vars, #{}),
    C = none,
    Oid = null, % avoid self-call branch in synccall code
    O = #object{oid=Oid,cog=Cog},
    put(this, {state, none}),
    Stack = [DC],
     %% AwaitFuture.abs:59--59
    put(vars, (get(vars))#{'f' => null}),
     %% AwaitFuture.abs:60--60
    put(vars, (get(vars))#{'f1' => null}),
     %% AwaitFuture.abs:61--61
    put(vars, (get(vars))#{'c' => false}),
     %% AwaitFuture.abs:62--62
    put(vars, (get(vars))#{'d' => false}),
     %% AwaitFuture.abs:63--63
    put(vars, (get(vars))#{'fids' => m_ABS_StdLib_funs:f_list(Cog,[],[O,DC| Stack])}),
     %% AwaitFuture.abs:64--64
    put(vars, (get(vars))#{'o' => object:new(cog:start(Cog,DC),class_ABS_Payment,[[]],Cog,[O,DC| Stack])}),
     %% AwaitFuture.abs:65--65
    put(vars, (get(vars))#{'o1' => object:new(cog:start(Cog,DC),class_ABS_Payment,[[]],Cog,[O,DC| Stack])}),
     %% AwaitFuture.abs:66--66
    put(vars, (get(vars))#{'a' => object:new(cog:start(Cog,DC),class_ABS_AwaitFut,[[]],Cog,[O,DC| Stack])}),
     %% AwaitFuture.abs:67--67
    put(vars, (get(vars))#{'b' => object:new(cog:start(Cog,DC),class_ABS_AwaitFut,[[]],Cog,[O,DC| Stack])}),
     %% AwaitFuture.abs:68--68
    put(vars, (get(vars))#{'f' := cog:create_task(maps:get('o', get(vars)),'m_payInCash',[maps:get('o', get(vars)),[]],#task_info{method= <<"payInCash"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline={ dataDuration,3}},Cog)}),
     %% AwaitFuture.abs:69--69
    put(vars, (get(vars))#{'f1' := cog:create_task(maps:get('o1', get(vars)),'m_payByCard',[maps:get('o1', get(vars)),[]],#task_info{method= <<"payByCard"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline={ dataDuration,3}},Cog)}),
     %% AwaitFuture.abs:70--70
    T_1 = cog:create_task(maps:get('a', get(vars)),'m_awaitFut',[m_ABS_StdLib_funs:f_list(Cog,[ maps:get('f', get(vars))] ,[O,DC| Stack]),[]],#task_info{method= <<"awaitFut"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog),
    T_1,
     %% AwaitFuture.abs:71--71
    T_2 = cog:create_task(maps:get('b', get(vars)),'m_awaitFut',[m_ABS_StdLib_funs:f_list(Cog,[ maps:get('f1', get(vars))] ,[O,DC| Stack]),[]],#task_info{method= <<"awaitFut"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog),
    T_2,
     %% AwaitFuture.abs:72--72
    []=(fun Loop ([])->
        case not ((maps:get('c', get(vars))) or (maps:get('d', get(vars)))) of
        false -> [];
        true -> receive
                {stop_world, CogRef} ->
                    cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                    cog:task_is_runnable(Cog,self()),
                    task:wait_for_token(Cog,[O,DC| Stack])
                after 0 -> ok
            end,
             %% AwaitFuture.abs:74--74
            put(vars, (get(vars))#{'tmp655180711' => cog:create_task(maps:get('a', get(vars)),'m_checkFut',[[]],#task_info{method= <<"checkFut"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog)}),
             %% AwaitFuture.abs:74--74
            future:await(maps:get('tmp655180711', get(vars)), Cog, [O,DC| Stack]),
            ok,
             %% AwaitFuture.abs:74--74
            put(vars, (get(vars))#{'d' := future:get_blocking(maps:get('tmp655180711', get(vars)), Cog, [O,DC| Stack])}),
             %% AwaitFuture.abs:75--75
            put(vars, (get(vars))#{'tmp512029640' => cog:create_task(maps:get('b', get(vars)),'m_checkFut',[[]],#task_info{method= <<"checkFut"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog)}),
             %% AwaitFuture.abs:75--75
            future:await(maps:get('tmp512029640', get(vars)), Cog, [O,DC| Stack]),
            ok,
             %% AwaitFuture.abs:75--75
            put(vars, (get(vars))#{'c' := future:get_blocking(maps:get('tmp512029640', get(vars)), Cog, [O,DC| Stack])}),
             %% AwaitFuture.abs:76--76
            T_3 = builtin:println(Cog,iolist_to_binary([iolist_to_binary([iolist_to_binary([<<"c = "/utf8>>, builtin:toString(Cog,maps:get('c', get(vars)))]), iolist_to_binary([<<" and d = "/utf8>>, builtin:toString(Cog,maps:get('d', get(vars)))])]), <<""/utf8>>])),
            T_3,
             %% AwaitFuture.abs:77--77
            cog:suspend_current_task_for_duration(Cog,2,2,[O,DC| Stack]),
            ok,
        Loop([])  end end)
    ([]),
     %% AwaitFuture.abs:79--79
    T_3 = builtin:println(Cog,<<"Thank You for the payment :)"/utf8>>),
    T_3,
     %% AwaitFuture.abs:80--80
    put(vars, (get(vars))#{'tmp1599728268' => cog:create_task(maps:get('a', get(vars)),'m_checkFut',[[]],#task_info{method= <<"checkFut"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog)}),
     %% AwaitFuture.abs:80--80
    future:await(maps:get('tmp1599728268', get(vars)), Cog, [O,DC| Stack]),
    ok,
     %% AwaitFuture.abs:80--80
    put(vars, (get(vars))#{'d' := future:get_blocking(maps:get('tmp1599728268', get(vars)), Cog, [O,DC| Stack])}),
     %% AwaitFuture.abs:81--81
    put(vars, (get(vars))#{'tmp2066533285' => cog:create_task(maps:get('b', get(vars)),'m_checkFut',[[]],#task_info{method= <<"checkFut"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog)}),
     %% AwaitFuture.abs:81--81
    future:await(maps:get('tmp2066533285', get(vars)), Cog, [O,DC| Stack]),
    ok,
     %% AwaitFuture.abs:81--81
    put(vars, (get(vars))#{'c' := future:get_blocking(maps:get('tmp2066533285', get(vars)), Cog, [O,DC| Stack])}),
     %% AwaitFuture.abs:82--82
    T_4 = builtin:println(Cog,iolist_to_binary([iolist_to_binary([iolist_to_binary([<<"c = "/utf8>>, builtin:toString(Cog,maps:get('c', get(vars)))]), iolist_to_binary([<<" and d = "/utf8>>, builtin:toString(Cog,maps:get('d', get(vars)))])]), <<""/utf8>>])),
    T_4.

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    runtime:start_link([m_ABS]).

stop(_State) ->
    ok.
