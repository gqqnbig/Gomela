// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/nektos/act/blob/020d6a60832a324e46b72be92ac5754537e57a17/pkg/runner/run_context_test.go#L17
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestRunContext_EvalBool170 = [1] of {int};
	run TestRunContext_EvalBool17(child_TestRunContext_EvalBool170);
	run receiver(child_TestRunContext_EvalBool170)
stop_process:skip
}

proctype TestRunContext_EvalBool17(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef hook_mu;
	int var_tablestables = -2; // opt var_tablestables
	run mutexMonitor(hook_mu);
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

