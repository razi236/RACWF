-module(class_ABS_DC_DeploymentComponent).
-include_lib("../include/abs_types.hrl").
-behaviour(object).
-export([get_val_internal/2,set_val_internal/3,init_internal/0,get_state_for_modelapi/1,implemented_interfaces/0,exported/0]).
-compile(export_all).

implemented_interfaces() -> [ <<"Object">>, <<"DeploymentComponentForCloudProvider">>, <<"DeploymentComponent">> ].

exported() -> #{  }.

%% --- Internal state and low-level accessors

-record(state,{'class'=class_ABS_DC_DeploymentComponent,'description'=null,'initconfig'=null,'cpuhistory'=null,'cpuhistorytotal'=null,'bwhistory'=null,'bwhistorytotal'=null,'memoryhistory'=null,'memoryhistorytotal'=null,'cpuconsumed'=null,'bwconsumed'=null,'memoryconsumed'=null,'creationTime'=null,'shutdownTime'=null,'initialized'=null,'is_shutdown'=null,'cpu'=null,'cpunext'=null,'bw'=null,'bwnext'=null,'memory'=null,'memorynext'=null,'paymentInterval'=null,'costPerInterval'=null,'startupDuration'=null,'shutdownDuration'=null,'numberOfCores'=null,'cloudprovider'=null}).
'init_internal'()->
    #state{}.

 %% abs/lang/abslang.abs:1013
