-module(class_ABS_ABC).
-include_lib("../include/abs_types.hrl").
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"ABC">>, <<"Object">> ].

exported() -> #{  }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_ABS_ABC}).
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

 %% cost.abs:8
 %% cost.abs:8
'm_xyz'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_x_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'x' => V_x_0 }),
    try
         %% cost.abs:10--10
        T_1 = builtin:println(Cog,<<"Hello World $x$"/utf8>>),
        T_1,
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method xyz and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
