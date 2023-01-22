-module(class_ABS_DC_CloudProvider).
-include_lib("../include/abs_types.hrl").
-behaviour(object).
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"CloudProviderForDeploymentComponent">>, <<"Object">>, <<"CloudProvider">> ].

exported() -> #{  }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_ABS_DC_CloudProvider,'name'=null,'instanceDescriptions'=null,'launchedInstances'=null,'acquiredInstances'=null,'killedInstances'=null,'nextInstanceId'=null,'accumulatedCostOfKilledDCs'=null}).
'init_internal'()->
    #state{}.

 %% RPL/lang/RPLlang.RPL:864
'get_val_internal'(#state{'name'=G},'name')->
    object:register_read('name'),
    G;
 %% RPL/lang/RPLlang.RPL:868
'get_val_internal'(#state{'instanceDescriptions'=G},'instanceDescriptions')->
    object:register_read('instanceDescriptions'),
    G;
 %% RPL/lang/RPLlang.RPL:871
'get_val_internal'(#state{'launchedInstances'=G},'launchedInstances')->
    object:register_read('launchedInstances'),
    G;
 %% RPL/lang/RPLlang.RPL:873
'get_val_internal'(#state{'acquiredInstances'=G},'acquiredInstances')->
    object:register_read('acquiredInstances'),
    G;
 %% RPL/lang/RPLlang.RPL:874
'get_val_internal'(#state{'killedInstances'=G},'killedInstances')->
    object:register_read('killedInstances'),
    G;
 %% RPL/lang/RPLlang.RPL:875
'get_val_internal'(#state{'nextInstanceId'=G},'nextInstanceId')->
    object:register_read('nextInstanceId'),
    G;
 %% RPL/lang/RPLlang.RPL:876
'get_val_internal'(#state{'accumulatedCostOfKilledDCs'=G},'accumulatedCostOfKilledDCs')->
    object:register_read('accumulatedCostOfKilledDCs'),
    G;
'get_val_internal'(_,_)->
    %% Invalid return value; handled by HTTP API when querying for non-existant field.
    %% Will never occur in generated code.
    none.

 %% RPL/lang/RPLlang.RPL:864
'set_val_internal'(S,'name',V)->
    object:register_write('name'),
    S#state{'name'=V};
 %% RPL/lang/RPLlang.RPL:868
'set_val_internal'(S,'instanceDescriptions',V)->
    object:register_write('instanceDescriptions'),
    S#state{'instanceDescriptions'=V};
 %% RPL/lang/RPLlang.RPL:871
'set_val_internal'(S,'launchedInstances',V)->
    object:register_write('launchedInstances'),
    S#state{'launchedInstances'=V};
 %% RPL/lang/RPLlang.RPL:873
'set_val_internal'(S,'acquiredInstances',V)->
    object:register_write('acquiredInstances'),
    S#state{'acquiredInstances'=V};
 %% RPL/lang/RPLlang.RPL:874
'set_val_internal'(S,'killedInstances',V)->
    object:register_write('killedInstances'),
    S#state{'killedInstances'=V};
 %% RPL/lang/RPLlang.RPL:875
'set_val_internal'(S,'nextInstanceId',V)->
    object:register_write('nextInstanceId'),
    S#state{'nextInstanceId'=V};
 %% RPL/lang/RPLlang.RPL:876
'set_val_internal'(S,'accumulatedCostOfKilledDCs',V)->
    object:register_write('accumulatedCostOfKilledDCs'),
    S#state{'accumulatedCostOfKilledDCs'=V}.

'get_state_for_modelapi'(S)->
    [
        { 'name', S#state.'name' }
        , { 'instanceDescriptions', S#state.'instanceDescriptions' }
        , { 'launchedInstances', S#state.'launchedInstances' }
        , { 'acquiredInstances', S#state.'acquiredInstances' }
        , { 'killedInstances', S#state.'killedInstances' }
        , { 'nextInstanceId', S#state.'nextInstanceId' }
        , { 'accumulatedCostOfKilledDCs', S#state.'accumulatedCostOfKilledDCs' }
    ].
%% --- Constructor: field initializers and init block

'init'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},[P_name,Stack])->
    C=(get(this))#state.class,
    put(vars, #{}),
    put(this, C:set_val_internal(get(this),'name',P_name)),
     %% RPL/lang/RPLlang.RPL:868--868
    put(this, C:set_val_internal(get(this),'instanceDescriptions',m_ABS_StdLib_funs:f_map(Cog,[],[O,DC| Stack]))),
     %% RPL/lang/RPLlang.RPL:871--871
    put(this, C:set_val_internal(get(this),'launchedInstances',m_ABS_StdLib_funs:f_set(Cog,[],[O,DC| Stack]))),
     %% RPL/lang/RPLlang.RPL:873--873
    put(this, C:set_val_internal(get(this),'acquiredInstances',m_ABS_StdLib_funs:f_set(Cog,[],[O,DC| Stack]))),
     %% RPL/lang/RPLlang.RPL:874--874
    put(this, C:set_val_internal(get(this),'killedInstances',m_ABS_StdLib_funs:f_set(Cog,[],[O,DC| Stack]))),
     %% RPL/lang/RPLlang.RPL:875--875
    put(this, C:set_val_internal(get(this),'nextInstanceId',0)),
     %% RPL/lang/RPLlang.RPL:876--876
    put(this, C:set_val_internal(get(this),'accumulatedCostOfKilledDCs',0)),
    gc:register_object(O),
    O.
%% --- Class has no recovery block

%% --- Methods

 %% RPL/lang/RPLlang.RPL:878
 %% RPL/lang/RPLlang.RPL:878
'm_shutdown'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% RPL/lang/RPLlang.RPL:880--880
        skip,
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method shutdown and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% RPL/lang/RPLlang.RPL:883
 %% RPL/lang/RPLlang.RPL:883
'm_createInstance'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_instancename_0,V_d_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'instancename' => V_instancename_0,
 'd' => V_d_0 }),
    try
         %% RPL/lang/RPLlang.RPL:884--884
        put(vars, (get(vars))#{'mightNeedToStartAccounting' => m_ABS_StdLib_funs:f_emptySet(Cog,C:get_val_internal(get(this), 'launchedInstances'),[O,DC| Stack])}),
         %% RPL/lang/RPLlang.RPL:885--886
        put(vars, (get(vars))#{'result' => object:new(cog:start(Cog,DC),class_ABS_DC_DeploymentComponent,[iolist_to_binary([iolist_to_binary([maps:get('instancename', get(vars)), <<"-"/utf8>>]), builtin:toString(Cog,C:get_val_internal(get(this), 'nextInstanceId'))]),maps:get('d', get(vars)),[]],Cog,[O,DC| Stack])}),
         %% RPL/lang/RPLlang.RPL:887--887
        T_1 = cog:create_task(maps:get('result', get(vars)),'m_setProvider',[O,[]],#task_info{method= <<"setProvider"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog),
        T_1,
         %% RPL/lang/RPLlang.RPL:888--888
        put(this, C:set_val_internal(get(this), 'nextInstanceId',(C:get_val_internal(get(this), 'nextInstanceId') + 1) )),
         %% RPL/lang/RPLlang.RPL:891--891
        put(vars, (get(vars))#{'nullWorkAround' => maps:get('result', get(vars))}),
         %% RPL/lang/RPLlang.RPL:892--892
        put(this, C:set_val_internal(get(this), 'launchedInstances',m_ABS_StdLib_funs:f_insertElement(Cog,C:get_val_internal(get(this), 'launchedInstances'),maps:get('nullWorkAround', get(vars)),[O,DC| Stack]))),
         %% RPL/lang/RPLlang.RPL:893--893
        maps:get('result', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method createInstance and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% RPL/lang/RPLlang.RPL:896
 %% RPL/lang/RPLlang.RPL:896
'm_prelaunchInstance'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_d_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'd' => V_d_0 }),
    try
         %% RPL/lang/RPLlang.RPL:897--897
        put(vars, (get(vars))#{'result' => (fun() -> case O of
            null -> throw(dataNullPointerException);
            Callee=#object{oid=Oid,cog=Cog} ->
                %% self-call
                Vars=get(vars),
                Result=C:'m_createInstance'(Callee,C:get_val_internal(get(this), 'name'),maps:get('d', get(vars)),[O,DC,Vars| Stack]),
                put(vars, Vars),
                Result;
            Callee=#object{oid=ObjRef,cog=Cog} ->
                %% cog-local call
                V_instancename = C:get_val_internal(get(this), 'name'),
                V_d = maps:get('d', get(vars)),
                State=get(this),
                Vars=get(vars),
                cog:object_state_changed(Cog, O, State),
                put(this,cog:get_object_state(Callee#object.cog, Callee)),
                put(task_info,(get(task_info))#task_info{this=Callee}),
                T=object:get_class_from_state(get(this)), % it's the callee state already
                Result=T:'m_createInstance'(Callee, V_instancename, V_d,[O,DC,Vars,State| Stack]),
                cog:object_state_changed(Callee#object.cog, Callee, get(this)),
                put(task_info,(get(task_info))#task_info{this=O}),
                put(this, cog:get_object_state(Cog, O)),
                put(vars, Vars),
                Result;
            Callee ->
                %% remote call
                TempFuture = cog:create_task(Callee,'m_createInstance',[C:get_val_internal(get(this), 'name'),maps:get('d', get(vars)),[]],#task_info{method= <<"createInstance"/utf8>>},Cog),
                future:get_blocking(TempFuture, Cog, [O,DC| Stack])
        end end)()}),
         %% RPL/lang/RPLlang.RPL:898--898
        put(vars, (get(vars))#{'tmp1448580731' => cog:create_task(maps:get('result', get(vars)),'m_getStartupDuration',[[]],#task_info{method= <<"getStartupDuration"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog)}),
         %% RPL/lang/RPLlang.RPL:898--898
        future:await(maps:get('tmp1448580731', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% RPL/lang/RPLlang.RPL:898--898
        put(vars, (get(vars))#{'startup_duration' => future:get_blocking(maps:get('tmp1448580731', get(vars)), Cog, [O,DC| Stack])}),
         %% RPL/lang/RPLlang.RPL:899--899
        cog:suspend_current_task_for_duration(Cog,maps:get('startup_duration', get(vars)),maps:get('startup_duration', get(vars)),[O,DC| Stack]),
        ok,
         %% RPL/lang/RPLlang.RPL:900--900
        maps:get('result', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method prelaunchInstance and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% RPL/lang/RPLlang.RPL:903
 %% RPL/lang/RPLlang.RPL:903
'm_prelaunchInstanceNamed'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_instancename_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'instancename' => V_instancename_0 }),
    try
         %% RPL/lang/RPLlang.RPL:904--904
        put(vars, (get(vars))#{'mconfig' => m_ABS_StdLib_funs:f_lookup(Cog,C:get_val_internal(get(this), 'instanceDescriptions'),maps:get('instancename', get(vars)),[O,DC| Stack])}),
         %% RPL/lang/RPLlang.RPL:905--905
        put(vars, (get(vars))#{'dc' => null}),
         %% RPL/lang/RPLlang.RPL:906--906
        case m_ABS_StdLib_funs:f_isJust(Cog,maps:get('mconfig', get(vars)),[O,DC| Stack]) of
            true ->  %% RPL/lang/RPLlang.RPL:907--907
            put(vars, (get(vars))#{'config' => m_ABS_StdLib_funs:f_fromJust(Cog,maps:get('mconfig', get(vars)),[O,DC| Stack])}),
             %% RPL/lang/RPLlang.RPL:908--908
            put(vars, (get(vars))#{'dc' := (fun() -> case O of
                null -> throw(dataNullPointerException);
                Callee=#object{oid=Oid,cog=Cog} ->
                    %% self-call
                    Vars=get(vars),
                    Result=C:'m_createInstance'(Callee,iolist_to_binary([iolist_to_binary([C:get_val_internal(get(this), 'name'), <<"-"/utf8>>]), maps:get('instancename', get(vars))]),maps:get('config', get(vars)),[O,DC,Vars| Stack]),
                    put(vars, Vars),
                    Result;
                Callee=#object{oid=ObjRef,cog=Cog} ->
                    %% cog-local call
                    V_instancename = iolist_to_binary([iolist_to_binary([C:get_val_internal(get(this), 'name'), <<"-"/utf8>>]), maps:get('instancename', get(vars))]),
                    V_d = maps:get('config', get(vars)),
                    State=get(this),
                    Vars=get(vars),
                    cog:object_state_changed(Cog, O, State),
                    put(this,cog:get_object_state(Callee#object.cog, Callee)),
                    put(task_info,(get(task_info))#task_info{this=Callee}),
                    T=object:get_class_from_state(get(this)), % it's the callee state already
                    Result=T:'m_createInstance'(Callee, V_instancename, V_d,[O,DC,Vars,State| Stack]),
                    cog:object_state_changed(Callee#object.cog, Callee, get(this)),
                    put(task_info,(get(task_info))#task_info{this=O}),
                    put(this, cog:get_object_state(Cog, O)),
                    put(vars, Vars),
                    Result;
                Callee ->
                    %% remote call
                    TempFuture = cog:create_task(Callee,'m_createInstance',[iolist_to_binary([iolist_to_binary([C:get_val_internal(get(this), 'name'), <<"-"/utf8>>]), maps:get('instancename', get(vars))]),maps:get('config', get(vars)),[]],#task_info{method= <<"createInstance"/utf8>>},Cog),
                    future:get_blocking(TempFuture, Cog, [O,DC| Stack])
            end end)()});
            false ->         ok
        end,
         %% RPL/lang/RPLlang.RPL:910--910
        put(vars, (get(vars))#{'tmp1631143060' => cog:create_task(maps:get('dc', get(vars)),'m_getStartupDuration',[[]],#task_info{method= <<"getStartupDuration"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog)}),
         %% RPL/lang/RPLlang.RPL:910--910
        future:await(maps:get('tmp1631143060', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% RPL/lang/RPLlang.RPL:910--910
        put(vars, (get(vars))#{'startup_duration' => future:get_blocking(maps:get('tmp1631143060', get(vars)), Cog, [O,DC| Stack])}),
         %% RPL/lang/RPLlang.RPL:911--911
        cog:suspend_current_task_for_duration(Cog,maps:get('startup_duration', get(vars)),maps:get('startup_duration', get(vars)),[O,DC| Stack]),
        ok,
         %% RPL/lang/RPLlang.RPL:912--912
        maps:get('dc', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method prelaunchInstanceNamed and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% RPL/lang/RPLlang.RPL:915
 %% RPL/lang/RPLlang.RPL:915
'm_launchInstance'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_d_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'd' => V_d_0 }),
    try
         %% RPL/lang/RPLlang.RPL:916--916
        put(vars, (get(vars))#{'result' => (fun() -> case O of
            null -> throw(dataNullPointerException);
            Callee=#object{oid=Oid,cog=Cog} ->
                %% self-call
                Vars=get(vars),
                Result=C:'m_prelaunchInstance'(Callee,maps:get('d', get(vars)),[O,DC,Vars| Stack]),
                put(vars, Vars),
                Result;
            Callee=#object{oid=ObjRef,cog=Cog} ->
                %% cog-local call
                V_d = maps:get('d', get(vars)),
                State=get(this),
                Vars=get(vars),
                cog:object_state_changed(Cog, O, State),
                put(this,cog:get_object_state(Callee#object.cog, Callee)),
                put(task_info,(get(task_info))#task_info{this=Callee}),
                T=object:get_class_from_state(get(this)), % it's the callee state already
                Result=T:'m_prelaunchInstance'(Callee, V_d,[O,DC,Vars,State| Stack]),
                cog:object_state_changed(Callee#object.cog, Callee, get(this)),
                put(task_info,(get(task_info))#task_info{this=O}),
                put(this, cog:get_object_state(Cog, O)),
                put(vars, Vars),
                Result;
            Callee ->
                %% remote call
                TempFuture = cog:create_task(Callee,'m_prelaunchInstance',[maps:get('d', get(vars)),[]],#task_info{method= <<"prelaunchInstance"/utf8>>},Cog),
                future:get_blocking(TempFuture, Cog, [O,DC| Stack])
        end end)()}),
         %% RPL/lang/RPLlang.RPL:917--917
        put(this, C:set_val_internal(get(this), 'acquiredInstances',m_ABS_StdLib_funs:f_insertElement(Cog,C:get_val_internal(get(this), 'acquiredInstances'),maps:get('result', get(vars)),[O,DC| Stack]))),
         %% RPL/lang/RPLlang.RPL:918--918
        maps:get('result', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method launchInstance and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% RPL/lang/RPLlang.RPL:921
 %% RPL/lang/RPLlang.RPL:921
'm_launchInstanceNamed'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_instancename_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'instancename' => V_instancename_0 }),
    try
         %% RPL/lang/RPLlang.RPL:922--922
        put(vars, (get(vars))#{'result' => (fun() -> case O of
            null -> throw(dataNullPointerException);
            Callee=#object{oid=Oid,cog=Cog} ->
                %% self-call
                Vars=get(vars),
                Result=C:'m_prelaunchInstanceNamed'(Callee,maps:get('instancename', get(vars)),[O,DC,Vars| Stack]),
                put(vars, Vars),
                Result;
            Callee=#object{oid=ObjRef,cog=Cog} ->
                %% cog-local call
                V_instancename = maps:get('instancename', get(vars)),
                State=get(this),
                Vars=get(vars),
                cog:object_state_changed(Cog, O, State),
                put(this,cog:get_object_state(Callee#object.cog, Callee)),
                put(task_info,(get(task_info))#task_info{this=Callee}),
                T=object:get_class_from_state(get(this)), % it's the callee state already
                Result=T:'m_prelaunchInstanceNamed'(Callee, V_instancename,[O,DC,Vars,State| Stack]),
                cog:object_state_changed(Callee#object.cog, Callee, get(this)),
                put(task_info,(get(task_info))#task_info{this=O}),
                put(this, cog:get_object_state(Cog, O)),
                put(vars, Vars),
                Result;
            Callee ->
                %% remote call
                TempFuture = cog:create_task(Callee,'m_prelaunchInstanceNamed',[maps:get('instancename', get(vars)),[]],#task_info{method= <<"prelaunchInstanceNamed"/utf8>>},Cog),
                future:get_blocking(TempFuture, Cog, [O,DC| Stack])
        end end)()}),
         %% RPL/lang/RPLlang.RPL:923--923
        case (not cmp:eq(maps:get('result', get(vars)),null)) of
            true ->  %% RPL/lang/RPLlang.RPL:924--924
            put(vars, (get(vars))#{'nullableWorkAround' => maps:get('result', get(vars))}),
             %% RPL/lang/RPLlang.RPL:925--925
            put(this, C:set_val_internal(get(this), 'acquiredInstances',m_ABS_StdLib_funs:f_insertElement(Cog,C:get_val_internal(get(this), 'acquiredInstances'),maps:get('nullableWorkAround', get(vars)),[O,DC| Stack])));
            false ->         ok
        end,
         %% RPL/lang/RPLlang.RPL:927--927
        maps:get('result', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method launchInstanceNamed and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% RPL/lang/RPLlang.RPL:930
 %% RPL/lang/RPLlang.RPL:930
'm_acquireInstance'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_instance_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'instance' => V_instance_0 }),
    try
         %% RPL/lang/RPLlang.RPL:931--931
        put(vars, (get(vars))#{'result' => true}),
         %% RPL/lang/RPLlang.RPL:932--932
        put(vars, (get(vars))#{'tmp1468685544' => cog:create_task(maps:get('instance', get(vars)),'m_getProvider',[[]],#task_info{method= <<"getProvider"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog)}),
         %% RPL/lang/RPLlang.RPL:932--932
        future:await(maps:get('tmp1468685544', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% RPL/lang/RPLlang.RPL:932--932
        put(vars, (get(vars))#{'cp' => future:get_blocking(maps:get('tmp1468685544', get(vars)), Cog, [O,DC| Stack])}),
         %% RPL/lang/RPLlang.RPL:933--933
        put(vars, (get(vars))#{'nullableWorkAround' => maps:get('instance', get(vars))}),
         %% RPL/lang/RPLlang.RPL:934--934
        case (not cmp:eq(maps:get('cp', get(vars)),O)) of
            true ->  %% RPL/lang/RPLlang.RPL:936--936
            put(vars, (get(vars))#{'result' := false});
            false ->          %% RPL/lang/RPLlang.RPL:937--938
        case (m_ABS_StdLib_funs:f_contains(Cog,C:get_val_internal(get(this), 'acquiredInstances'),maps:get('nullableWorkAround', get(vars)),[O,DC| Stack])) or (m_ABS_StdLib_funs:f_contains(Cog,C:get_val_internal(get(this), 'killedInstances'),maps:get('nullableWorkAround', get(vars)),[O,DC| Stack])) of
            true ->  %% RPL/lang/RPLlang.RPL:939--939
            put(vars, (get(vars))#{'result' := false});
            false ->          %% RPL/lang/RPLlang.RPL:941--941
        put(this, C:set_val_internal(get(this), 'acquiredInstances',m_ABS_StdLib_funs:f_insertElement(Cog,C:get_val_internal(get(this), 'acquiredInstances'),maps:get('nullableWorkAround', get(vars)),[O,DC| Stack])))
        end
        end,
         %% RPL/lang/RPLlang.RPL:943--943
        maps:get('result', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method acquireInstance and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% RPL/lang/RPLlang.RPL:945
 %% RPL/lang/RPLlang.RPL:945
'm_releaseInstance'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_instance_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'instance' => V_instance_0 }),
    try
         %% RPL/lang/RPLlang.RPL:950--950
        case m_ABS_StdLib_funs:f_contains(Cog,C:get_val_internal(get(this), 'acquiredInstances'),maps:get('instance', get(vars)),[O,DC| Stack]) of
            true ->  %% RPL/lang/RPLlang.RPL:951--951
            put(this, C:set_val_internal(get(this), 'acquiredInstances',m_ABS_StdLib_funs:f_remove(Cog,C:get_val_internal(get(this), 'acquiredInstances'),maps:get('instance', get(vars)),[O,DC| Stack])));
            false ->         ok
        end,
         %% RPL/lang/RPLlang.RPL:953--953
        true
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method releaseInstance and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% RPL/lang/RPLlang.RPL:956
 %% RPL/lang/RPLlang.RPL:956
'm_shutdownInstance'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_instance_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'instance' => V_instance_0 }),
    try
         %% RPL/lang/RPLlang.RPL:957--957
        T_1 = cog:create_task(maps:get('instance', get(vars)),'m_shutdown',[[]],#task_info{method= <<"shutdown"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog),
        T_1,
         %% RPL/lang/RPLlang.RPL:958--958
        true
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method shutdownInstance and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% RPL/lang/RPLlang.RPL:961
 %% RPL/lang/RPLlang.RPL:961
'm_internalShutdownInstance'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_instance_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'instance' => V_instance_0 }),
    try
         %% RPL/lang/RPLlang.RPL:962--962
        put(vars, (get(vars))#{'nullWorkAround' => maps:get('instance', get(vars))}),
         %% RPL/lang/RPLlang.RPL:965--965
        put(this, C:set_val_internal(get(this), 'acquiredInstances',m_ABS_StdLib_funs:f_remove(Cog,C:get_val_internal(get(this), 'acquiredInstances'),maps:get('nullWorkAround', get(vars)),[O,DC| Stack]))),
         %% RPL/lang/RPLlang.RPL:968--968
        put(this, C:set_val_internal(get(this), 'killedInstances',m_ABS_StdLib_funs:f_insertElement(Cog,C:get_val_internal(get(this), 'killedInstances'),maps:get('nullWorkAround', get(vars)),[O,DC| Stack]))),
         %% RPL/lang/RPLlang.RPL:969--969
        put(vars, (get(vars))#{'tmp2084912180' => cog:create_task(maps:get('instance', get(vars)),'m_getShutdownDuration',[[]],#task_info{method= <<"getShutdownDuration"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog)}),
         %% RPL/lang/RPLlang.RPL:969--969
        future:await(maps:get('tmp2084912180', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% RPL/lang/RPLlang.RPL:969--969
        put(vars, (get(vars))#{'shutdown_duration' => future:get_blocking(maps:get('tmp2084912180', get(vars)), Cog, [O,DC| Stack])}),
         %% RPL/lang/RPLlang.RPL:970--970
        cog:suspend_current_task_for_duration(Cog,maps:get('shutdown_duration', get(vars)),maps:get('shutdown_duration', get(vars)),[O,DC| Stack]),
        ok,
         %% RPL/lang/RPLlang.RPL:974--974
        put(this, C:set_val_internal(get(this), 'launchedInstances',m_ABS_StdLib_funs:f_remove(Cog,C:get_val_internal(get(this), 'launchedInstances'),maps:get('nullWorkAround', get(vars)),[O,DC| Stack]))),
         %% RPL/lang/RPLlang.RPL:976--976
        put(vars, (get(vars))#{'tmp382441865' => cog:create_task(maps:get('instance', get(vars)),'m_getAccumulatedCost',[[]],#task_info{method= <<"getAccumulatedCost"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog)}),
         %% RPL/lang/RPLlang.RPL:976--976
        future:await(maps:get('tmp382441865', get(vars)), Cog, [O,DC| Stack]),
        ok,
         %% RPL/lang/RPLlang.RPL:976--976
        put(vars, (get(vars))#{'cost' => future:get_blocking(maps:get('tmp382441865', get(vars)), Cog, [O,DC| Stack])}),
         %% RPL/lang/RPLlang.RPL:977--977
        put(this, C:set_val_internal(get(this), 'accumulatedCostOfKilledDCs',( rationals:add(C:get_val_internal(get(this), 'accumulatedCostOfKilledDCs'),maps:get('cost', get(vars)))) )),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method internalShutdownInstance and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% RPL/lang/RPLlang.RPL:980
 %% RPL/lang/RPLlang.RPL:980
'm_getAccumulatedCost'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% RPL/lang/RPLlang.RPL:981--981
        put(vars, (get(vars))#{'result' => 0}),
         %% RPL/lang/RPLlang.RPL:982--982
        put(vars, (get(vars))#{'t' => m_ABS_StdLib_funs:f_now(Cog,[O,DC| Stack])}),
         %% RPL/lang/RPLlang.RPL:983--986
        put(vars, (get(vars))#{'tmp885465900' => m_ABS_StdLib_funs:f_elements(Cog,C:get_val_internal(get(this), 'launchedInstances'),[O,DC| Stack])}),
         %% RPL/lang/RPLlang.RPL:983--986
        []=(fun Loop ([])->
            case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp885465900', get(vars)),[O,DC| Stack])) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% RPL/lang/RPLlang.RPL:983--986
                put(vars, (get(vars))#{'dc' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp885465900', get(vars)),[O,DC| Stack])}),
                 %% RPL/lang/RPLlang.RPL:983--986
                put(vars, (get(vars))#{'tmp885465900' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp885465900', get(vars)),[O,DC| Stack])}),
                 %% RPL/lang/RPLlang.RPL:984--984
                put(vars, (get(vars))#{'tmp1040015904' => cog:create_task(maps:get('dc', get(vars)),'m_getAccumulatedCost',[[]],#task_info{method= <<"getAccumulatedCost"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog)}),
                 %% RPL/lang/RPLlang.RPL:984--984
                future:await(maps:get('tmp1040015904', get(vars)), Cog, [O,DC| Stack]),
                ok,
                 %% RPL/lang/RPLlang.RPL:984--984
                put(vars, (get(vars))#{'cost' => future:get_blocking(maps:get('tmp1040015904', get(vars)), Cog, [O,DC| Stack])}),
                 %% RPL/lang/RPLlang.RPL:985--985
                put(vars, (get(vars))#{'result' := ( rationals:add(maps:get('result', get(vars)),maps:get('cost', get(vars)))) }),
            Loop([])  end end)
        ([]),
         %% RPL/lang/RPLlang.RPL:987--987
        ( rationals:add(maps:get('result', get(vars)),C:get_val_internal(get(this), 'accumulatedCostOfKilledDCs'))) 
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getAccumulatedCost and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% RPL/lang/RPLlang.RPL:991
 %% RPL/lang/RPLlang.RPL:991
'm_setInstanceDescriptions'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_instanceDescriptions_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'instanceDescriptions' => V_instanceDescriptions_0 }),
    try
         %% RPL/lang/RPLlang.RPL:992--992
        put(this, C:set_val_internal(get(this), 'instanceDescriptions',maps:get('instanceDescriptions', get(vars)))),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method setInstanceDescriptions and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% RPL/lang/RPLlang.RPL:996
 %% RPL/lang/RPLlang.RPL:996
'm_addInstanceDescription'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_instanceDescription_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'instanceDescription' => V_instanceDescription_0 }),
    try
         %% RPL/lang/RPLlang.RPL:997--997
        put(this, C:set_val_internal(get(this), 'instanceDescriptions',m_ABS_StdLib_funs:f_insert(Cog,C:get_val_internal(get(this), 'instanceDescriptions'),maps:get('instanceDescription', get(vars)),[O,DC| Stack]))),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method addInstanceDescription and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% RPL/lang/RPLlang.RPL:1001
 %% RPL/lang/RPLlang.RPL:1001
'm_removeInstanceDescription'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_instanceDescriptionName_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'instanceDescriptionName' => V_instanceDescriptionName_0 }),
    try
         %% RPL/lang/RPLlang.RPL:1002--1002
        put(this, C:set_val_internal(get(this), 'instanceDescriptions',m_ABS_StdLib_funs:f_removeKey(Cog,C:get_val_internal(get(this), 'instanceDescriptions'),maps:get('instanceDescriptionName', get(vars)),[O,DC| Stack]))),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method removeInstanceDescription and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% RPL/lang/RPLlang.RPL:1005
 %% RPL/lang/RPLlang.RPL:1005
'm_getInstanceDescriptions'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% RPL/lang/RPLlang.RPL:1006--1006
        C:get_val_internal(get(this), 'instanceDescriptions')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getInstanceDescriptions and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