'get_val_internal'(#state{'description'=G},'description')->
    object:register_read('description'),
    G;
 %% abs/lang/abslang.abs:1013
'get_val_internal'(#state{'initconfig'=G},'initconfig')->
    object:register_read('initconfig'),
    G;
 %% abs/lang/abslang.abs:1023
'get_val_internal'(#state{'cpuhistory'=G},'cpuhistory')->
    object:register_read('cpuhistory'),
    G;
 %% abs/lang/abslang.abs:1024
'get_val_internal'(#state{'cpuhistorytotal'=G},'cpuhistorytotal')->
    object:register_read('cpuhistorytotal'),
    G;
 %% abs/lang/abslang.abs:1025
'get_val_internal'(#state{'bwhistory'=G},'bwhistory')->
    object:register_read('bwhistory'),
    G;
 %% abs/lang/abslang.abs:1026
'get_val_internal'(#state{'bwhistorytotal'=G},'bwhistorytotal')->
    object:register_read('bwhistorytotal'),
    G;
 %% abs/lang/abslang.abs:1027
'get_val_internal'(#state{'memoryhistory'=G},'memoryhistory')->
    object:register_read('memoryhistory'),
    G;
 %% abs/lang/abslang.abs:1028
'get_val_internal'(#state{'memoryhistorytotal'=G},'memoryhistorytotal')->
    object:register_read('memoryhistorytotal'),
    G;
 %% abs/lang/abslang.abs:1034
'get_val_internal'(#state{'cpuconsumed'=G},'cpuconsumed')->
    object:register_read('cpuconsumed'),
    G;
 %% abs/lang/abslang.abs:1035
'get_val_internal'(#state{'bwconsumed'=G},'bwconsumed')->
    object:register_read('bwconsumed'),
    G;
 %% abs/lang/abslang.abs:1036
'get_val_internal'(#state{'memoryconsumed'=G},'memoryconsumed')->
    object:register_read('memoryconsumed'),
    G;
 %% abs/lang/abslang.abs:1040
'get_val_internal'(#state{'creationTime'=G},'creationTime')->
    object:register_read('creationTime'),
    G;
 %% abs/lang/abslang.abs:1041
'get_val_internal'(#state{'shutdownTime'=G},'shutdownTime')->
    object:register_read('shutdownTime'),
    G;
 %% abs/lang/abslang.abs:1045
'get_val_internal'(#state{'initialized'=G},'initialized')->
    object:register_read('initialized'),
    G;
 %% abs/lang/abslang.abs:1048
'get_val_internal'(#state{'is_shutdown'=G},'is_shutdown')->
    object:register_read('is_shutdown'),
    G;
 %% abs/lang/abslang.abs:1050
'get_val_internal'(#state{'cpu'=G},'cpu')->
    object:register_read('cpu'),
    G;
 %% abs/lang/abslang.abs:1052
'get_val_internal'(#state{'cpunext'=G},'cpunext')->
    object:register_read('cpunext'),
    G;
 %% abs/lang/abslang.abs:1053
'get_val_internal'(#state{'bw'=G},'bw')->
    object:register_read('bw'),
    G;
 %% abs/lang/abslang.abs:1055
'get_val_internal'(#state{'bwnext'=G},'bwnext')->
    object:register_read('bwnext'),
    G;
 %% abs/lang/abslang.abs:1056
'get_val_internal'(#state{'memory'=G},'memory')->
    object:register_read('memory'),
    G;
 %% abs/lang/abslang.abs:1058
'get_val_internal'(#state{'memorynext'=G},'memorynext')->
    object:register_read('memorynext'),
    G;
 %% abs/lang/abslang.abs:1059
'get_val_internal'(#state{'paymentInterval'=G},'paymentInterval')->
    object:register_read('paymentInterval'),
    G;
 %% abs/lang/abslang.abs:1062
'get_val_internal'(#state{'costPerInterval'=G},'costPerInterval')->
    object:register_read('costPerInterval'),
    G;
 %% abs/lang/abslang.abs:1063
'get_val_internal'(#state{'startupDuration'=G},'startupDuration')->
    object:register_read('startupDuration'),
    G;
 %% abs/lang/abslang.abs:1064
'get_val_internal'(#state{'shutdownDuration'=G},'shutdownDuration')->
    object:register_read('shutdownDuration'),
    G;
 %% abs/lang/abslang.abs:1065
'get_val_internal'(#state{'numberOfCores'=G},'numberOfCores')->
    object:register_read('numberOfCores'),
    G;
 %% abs/lang/abslang.abs:1067
'get_val_internal'(#state{'cloudprovider'=G},'cloudprovider')->
    object:register_read('cloudprovider'),
    G;
'get_val_internal'(_,_)->
    %% Invalid return value; handled by HTTP API when querying for non-existant field.
    %% Will never occur in generated code.
    none.

 %% abs/lang/abslang.abs:1013
'set_val_internal'(S,'description',V)->
    object:register_write('description'),
    S#state{'description'=V};
 %% abs/lang/abslang.abs:1013
'set_val_internal'(S,'initconfig',V)->
    object:register_write('initconfig'),
    S#state{'initconfig'=V};
 %% abs/lang/abslang.abs:1023
'set_val_internal'(S,'cpuhistory',V)->
    object:register_write('cpuhistory'),
    S#state{'cpuhistory'=V};
 %% abs/lang/abslang.abs:1024
'set_val_internal'(S,'cpuhistorytotal',V)->
    object:register_write('cpuhistorytotal'),
    S#state{'cpuhistorytotal'=V};
 %% abs/lang/abslang.abs:1025
'set_val_internal'(S,'bwhistory',V)->
    object:register_write('bwhistory'),
    S#state{'bwhistory'=V};
 %% abs/lang/abslang.abs:1026
'set_val_internal'(S,'bwhistorytotal',V)->
    object:register_write('bwhistorytotal'),
    S#state{'bwhistorytotal'=V};
 %% abs/lang/abslang.abs:1027
'set_val_internal'(S,'memoryhistory',V)->
    object:register_write('memoryhistory'),
    S#state{'memoryhistory'=V};
 %% abs/lang/abslang.abs:1028
'set_val_internal'(S,'memoryhistorytotal',V)->
    object:register_write('memoryhistorytotal'),
    S#state{'memoryhistorytotal'=V};
 %% abs/lang/abslang.abs:1034
'set_val_internal'(S,'cpuconsumed',V)->
    object:register_write('cpuconsumed'),
    S#state{'cpuconsumed'=V};
 %% abs/lang/abslang.abs:1035
'set_val_internal'(S,'bwconsumed',V)->
    object:register_write('bwconsumed'),
    S#state{'bwconsumed'=V};
 %% abs/lang/abslang.abs:1036
'set_val_internal'(S,'memoryconsumed',V)->
    object:register_write('memoryconsumed'),
    S#state{'memoryconsumed'=V};
 %% abs/lang/abslang.abs:1040
'set_val_internal'(S,'creationTime',V)->
    object:register_write('creationTime'),
    S#state{'creationTime'=V};
 %% abs/lang/abslang.abs:1041
'set_val_internal'(S,'shutdownTime',V)->
    object:register_write('shutdownTime'),
    S#state{'shutdownTime'=V};
 %% abs/lang/abslang.abs:1045
'set_val_internal'(S,'initialized',V)->
    object:register_write('initialized'),
    S#state{'initialized'=V};
 %% abs/lang/abslang.abs:1048
'set_val_internal'(S,'is_shutdown',V)->
    object:register_write('is_shutdown'),
    S#state{'is_shutdown'=V};
 %% abs/lang/abslang.abs:1050
'set_val_internal'(S,'cpu',V)->
    object:register_write('cpu'),
    S#state{'cpu'=V};
 %% abs/lang/abslang.abs:1052
'set_val_internal'(S,'cpunext',V)->
    object:register_write('cpunext'),
    S#state{'cpunext'=V};
 %% abs/lang/abslang.abs:1053
'set_val_internal'(S,'bw',V)->
    object:register_write('bw'),
    S#state{'bw'=V};
 %% abs/lang/abslang.abs:1055
'set_val_internal'(S,'bwnext',V)->
    object:register_write('bwnext'),
    S#state{'bwnext'=V};
 %% abs/lang/abslang.abs:1056
'set_val_internal'(S,'memory',V)->
    object:register_write('memory'),
    S#state{'memory'=V};
 %% abs/lang/abslang.abs:1058
'set_val_internal'(S,'memorynext',V)->
    object:register_write('memorynext'),
    S#state{'memorynext'=V};
 %% abs/lang/abslang.abs:1059
'set_val_internal'(S,'paymentInterval',V)->
    object:register_write('paymentInterval'),
    S#state{'paymentInterval'=V};
 %% abs/lang/abslang.abs:1062
'set_val_internal'(S,'costPerInterval',V)->
    object:register_write('costPerInterval'),
    S#state{'costPerInterval'=V};
 %% abs/lang/abslang.abs:1063
'set_val_internal'(S,'startupDuration',V)->
    object:register_write('startupDuration'),
    S#state{'startupDuration'=V};
 %% abs/lang/abslang.abs:1064
'set_val_internal'(S,'shutdownDuration',V)->
    object:register_write('shutdownDuration'),
    S#state{'shutdownDuration'=V};
 %% abs/lang/abslang.abs:1065
'set_val_internal'(S,'numberOfCores',V)->
    object:register_write('numberOfCores'),
    S#state{'numberOfCores'=V};
 %% abs/lang/abslang.abs:1067
'set_val_internal'(S,'cloudprovider',V)->
    object:register_write('cloudprovider'),
    S#state{'cloudprovider'=V}.

'get_state_for_modelapi'(S)->
    [
        { 'description', S#state.'description' }
        , { 'initconfig', S#state.'initconfig' }
        , { 'cpuhistory', S#state.'cpuhistory' }
        , { 'cpuhistorytotal', S#state.'cpuhistorytotal' }
        , { 'bwhistory', S#state.'bwhistory' }
        , { 'bwhistorytotal', S#state.'bwhistorytotal' }
        , { 'memoryhistory', S#state.'memoryhistory' }
        , { 'memoryhistorytotal', S#state.'memoryhistorytotal' }
        , { 'cpuconsumed', S#state.'cpuconsumed' }
        , { 'bwconsumed', S#state.'bwconsumed' }
        , { 'memoryconsumed', S#state.'memoryconsumed' }
        , { 'creationTime', S#state.'creationTime' }
        , { 'shutdownTime', S#state.'shutdownTime' }
        , { 'initialized', S#state.'initialized' }
        , { 'is_shutdown', S#state.'is_shutdown' }
        , { 'cpu', S#state.'cpu' }
        , { 'cpunext', S#state.'cpunext' }
        , { 'bw', S#state.'bw' }
        , { 'bwnext', S#state.'bwnext' }
        , { 'memory', S#state.'memory' }
        , { 'memorynext', S#state.'memorynext' }
        , { 'paymentInterval', S#state.'paymentInterval' }
        , { 'costPerInterval', S#state.'costPerInterval' }
        , { 'startupDuration', S#state.'startupDuration' }
        , { 'shutdownDuration', S#state.'shutdownDuration' }
        , { 'numberOfCores', S#state.'numberOfCores' }
        , { 'cloudprovider', S#state.'cloudprovider' }
    ].
%% --- Constructor: field initializers and init block

'init'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},[P_description,P_initconfig,Stack])->
    C=(get(this))#state.class,
    put(vars, #{}),
    put(this, C:set_val_internal(get(this),'description',P_description)),
    put(this, C:set_val_internal(get(this),'initconfig',P_initconfig)),
     %% abs/lang/abslang.abs:1023--1023
    put(this, C:set_val_internal(get(this),'cpuhistory',[])),
     %% abs/lang/abslang.abs:1024--1024
    put(this, C:set_val_internal(get(this),'cpuhistorytotal',[])),
     %% abs/lang/abslang.abs:1025--1025
    put(this, C:set_val_internal(get(this),'bwhistory',[])),
     %% abs/lang/abslang.abs:1026--1026
    put(this, C:set_val_internal(get(this),'bwhistorytotal',[])),
     %% abs/lang/abslang.abs:1027--1027
    put(this, C:set_val_internal(get(this),'memoryhistory',[])),
     %% abs/lang/abslang.abs:1028--1028
    put(this, C:set_val_internal(get(this),'memoryhistorytotal',[])),
     %% abs/lang/abslang.abs:1034--1034
    put(this, C:set_val_internal(get(this),'cpuconsumed',0)),
     %% abs/lang/abslang.abs:1035--1035
    put(this, C:set_val_internal(get(this),'bwconsumed',0)),
     %% abs/lang/abslang.abs:1036--1036
    put(this, C:set_val_internal(get(this),'memoryconsumed',0)),
     %% abs/lang/abslang.abs:1040--1040
    put(this, C:set_val_internal(get(this),'creationTime',m_ABS_StdLib_funs:f_now(Cog,[O,DC| Stack]))),
     %% abs/lang/abslang.abs:1041--1041
    put(this, C:set_val_internal(get(this),'shutdownTime',dataNothing)),
     %% abs/lang/abslang.abs:1045--1045
    put(this, C:set_val_internal(get(this),'initialized',false)),
     %% abs/lang/abslang.abs:1048--1048
    put(this, C:set_val_internal(get(this),'is_shutdown',false)),
     %% abs/lang/abslang.abs:1050--1051
    put(this, C:set_val_internal(get(this),'cpu',begin
        case m_ABS_StdLib_funs:f_lookup(Cog,C:get_val_internal(get(this), 'initconfig'),dataSpeed,[O,DC| Stack]) of
            
            dataNothing->dataInfRat;
            {dataJust,V_v_0}->{ dataFin,V_v_0};
            _ -> io:format("No match for FnApp(initconfig,Speed()) at abs/lang/abslang.abs:1050~n"), 
            exit(dataPatternMatchFailException)
        end
    end)),
     %% abs/lang/abslang.abs:1052--1052
    put(this, C:set_val_internal(get(this),'cpunext',C:get_val_internal(get(this), 'cpu'))),
     %% abs/lang/abslang.abs:1053--1054
    put(this, C:set_val_internal(get(this),'bw',begin
        case m_ABS_StdLib_funs:f_lookup(Cog,C:get_val_internal(get(this), 'initconfig'),dataBandwidth,[O,DC| Stack]) of
            
            dataNothing->dataInfRat;
            {dataJust,V_v_1}->{ dataFin,V_v_1};
            _ -> io:format("No match for FnApp(initconfig,Bandwidth()) at abs/lang/abslang.abs:1053~n"), 
            exit(dataPatternMatchFailException)
        end
    end)),
     %% abs/lang/abslang.abs:1055--1055
    put(this, C:set_val_internal(get(this),'bwnext',C:get_val_internal(get(this), 'bw'))),
     %% abs/lang/abslang.abs:1056--1057
    put(this, C:set_val_internal(get(this),'memory',begin
        case m_ABS_StdLib_funs:f_lookup(Cog,C:get_val_internal(get(this), 'initconfig'),dataMemory,[O,DC| Stack]) of
            
            dataNothing->dataInfRat;
            {dataJust,V_m_0}->{ dataFin,V_m_0};
            _ -> io:format("No match for FnApp(initconfig,Memory()) at abs/lang/abslang.abs:1056~n"), 
            exit(dataPatternMatchFailException)
        end
    end)),
     %% abs/lang/abslang.abs:1058--1058
    put(this, C:set_val_internal(get(this),'memorynext',C:get_val_internal(get(this), 'memory'))),
     %% abs/lang/abslang.abs:1059--1061
    put(this, C:set_val_internal(get(this),'paymentInterval',begin
        case m_ABS_StdLib_funs:f_lookup(Cog,C:get_val_internal(get(this), 'initconfig'),dataPaymentInterval,[O,DC| Stack]) of
            
            dataNothing->1;
            {dataJust,V_n_0}->builtin:truncate(Cog,V_n_0);
            _ -> io:format("No match for FnApp(initconfig,PaymentInterval()) at abs/lang/abslang.abs:1060~n"), 
            exit(dataPatternMatchFailException)
        end
    end)),
     %% abs/lang/abslang.abs:1062--1062
    put(this, C:set_val_internal(get(this),'costPerInterval',m_ABS_StdLib_funs:f_lookupDefault(Cog,C:get_val_internal(get(this), 'initconfig'),dataCostPerInterval, rationals:rdiv(0,1) ,[O,DC| Stack]))),
     %% abs/lang/abslang.abs:1063--1063
    put(this, C:set_val_internal(get(this),'startupDuration',m_ABS_StdLib_funs:f_lookupDefault(Cog,C:get_val_internal(get(this), 'initconfig'),dataStartupduration, rationals:rdiv(0,1) ,[O,DC| Stack]))),
     %% abs/lang/abslang.abs:1064--1064
    put(this, C:set_val_internal(get(this),'shutdownDuration',m_ABS_StdLib_funs:f_lookupDefault(Cog,C:get_val_internal(get(this), 'initconfig'),dataShutdownduration, rationals:rdiv(0,1) ,[O,DC| Stack]))),
     %% abs/lang/abslang.abs:1065--1065
    put(this, C:set_val_internal(get(this),'numberOfCores',m_ABS_StdLib_funs:f_lookupDefault(Cog,C:get_val_internal(get(this), 'initconfig'),dataCores, rationals:rdiv(1,1) ,[O,DC| Stack]))),
     %% abs/lang/abslang.abs:1067--1067
    put(this, C:set_val_internal(get(this),'cloudprovider',null)),
     %% abs/lang/abslang.abs:1069--1069
    put(this, C:set_val_internal(get(this), 'initialized',true)),
    gc:register_object(O),
    O.
%% --- Class has no recovery block

%% --- Methods

 %% abs/lang/abslang.abs:1071
 %% abs/lang/abslang.abs:1071
'm_load'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_rtype_0,V_periods_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'rtype' => V_rtype_0,
 'periods' => V_periods_0 }),
    try
         %% abs/lang/abslang.abs:1072--1072
        put(vars, (get(vars))#{'result' => 0}),
         %% abs/lang/abslang.abs:1073--1073
        case maps:get('rtype', get(vars)) of
            dataSpeed->
                 %% abs/lang/abslang.abs:1075--1075
                case (not cmp:eq(C:get_val_internal(get(this), 'cpu'),dataInfRat)) of
                    true ->  %% abs/lang/abslang.abs:1076--1076
                    put(vars, (get(vars))#{'result' := m_ABS_DC_funs:f_averageDivsN(Cog,C:get_val_internal(get(this), 'cpuhistory'),C:get_val_internal(get(this), 'cpuhistorytotal'),maps:get('periods', get(vars)),[O,DC| Stack])});
                    false ->                 ok
                end;
            dataBandwidth->
                 %% abs/lang/abslang.abs:1080--1080
                case (not cmp:eq(C:get_val_internal(get(this), 'bw'),dataInfRat)) of
                    true ->  %% abs/lang/abslang.abs:1081--1081
                    put(vars, (get(vars))#{'result' := m_ABS_DC_funs:f_averageDivsN(Cog,C:get_val_internal(get(this), 'bwhistory'),C:get_val_internal(get(this), 'bwhistorytotal'),maps:get('periods', get(vars)),[O,DC| Stack])});
                    false ->                 ok
                end;
            dataMemory->
                 %% abs/lang/abslang.abs:1085--1085
                case (not cmp:eq(C:get_val_internal(get(this), 'memory'),dataInfRat)) of
                    true ->  %% abs/lang/abslang.abs:1086--1086
                    put(vars, (get(vars))#{'result' := m_ABS_DC_funs:f_averageDivsN(Cog,C:get_val_internal(get(this), 'memoryhistory'),C:get_val_internal(get(this), 'memoryhistorytotal'),maps:get('periods', get(vars)),[O,DC| Stack])});
                    false ->                 ok
                end;
            _->
                 %% abs/lang/abslang.abs:1073--1089
                throw(dataPatternMatchFailException)
        end,
         %% abs/lang/abslang.abs:1090--1090
        maps:get('result', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method load and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1092
 %% abs/lang/abslang.abs:1092
'm_total'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_rtype_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'rtype' => V_rtype_0 }),
    try
         %% abs/lang/abslang.abs:1093--1093
        put(vars, (get(vars))#{'result' => dataInfRat}),
         %% abs/lang/abslang.abs:1094--1094
        case maps:get('rtype', get(vars)) of
            dataSpeed->
                 %% abs/lang/abslang.abs:1095--1095
                put(vars, (get(vars))#{'result' := C:get_val_internal(get(this), 'cpu')});
            dataBandwidth->
                 %% abs/lang/abslang.abs:1096--1096
                put(vars, (get(vars))#{'result' := C:get_val_internal(get(this), 'bw')});
            dataMemory->
                 %% abs/lang/abslang.abs:1097--1097
                put(vars, (get(vars))#{'result' := C:get_val_internal(get(this), 'memory')});
            _->
                 %% abs/lang/abslang.abs:1094--1098
                throw(dataPatternMatchFailException)
        end,
         %% abs/lang/abslang.abs:1099--1099
        maps:get('result', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method total and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1105
 %% abs/lang/abslang.abs:1105
'm_transfer'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_target_0,V_amount_0,V_rtype_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'target' => V_target_0,
 'amount' => V_amount_0,
 'rtype' => V_rtype_0 }),
    try
         %% abs/lang/abslang.abs:1106--1106
        put(vars, (get(vars))#{'amount' := (fun() -> case O of
            null -> throw(dataNullPointerException);
            Callee=#object{oid=Oid,cog=Cog} ->
                %% self-call
                Vars=get(vars),
                Result=C:'m_decrementResources'(Callee,maps:get('amount', get(vars)),maps:get('rtype', get(vars)),[O,DC,Vars| Stack]),
                put(vars, Vars),
                Result;
            Callee=#object{oid=ObjRef,cog=Cog} ->
                %% cog-local call
                V_amount = maps:get('amount', get(vars)),
                V_rtype = maps:get('rtype', get(vars)),
                State=get(this),
                Vars=get(vars),
                cog:object_state_changed(Cog, O, State),
                put(this,cog:get_object_state(Callee#object.cog, Callee)),
                put(task_info,(get(task_info))#task_info{this=Callee}),
                T=object:get_class_from_state(get(this)), % it's the callee state already
                Result=T:'m_decrementResources'(Callee, V_amount, V_rtype,[O,DC,Vars,State| Stack]),
                cog:object_state_changed(Callee#object.cog, Callee, get(this)),
                put(task_info,(get(task_info))#task_info{this=O}),
                put(this, cog:get_object_state(Cog, O)),
                put(vars, Vars),
                Result;
            Callee ->
                %% remote call
                TempFuture = cog:create_task(Callee,'m_decrementResources',[maps:get('amount', get(vars)),maps:get('rtype', get(vars)),[]],#task_info{method= <<"decrementResources"/utf8>>},Cog),
                future:get_blocking(TempFuture, Cog, [O,DC| Stack])
        end end)()}),
         %% abs/lang/abslang.abs:1107--1107
        T_1 = cog:create_task(maps:get('target', get(vars)),'m_incrementResources',[maps:get('amount', get(vars)),maps:get('rtype', get(vars)),[]],#task_info{method= <<"incrementResources"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog),
        T_1,
         %% abs/lang/abslang.abs:1108--1108
        maps:get('amount', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method transfer and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1111
 %% abs/lang/abslang.abs:1111
'm_decrementResources'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_amount_0,V_rtype_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'amount' => V_amount_0,
 'rtype' => V_rtype_0 }),
    try
         %% abs/lang/abslang.abs:1112--1112
        case maps:get('rtype', get(vars)) of
            dataSpeed->
                 %% abs/lang/abslang.abs:1113--1113
                case (not cmp:eq(C:get_val_internal(get(this), 'cpunext'),dataInfRat)) of
                    true ->  %% abs/lang/abslang.abs:1114--1114
                    put(vars, (get(vars))#{'amount' := m_ABS_StdLib_funs:f_min(Cog,maps:get('amount', get(vars)),m_ABS_DC_funs:f_finvalue(Cog,C:get_val_internal(get(this), 'cpunext'),[O,DC| Stack]),[O,DC| Stack])}),
                     %% abs/lang/abslang.abs:1115--1115
                    put(this, C:set_val_internal(get(this), 'cpunext',{ dataFin,( rationals:sub(m_ABS_DC_funs:f_finvalue(Cog,C:get_val_internal(get(this), 'cpunext'),[O,DC| Stack]),maps:get('amount', get(vars)))) }));
                    false ->                 ok
                end;
            dataBandwidth->
                 %% abs/lang/abslang.abs:1117--1117
                case (not cmp:eq(C:get_val_internal(get(this), 'bwnext'),dataInfRat)) of
                    true ->  %% abs/lang/abslang.abs:1118--1118
                    put(vars, (get(vars))#{'amount' := m_ABS_StdLib_funs:f_min(Cog,maps:get('amount', get(vars)),m_ABS_DC_funs:f_finvalue(Cog,C:get_val_internal(get(this), 'bwnext'),[O,DC| Stack]),[O,DC| Stack])}),
                     %% abs/lang/abslang.abs:1119--1119
                    put(this, C:set_val_internal(get(this), 'bwnext',{ dataFin,( rationals:sub(m_ABS_DC_funs:f_finvalue(Cog,C:get_val_internal(get(this), 'bwnext'),[O,DC| Stack]),maps:get('amount', get(vars)))) }));
                    false ->                 ok
                end;
            dataMemory->
                 %% abs/lang/abslang.abs:1121--1121
                case (not cmp:eq(C:get_val_internal(get(this), 'memorynext'),dataInfRat)) of
                    true ->  %% abs/lang/abslang.abs:1122--1122
                    put(vars, (get(vars))#{'amount' := m_ABS_StdLib_funs:f_min(Cog,maps:get('amount', get(vars)),m_ABS_DC_funs:f_finvalue(Cog,C:get_val_internal(get(this), 'memorynext'),[O,DC| Stack]),[O,DC| Stack])}),
                     %% abs/lang/abslang.abs:1123--1123
                    put(this, C:set_val_internal(get(this), 'memorynext',{ dataFin,( rationals:sub(m_ABS_DC_funs:f_finvalue(Cog,C:get_val_internal(get(this), 'memorynext'),[O,DC| Stack]),maps:get('amount', get(vars)))) }));
                    false ->                 ok
                end;
            _->
                 %% abs/lang/abslang.abs:1112--1125
                throw(dataPatternMatchFailException)
        end,
         %% abs/lang/abslang.abs:1126--1126
        maps:get('amount', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method decrementResources and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1128
 %% abs/lang/abslang.abs:1128
'm_incrementResources'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_amount_0,V_rtype_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'amount' => V_amount_0,
 'rtype' => V_rtype_0 }),
    try
         %% abs/lang/abslang.abs:1129--1129
        case maps:get('rtype', get(vars)) of
            dataSpeed->
                 %% abs/lang/abslang.abs:1131--1131
                case (not cmp:eq(C:get_val_internal(get(this), 'cpunext'),dataInfRat)) of
                    true ->  %% abs/lang/abslang.abs:1132--1132
                    put(this, C:set_val_internal(get(this), 'cpunext',{ dataFin,( rationals:add(m_ABS_DC_funs:f_finvalue(Cog,C:get_val_internal(get(this), 'cpunext'),[O,DC| Stack]),maps:get('amount', get(vars)))) }));
                    false ->                 ok
                end;
            dataBandwidth->
                 %% abs/lang/abslang.abs:1135--1135
                case (not cmp:eq(C:get_val_internal(get(this), 'bwnext'),dataInfRat)) of
                    true ->  %% abs/lang/abslang.abs:1136--1136
                    put(this, C:set_val_internal(get(this), 'bwnext',{ dataFin,( rationals:add(m_ABS_DC_funs:f_finvalue(Cog,C:get_val_internal(get(this), 'bwnext'),[O,DC| Stack]),maps:get('amount', get(vars)))) }));
                    false ->                 ok
                end;
            dataMemory->
                 %% abs/lang/abslang.abs:1138--1138
                case (not cmp:eq(C:get_val_internal(get(this), 'memorynext'),dataInfRat)) of
                    true ->  %% abs/lang/abslang.abs:1139--1139
                    put(this, C:set_val_internal(get(this), 'memorynext',{ dataFin,( rationals:add(m_ABS_DC_funs:f_finvalue(Cog,C:get_val_internal(get(this), 'memorynext'),[O,DC| Stack]),maps:get('amount', get(vars)))) }));
                    false ->                 ok
                end;
            _->
                 %% abs/lang/abslang.abs:1129--1141
                throw(dataPatternMatchFailException)
        end,
         %% abs/lang/abslang.abs:1142--1142
        maps:get('amount', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method incrementResources and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1144
 %% abs/lang/abslang.abs:1144
'm_setProvider'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},V_provider_0,Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O,
 'provider' => V_provider_0 }),
    try
         %% abs/lang/abslang.abs:1145--1145
        put(this, C:set_val_internal(get(this), 'cloudprovider',maps:get('provider', get(vars)))),
        dataUnit
        
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method setProvider and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1147
 %% abs/lang/abslang.abs:1147
'm_convertToDC'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% abs/lang/abslang.abs:1147--1147
        O
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method convertToDC and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1149
 %% abs/lang/abslang.abs:1149
'm_getProvider'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% abs/lang/abslang.abs:1149--1149
        C:get_val_internal(get(this), 'cloudprovider')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getProvider and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1150
 %% abs/lang/abslang.abs:1150
'm_acquire'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% abs/lang/abslang.abs:1151--1151
        put(vars, (get(vars))#{'result' => true}),
         %% abs/lang/abslang.abs:1152--1152
        case (not cmp:eq(C:get_val_internal(get(this), 'cloudprovider'),null)) of
            true ->  %% abs/lang/abslang.abs:1153--1153
            put(vars, (get(vars))#{'tmp578969118' => cog:create_task(C:get_val_internal(get(this), 'cloudprovider'),'m_acquireInstance',[O,[]],#task_info{method= <<"acquireInstance"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog)}),
             %% abs/lang/abslang.abs:1153--1153
            future:await(maps:get('tmp578969118', get(vars)), Cog, [O,DC| Stack]),
            ok,
             %% abs/lang/abslang.abs:1153--1153
            put(vars, (get(vars))#{'result' := future:get_blocking(maps:get('tmp578969118', get(vars)), Cog, [O,DC| Stack])});
            false ->         ok
        end,
         %% abs/lang/abslang.abs:1155--1155
        maps:get('result', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method acquire and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1157
 %% abs/lang/abslang.abs:1157
'm_release'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% abs/lang/abslang.abs:1158--1158
        put(vars, (get(vars))#{'result' => true}),
         %% abs/lang/abslang.abs:1159--1159
        case (not cmp:eq(C:get_val_internal(get(this), 'cloudprovider'),null)) of
            true ->  %% abs/lang/abslang.abs:1160--1160
            put(vars, (get(vars))#{'tmp861887593' => cog:create_task(C:get_val_internal(get(this), 'cloudprovider'),'m_releaseInstance',[O,[]],#task_info{method= <<"releaseInstance"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog)}),
             %% abs/lang/abslang.abs:1160--1160
            future:await(maps:get('tmp861887593', get(vars)), Cog, [O,DC| Stack]),
            ok,
             %% abs/lang/abslang.abs:1160--1160
            put(vars, (get(vars))#{'result' := future:get_blocking(maps:get('tmp861887593', get(vars)), Cog, [O,DC| Stack])});
            false ->         ok
        end,
         %% abs/lang/abslang.abs:1162--1162
        maps:get('result', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method release and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1165
 %% abs/lang/abslang.abs:1165
'm_shutdown'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% abs/lang/abslang.abs:1166--1166
        case not (C:get_val_internal(get(this), 'is_shutdown')) of
            true ->  %% abs/lang/abslang.abs:1167--1167
            put(this, C:set_val_internal(get(this), 'is_shutdown',true)),
             %% abs/lang/abslang.abs:1168--1168
            put(this, C:set_val_internal(get(this), 'shutdownTime',{ dataJust,m_ABS_StdLib_funs:f_now(Cog,[O,DC| Stack])})),
             %% abs/lang/abslang.abs:1169--1169
            case (not cmp:eq(C:get_val_internal(get(this), 'cloudprovider'),null)) of
                true ->  %% abs/lang/abslang.abs:1170--1170
                T_1 = cog:create_task(C:get_val_internal(get(this), 'cloudprovider'),'m_internalShutdownInstance',[O,[]],#task_info{method= <<"internalShutdownInstance"/utf8>>, creation={dataTime,builtin:currentms(Cog)}, proc_deadline=dataInfDuration},Cog),
                T_1;
                false ->             ok
            end;
            false ->         ok
        end,
         %% abs/lang/abslang.abs:1173--1173
        true
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method shutdown and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1176
 %% abs/lang/abslang.abs:1176
'm_getName'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% abs/lang/abslang.abs:1176--1176
        C:get_val_internal(get(this), 'description')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getName and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1177
 %% abs/lang/abslang.abs:1177
'm_getCreationTime'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% abs/lang/abslang.abs:1177--1177
        C:get_val_internal(get(this), 'creationTime')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getCreationTime and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1178
 %% abs/lang/abslang.abs:1178
'm_getStartupDuration'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% abs/lang/abslang.abs:1178--1178
        C:get_val_internal(get(this), 'startupDuration')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getStartupDuration and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1179
 %% abs/lang/abslang.abs:1179
'm_getShutdownDuration'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% abs/lang/abslang.abs:1179--1179
        C:get_val_internal(get(this), 'shutdownDuration')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getShutdownDuration and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1180
 %% abs/lang/abslang.abs:1180
'm_getPaymentInterval'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% abs/lang/abslang.abs:1180--1180
        C:get_val_internal(get(this), 'paymentInterval')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getPaymentInterval and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1181
 %% abs/lang/abslang.abs:1181
'm_getCostPerInterval'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% abs/lang/abslang.abs:1181--1181
        C:get_val_internal(get(this), 'costPerInterval')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getCostPerInterval and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1183
 %% abs/lang/abslang.abs:1183
'm_getAccumulatedCost'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% abs/lang/abslang.abs:1184--1184
        put(vars, (get(vars))#{'result' => 0}),
         %% abs/lang/abslang.abs:1185--1185
        case (cmp:gt(C:get_val_internal(get(this), 'costPerInterval'),0)) and (cmp:gt(C:get_val_internal(get(this), 'paymentInterval'),0)) of
            true ->  %% abs/lang/abslang.abs:1186--1186
            put(vars, (get(vars))#{'nIntervals' => builtin:truncate(Cog, rationals:rdiv(builtin:truncate(Cog,m_ABS_StdLib_funs:f_timeDifference(Cog,C:get_val_internal(get(this), 'creationTime'),m_ABS_StdLib_funs:f_now(Cog,[O,DC| Stack]),[O,DC| Stack])),C:get_val_internal(get(this), 'paymentInterval')) )}),
             %% abs/lang/abslang.abs:1187--1187
            put(vars, (get(vars))#{'result' := ( rationals:mul(maps:get('nIntervals', get(vars)),C:get_val_internal(get(this), 'costPerInterval'))) });
            false ->         ok
        end,
         %% abs/lang/abslang.abs:1189--1189
        maps:get('result', get(vars))
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getAccumulatedCost and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
 %% abs/lang/abslang.abs:1192
 %% abs/lang/abslang.abs:1192
'm_getNumberOfCores'(O=#object{oid=Oid,cog=Cog=#cog{ref=CogRef,dcobj=DC}},Stack)->
    C=(get(this))#state.class,
    put(vars, #{ 'this' => O }),
    try
         %% abs/lang/abslang.abs:1192--1192
        C:get_val_internal(get(this), 'numberOfCores')
    catch
        _:Exception:Stacktrace ->
            io:format(standard_error, "Uncaught ~s in method getNumberOfCores and no recovery block in class definition, killing object ~s~n", [builtin:toString(Cog, Exception), builtin:toString(Cog, O)]),
            io:format(standard_error, "stacktrace: ~tp~n", [Stacktrace]),
            object:die(O, Exception), exit(Exception)
    end.
