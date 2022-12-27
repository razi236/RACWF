-module(class_ABS_ResourceManager_ResourceManager).
-include_lib("../include/abs_types.hrl").
-behaviour(object).
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"ResourceManager">>, <<"Object">> ].

exported() -> #{  }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_ABS_ResourceManager_ResourceManager,'resources'=null,'resource_counter'=null}).
'init_internal'()->
    #state{}.

 %% RABS.abs:20
'get_val_internal'(#state{'resources'=G},'resources')->
    object:register_read('resources'),
    G;
 %% RABS.abs:21
'get_val_internal'(#state{'resource_counter'=G},'resource_counter')->
    object:register_read('resource_counter'),
    G;
'get_val_internal'(_,_)->
    %% Invalid return value; handled by HTTP API when querying for non-existant field.
    %% Will never occur in generated code.
    none.

 %% RABS.abs:20
'set_val_internal'(S,'resources',V)->
    object:register_write('resources'),
    S#state{'resources'=V};
 %% RABS.abs:21
'set_val_internal'(S,'resource_counter',V)->
    object:register_write('resource_counter'),
    S#state{'resource_counter'=V}.

'get_state_for_modelapi'(S)->
    [
        { 'resources', S#state.'resources' }
        , { 'resource_counter', S#state.'resource_counter' }
    ].
%% --- Constructor: field initializers and init block

'init'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},[Stack])->
    C=(get(this))#state.class,
    put(vars, #{}),
     %% RABS.abs:20--20
    put(this, C:set_val_internal(get(this),'resources',m_ABS_StdLib_funs:f_map(Cog,[],[O,DC| Stack]))),
     %% RABS.abs:21--21
    put(this, C:set_val_internal(get(this),'resource_counter',0)),
    gc:register_object(O),
    O.
%% --- Class has no recovery block

%% --- Methods

 %% RABS.abs:23
 %% RABS.abs:23
'm_print'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% RABS.abs:24--24
        T_1 = builtin:println(Cog,builtin:toString(Cog,C:get_val_internal(get(this), 'resources'))),
        T_1,
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method print and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% RABS.abs:26
 %% RABS.abs:26
'm_addRes'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_newResources_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'newResources' => V_newResources_0 }),
    try
         %% RABS.abs:27--27
        put(vars, (get(vars))#{'result' => m_ABS_StdLib_funs:f_list(Cog,[],[O,DC| Stack])}),
         %% RABS.abs:28--32
        put(vars, (get(vars))#{'tmp245867715' => maps:get('newResources', get(vars))}),
         %% RABS.abs:28--32
        []=(fun Loop ([])->
            case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp245867715', get(vars)),[O,DC| Stack])) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% RABS.abs:28--32
                put(vars, (get(vars))#{'r' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp245867715', get(vars)),[O,DC| Stack])}),
                 %% RABS.abs:28--32
                put(vars, (get(vars))#{'tmp245867715' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp245867715', get(vars)),[O,DC| Stack])}),
                 %% RABS.abs:29--29
                put(this, C:set_val_internal(get(this), 'resource_counter',(C:get_val_internal(get(this), 'resource_counter') + 1) )),
                 %% RABS.abs:30--30
                put(this, C:set_val_internal(get(this), 'resources',m_ABS_StdLib_funs:f_insert(Cog,C:get_val_internal(get(this), 'resources'),{ dataPair,C:get_val_internal(get(this), 'resource_counter'),{ dataPair,dataFree,maps:get('r', get(vars))}},[O,DC| Stack]))),
                 %% RABS.abs:31--31
                put(vars, (get(vars))#{'result' := [C:get_val_internal(get(this), 'resource_counter') | maps:get('result', get(vars))]}),
            Loop([])  end end)
        ([]),
         %% RABS.abs:34--34
        maps:get('result', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method addRes and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% RABS.abs:37
 %% RABS.abs:37
'm_holdRes'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_wantedResources_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'wantedResources' => V_wantedResources_0 }),
    try
         %% RABS.abs:38--38
        put(vars, (get(vars))#{'result' => m_ABS_StdLib_funs:f_list(Cog,[],[O,DC| Stack])}),
         %% RABS.abs:39--39
        put(vars, (get(vars))#{'lr' => C:get_val_internal(get(this), 'resources')}),
         %% RABS.abs:40--40
        []=(fun Loop ([])->
            case cmp:eq(maps:get('result', get(vars)),[]) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% RABS.abs:41--53
                put(vars, (get(vars))#{'tmp1765165869' => maps:get('wantedResources', get(vars))}),
                 %% RABS.abs:41--53
                []=(fun Loop ([])->
                    case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp1765165869', get(vars)),[O,DC| Stack])) of
                    false -> [];
                    true -> receive
                            {stop_world, CogRef} ->
                                cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                                cog:task_is_runnable(Cog,self()),
                                task:wait_for_token(Cog,[O,DC| Stack])
                            after 0 -> ok
                        end,
                         %% RABS.abs:41--53
                        put(vars, (get(vars))#{'q' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp1765165869', get(vars)),[O,DC| Stack])}),
                         %% RABS.abs:41--53
                        put(vars, (get(vars))#{'tmp1765165869' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp1765165869', get(vars)),[O,DC| Stack])}),
                         %% RABS.abs:42--42
                        put(vars, (get(vars))#{'found' => false}),
                         %% RABS.abs:43--52
                        put(vars, (get(vars))#{'tmp1391890442' => m_ABS_StdLib_funs:f_entries(Cog,maps:get('lr', get(vars)),[O,DC| Stack])}),
                         %% RABS.abs:43--52
                        []=(fun Loop ([])->
                            case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp1391890442', get(vars)),[O,DC| Stack])) of
                            false -> [];
                            true -> receive
                                    {stop_world, CogRef} ->
                                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                                        cog:task_is_runnable(Cog,self()),
                                        task:wait_for_token(Cog,[O,DC| Stack])
                                    after 0 -> ok
                                end,
                                 %% RABS.abs:43--52
                                put(vars, (get(vars))#{'entry' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp1391890442', get(vars)),[O,DC| Stack])}),
                                 %% RABS.abs:43--52
                                put(vars, (get(vars))#{'tmp1391890442' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp1391890442', get(vars)),[O,DC| Stack])}),
                                 %% RABS.abs:44--46
                                case ((not (maps:get('found', get(vars)))) and (cmp:eq(m_ABS_StdLib_funs:f_fst(Cog,m_ABS_StdLib_funs:f_snd(Cog,maps:get('entry', get(vars)),[O,DC| Stack]),[O,DC| Stack]),dataFree))) and (m_ABS_StdLib_funs:f_isSubset(Cog,maps:get('q', get(vars)),m_ABS_StdLib_funs:f_snd(Cog,m_ABS_StdLib_funs:f_snd(Cog,maps:get('entry', get(vars)),[O,DC| Stack]),[O,DC| Stack]),[O,DC| Stack])) of
                                    true ->  %% RABS.abs:48--48
                                    put(vars, (get(vars))#{'found' := true}),
                                     %% RABS.abs:49--49
                                    put(vars, (get(vars))#{'result' := [m_ABS_StdLib_funs:f_fst(Cog,maps:get('entry', get(vars)),[O,DC| Stack]) | maps:get('result', get(vars))]}),
                                     %% RABS.abs:50--50
                                    put(vars, (get(vars))#{'lr' := m_ABS_StdLib_funs:f_put(Cog,maps:get('lr', get(vars)),m_ABS_StdLib_funs:f_fst(Cog,maps:get('entry', get(vars)),[O,DC| Stack]),{ dataPair,dataBusy,m_ABS_StdLib_funs:f_snd(Cog,m_ABS_StdLib_funs:f_snd(Cog,maps:get('entry', get(vars)),[O,DC| Stack]),[O,DC| Stack])},[O,DC| Stack])});
                                    false ->                                 ok
                                end,
                            Loop([])  end end)
                        ([]),
                    Loop([])  end end)
                ([]),
                 %% RABS.abs:54--54
                case (not cmp:eq(m_ABS_StdLib_funs:f_length(Cog,maps:get('result', get(vars)),[O,DC| Stack]),m_ABS_StdLib_funs:f_length(Cog,maps:get('wantedResources', get(vars)),[O,DC| Stack]))) of
                    true ->  %% RABS.abs:56--56
                    T_1 = builtin:println(Cog,iolist_to_binary([iolist_to_binary([iolist_to_binary([<<"hold retrying: Resources = "/utf8>>, builtin:toString(Cog,C:get_val_internal(get(this), 'resources'))]), iolist_to_binary([<<" We want "/utf8>>, builtin:toString(Cog,maps:get('wantedResources', get(vars)))])]), <<""/utf8>>])),
                    T_1,
                     %% RABS.abs:57--57
                    put(vars, (get(vars))#{'result' := []}),
                     %% RABS.abs:58--58
                    put(vars, (get(vars))#{'lr' := C:get_val_internal(get(this), 'resources')}),
                     %% RABS.abs:59--59
                    cog:return_token(Cog,self(),{waiting_poll, get(vars), fun (Vars, OState) ->
                        put(this, OState),
                        put(vars, Vars),
                        ReadSet=[object:field_with_oid(resources, Oid)],
                        Result=try
                            (not cmp:eq(C:get_val_internal(get(this), 'resources'),maps:get('lr', get(vars))))
                        catch
                            _:Exception -> {crashed, Exception}
                            %% Exception will be re-thrown manually below
                        end,
                        erase(this),
                        erase(vars),
                        {Result, ReadSet}
                    end}, get(task_info), get(this)),
                    (fun Poll (Params=[], Exception)->
                    receive
                        {throw, E} -> Poll(Params, E);
                        {token, OState} ->
                            put(this, OState),
                            case Exception of none -> ok; _ -> throw(Exception) end;
                        {stop_world, _Sender} -> % only happens when stop_world and return_token cross
                            Poll(Params, Exception);
                        {get_references, Sender} ->
                            cog:submit_references(Sender, gc:extract_references([O,DC| Stack])),
                            Poll(Params, Exception)
                        end end)
                    ([], none),
                 %% RABS.abs:60--60
                put(vars, (get(vars))#{'lr' := C:get_val_internal(get(this), 'resources')});
                false ->                  %% RABS.abs:68--68
                put(this, C:set_val_internal(get(this), 'resources',maps:get('lr', get(vars))))
            end,
        Loop([])  end end)
    ([]),
     %% RABS.abs:73--73
    maps:get('result', get(vars))
catch
    _:Exception:Stacktrace ->
        io:format(standard_error, "Uncaught ~s in method holdRes and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
        io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
        object:die(O, Exception), exit(Exception)
end.
 %% RABS.abs:76
 %% RABS.abs:76
'm_releaseRes'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_ids_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'ids' => V_ids_0 }),
    try
         %% RABS.abs:77--77
        put(vars, (get(vars))#{'all_ids' => m_ABS_StdLib_funs:f_keys(Cog,C:get_val_internal(get(this), 'resources'),[O,DC| Stack])}),
         %% RABS.abs:78--83
        put(vars, (get(vars))#{'tmp2075981552' => maps:get('ids', get(vars))}),
         %% RABS.abs:78--83
        []=(fun Loop ([])->
            case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp2075981552', get(vars)),[O,DC| Stack])) of
            false -> [];
            true -> receive
                    {stop_world, CogRef} ->
                        cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                        cog:task_is_runnable(Cog,self()),
                        task:wait_for_token(Cog,[O,DC| Stack])
                    after 0 -> ok
                end,
                 %% RABS.abs:78--83
                put(vars, (get(vars))#{'id' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp2075981552', get(vars)),[O,DC| Stack])}),
                 %% RABS.abs:78--83
                put(vars, (get(vars))#{'tmp2075981552' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp2075981552', get(vars)),[O,DC| Stack])}),
                 %% RABS.abs:79--79
                case m_ABS_StdLib_funs:f_contains(Cog,maps:get('all_ids', get(vars)),maps:get('id', get(vars)),[O,DC| Stack]) of
                    true ->  %% RABS.abs:80--80
                    put(vars, (get(vars))#{'entry' => m_ABS_StdLib_funs:f_lookupUnsafe(Cog,C:get_val_internal(get(this), 'resources'),maps:get('id', get(vars)),[O,DC| Stack])}),
                     %% RABS.abs:81--81
                    put(this, C:set_val_internal(get(this), 'resources',m_ABS_StdLib_funs:f_put(Cog,C:get_val_internal(get(this), 'resources'),maps:get('id', get(vars)),{ dataPair,dataFree,m_ABS_StdLib_funs:f_snd(Cog,maps:get('entry', get(vars)),[O,DC| Stack])},[O,DC| Stack])));
                    false ->                 ok
                end,
            Loop([])  end end)
        ([]),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method releaseRes and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
