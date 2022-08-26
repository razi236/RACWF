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
     %% RABS.abs:130--130
    put(vars, (get(vars))#{'r' => object:new(cog:start(Cog,DC),class_ResourceManager_ResourceManager,[[]],Cog,[O,DC| Stack])}),
     %% RABS.abs:131--131
    put(vars, (get(vars))#{'f' => null}),
     %% RABS.abs:132--132
    put(vars, (get(vars))#{'f1' => null}),
     %% RABS.abs:133--133
    put(vars, (get(vars))#{'f2' => null}),
     %% RABS.abs:134--134
    put(vars, (get(vars))#{'fids' => m_ABS_StdLib_funs:f_list(Cog,[],[O,DC| Stack])}),
     %% RABS.abs:135--135
    put(vars, (get(vars))#{'i' => 0}),
     %% RABS.abs:136--136
    put(vars, (get(vars))#{'o' => object:new(cog:start(Cog,DC),class_ABS_ABC,[[]],Cog,[O,DC| Stack])}),
     %% RABS.abs:137--137
    put(vars, (get(vars))#{'o1' => object:new(cog:start(Cog,DC),class_ABS_ABC,[[]],Cog,[O,DC| Stack])}),
     %% RABS.abs:138--138
    put(vars, (get(vars))#{'o2' => object:new(cog:start(Cog,DC),class_ABS_ABC,[[]],Cog,[O,DC| Stack])}),
     %% RABS.abs:139--139
    put(vars, (get(vars))#{'o3' => object:new(cog:start(Cog,DC),class_ABS_ABC,[[]],Cog,[O,DC| Stack])}).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    runtime:start_link([m_ABS]).

stop(_State) ->
    ok.
