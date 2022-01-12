// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/derailed/k9s/blob//internal/model/table_test.go#L52
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestTableAddListener520 = [1] of {int};
	run TestTableAddListener52(child_TestTableAddListener520);
	run receiver(child_TestTableAddListener520)
stop_process:skip
}

proctype TestTableAddListener52(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_AddListener662 = [1] of {int};
	chan child_Empty1541 = [1] of {int};
	chan child_SetNamespace1330 = [1] of {int};
	Mutexdef ta_mx;
	run mutexMonitor(ta_mx);
	run SetNamespace133(ta_mx,child_SetNamespace1330);
	child_SetNamespace1330?0;
	run Empty154(ta_mx,child_Empty1541);
	child_Empty1541?0;
	run AddListener66(ta_mx,child_AddListener662);
	child_AddListener662?0;
	stop_process: skip;
	child!0
}
proctype SetNamespace133(Mutexdef t_mx;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	stop_process: skip;
	child!0
}
proctype Empty154(Mutexdef t_mx;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype AddListener66(Mutexdef t_mx;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
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

