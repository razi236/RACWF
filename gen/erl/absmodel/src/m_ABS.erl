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
     %% cost.abs:14--14
    put(vars, (get(vars))#{'f' => null}),
     %% cost.abs:14--14
    put(vars, (get(vars))#{'f1' => null}),
     %% cost.abs:14--14
    put(vars, (get(vars))#{'f2' => null}),
     %% cost.abs:15--15
    put(vars, (get(vars))#{'a' => object:new(cog:start(Cog,DC),class_ABS_ABC,[[]],Cog,[O,DC| Stack])}),
     %% cost.abs:16--16
    put(vars, (get(vars))#{'f' := cog:create_task(maps:get('a', get(vars)),'m_xyz',[10,[]],#task_info{method= <<"xyz"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog)}).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    runtime:start_link([m_ABS]).

stop(_State) ->
    ok.
