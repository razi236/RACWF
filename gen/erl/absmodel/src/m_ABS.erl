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
     %% RABS.abs:143--143
    put(vars, (get(vars))#{'r' => object:new(cog:start(Cog,DC),class_ResourceManager_ResourceManager,[[]],Cog,[O,DC| Stack])}),
     %% RABS.abs:144--144
    put(vars, (get(vars))#{'f' => null}),
     %% RABS.abs:145--145
    put(vars, (get(vars))#{'f1' => null}),
     %% RABS.abs:146--146
    put(vars, (get(vars))#{'f2' => null}),
     %% RABS.abs:147--147
    put(vars, (get(vars))#{'fids' => m_ABS_StdLib_funs:f_list(Cog,[],[O,DC| Stack])}),
     %% RABS.abs:148--148
    put(vars, (get(vars))#{'i' => 0}),
     %% RABS.abs:149--149
    put(vars, (get(vars))#{'o' => object:new(cog:start(Cog,DC),class_ABS_ABC,[[]],Cog,[O,DC| Stack])}),
     %% RABS.abs:150--150
    put(vars, (get(vars))#{'o1' => object:new(cog:start(Cog,DC),class_ABS_ABC,[[]],Cog,[O,DC| Stack])}),
     %% RABS.abs:151--151
    put(vars, (get(vars))#{'o2' => object:new(cog:start(Cog,DC),class_ABS_ABC,[[]],Cog,[O,DC| Stack])}),
     %% RABS.abs:152--152
    put(vars, (get(vars))#{'o3' => object:new(cog:start(Cog,DC),class_ABS_ABC,[[]],Cog,[O,DC| Stack])}),
     %% RABS.abs:153--153
    put(vars, (get(vars))#{'f' := cog:create_task(maps:get('o', get(vars)),'m_xyz',[<<"Muhammad"/utf8>>,[]],#task_info{method= <<"xyz"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline={ dataDuration,10}},Cog)}),
     %% RABS.abs:154--154
    put(vars, (get(vars))#{'f1' := cog:create_task(maps:get('o1', get(vars)),'m_abc',[<<"Rizwan"/utf8>>,[]],#task_info{method= <<"abc"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline={ dataDuration,10}},Cog)}),
     %% RABS.abs:155--155
    put(vars, (get(vars))#{'b1' => false}),
     %% RABS.abs:156--156
    put(vars, (get(vars))#{'a1' => object:new(cog:start(Cog,DC),class_ResourceManager_AwaitFut,[[]],Cog,[O,DC| Stack])}),
     %% RABS.abs:157--157
    T_1 = cog:create_task(maps:get('a1', get(vars)),'m_awaitFut',[m_ABS_StdLib_funs:f_list(Cog,[ maps:get('f', get(vars)), maps:get('f1', get(vars))] ,[O,DC| Stack]),[]],#task_info{method= <<"awaitFut"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog),
    T_1,
     %% RABS.abs:158--158
    []=(fun Loop ([])->
        case not (maps:get('b1', get(vars))) of
        false -> [];
        true -> receive
                {stop_world, CogRef} ->
                    cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                    cog:task_is_runnable(Cog,self()),
                    task:wait_for_token(Cog,[O,DC| Stack])
                after 0 -> ok
            end,
             %% RABS.abs:160--160
            put(vars, (get(vars))#{'tmp1872627924' => cog:create_task(maps:get('a1', get(vars)),'m_checkFut',[[]],#task_info{method= <<"checkFut"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog)}),
             %% RABS.abs:160--160
            future:await(maps:get('tmp1872627924', get(vars)), Cog, [O,DC| Stack]),
            ok,
             %% RABS.abs:160--160
            put(vars, (get(vars))#{'b1' := future:get_blocking(maps:get('tmp1872627924', get(vars)), Cog, [O,DC| Stack])}),
             %% RABS.abs:161--161
            cog:suspend_current_task_for_duration(Cog,1,1,[O,DC| Stack]),
            ok,
        Loop([])  end end)
    ([]),
     %% RABS.abs:163--163
    put(vars, (get(vars))#{'f2' := cog:create_task(maps:get('o2', get(vars)),'m_xyz',[<<"Ali"/utf8>>,[]],#task_info{method= <<"xyz"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline={ dataDuration,15}},Cog)}).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    runtime:start_link([m_ABS]).

stop(_State) ->
    ok.
