-module(class_ABS_ResourceManager_AwaitFut).
-include_lib("../include/abs_types.hrl").
-behaviour(object).
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"AwaitFut">>, <<"Object">> ].

exported() -> #{  }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_ABS_ResourceManager_AwaitFut,'resolved'=null}).
'init_internal'()->
    #state{}.

 %% ABS.rpl:105
'get_val_internal'(#state{'resolved'=G},'resolved')->
    object:register_read('resolved'),
    G;
'get_val_internal'(_,_)->
    %% Invalid return value; handled by HTTP API when querying for non-existant field.
    %% Will never occur in generated code.
    none.

 %% ABS.rpl:105
'set_val_internal'(S,'resolved',V)->
    object:register_write('resolved'),
    S#state{'resolved'=V}.

'get_state_for_modelapi'(S)->
    [
        { 'resolved', S#state.'resolved' }
    ].
%% --- Constructor: field initializers and init block

'init'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},[Stack])->
    C=(get(this))#state.class,
    put(vars, #{}),
     %% ABS.rpl:105--105
    put(this, C:set_val_internal(get(this),'resolved',false)),
    gc:register_object(O),
    O.
%% --- Class has no recovery block

%% --- Methods

 %% ABS.rpl:106
 %% ABS.rpl:106
'm_awaitFut'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_fut_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'fut' => V_fut_0 }),
    try
         %% ABS.rpl:108--108
        try
             %% ABS.rpl:109--109
            case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('fut', get(vars)),[O,DC| Stack])) of
                true ->  %% ABS.rpl:110--113
                put(vars, (get(vars))#{'tmp40829249' => maps:get('fut', get(vars))}),
                 %% ABS.rpl:110--113
                []=(fun Loop ([])->
                    case not (m_ABS_StdLib_funs:f_isEmpty(Cog,maps:get('tmp40829249', get(vars)),[O,DC| Stack])) of
                    false -> [];
                    true -> receive
                            {stop_world, CogRef} ->
                                cog:task_is_blocked_for_gc(Cog, self(), get(task_info), get(this)),
                                cog:task_is_runnable(Cog,self()),
                                task:wait_for_token(Cog,[O,DC| Stack])
                            after 0 -> ok
                        end,
                         %% ABS.rpl:110--113
                        put(vars, (get(vars))#{'f' => m_ABS_StdLib_funs:f_head(Cog,maps:get('tmp40829249', get(vars)),[O,DC| Stack])}),
                         %% ABS.rpl:110--113
                        put(vars, (get(vars))#{'tmp40829249' := m_ABS_StdLib_funs:f_tail(Cog,maps:get('tmp40829249', get(vars)),[O,DC| Stack])}),
                         %% ABS.rpl:112--112
                        future:await(maps:get('f', get(vars)), Cog, [O,DC| Stack]),
                        ok,
                    Loop([])  end end)
                ([]),
                 %% ABS.rpl:114--114
                put(this, C:set_val_internal(get(this), 'resolved',true)),
                 %% ABS.rpl:115--115
                T_1 = builtin:println(Cog,<<"Future Resolved:)"/utf8>>),
                T_1;
                false ->             ok
            end
        catch
            _:dataNullPointerException->
                 %% ABS.rpl:118--118
                T_2 = builtin:println(Cog,<<"Future is not initialized"/utf8>>),
                T_2
        end,
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method awaitFut and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% ABS.rpl:121
 %% ABS.rpl:121
'm_checkFut'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% ABS.rpl:123--123
        C:get_val_internal(get(this), 'resolved')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method checkFut and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
