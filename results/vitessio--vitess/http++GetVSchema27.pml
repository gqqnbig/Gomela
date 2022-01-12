// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/vitessio/vitess/blob//go/vt/vtadmin/http/vschemas.go#L27
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_GetVSchema270 = [1] of {int};
	run GetVSchema27(child_GetVSchema270);
	run receiver(child_GetVSchema270)
stop_process:skip
}

proctype GetVSchema27(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_NewJSONResponse450 = [1] of {int};
	Mutexdef vschema_VSchema_state_atomicMessageInfo_initMu;
	Mutexdef vschema_Cluster_state_atomicMessageInfo_initMu;
	Mutexdef vschema_state_atomicMessageInfo_initMu;
	run mutexMonitor(vschema_state_atomicMessageInfo_initMu);
	run mutexMonitor(vschema_Cluster_state_atomicMessageInfo_initMu);
	run mutexMonitor(vschema_VSchema_state_atomicMessageInfo_initMu);
	run NewJSONResponse45(vschema_Cluster_state_atomicMessageInfo_initMu,vschema_state_atomicMessageInfo_initMu,vschema_VSchema_state_atomicMessageInfo_initMu,child_NewJSONResponse450);
	child_NewJSONResponse450?0;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype NewJSONResponse45(Mutexdef value_Cluster_state_atomicMessageInfo_initMu;Mutexdef value_state_atomicMessageInfo_initMu;Mutexdef value_VSchema_state_atomicMessageInfo_initMu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: true -> 
		

		if
		:: true -> 
			goto stop_process
		:: true -> 
			goto stop_process
		fi
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}

 /* ================================================================================== */
 /* ================================================================================== */
 /* ================================================================================== */ 
proctype mutexMonitor(Mutexdef m) {
bool locked = false;
do
:: true ->
	if
	:: m.Counter > 0 ->
		if 
		:: m.RUnlock?false -> 
			m.Counter = m.Counter - 1;
		:: m.RLock?false -> 
			m.Counter = m.Counter + 1;
		fi;
	:: locked ->
		m.Unlock?false;
		locked = false;
	:: else ->	 end:	if
		:: m.Unlock?false ->
			assert(0==32);		:: m.Lock?false ->
			locked =true;
		:: m.RUnlock?false ->
			assert(0==32);		:: m.RLock?false ->
			m.Counter = m.Counter + 1;
		fi;
	fi;
od
}

proctype receiver(chan c) {
c?0
}

