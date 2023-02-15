-module(class_ProdCons_Producer).
-include_lib("../include/abs_types.hrl").
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"Producer">>, <<"Object">> ].

exported() -> #{  }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_ProdCons_Producer}).
'init_internal'()->
    #state{}.

'get_val_internal'(_,_)->
    %% Invalid return value; handled by HTTP API when querying for non-existant field.
    %% Will never occur in generated code.
    none.

'set_val_internal'(S,S,S)->
    throw(badarg).
'get_state_for_modelapi'(S)->
    [
    ].
%% --- Constructor: field initializers and init block

'init'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},[Stack])->
    C=(get(this))#state.class,
    put(vars, #{}),
    gc:register_object(O),
    O.
%% --- Class has no recovery block

%% --- Methods

 %% ABS.rpl:139
 %% ABS.rpl:139
'm_produce'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_rm_0,V_a_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'rm' => V_rm_0,
 'a' => V_a_0 }),
    try
         %% ABS.rpl:140--140
        cog:block_current_task_for_duration(Cog,maps:get('a', get(vars)),maps:get('a', get(vars)),[O,DC| Stack]),
         %% ABS.rpl:140--140
        try
             %% ABS.rpl:141--141
            put(vars, (get(vars))#{'d' => m_ABS_StdLib_funs:f_deadline(Cog,[O,DC| Stack])}),
             %% ABS.rpl:142--142
            put(vars, (get(vars))#{'r' => m_ABS_StdLib_funs:f_durationValue(Cog,maps:get('d', get(vars)),[O,DC| Stack])}),
             %% ABS.rpl:143--143
            case cmp:gt(maps:get('r', get(vars)),0) of
                true -> ok;
                false -> io:format(standard_error, "Assertion failure at ABS.rpl:143~n", []), throw(dataAssertionFailException)
            end
        catch
            _:dataAssertionFailException->
                 %% ABS.rpl:145--145
                T_1 = builtin:println(Cog,<<"The method \"produce\" have missed the deadline."/utf8>>),
                T_1
        end,
         %% ABS.rpl:147--147
        0
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method produce and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
