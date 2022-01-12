// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/prometheus/prometheus/blob//scrape/target_test.go#L93
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestTargetURL930 = [1] of {int};
	run TestTargetURL93(child_TestTargetURL930);
	run receiver(child_TestTargetURL930)
stop_process:skip
}

proctype TestTargetURL93(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_URL2000 = [1] of {int};
	Mutexdef target_mtx;
	run mutexMonitor(target_mtx);
	run URL200(target_mtx,child_URL2000);
	child_URL2000?0;
	stop_process: skip;
	child!0
}
proctype URL200(Mutexdef t_mtx;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	int var_t_labels = -2; // opt var_t_labels
	int var_t_params = -2; // opt var_t_params
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

