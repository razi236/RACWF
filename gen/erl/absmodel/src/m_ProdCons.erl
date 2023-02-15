-module(m_ProdCons).
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
     %% ABS.rpl:167--167
    put(vars, (get(vars))#{'rm' => object:new(cog:start(Cog,DC),class_ABS_ResourceManager_ResourceManager,[[]],Cog,[O,DC| Stack])}),
     %% ABS.rpl:168--168
    put(vars, (get(vars))#{'tmp1768641212' => cog:create_task(maps:get('rm', get(vars)),'m_addRes',[m_ABS_StdLib_funs:f_list(Cog,[ m_ABS_StdLib_funs:f_set(Cog,[ dataPathologist, { dataEfficiency,3}] ,[O,DC| Stack]), m_ABS_StdLib_funs:f_set(Cog,[ dataBioTechnician, { dataEfficiency,5}] ,[O,DC| Stack]), m_ABS_StdLib_funs:f_set(Cog,[ dataBioTechnician, { dataEfficiency,3}] ,[O,DC| Stack]), m_ABS_StdLib_funs:f_set(Cog,[ dataBioTechnician, { dataEfficiency,10}] ,[O,DC| Stack]), m_ABS_StdLib_funs:f_set(Cog,[ dataVanDriver, { dataEfficiency,5}] ,[O,DC| Stack]), m_ABS_StdLib_funs:f_set(Cog,[ dataDeliveryVan, { dataEfficiency,1500}] ,[O,DC| Stack]), m_ABS_StdLib_funs:f_set(Cog,[ dataBioTechnician, { dataEfficiency,2}] ,[O,DC| Stack]), m_ABS_StdLib_funs:f_set(Cog,[ dataBioTechnician, { dataEfficiency,2}] ,[O,DC| Stack]), m_ABS_StdLib_funs:f_set(Cog,[ dataBioTechnician, { dataEfficiency,2}] ,[O,DC| Stack]), m_ABS_StdLib_funs:f_set(Cog,[ dataBioTechnician, { dataEfficiency,2}] ,[O,DC| Stack]), m_ABS_StdLib_funs:f_set(Cog,[ dataProcessingMachine, { dataEfficiency,10}] ,[O,DC| Stack]), m_ABS_StdLib_funs:f_set(Cog,[ dataProcessingMachine, { dataEfficiency,10}] ,[O,DC| Stack]), m_ABS_StdLib_funs:f_set(Cog,[ dataStainingMachine, { dataEfficiency,5}] ,[O,DC| Stack]), m_ABS_StdLib_funs:f_set(Cog,[ dataStainingMachine, { dataEfficiency,5}] ,[O,DC| Stack]), m_ABS_StdLib_funs:f_set(Cog,[ dataPathologist, { dataEfficiency,2}] ,[O,DC| Stack]), m_ABS_StdLib_funs:f_set(Cog,[ dataHeadWaiter, { dataEfficiency,2}] ,[O,DC| Stack]), m_ABS_StdLib_funs:f_set(Cog,[ dataRunnerWaiter, { dataEfficiency,1}] ,[O,DC| Stack]), m_ABS_StdLib_funs:f_set(Cog,[ dataRunnerWaiter, { dataEfficiency,1}] ,[O,DC| Stack]), m_ABS_StdLib_funs:f_set(Cog,[ dataCook, { dataEfficiency,5}] ,[O,DC| Stack]), m_ABS_StdLib_funs:f_set(Cog,[ dataCookAssistant, { dataEfficiency,1}] ,[O,DC| Stack]), m_ABS_StdLib_funs:f_set(Cog,[ dataCookAssistant, { dataEfficiency,1}] ,[O,DC| Stack]), m_ABS_StdLib_funs:f_set(Cog,[ dataCookAssistant, { dataEfficiency,1}] ,[O,DC| Stack]), m_ABS_StdLib_funs:f_set(Cog,[ dataCook, { dataEfficiency,3}] ,[O,DC| Stack])] ,[O,DC| Stack]),[]],#task_info{method= <<"addRes"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog)}),
     %% ABS.rpl:168--168
    future:await(maps:get('tmp1768641212', get(vars)), Cog, [O,DC| Stack]),
    ok,
     %% ABS.rpl:169--169
    put(vars, (get(vars))#{'fp1' => null}),
     %% ABS.rpl:170--170
    put(vars, (get(vars))#{'fp2' => null}),
     %% ABS.rpl:171--171
    put(vars, (get(vars))#{'fc1' => null}),
     %% ABS.rpl:172--172
    put(vars, (get(vars))#{'fc2' => null}),
     %% ABS.rpl:173--173
    put(vars, (get(vars))#{'p' => object:new(cog:start(Cog,DC),class_ProdCons_Producer,[[]],Cog,[O,DC| Stack])}),
     %% ABS.rpl:174--174
    put(vars, (get(vars))#{'c' => object:new(cog:start(Cog,DC),class_ProdCons_Consumer,[[]],Cog,[O,DC| Stack])}),
     %% ABS.rpl:175--175
    put(vars, (get(vars))#{'k1' => builtin:random(Cog,10)}),
     %% ABS.rpl:176--176
    put(vars, (get(vars))#{'k2' => builtin:random(Cog,10)}),
     %% ABS.rpl:177--177
    cog:block_current_task_for_duration(Cog,maps:get('k1', get(vars)),maps:get('k1', get(vars)),[O,DC| Stack]),
     %% ABS.rpl:178--178
    put(vars, (get(vars))#{'fp1' := cog:create_task(maps:get('p', get(vars)),'m_produce',[maps:get('rm', get(vars)),10,[]],#task_info{method= <<"produce"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline={ dataDuration,15}},Cog)}),
     %% ABS.rpl:181--181
    put(vars, (get(vars))#{'b1' => false}),
     %% ABS.rpl:182--182
    put(vars, (get(vars))#{'a1' => object:new(cog:start(Cog,DC),class_ABS_ResourceManager_AwaitFut,[[]],Cog,[O,DC| Stack])}),
     %% ABS.rpl:183--183
    T_1 = cog:create_task(maps:get('a1', get(vars)),'m_awaitFut',[m_ABS_StdLib_funs:f_list(Cog,[ maps:get('fp1', get(vars))] ,[O,DC| Stack]),[]],#task_info{method= <<"awaitFut"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog),
    T_1,
     %% ABS.rpl:184--184
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
             %% ABS.rpl:186--186
            put(vars, (get(vars))#{'tmp1946815838' => cog:create_task(maps:get('a1', get(vars)),'m_checkFut',[[]],#task_info{method= <<"checkFut"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog)}),
             %% ABS.rpl:186--186
            future:await(maps:get('tmp1946815838', get(vars)), Cog, [O,DC| Stack]),
            ok,
             %% ABS.rpl:186--186
            put(vars, (get(vars))#{'b1' := future:get_blocking(maps:get('tmp1946815838', get(vars)), Cog, [O,DC| Stack])}),
             %% ABS.rpl:187--187
            cog:suspend_current_task_for_duration(Cog,1,1,[O,DC| Stack]),
            ok,
        Loop([])  end end)
    ([]),
     %% ABS.rpl:190--190
    put(vars, (get(vars))#{'fp2' := cog:create_task(maps:get('p', get(vars)),'m_produce',[maps:get('rm', get(vars)),10,[]],#task_info{method= <<"produce"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline={ dataDuration,15}},Cog)}),
     %% ABS.rpl:191--191
    cog:block_current_task_for_duration(Cog,maps:get('k2', get(vars)),maps:get('k2', get(vars)),[O,DC| Stack]),
     %% ABS.rpl:192--192
    put(vars, (get(vars))#{'fc1' := cog:create_task(maps:get('c', get(vars)),'m_consume',[maps:get('rm', get(vars)),5,[]],#task_info{method= <<"consume"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline={ dataDuration,10}},Cog)}),
     %% ABS.rpl:193--193
    put(vars, (get(vars))#{'fc2' := cog:create_task(maps:get('c', get(vars)),'m_consume',[maps:get('rm', get(vars)),5,[]],#task_info{method= <<"consume"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline={ dataDuration,10}},Cog)}),
     %% ABS.rpl:194--194
    future:await(maps:get('fc1', get(vars)), Cog, [O,DC| Stack]),
    ok,
     %% ABS.rpl:195--195
    future:await(maps:get('fc2', get(vars)), Cog, [O,DC| Stack]),
    ok.

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    runtime:start_link([m_ProdCons]).

stop(_State) ->
    ok.
