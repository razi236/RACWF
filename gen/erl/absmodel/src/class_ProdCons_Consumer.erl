-module(class_ProdCons_Consumer).
-include_lib("../include/abs_types.hrl").
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"Consumer">>, <<"Object">> ].

exported() -> #{  }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_ProdCons_Consumer}).
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

 %% ABS.rpl:153
 %% ABS.rpl:153
'm_consume'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_rm_0,V_a_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'rm' => V_rm_0,
 'a' => V_a_0 }),
    try
         %% ABS.rpl:154--154
        cog:block_current_task_for_duration(Cog,maps:get('a', get(vars)),maps:get('a', get(vars)),[O,DC| Stack]),
         %% ABS.rpl:154--154
        try
             %% ABS.rpl:155--155
            put(vars, (get(vars))#{'d' => m_ABS_StdLib_funs:f_deadline(Cog,[O,DC| Stack])}),
             %% ABS.rpl:156--156
            put(vars, (get(vars))#{'r' => m_ABS_StdLib_funs:f_durationValue(Cog,maps:get('d', get(vars)),[O,DC| Stack])}),
             %% ABS.rpl:157--157
            case cmp:gt(maps:get('r', get(vars)),0) of
                true -> ok;
                false -> io:format(standard_error, "Assertion failure at ABS.rpl:157~n", []), throw(dataAssertionFailException)
            end
        catch
            _:dataAssertionFailException->
                 %% ABS.rpl:159--159
                T_1 = builtin:println(Cog,<<"The method \"consume\" have missed the deadline."/utf8>>),
                T_1
        end,
         %% ABS.rpl:161--161
        0
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method consume and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
